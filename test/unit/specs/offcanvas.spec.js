describe( "Offcanvas Directive", function() {
    "use strict";

    var $rootScope, $rootElement, $compile;
    var $ = angular.element;

    before(function() {
        var style = this.styleBiggerScreen = document.createElement( "style" );
        style.textContent = ".show-tiny { display: none !important; }";

        style = this.styleTinyScreen = document.createElement( "style" );
        style.textContent = ".show-tiny { display: block !important; }";

        $( document.head ).append( this.styleTinyScreen );
    });

    beforeEach( module( "ngTouch", "frontkit.offcanvas" ) );
    beforeEach( inject(function( $injector ) {
        $rootScope = $injector.get( "$rootScope" );
        $rootElement = $injector.get( "$rootElement" );
        $compile = $injector.get( "$compile" );

        this.menu = angular.element( "<div></div>" );
        $rootElement.append( this.menu );

        this.compile = function( expr ) {
            this.menu.attr( "offcanvas", expr );
            $compile( this.menu )( $rootScope );
            $rootScope.$apply();

            return this.menu;
        };

        this.getClasses = function( element ) {
            element = element.nodeType ? element : element[ 0 ];
            return element.className.split( " " );
        };
    }));

    afterEach(function() {
        this.menu.remove();
        $( this.styleBiggerScreen ).remove();
    });

    // ---------------------------------------------------------------------------------------------

    it( "should exist", inject(function( $injector ) {
        var getDirective = function() {
            return $injector.get( "offcanvasDirective" );
        };

        expect( getDirective ).to.not.throw( Error );
    }));

    it( "should not conflict with other offcanvas instances", function( done ) {
        var ctx = this;

        // Create another offcanvas menu
        var another = this.menu.clone();
        another.attr( "offcanvas", "test" );
        $compile( another )( $rootScope );
        $rootElement.append( another );

        // ...and now compile the original menu, with the opposite condition
        $rootScope.test = false;
        this.compile( "!test" );

        setTimeout(function() {
            expect( ctx.getClasses( ctx.menu ) ).to.contain( "offcanvas-menu-active" );
            expect( ctx.getClasses( another ) ).to.not.contain( "offcanvas-menu-active" );

            $rootScope.test = true;
            $rootScope.$apply();

            setTimeout(function() {
                expect( ctx.getClasses( ctx.menu ) ).to.not.contain( "offcanvas-menu-active" );
                expect( ctx.getClasses( another ) ).to.contain( "offcanvas-menu-active" );

                done();
            }, 0 );
        }, 0 );
    });

    // ---------------------------------------------------------------------------------------------

    describe( "when there's a click in body", function() {
        it( "should assign false to expression when it's true", function() {
            $rootScope.prop = false;
            this.compile( "prop" );

            $( document.body ).triggerHandler( "click" );
            expect( $rootScope.prop ).to.not.be.ok;
        });

        it( "should assign false to expression when it's true", function() {
            $rootScope.prop = true;
            this.compile( "prop" );

            $( document.body ).triggerHandler( "click" );
            expect( $rootScope.prop ).to.not.be.ok;
        });
    });

    // ---------------------------------------------------------------------------------------------

    describe( "when no target screen is set", function() {
        it( "should add .offcanvas to body", function() {
            this.compile( "1" );
            expect( this.getClasses( document.body ) ).to.contain( "offcanvas" );
        });

        it( "should add .offcanvas-menu to the menu", function() {
            this.compile( "1" );
            expect( this.getClasses( this.menu ) ).to.contain( "offcanvas-menu" );
        });

        it( "should activate by expression", function( done ) {
            var ctx = this;
            this.compile( "1" );

            setTimeout(function() {
                expect( ctx.getClasses( document.body ) ).to.contain( "offcanvas-active" );
                done();
            }, 0 );
        });
    });

    // ---------------------------------------------------------------------------------------------

    describe( "when in the target screen", function() {
        beforeEach(function() {
            $rootScope.fn = sinon.stub().returns( true );
            this.menu.attr( "target-screen", "tiny" );
            this.compile( "fn()" );
        });

        it( "should add .offcanvas to body", function() {
            expect( this.getClasses( document.body ) ).to.contain( "offcanvas" );
        });

        it( "should add .offcanvas-menu to the menu", function() {
            expect( this.getClasses( this.menu ) ).to.contain( "offcanvas-menu" );
        });

        it( "should set display: none when the expression is false",function() {
            $rootScope.fn.returns( false );
            this.compile( "fn()" );

            expect( this.menu[ 0 ].style.display ).to.equal( "none" );
        });

        it( "should set display: block whenever the expression is true", function() {
            // fn() returns false
            $rootScope.fn.returns( false );
            $rootScope.$apply();

            expect( this.menu[ 0 ].style.display ).to.equal( "block" );

            // Let's make it return true now. display: block should keep
            $rootScope.fn.returns( true );
            $rootScope.$apply();

            expect( this.menu[ 0 ].style.display ).to.equal( "block" );
        });
    });

    // ---------------------------------------------------------------------------------------------

    describe( "when not in the target screen", function() {
        beforeEach(function() {
            $( document.head ).append( this.styleBiggerScreen );

            this.menu.attr( "target-screen", "tiny" );
            this.compile( "1" );
        });

        it( "should not add .offcanvas to body", function() {
            expect( this.getClasses( document.body ) ).to.not.contain( "offcanvas" );
        });

        it( "should not add .offcanvas-menu to the menu", function() {
            expect( this.getClasses( this.menu ) ).to.not.contain( "offcanvas-menu" );
        });

        it( "should reset display value", function() {
            this.menu.attr( "target-screen", "tiny" );
            this.compile( "1" );

            expect( this.menu[ 0 ].style.display ).to.equal( "" );
        });
    });

    // ---------------------------------------------------------------------------------------------

    describe( "when there's a resize", function() {
        it( "should update display property", function() {
            this.menu.attr( "target-screen", "tiny" );
            this.compile( "1" );
            expect( this.menu[ 0 ].style.display ).to.equal( "block" );

            $( document.head ).append( this.styleBiggerScreen );
            $( window ).triggerHandler( "resize" );
            expect( this.menu[ 0 ].style.display ).to.equal( "" );
        });
    });

    // ---------------------------------------------------------------------------------------------

    describe( "when has ngTouch available", function() {
        var offcanvasConfig;

        beforeEach( inject(function( $injector ) {
            offcanvasConfig = $injector.get( "offcanvasConfig" );

            this.startEvent = document.createEvent( "Event" );
            this.startEvent.initEvent( "touchstart", true, true );
            this.startEvent.clientY = 0;

            this.endEvent = document.createEvent( "Event" );
            this.endEvent.initEvent( "touchend", true, true );
            this.endEvent.clientY = 0;
        }));

        it( "should open on swipe to right", function() {
            this.compile( "foo" );

            // Trigger touchstart...
            this.startEvent.clientX = 0;
            document.dispatchEvent( this.startEvent );

            // ...and then touchend
            this.endEvent.clientX = offcanvasConfig.swipeThreshold + 1;
            document.dispatchEvent( this.endEvent );

            expect( $rootScope.foo ).to.be.ok;
        });

        it( "should close on swipe to left", function() {
            $rootScope.foo = true;
            this.compile( "foo" );

            // Trigger touchstart...
            this.startEvent.clientX = offcanvasConfig.swipeThreshold + 1;
            document.dispatchEvent( this.startEvent );

            // ...and then touchend
            this.endEvent.clientX = 0;
            document.dispatchEvent( this.endEvent );

            expect( $rootScope.foo ).to.not.be.ok;
        });

        it( "should not do anything if not enough swiped distance", function() {
            this.compile( "foo" );

            // Trigger touchstart...
            this.startEvent.clientX = 0;
            document.dispatchEvent( this.startEvent );

            // ...and then touchend
            this.endEvent.clientX = offcanvasConfig.swipeThreshold;
            document.dispatchEvent( this.endEvent );

            expect( $rootScope.foo ).to.be.undefined;
        });

    });
});

