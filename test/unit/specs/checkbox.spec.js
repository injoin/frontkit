describe( "Checkbox Directive", function() {
    "use strict";

    var $rootScope, $compile, $document, $timeout, keycodes;
    var $ = angular.element;

    beforeEach( module( "frontkit.checkbox" ) );
    beforeEach( inject(function( $injector ) {
        // Inject tons of things
        $rootScope = $injector.get( "$rootScope" );
        $compile = $injector.get( "$compile" );
        $document = $injector.get( "$document" );
        $timeout = $injector.get( "$timeout" );
        keycodes = $injector.get( "keycodes" );

        // Compile a few other things
        this.input = $( "<input type='checkbox' checkbox />" );
        $document.find( "body" ).append( this.input );
        $compile( this.input )( $rootScope );
        $rootScope.$apply();

        this.styled = this.input.next();
    }));

    afterEach(function() {
        this.input.remove();
    });

    it( "should exist", inject(function( $injector ) {
        var getDirective = function() {
            return $injector.get( "checkboxDirective" );
        };

        expect( getDirective ).to.not.throw( Error );
    }));

    it( "should add .checkbox right after the element", function() {
        var cls = this.styled.attr( "class" ).split( " " );
        expect( cls ).to.contain( "checkbox" );
    });

    it( "should have a tabindex defined", function() {
        var tabindex = +this.styled.attr( "tabindex" );
        tabindex = isNaN( tabindex ) ? -1 : tabindex;

        expect( tabindex ).to.be.gte( 0 );
    });

    describe( "on keypress", function() {
        it( "should trigger the click event if space key", function() {
            var spy = sinon.spy();
            var event = document.createEvent( "Event" );
            event.initEvent( "keypress", true, true );
            event.which = keycodes.SPACE;

            this.styled.on( "click", spy );
            this.styled[ 0 ].dispatchEvent( event );

            expect( spy.called ).to.be.ok;
        });

        it( "should not handle the event if not space key", function() {
            var spy = sinon.spy();
            var event = document.createEvent( "Event" );
            event.initEvent( "keypress", true, true );
            event.which = "a".charCodeAt( 0 );

            this.styled.on( "click", spy );
            this.styled[ 0 ].dispatchEvent( event );

            expect( spy.called ).to.not.be.ok;
        });
    });

    describe( "on click", function() {
        it( "should invert checked state", function() {
            this.styled.triggerHandler( "click" );
            expect( this.input.prop( "checked" ) ).to.be.ok;

            this.styled.triggerHandler( "click" );
            expect( this.input.prop( "checked" ) ).to.not.be.ok;
        });

        it( "should trigger input click", function() {
            var spy = sinon.spy();
            this.input.on( "click", spy );
            this.styled.triggerHandler( "click" );

            // TODO findout why $rootScope.$apply() no longer works for timeouts
            $timeout.flush();
            expect( spy.called ).to.be.ok;
        });
    });

});