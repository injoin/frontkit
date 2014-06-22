describe( "$safeApply", function() {
    "use strict";

    var $rootScope;

    beforeEach( module( "frontkit.utils" ) );
    beforeEach( inject(function( $injector ) {
        $rootScope = $injector.get( "$rootScope" );
    }));

    it( "should exist", function() {
        var child = $rootScope.$new();

        expect( $rootScope.$safeApply ).to.be.a( "function" );
        expect( child.$safeApply ).to.be.a( "function" );

        child.$destroy();
    });

    it( "should eval passed expression", function() {
        var spy = sinon.spy( $rootScope, "$eval" );
        var fn = function() {};

        $rootScope.$safeApply( "foo" );
        expect( spy ).to.have.been.calledWith( "foo" );

        $rootScope.$safeApply( fn );
        expect( spy ).to.have.been.calledWith( fn );

        spy.restore();
    });

    it( "should $apply if no digest occurring", function() {
        var spy = sinon.spy( $rootScope, "$apply" );

        $rootScope.$safeApply();
        expect( spy ).to.have.been.called;

        spy.restore();
    });

    it( "should not $apply if digest occurring", function() {
        var spy = sinon.spy( $rootScope, "$apply" );
        var scope = $rootScope.$new();

        $rootScope.$$phase = true;
        $rootScope.$safeApply();
        expect( spy ).to.not.have.been.called;

        scope.$safeApply();
        expect( spy ).to.not.have.been.called;

        scope.$destroy();
        spy.restore();
    });
});