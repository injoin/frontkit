!function( ng ) {
    "use strict";

    var toArray = function( elem ) {
        return [].slice.call( elem );
    };
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

                // Watch for changes in <option> elements.
                // This allows ng-options (in <select>) and ng-repeat (in <option>) to be used.
                scope.$watch(function() {
                    var options = element[ 0 ].querySelectorAll( "option" );
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
                    // Clear current options
                    scope.options = options;
                }, true );
            };

            return definition;
        }
    ]);

    module.controller( "DropdownController", [
        "$$safeApply",
        "$scope",
        function( $$safeApply, $scope ) {
            var ctrl = this;
            var open = false;
            var value = null;
            var highlighted = -1;

            ctrl.value = $$safeApply( $scope, function( val ) {
                var i;

                if ( val === undefined ) {
                    return value;
                }

                // Try to the find the option with the passed value
                if ( val != null && !val.value ) {
                    for ( i = 0; i < $scope.options.length; i++ ) {
                        if ( $scope.options[ i ].value === val ) {
                            val = $scope.options[ i ];
                            break;
                        }
                    }
                }

                // Actually set the value
                value = val;

                // Reset highlighted position to the current value
                if ( val != null ) {
                    highlighted = $scope.options.indexOf( val );
                }
            });

            ctrl.isOpen = function() {
                return open;
            };

            ctrl.open = $$safeApply( $scope, function() {
                open = true;
            });

            ctrl.close = $$safeApply( $scope, function() {
                open = false;
            });

            ctrl.highlighted = $$safeApply( $scope, function( val ) {
                if ( typeof val !== "number" ) {
                    return highlighted;
                }

                highlighted = val;
            });
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

                // Create a filter for the option list
                scope.search = {
                    text: ""
                };

                // Scope Watches
                // -------------
                // Watch on the input value and set the current search accordingly.
                // If a value is present, then a empty string will be set - can't be null otherwise
                // Angular's filter filter won't work.
                scope.$watch( "input", function( input ) {
                    scope.search.text = controller.value() == null ? input : "";
                });

                // Whenever the dropdown value is set/unset, we'll replace the input value and the
                // original select element. Also, the dropdown must be closed if value was set.
                scope.$watch(function() {
                    return controller.value();
                }, function( val ) {
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

                scope.$watch( "options", function() {
                    controller.highlighted( -1 );
                });

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

                    // On escape, close and blur.
                    // On enter, set a value and blur.
                    if ( key === keycodes.ESCAPE ) {
                        controller.close();
                        return input.blur();
                    } else if ( key === keycodes.ENTER ) {
                        controller.value( scope.options[ index ] );
                        return input.blur();
                    }

                    if ( key === keycodes.ARROWUP || key === keycodes.ARROWDOWN ) {
                        evt.preventDefault();

                        // Limit the arrow navigation to the first/last item in the option list
                        if ( key === keycodes.ARROWUP ) {
                            index = Math.max( 0, index - 1 );
                        } else if ( key === keycodes.ARROWDOWN ) {
                            index = Math.min( scope.options.length - 1, index + 1 );
                        }

                        controller.highlighted( index );
                    }

                    if ( controller.value() != null ) {
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
        function() {
            var definition = {};

            definition.restrict = "C";
            definition.require = "^dropdownWrapper";

            definition.link = function( scope, element, attrs, controller ) {
                var list = element[ 0 ];

                scope.$watch(function() {
                    return controller.highlighted();
                }, function( index ) {
                    var fromScrollTop;
                    var scrollTop = list.scrollTop;
                    var options = list.querySelectorAll( ".dropdown-option" );
                    var option = options[ index ];

                    // Option inexistent? Let's just do nothing
                    if ( !option ) {
                        return;
                    }

                    fromScrollTop = option.offsetTop - list.scrollTop;

                    // If the option is above the current scroll, we'll make it appear on the top of
                    // the scroll. Otherwise, it'll appear in the end of the scroll view.
                    if ( fromScrollTop < 0 ) {
                        scrollTop = option.offsetTop;
                    } else if ( list.clientHeight <= fromScrollTop ) {
                        scrollTop = option.offsetTop + option.clientHeight - list.clientHeight;
                    }

                    list.scrollTop = scrollTop;
                });
            };

            return definition;
        }
    ]);

}( angular );