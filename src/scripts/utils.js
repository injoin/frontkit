!function( ng ) {
    "use strict";

    var module = ng.module( "frontkit.utils", [] );

    module.constant( "keycodes", {
        BACKSPACE: 8,
        ENTER: 13,
        ESCAPE: 27,
        SPACE: 32,
        ARROWLEFT: 37,
        ARROWUP: 38,
        ARROWRIGHT: 39,
        ARROWDOWN: 40
    });

    module.factory( "$$safeApply", [
        "$rootScope",
        function( $rootScope ) {
            var apply = function( scope ) {
                scope = scope || $rootScope;
                !$rootScope.$$phase && scope.$apply();
            };

            return function( scope, fn ) {
                // If a function was passed, everytime it's called a digest will be triggered.
                if ( ng.isFunction( fn ) ) {
                    return function() {
                        var ret = fn.apply( this, arguments );
                        apply( scope );

                        return ret;
                    };
                }

                // If no function, simply trigger a digest now.
                apply( scope );
            };
        }
    ]);

}( angular );