!function( ng ) {
    "use strict";

    var baseTemplate = "<span class='DIRECTIVE' tabindex='0'></span>";

    var module = ng.module( "frontkit.checkbox", [
        "frontkit.utils"
    ]);

    [ "checkbox", "radio" ].forEach(function( directive ) {
        var template = baseTemplate.replace( "DIRECTIVE", directive );

        module.directive( directive, [
            "$compile",
            "$timeout",
            "keycodes",
            function( $compile, $timeout, keycodes ) {
                var definition = {};

                definition.restrict = "A";
                definition.link = function( scope, input ) {
                    var styled = $compile( template )( scope );
                    input.after( styled );
                    input.addClass( "hide" );

                    input.on( "$destroy", function() {
                        // Remove the styled element as well
                        styled.remove();
                    });

                    styled.on( "keypress", function( evt ) {
                        // Space is the only key that triggers an click on a checkbox/radio, the far
                        // we know
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
    });

}( angular );