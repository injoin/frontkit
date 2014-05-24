!function( ng ) {
    "use strict";

    var module = ng.module( "frontkit.dropdown", [
        "frontkit.utils",
        "templates/dropdown/single.html"
    ]);

    module.directive( "dropdown", [
        "$compile",
        "$templateCache",
        function( $compile, $templateCache ) {
            var definition = {};

            definition.scope = {
                placeholder: "@"
            };

            definition.link = function( scope, element ) {
                var $dropdown;
                var templateUrl = "templates/dropdown/single.html";

                // Save the reference to the original element in the scope
                scope.$select = element;

                // Compile the dropdown template and place it after the original element
                $dropdown = $compile( $templateCache.get( templateUrl ) )( scope );
                element.after( $dropdown );

                // Hide the original element
                element.css( "display", "none" );
            };

            return definition;
        }
    ]);

    module.controller( "DropdownController", [
        "$$safeApply",
        "$filter",
        "$scope",
        function( $$safeApply, $filter, $scope ) {
            var options, open, value, highlighted;
            var filterFilter = $filter( "filter" );
            var ctrl = this;

            // Initialize the search object
            var search = {
                text: ""
            };

            // Get/set the current option set.
            // If a search is available, the options will be filtered.
            ctrl.options = function( val ) {
                // If it's not an array, we'll not overwrite the options.
                // Let's just return the filtered value.
                if ( !ng.isArray( val ) ) {
                    return filterFilter( options || [], search );
                }

                options = val;
                $$safeApply( $scope );
            };

            ctrl.value = function( val ) {
                var i;

                // If no value was passed, let's return the value
                if ( val === undefined ) {
                    return value || null;
                }

                // Try to the find the option with the passed value
                if ( val != null && !val.value ) {
                    for ( i = 0; i < options.length; i++ ) {
                        if ( options[ i ].value === val ) {
                            val = options[ i ];
                            break;
                        }
                    }
                }

                // Actually set the value
                value = val;

                // Reset highlighted position to the current value
                if ( val != null ) {
                    highlighted = options.indexOf( val );
                }

                $$safeApply( $scope );
            };

            ctrl.isOpen = function() {
                return !!open;
            };

            ctrl.open = $$safeApply( $scope, function() {
                open = true;
            });

            ctrl.close = $$safeApply( $scope, function() {
                open = false;
            });

            ctrl.highlighted = function( val ) {
                if ( typeof val !== "number" ) {
                    return highlighted != null ? highlighted : -1;
                }

                highlighted = val;
                $$safeApply( $scope );
            };

            ctrl.setSearch = $$safeApply( $scope, function( str ) {
                search.text = str;
            });

            $scope.$watch();
        }
    ]);

    module.directive( "dropdownWrapper", [
        "$timeout",
        "$document",
        function( $timeout, $document ) {
            var definition = {};

            definition.controller = "DropdownController";
            definition.controllerAs = "$";

            definition.link = function( scope, element, attrs, controller ) {
                var $original = scope.$select;

                // Scope Watches
                // -------------
                // Watch on the input value and set the current search accordingly.
                // If a value is present, then a empty string will be set - can't be null otherwise
                // Angular's filter filter won't work.
                scope.$watch( "input", function( input ) {
                    controller.setSearch( controller.value() == null ? input : "" );
                });

                // Whenever the dropdown value is set/unset, we'll replace the input value and the
                // original select element. Also, the dropdown must be closed if value was set.
                scope.$watch( wrapFn( controller.value ), function( val ) {
                    // If there's a value, we'll close the dropdown
                    if ( val ) {
                        controller.close();
                    }

                    // Set the input to the current value text or empty string, if no value!
                    scope.input = val ? val.text : "";

                    // Set the new selected value in the original select
                    $timeout(function() {
                        $original.val( val ? val.value : null );
                        $original.triggerHandler( "change" );
                    });
                });

                // Whenever the options change, the highlighted index must be reset.
                // Either to the -1 index or to the selected option.
                scope.$watch( wrapFn( controller.options ), function( options ) {
                    var value = controller.value();
                    var index = value ? options.indexOf( value ) : -1;

                    controller.highlighted( index );
                }, true );

                // Watch for changes in <option> elements.
                // This allows ng-options (in <select>) and ng-repeat (in <option>) to be used.
                scope.$watch(function() {
                    var options = $original[ 0 ].querySelectorAll( "option" );
                    return toArray( options ).filter(function( option ) {
                        // Ignore empty option
                        return option.value !== "" && option.value !== "?";
                    }).map(function( option ) {
                        return {
                            value: option.value,
                            text: option.text
                        };
                    });
                }, function( options ) {
                    // Clear current options by setting the new values
                    controller.options( options );
                }, true );

                // DOM Events
                // ----------
                // Whenever there's a click inside the dropdown, we'll stop propagating it.
                // This works to prevent that $document click close the dropdown while we're
                // still clicking inside it.
                element.on( "click", function( evt ) {
                    evt.stopPropagation();
                });

                // When a click reaches the document, we need to close the dropdown
                $document.on( "click", controller.close );
            };

            return definition;
        }
    ]);

    module.directive( "dropdownInput", [
        "$timeout",
        "keycodes",
        function( $timeout, keycodes ) {
            var definition = {};

            definition.restrict = "C";
            definition.require = "^dropdownWrapper";

            definition.link = function( scope, element, attrs, controller ) {
                var input = element[ 0 ];

                element.on( "focus", function() {
                    var pos;

                    if ( controller.value() == null ) {
                        return;
                    }

                    // Wait until the element is really focused
                    $timeout(function() {
                        pos = input.value.length;

                        if ( input.setSelectionRange ) {
                            input.setSelectionRange( pos, pos );
                        } else if ( input.createTextRange ) {
                            var range = input.createTextRange();
                            range.collapse( true );
                            range.moveEnd( "character", pos );
                            range.moveStart( "character", pos );
                            range.select();
                        }
                    });
                });

                element.on( "keydown", function( evt ) {
                    var index = controller.highlighted();
                    var key = evt.keyCode;
                    var options = controller.options();

                    // On escape, close and blur.
                    // On enter, set a value and blur.
                    if ( key === keycodes.ESCAPE ) {
                        controller.close();
                        return input.blur();
                    } else if ( key === keycodes.ENTER ) {
                        controller.value( options[ index ] );
                        return input.blur();
                    }

                    if ( key === keycodes.ARROWUP || key === keycodes.ARROWDOWN ) {
                        evt.preventDefault();

                        // Limit the arrow navigation to the first/last item in the option list
                        if ( key === keycodes.ARROWUP ) {
                            index = Math.max( 0, index - 1 );
                        } else if ( key === keycodes.ARROWDOWN ) {
                            index = Math.min( options.length - 1, index + 1 );
                        }

                        controller.highlighted( index );
                    }

                    if ( controller.value() != null ) {
                        // Anything that's not trying to delete the current value is not welcome!
                        if ( key !== keycodes.BACKSPACE ) {
                            return evt.stopPropagation();
                        }

                        // Clear the value when backspace is pressed
                        controller.value( null );
                    }
                });
            };

            return definition;
        }
    ]);

    module.directive( "dropdownOptions", [
        "$timeout",
        function( $timeout ) {
            var definition = {};

            definition.restrict = "C";
            definition.require = "^dropdownWrapper";

            definition.link = function( scope, element, attrs, controller ) {
                var list = element[ 0 ];

                scope.$watch( wrapFn( controller.highlighted ), adjustScroll );
                scope.$watch( wrapFn( controller.isOpen ), function( open ) {
                    if ( open ) {
                        // Wait until it's really opened
                        $timeout(function() {
                            adjustScroll( controller.highlighted() );
                        });
                    }
                });

                function adjustScroll( index ) {
                    var fromScrollTop;
                    var scrollTop = list.scrollTop;
                    var optionElem = list.querySelectorAll( ".dropdown-option" )[ index ];

                    // Option inexistent? Let's just do nothing
                    if ( !optionElem ) {
                        return;
                    }

                    fromScrollTop = optionElem.offsetTop - list.scrollTop;

                    // If the option is above the current scroll, we'll make it appear on the top of
                    // the scroll. Otherwise, it'll appear in the end of the scroll view.
                    if ( fromScrollTop < 0 ) {
                        scrollTop = optionElem.offsetTop;
                    } else if ( list.clientHeight <= fromScrollTop ) {
                        scrollTop = optionElem.offsetTop +
                                    optionElem.clientHeight -
                                    list.clientHeight;
                    }

                    list.scrollTop = scrollTop;
                }
            };

            return definition;
        }
    ]);

    function toArray( elem ) {
        return [].slice.call( elem );
    }

    function wrapFn( fn ) {
        return function() {
            return fn();
        };
    }

}( angular );