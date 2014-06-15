/* jshint unused: false */
!function( ng ) {
    "use strict";

    var $ = ng.element;
    var module = ng.module( "frontkit.dropdown", [
        "frontkit.utils"
    ]);

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

                if ( ngModel ) {
                    scope.$watch( "$dropdown.items", function( items ) {
                        items = $dropdown.maxItems === 1 ? items[ 0 ] : items;
                        ngModel.$setViewValue( items );
                    }, true );

                    ngModel.$render = function() {
                        var value = ngModel.$viewValue;
                        if ( value == null ) {
                            $dropdown.items = [];
                            return;
                        }

                        $dropdown.items = ng.isArray( value ) ? value : [ value ];
                    };
                }

                element.on( "click", function( evt ) {
                    evt.stopPropagation();
                });

                $document.on( "click", function() {
                    scope.$safeApply( $dropdown.close );
                });

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
                $scope.$watch( model, function( value ) {
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
                                throw new Error();
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
        function() {
            var definition = {};

            definition.restrict = "EA";
            definition.replace = true;
            definition.transclude = true;
            definition.templateUrl = "templates/dropdown/items.html";
            definition.require = "^dropdown";

            definition.link = function( scope, element, attr, $dropdown ) {
                attr.$observe( "placeholder", function( placeholder ) {
                    $dropdown.placeholder = placeholder;
                });
            };

            return definition;
        }
    ]);

    module.directive( "dropdownOptions", [
        "repeatParser",
        function( repeatParser ) {
            var definition = {};

            definition.restrict = "EA";
            definition.replace = true;
            definition.transclude = true;
            definition.templateUrl = "templates/dropdown/options.html";
            definition.require = "^dropdown";

            definition.compile = function( tElement, tAttr ) {
                var model;
                var option = tElement.querySelector( ".dropdown-option" );
                var repeat = repeatParser.parse( tAttr.items );

                if ( !repeat ) {
                    return;
                }

                model = repeat.expr;
                repeat.expr = "$dropdown.options";

                option.attr( "ng-repeat", repeatParser.toNgRepeat( repeat ) );
                option.attr( "ng-click", "$dropdown.addItem( " + repeat.item + " )" );
                option.attr( "ng-class", "{" +
                    "active: $dropdown.activeOption === " + repeat.item +
                "}" );

                return function( scope, element, attr, $dropdown ) {
                    var list = element[ 0 ];
                    $dropdown.parseOptions( model );
                    $dropdown.valueKey = tAttr.value || null;

                    scope.$watch( "$dropdown.open", adjustScroll );
                    scope.$watch( "$dropdown.activeOption", adjustScroll );

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
                };
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