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