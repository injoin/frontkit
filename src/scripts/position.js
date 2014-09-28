!function( ng ) {
    "use strict";

    var $ = ng.element;
    var module = ng.module( "frontkit.position", [] );

    var debounce = function( fn, wait ) {
        var timeout;

        return function() {
            var ctx = this;
            var args = arguments;
            clearTimeout( timeout );

            timeout = setTimeout(function() {
                fn.apply( ctx, args );
            }, wait );
        };
    };

    module.provider( "$$position", function() {
        var provider = {};
        var getPosition = function( axis, pos ) {
            var regexp = getPosition[ axis ];
            return regexp.test( pos ) ? pos : provider.defaults[ axis ];
        };
        getPosition.x = /^left|center|right$/;
        getPosition.y = /^top|center|bottom$/;

        provider.defaults = {
            x: "center",
            y: "center"
        };

        provider.repositionDelay = 10;

        provider.$get = function( $window ) {
            var elements = [];
            var getRect = function( element ) {
                var options = element.data( module.name );
                var targetRect = options.target[ 0 ].getBoundingClientRect();
                var selfRect = element[ 0 ].getBoundingClientRect();

                return {
                    target: targetRect,
                    self: selfRect
                };
            };

            var reposition = function( rect, element ) {
                var top, left;
                var options = element.data( module.name );
                var width = options.copyWidth ? rect.target.width : rect.self.width;
                var height = options.copyHeight ? rect.target.height : rect.self.height;

                if ( options.copyWidth ) {
                    element.css( "width", width + "px" );
                }

                if ( options.copyHeight ) {
                    element.css( "height", height + "px" );
                }

                switch ( options.x ) {
                    case "left":
                        left = rect.target.left - rect.self.width;
                        break;

                    case "center":
                        left = rect.target.left + ( rect.target.width / 2 ) - ( width / 2 );
                        break;

                    case "right":
                        left = rect.target.right;
                        break;
                }

                switch ( options.y ) {
                    case "top":
                        top = rect.target.top - rect.self.height;
                        break;

                    case "center":
                        top = rect.target.top + ( rect.target.height / 2 ) - ( height / 2 );
                        break;

                    case "bottom":
                        top = rect.target.bottom;
                        break;
                }

                element.css({
                    position: "fixed",
                    top: top + "px",
                    left: left + "px",
                    right: "auto",
                    bottom: "auto",
                    "z-index": ( +options.target.style( "z-index" ) || 0 ) + 1
                });
            };

            $( $window ).on( "resize scroll", debounce(function() {
                elements.forEach(function( element ) {
                    reposition( getRect( element ), element );
                });
            }, provider.repositionDelay ) );

            return function( element, options ) {
                element = $( element );

                options = options || {};
                options.target = $( options.target );

                if ( !element.length || !options.target.length ) {
                    return;
                }

                options.x = getPosition( "x", options.x );
                options.y = getPosition( "y", options.y );
                element.data( module.name, options );

                elements.push( element );
                element.on( "$destroy", function() {
                    elements.splice( elements.indexOf( element ), 1 );
                });

                element.scope().$watch(function() {
                    return getRect( element );
                }, function( rect ) {
                    reposition( rect, element );
                }, true );
            };
        };

        return provider;
    });
}( angular );