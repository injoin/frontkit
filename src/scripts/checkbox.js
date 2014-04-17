!function( ng ) {
    "use strict";

    var template = "<span class='checkbox' tabindex='0'></span>";

    var module = ng.module( "frontkit.checkbox", [
        "frontkit.utils"
    ]);

    module.directive( "checkbox", [
        "$compile",
        "$timeout",
        "keycodes",
        function( $compile, $timeout, keycodes ) {
            var definition = {};

            definition.restrict = "A";
            definition.link = function( scope, input, attr ) {
                var styled = $compile( template )( scope );
                input.after( styled );
                input.addClass( "hide" );

                styled.on( "keypress", function( evt ) {
                    // Space is the only key that triggers an click on a checkbox, the far we know
                    if ( evt.type === "keypress" && evt.which !== keycodes.SPACE ) {
                        return;
                    }

                    styled.triggerHandler( "click" );
                    evt.preventDefault();
                });

                styled.on( "click", function( evt ) {
                    evt.preventDefault();

                    input.prop( "checked", !input.prop( "checked" ) );
                    $timeout(function() {
                        // Activate Angular's native checkbox directive
                        input.triggerHandler( "click" );
                    });
                });
            };

            return definition;
        }
    ]);

}( angular );