// -------------------------------------------------------------------------------------------------

describe( "Offcanvas Directive", function() {
    "use strict";

    var $rootScope;
    var $ = angular.element;

    beforeEach( module( "frontkit.offcanvas" ) );
    beforeEach( inject(function( $injector ) {
        var $rootElement = $injector.get( "$rootElement" );
        var $compile = $injector.get( "$compile" );
        $rootScope = $injector.get( "$rootScope" );

        this.menu = $( "<div></div>" );
        $rootElement.append( this.menu );

        this.compile = function( expr ) {
            this.menu.attr( "offcanvas", expr );
            $compile( this.menu )( $rootScope );
            $rootScope.$apply();

            return this.menu;
        };
    }));

    describe( "when ngTouch is not available", function() {
        it( "should not try to bind to swipe events", inject(function( offcanvasConfig ) {
            var startEvent, endEvent;
            this.compile( "foo" );

            startEvent = document.createEvent( "Event" );
            startEvent.initEvent( "touchstart", true, true );
            startEvent.clientX = 0;
            startEvent.clientY = 0;
            document.dispatchEvent( startEvent );

            endEvent = document.createEvent( "Event" );
            endEvent.initEvent( "touchend", true, true );
            endEvent.clientX = offcanvasConfig.swipeThreshold + 1;
            endEvent.clientY = 0;
            document.dispatchEvent( endEvent );

            expect( $rootScope.foo ).to.be.undefined;
        }));
    });
});