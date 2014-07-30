!function( ng ) {
    "use strict";

    var $ = ng.element;
    var module = ng.module( "frontkit.utils", [] );

    module.constant( "keycodes", {
        BACKSPACE: 8,
        TAB: 9,
        ENTER: 13,
        ESCAPE: 27,
        SPACE: 32,
        PGUP: 33,
        PGDOWN: 34,
        ARROWLEFT: 37,
        ARROWUP: 38,
        ARROWRIGHT: 39,
        ARROWDOWN: 40
    });

    module.config([
        "$provide",
        function( $provide ) {
            // Function to help determine if a variable is a valid type for an Angular expression
            // This means only strings (because they'll be evaluated) and functions (because they're
            // executable)
            var isExpr = function( expr ) {
                return typeof expr === "string" || ng.isFunction( expr );
            };

            $provide.decorator( "$rootScope", function( $delegate ) {
                $delegate.$safeApply = function( scope, expr ) {
                    var parent;

                    // Is the first arg an expression? If so, we'll use $rootScope as our scope of
                    // choice for triggering the digest
                    if ( isExpr( scope ) ) {
                        expr = scope;
                        scope = $delegate;
                    }

                    // If no scope was passed, fallback to $rootScope
                    scope = scope || $delegate;

                    // Eval the expression, if there's any
                    if ( isExpr( expr ) ) {
                        scope.$eval( expr );
                    }

                    // Find out if one of the parent scopes is in a phase
                    parent = scope;
                    while ( parent ) {
                        // Is this scope is in a phase, we need to return now
                        if ( parent.$$phase ) {
                            return;
                        }

                        parent = parent.$parent;
                    }

                    // Finally apply if no parent scope is in a phase
                    scope.$apply();
                };

                return $delegate;
            });
        }
    ]);

    // Extensions to jQLite
    $.prototype.querySelector = function( str ) {
        return $( this[ 0 ].querySelector( str ) );
    };

    $.prototype.querySelectorAll = function( str ) {
        return $( this[ 0 ].querySelectorAll( str ) );
    };

    $.prototype.style = function( prop ) {
        var view = this[ 0 ].ownerDocument.defaultView;
        var styles = view.getComputedStyle( this[ 0 ], null );

        return styles.getPropertyValue( prop );
    };

}( angular );