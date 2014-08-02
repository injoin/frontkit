!function( ng ) {
    "use strict";

    var $ = ng.element;
    var module = ng.module( "frontkit.offcanvas", [] );

    module.value( "offcanvasConfig", {
        swipeThreshold: 30
    });

    module.directive( "offcanvas", [
        "$parse",
        "$window",
        "$document",
        "swipeManager",
        function( $parse, $window, $document, swipeManager ) {
            var body = $document.find( "body" );

            return function( scope, element, attrs ) {
                var expr = $parse( attrs.offcanvas );
                var targetScreen = attrs.targetScreen;

                // Scope Watches
                // ---------------------------------------------------------------------------------
                scope.$watch( runTests, activateOffcanvas, true );

                // DOM Events
                // ---------------------------------------------------------------------------------
                $( $window ).on( "resize", function() {
                    // Try to activate the offcanvas by emulating Angular's scope.$watch, which
                    // provides its callback the current and the previous value.
                    activateOffcanvas( runTests(), runTests.prevResult );
                });

                // Wait for clicks in the body, and set the activation expression to false if
                // possible
                body.on( "click", function() {
                    if ( expr( scope ) ) {
                        try {
                            expr.assign( scope, false );
                            scope.$apply();
                        } catch ( e ) {}
                    }
                });

                swipeManager(function( opening ) {
                    var tests;

                    try {
                        expr.assign( scope, opening );
                    } catch ( e ) {}

                    tests = runTests();
                    tests.active = opening;

                    activateOffcanvas( tests, runTests.prevResult );
                });

                // Functions
                // ---------------------------------------------------------------------------------
                function runTests() {
                    var testElem = runTests.screenTestElement;

                    // Test right away the offcanvas activation expression
                    var result = {
                        active: !!expr( scope )
                    };

                    // Do we have a test element?
                    if ( !testElem ) {
                        // If we don't have a test element, let's create it
                        testElem = runTests.screenTestElement = $( "<div></div>" );
                        testElem.addClass( "show-" + targetScreen );
                    }

                    // Attach the element, test its display, and detach it again
                    body.append( testElem );
                    result.screen = testElem.style( "display" ) !== "none";
                    testElem.remove();

                    return result;
                }

                function activateOffcanvas( currTests, prevTests ) {
                    var active = currTests.screen && currTests.active;

                    if ( currTests.screen ) {
                        // If the offcanvas was/is active, we must show it in order to transitions
                        // show correctly.
                        // In all other cases, we can hard set it to none, so eg. if we're resizing
                        // the window and the element isn't active yet, it will not be shown right
                        // away.
                        element.css( "display",
                            prevTests.active || currTests.active ?
                                "block" :
                                "none"
                        );
                    } else {
                        // Reset to the original display value
                        element[ 0 ].style.display = "";
                    }

                    body.toggleClass( "offcanvas", currTests.screen );
                    element.toggleClass( "offcanvas-menu", currTests.screen );

                    // By using a timeout, we allow .offcanvas to be added, so transitions can
                    // happen normally
                    setTimeout(function() {
                        body.toggleClass( "offcanvas-active", active );
                        element.toggleClass( "offcanvas-menu-active", active );
                    }, 0 );

                    // Save the current result as the previous one!
                    runTests.prevResult = currTests;
                }
            };
        }
    ]);

    module.factory( "swipeManager", [
        "$injector",
        "$document",
        "offcanvasConfig",
        function( $injector, $document, offcanvasConfig ) {
            var $swipe;
            try {
                $swipe = $injector.get( "$swipe" );
            } catch ( e ) {}

            return function( callback ) {
                var lastSwipe;

                if ( !$swipe ) {
                    return;
                }

                $swipe.bind( $document, {
                    start: function( coords ) {
                        lastSwipe = coords;
                    },
                    end: function( coords ) {
                        var dist = coords.x - lastSwipe.x;
                        var direction = dist > 0 ? "right" : "left";

                        // Do we have swiped enough to do the callback?
                        if ( Math.abs( dist ) > offcanvasConfig.swipeThreshold ) {
                            callback( direction === "right" ? true : false );
                        }
                    }
                });
            };
        }
    ]);

}( angular );