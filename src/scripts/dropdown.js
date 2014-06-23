/* jshint unused: false */
!function( ng ) {
    "use strict";

    var $ = ng.element;
    var module = ng.module( "frontkit.dropdown", [
        "frontkit.utils"
    ]);

    module.value( "dropdownConfig", {
        optionsPageSize: 5
    });

    module.directive( "dropdown", [
        "$document",
        function( $document ) {
            var definition = {};

            definition.restrict = "EA";
            definition.replace = true;
            definition.transclude = true;
            definition.templateUrl = "templates/dropdown/single.html";
            definition.controller = "DropdownController";
            definition.controllerAs = "$dropdown";
            definition.scope = true;
            definition.require = [ "dropdown", "?ngModel" ];

            definition.compile = function( tElement, tAttr ) {
                var ngModel = tAttr.ngModel;

                // If ng-model is present, let's reference the parent scope
                if ( ngModel ) {
                    tAttr.$set( "ngModel", "$parent." + ngModel );
                }

                return definition.link;
            };

            definition.link = function( scope, element, attr, controllers, transclude ) {
                // Create shortcuts for the controllers
                var $dropdown = controllers[ 0 ];
                var ngModel = controllers[ 1 ];

                // Configure ngModel, if present
                if ( ngModel ) {
                    scope.$watch( "$dropdown.items", function( items ) {
                        // Almost all the time users expect to receive a single value if their
                        // dropdown accepts only 1 item, and an array of values if the dropdown
                        // accepts more than 1 value.
                        items = $dropdown.maxItems === 1 ? items[ 0 ] : items;
                        ngModel.$setViewValue( items );
                    }, true );

                    ngModel.$render = function() {
                        var value = ngModel.$viewValue;
                        if ( value == null ) {
                            $dropdown.items = [];
                            return;
                        }

                        // Properly transform the value into an array, as used internally by us
                        $dropdown.items = ng.isArray( value ) ? value : [ value ];
                    };
                }

                // Transclude contents into the right place in the directive
                transclude( scope, function( children ) {
                    var clone = $( "<div>" ).append( children );
                    var items = clone.querySelector( ".dropdown-items" );
                    var options = clone.querySelector( ".dropdown-options" );

                    if ( items.length ) {
                        element.querySelector( ".dropdown-container" ).prepend( items );
                    }

                    if ( options.length ) {
                        element.querySelector( "dropdown-options" ).replaceWith( options );
                    }
                });

                // DOM Events
                // ---------------------------------------------------------------------------------
                // Make sure clicks inside the dropdown element don't close itself
                element.on( "click", function( evt ) {
                    evt.stopPropagation();
                });

                // Close the dropdown when a click outside is detected
                $document.on( "click", function() {
                    scope.$safeApply( $dropdown.close );
                });
            };

            return definition;
        }
    ]);

    module.controller( "DropdownController", [
        "$scope",
        "$attrs",
        "$q",
        function( $scope, $attrs, $q ) {
            var ctrl = this;
            var EMPTY_SEARCH = "";

            ctrl.options = [];
            ctrl.items = [];
            ctrl.placeholder = null;
            ctrl.valueKey = null;
            ctrl.open = false;
            ctrl.search = EMPTY_SEARCH;
            ctrl.maxItems = +$attrs.maxItems || 1;
            ctrl.activeOption = null;

            ctrl.isFull = function() {
                return ctrl.items.length >= ctrl.maxItems;
            };

            ctrl.addItem = function( item ) {
                if ( ctrl.maxItems === 1 ) {
                    ctrl.items = [ item ];
                } else if ( !ctrl.isFull() ) {
                    ctrl.items.push( item );
                }

                if ( ctrl.isFull() ) {
                    ctrl.close();
                }
            };

            ctrl.close = function() {
                ctrl.open = false;
                clearSearch();
            };

            ctrl.parseOptions = function( model ) {
                var currPromise;
                $scope.$watch( model, function watchFn( value ) {
                    var promise;
                    currPromise = null;

                    if ( value == null ) {
                        ctrl.options = [];
                    } else {
                        promise = $q.when( value ).then(function( options ) {
                            var activeKey;
                            var isArray = ng.isArray( options );

                            if ( promise !== currPromise ) {
                                return;
                            } else if ( !isArray && !ng.isObject( options ) ) {
                                throw new Error( "Dropdown options should be array or object!" );
                            }

                            ctrl.options = options;

                            activeKey = isArray ? 0 : Object.keys( options )[ 0 ];
                            ctrl.activeOption = options[ activeKey ];
                        });

                        currPromise = promise;
                    }
                }, true );
            };

            function clearSearch() {
                ctrl.search = EMPTY_SEARCH;
            }
        }
    ]);

    module.directive( "dropdownItems", [
        "$compile",
        function( $compile ) {
            var definition = {};

            definition.restrict = "EA";
            definition.replace = true;
            definition.transclude = true;
            definition.templateUrl = "templates/dropdown/items.html";
            definition.require = "^dropdown";

            definition.link = function( scope, element, attr, $dropdown, transclude ) {
                var item = element.querySelector( ".dropdown-item" );
                transclude(function( childs ) {
                    item.append( childs );
                });

                item.attr( "ng-repeat", "item in $dropdown.items" );
                $compile( item )( scope );

                attr.$observe( "placeholder", function( placeholder ) {
                    $dropdown.placeholder = placeholder;
                });
            };

            return definition;
        }
    ]);

    module.directive( "dropdownOptions", [
        "$compile",
        "repeatParser",
        "dropdownConfig",
        function( $compile, repeatParser, dropdownConfig ) {
            var definition = {};

            definition.restrict = "EA";
            definition.replace = true;
            definition.transclude = true;
            definition.templateUrl = "templates/dropdown/options.html";
            definition.require = "^dropdown";

            definition.compile = function( tElement ) {
                // When in a detached case, we won't let compile go ahead
                if ( !tElement.parent().length ) {
                    return;
                }

                return definition.link;
            };

            definition.link = function( scope, element, attr, $dropdown, transclude ) {
                var list = element[ 0 ];
                var option = element.querySelector( ".dropdown-option" );
                var repeat = repeatParser.parse( attr.items );

                // If we have a repeat expr, let's use it to build the option list
                if ( repeat ) {
                    $dropdown.parseOptions( repeat.expr );
                    repeat.expr = "$dropdown.options";

                    // Option list building
                    transclude(function( childs ) {
                        option.append( childs );
                    });

                    // Add a few directives to the option...
                    option.attr( "ng-repeat", repeatParser.toNgRepeat( repeat ) );
                    option.attr( "ng-click", "$dropdown.addItem( " + repeat.item + " )" );
                    option.attr( "ng-class", "{" +
                        "active: $dropdown.activeOption === " + repeat.item +
                    "}" );

                    // ...and compile it
                    $compile( option )( scope );
                }

                // Configure the overflow for this list
                configureOverflow();

                // Set the value key
                $dropdown.valueKey = attr.value || null;

                // Scope Watches
                // ---------------------------------------------------------------------------------
                scope.$watch( "$dropdown.open", adjustScroll );
                scope.$watch( "$dropdown.activeOption", adjustScroll );

                // Functions
                // ---------------------------------------------------------------------------------
                function adjustScroll() {
                    var fromScrollTop, index, activeElem;
                    var options = $dropdown.options;
                    var scrollTop = list.scrollTop;

                    if ( ng.isArray( options ) ) {
                        index = options.indexOf( $dropdown.activeOption );
                    } else {
                        // To keep compatibility with arrays, we'll init the index as -1
                        index = -1;
                        Object.keys( options ).some(function( key, i ) {
                            if ( options[ key ] === $dropdown.activeOption ) {
                                index = i;
                                return true;
                            }
                        });
                    }

                    activeElem = list.querySelectorAll( ".dropdown-option" )[ index ];

                    if ( !$dropdown.open || !activeElem ) {
                        // To be handled!
                        return;
                    }

                    fromScrollTop = activeElem.offsetTop - list.scrollTop;

                    // If the option is above the current scroll, we'll make it appear on the
                    // top of the scroll.
                    // Otherwise, it'll appear in the end of the scroll view.
                    if ( fromScrollTop < 0 ) {
                        scrollTop = activeElem.offsetTop;
                    } else if ( list.clientHeight <= fromScrollTop + activeElem.clientHeight ) {
                        scrollTop = activeElem.offsetTop +
                                    activeElem.clientHeight -
                                    list.clientHeight;
                    }

                    list.scrollTop = scrollTop;
                }

                function configureOverflow() {
                    var height;
                    var view = list.ownerDocument.defaultView;
                    var styles = view.getComputedStyle( list, null );
                    var display = element.css( "display" );
                    var size = dropdownConfig.optionsPageSize;
                    var li = $( "<li class='dropdown-option'>&nbsp;</li>" )[ 0 ];
                    element.prepend( li );

                    // Temporarily show the element, just to calculate the li height
                    element.css( "display", "block" );

                    // Calculate the height, considering border/padding
                    height = li.clientHeight * size;
                    height = [ "padding", "border" ].reduce(function( value, prop ) {
                        var top = styles.getPropertyValue( prop + "-top" ) || "";
                        var bottom = styles.getPropertyValue( prop + "-bottom" ) || "";

                        value += +top.replace( "px", "" ) || 0;
                        value += +bottom.replace( "px", "" ) || 0;

                        return value;
                    }, height );

                    // Set overflow CSS rules
                    element.css({
                        "overflow-y": "auto",
                        "max-height": height + "px"
                    });

                    // And finally, set the element display to the previous value
                    element.css( "display", display );

                    // Also remove the dummy <li> created previously
                    $( li ).remove();
                }
            };

            return definition;
        }
    ]);

    module.directive( "dropdownContainer", [
        "keycodes",
        function( keycodes ) {
            var definition, keyCallbacks;

            // -------------------------------------------------------------------------------------

            keyCallbacks = {};
            keyCallbacks[ keycodes.BACKSPACE ] = handleBackspace;
            keyCallbacks[ keycodes.TAB ] = handleTabEsc;
            keyCallbacks[ keycodes.ESCAPE ] = handleTabEsc;
            keyCallbacks[ keycodes.ARROWUP ] = handleKeyNav;
            keyCallbacks[ keycodes.ARROWDOWN ] = handleKeyNav;
            keyCallbacks[ keycodes.PGUP ] = handleKeyNav;
            keyCallbacks[ keycodes.PGDOWN ] = handleKeyNav;
            keyCallbacks[ keycodes.ENTER ] = handleEnter;

            // -------------------------------------------------------------------------------------

            definition = {};
            definition.restrict = "C";
            definition.require = "^dropdown";
            definition.link = function( scope, element, attr, $dropdown ) {
                var input = element.querySelector( ".dropdown-input input" );

                // Scope Watchers
                // ---------------------------------------------------------------------------------
                scope.$watch( "$dropdown.search", function( search ) {
                    if ( search && !$dropdown.isFull() ) {
                        $dropdown.open = true;
                    }
                });

                // DOM Events
                // ---------------------------------------------------------------------------------
                element.on( "click", function() {
                    input[ 0 ].focus();
                });

                input.on( "focus", function() {
                    var full = $dropdown.isFull();

                    // Only open the options list if:
                    // 1. It's not full
                    // 2. It's full but is a single selection dropdown
                    if ( !full || ( full && $dropdown.maxItems === 1 ) ) {
                        $dropdown.open = true;
                    }

                    scope.$safeApply();
                });

                input.on( "keydown", function( evt ) {
                    var typed;
                    var key = evt.keyCode;
                    var cb = keyCallbacks[ key ];

                    if ( ng.isFunction( cb ) ) {
                        return cb( evt, scope, $dropdown );
                    }

                    // Disable searching when dropdown is full
                    typed = String.fromCharCode( key ).trim();
                    if ( $dropdown.isFull() && typed ) {
                        evt.preventDefault();
                    }
                });
            };

            return definition;

            // -------------------------------------------------------------------------------------

            function handleBackspace( evt, scope, $dropdown ) {
                // If some search is available, backspace action should be delete the last char
                if ( $dropdown.search ) {
                    return;
                }

                // Is ctrl key is pressed?
                // If yes, we'll remove all selected items;
                // Otherwise, we'll just pop the last item.
                if ( evt.ctrlKey ) {
                    $dropdown.items.splice( 0 );
                } else {
                    $dropdown.items.pop();
                }

                scope.$safeApply();
            }

            function handleKeyNav( evt, scope, $dropdown ) {
                var limit, movement, method, index;
                var options = $dropdown.options;
                var active = $dropdown.activeOption;

                if ( !$dropdown.open ) {
                    $dropdown.open = true;
                    scope.$safeApply();

                    return;
                }

                index = options.indexOf( active );
                if ( index < 0 ) {
                    index = 0;
                    active = options[ 0 ];
                }

                evt.preventDefault();

                // Determine which movement to do.
                switch ( evt.keyCode ) {
                    case keycodes.ARROWUP:
                        movement = -1;
                        break;

                    case keycodes.ARROWDOWN:
                        movement = 1;
                        break;

                    case keycodes.PGUP:
                        movement = -4;
                        break;

                    case keycodes.PGDOWN:
                        movement = 4;
                        break;

                }

                limit = movement < 0 ? 0 : options.length - 1;
                method = movement < 0 ? "max" : "min";

                active = options[ Math[ method ]( limit, index + movement ) ];
                if ( active !== $dropdown.activeOption ) {
                    $dropdown.activeOption = active;
                    scope.$safeApply();
                }
            }

            function handleEnter( evt, scope, $dropdown ) {
                evt.preventDefault();

                if ( $dropdown.open ) {
                    $dropdown.addItem( $dropdown.activeOption );
                } else {
                    $dropdown.open = true;
                }

                scope.$safeApply();
            }

            function handleTabEsc( evt, scope, $dropdown ) {
                // If it's not already blurring via tab, will do this now
                if ( evt.keyCode !== keycodes.TAB ) {
                    evt.target.blur();
                }

                scope.$safeApply( $dropdown.close );
            }
        }
    ]);

    module.service( "repeatParser", function() {
        var self = this;

        // RegExp directly taken from Angular.js ngRepeat source
        // https://github.com/angular/angular.js/blob/v1.2.16/src/ng/directive/ngRepeat.js#L211
        var exprRegex = /^\s*([\s\S]+?)\s+in\s+([\s\S]+?)(?:\s+track\s+by\s+([\s\S]+?))?\s*$/;
        var itemRegex = /^(?:([\$\w]+)|\(([\$\w]+)\s*,\s*([\$\w]+)\))$/;

        self.parse = function( expr ) {
            var lhs, rhs, trackBy, key, item;
            var match = ( expr || "" ).match( exprRegex );

            if ( !match ) {
                return;
            }

            lhs = match[ 1 ];
            rhs = match[ 2 ];
            trackBy = match[ 3 ];

            match = lhs.match( itemRegex );
            if ( !match ) {
                return;
            }

            item = match[ 3 ] || match[ 1 ];
            key = match[ 2 ];

            return {
                key: key,
                item: item,
                expr: rhs,
                trackBy: trackBy
            };
        };

        self.toNgRepeat = function( obj ) {
            var lhs = obj.key ? "(" + obj.key + ", " + obj.item + ")" : obj.item;
            var trackBy = obj.trackBy ? " track by " + obj.trackBy : "";

            return lhs + " in " + obj.expr + trackBy;
        };
    });

}( angular );