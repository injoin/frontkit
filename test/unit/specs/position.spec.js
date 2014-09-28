describe( "Position Service", function() {
    "use strict";

    var $$position, $rootScope, $window;
    var $ = angular.element;

    beforeEach( module( "frontkit.position" ) );
    beforeEach( inject(function( $injector ) {
        var $compile = $injector.get( "$compile" );
        var $document = $injector.get( "$document" );
        $rootScope = $injector.get( "$rootScope" );
        $window = $injector.get( "$window" );
        $$position = $injector.get( "$$position" );

        this.testElem = $compile( $( "<div>" ).text( "foo" ) )( $rootScope );
        this.targetElem = $compile( $( "<div>" ).text( "bar" ) )( $rootScope );
        this.options = {
            target: this.targetElem
        };
        $document.find( "body" ).append( this.testElem ).append( this.targetElem );

        this.clock = sinon.useFakeTimers();

        this.rect = function() {
            return {
                self: this.testElem[ 0 ].getBoundingClientRect(),
                target: this.targetElem[ 0 ].getBoundingClientRect()
            };
        };
    }));

    afterEach(function() {
        this.testElem.remove();
        this.targetElem.remove();
    });

    it( "should skip if no element provided", function() {
        $$position();
        expect( this.testElem.data( "frontkit.position" ) ).to.be.undefined;
    });

    it( "should skip if no target provided", function() {
        $$position( this.testElem );
        expect( this.testElem.data( "frontkit.position" ) ).to.be.undefined;
    });

    it( "should use default positioning options", function() {
        $$position( this.testElem, this.options );
        expect( this.options.x ).to.equal( "center" );
        expect( this.options.y ).to.equal( "center" );
    });

    it( "should set z-index bigger than target z-index", function() {
        this.targetElem.css({
            position: "relative",
            "z-index": 10
        });

        $$position( this.testElem, this.options );
        $rootScope.$apply();

        expect( this.testElem.css( "z-index" ) ).to.equal( "11" );
    });

    it( "should copy width of target with copyWidth", function() {
        var rect;

        this.options.copyWidth = true;
        $$position( this.testElem, this.options );
        $rootScope.$apply();

        rect = this.rect();
        expect( rect.self.width ).to.equal( rect.target.width );
    });

    it( "should copy height of target with copyHeight", function() {
        var rect;

        this.options.copyHeight = true;
        $$position( this.testElem, this.options );
        $rootScope.$apply();

        rect = this.rect();
        expect( rect.self.height ).to.equal( rect.target.height );
    });

    // ---------------------------------------------------------------------------------------------

    describe( "repositioning", function() {
        it( "should occur on scroll", function() {
            $$position( this.testElem, this.options );

            $( $window ).triggerHandler( "scroll" );
            this.clock.tick( 100 );

            expect( this.testElem.css( "position" ) ).to.equal( "fixed" );
        });

        it( "should occur on resize", function() {
            $$position( this.testElem, this.options );

            $( $window ).triggerHandler( "resize" );
            this.clock.tick( 100 );

            expect( this.testElem.css( "position" ) ).to.equal( "fixed" );
        });

        it( "should occur on scope watch", function() {
            $$position( this.testElem, this.options );

            $rootScope.$apply();
            expect( this.testElem.css( "position" ) ).to.equal( "fixed" );
        });
    });

    // ---------------------------------------------------------------------------------------------

    describe( "X axis", function() {
        it( "should place in the left", function() {
            var rect;

            this.options.x = "left";
            $$position( this.testElem, this.options );
            $rootScope.$apply();

            rect = this.rect();
            expect( rect.self.right ).to.equal( rect.target.left );
        });

        it( "should place in the center", function() {
            var rect, center;

            this.options.x = "center";
            $$position( this.testElem, this.options );
            $rootScope.$apply();

            rect = this.rect();
            center = rect.target.left + ( rect.target.width / 2 ) - ( rect.self.width / 2 );

            // To avoid Webkit weirdness with decimal units, let's just round the result and
            // the actual values, so tests can properly pass
            expect( Math.round( rect.self.left ) ).to.equal( Math.round( center ) );
        });

        it( "should place in the right", function() {
            var rect;

            this.options.x = "right";
            $$position( this.testElem, this.options );
            $rootScope.$apply();

            rect = this.rect();
            expect( rect.self.left ).to.equal( rect.target.right );
        });
    });

    // ---------------------------------------------------------------------------------------------

    describe( "Y axis", function() {
        it( "should place in the top", function() {
            var rect;

            this.options.y = "top";
            $$position( this.testElem, this.options );
            $rootScope.$apply();

            rect = this.rect();
            expect( rect.self.bottom ).to.equal( rect.target.top );
        });

        it( "should place in the center", function() {
            var rect, center;

            this.options.y = "center";
            $$position( this.testElem, this.options );
            $rootScope.$apply();

            rect = this.rect();
            center = rect.target.top + ( rect.target.height / 2 ) - ( rect.self.height / 2 );

            // To avoid Webkit weirdness with decimal units, let's just round the result and
            // the actual values, so tests can properly pass
            expect( Math.round( rect.self.top ) ).to.equal( Math.round( center ) );
        });

        it( "should place in the bottom", function() {
            var rect;

            this.options.y = "bottom";
            $$position( this.testElem, this.options );
            $rootScope.$apply();

            rect = this.rect();
            expect( rect.self.top ).to.equal( rect.target.bottom );
        });
    });
});