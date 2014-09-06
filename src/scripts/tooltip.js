!function( ng ) {
    "use strict";

    var $ = ng.element;
    var module = ng.module( "frontkit.tooltip", [] );

    module.directive( "tooltip", [
        "$document",
        function( $document ) {
            var tooltip = $( "<span>" ).addClass( "tooltip" );
            $document.find( "body" ).append( tooltip );

            return function( scope, element ) {
                var timeout;
                var title = element.attr( "title" );

                element.attr( "title", "" );

                element.on( "mouseenter", function() {
                    timeout = setTimeout(function() {
                        var rect = element[ 0 ].getBoundingClientRect();
                        timeout = null;

                        tooltip.text( title ).addClass( "visible" );
                        tooltip.css({
                            top: rect.bottom + "px",
                            left: rect.left + ( rect.width / 2 ) + "px"
                        });
                    }, 300 );
                });

                element.on( "mouseleave", function() {
                    if ( timeout ) {
                        clearTimeout( timeout );
                        timeout = null;
                        return;
                    }

                    tooltip.removeClass( "visible" );
                });
            };
        }
    ]);
}( angular );