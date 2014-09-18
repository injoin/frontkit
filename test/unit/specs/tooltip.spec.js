describe( "Tooltip Directive", function() {
    "use strict";

    var $ = angular.element;

    beforeEach( module( "frontkit.tooltip" ) );
    beforeEach( inject(function( $injector ) {
        var self = this;
        var $rootScope = $injector.get( "$rootScope" );
        var $document = $injector.get( "$document" );
        var $compile = $injector.get( "$compile" );

        this.clock = sinon.useFakeTimers();

        this.element = $( "<span title='{{ title }}' tooltip>" ).text( "foo" );
        $document.find( "body" ).append( this.element );
        $compile( this.element )( $rootScope );

        this.setTitle = function( title ) {
            $rootScope.title = self.title = title;
        };

        this.tooltip = $document.querySelector( ".tooltip" );
        this.setTitle( "foobar" );
    }));

    afterEach(function() {
        this.tooltip.remove();
        this.element.remove();
        this.clock.restore();
    });

    it( "should exist", inject(function( $injector ) {
        var getDirective = function() {
            return $injector.get( "tooltipDirective" );
        };

        expect( getDirective ).to.not.throw( Error );
    }));

    it( "should set the element's title to ''", function() {
        var title = this.element.attr( "title" );
        expect( title ).to.equal( "" );
    });

    // ---------------------------------------------------------------------------------------------

    describe( "on mouseenter", function() {
        beforeEach(function() {
            this.element.triggerHandler( "mouseenter" );
        });

        it( "should add .visible", function() {
            var tooltip = this.tooltip[ 0 ];

            expect( tooltip.className.split( " " ) ).to.not.contain( "visible" );

            this.clock.tick( 300 );
            expect( tooltip.className.split( " " ) ).to.contain( "visible" );
        });

        it( "should not show the tooltip if no title available", function() {
            this.setTitle( "" );
            this.clock.tick( 300 );

            expect( this.tooltip[ 0 ].className.split( " " ) ).to.not.contain( "visible" );
        });

        it( "should not show the tooltip if element not in the DOM", function() {
            this.element.remove();

            this.clock.tick( 300 );

            expect( this.tooltip[ 0 ].className.split( " " ) ).to.not.contain( "visible" );
        });

        it( "should set the tooltip content to the title attribute", function() {
            var tooltip = this.tooltip;

            expect( tooltip.text() ).to.equal( "" );

            this.clock.tick( 300 );
            expect( tooltip.text() ).to.equal( this.title );
        });

        it( "should be positioned in the bottom, centered", function() {
            var rect = this.element[ 0 ].getBoundingClientRect();

            this.clock.tick( 300 );
            expect( this.tooltip.css( "top" ) ).to.equal( rect.bottom + "px" );
            expect( this.tooltip.css( "left" ) ).to.equal( rect.left + ( rect.width / 2 ) + "px" );
        });
    });

    // ---------------------------------------------------------------------------------------------

    describe( "on mouseleave", function() {
        beforeEach(function() {
            this.element.triggerHandler( "mouseenter" );
        });

        it( "should not allow .visible to be added", function() {
            this.element.triggerHandler( "mouseleave" );

            this.clock.tick( 300 );
            expect( this.tooltip[ 0 ].className.split( " " ) ).to.not.contain( "visible" );
        });

        it( "should remove .visible", function() {
            this.clock.tick( 300 );
            this.element.triggerHandler( "mouseleave" );

            expect( this.tooltip[ 0 ].className.split( " " ) ).to.not.contain( "visible" );
        });
    });

});