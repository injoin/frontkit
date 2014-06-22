describe( "repeatParser factory", function() {
    "use strict";

    var repeatParser;

    beforeEach( module( "frontkit.dropdown" ) );
    beforeEach( inject(function( $injector ) {
        repeatParser = $injector.get( "repeatParser" );
    }));

    describe( "parse method", function() {

        it( "should return undefined for invalid expression", function() {
            expect( repeatParser.parse( "foo" ) ).to.be.undefined;
            expect( repeatParser.parse( "foo,bar in baz" ) ).to.be.undefined;
        });

        it( "should find the item for array expression", function() {
            var expr = "foo in bar";
            var repeat = repeatParser.parse( expr );

            expect( repeat ).to.not.have.property( "key" );
            expect( repeat ).to.have.property( "item", "foo" );
        });

        it( "should find the key and item for object expression", function() {
            var expr = "(foo, bar) in baz";
            var repeat = repeatParser.parse( expr );

            expect( repeat ).to.have.property( "key", "foo" );
            expect( repeat ).to.have.property( "item", "bar" );
        });

        it( "should find the evaluated expression", function() {
            var expr = "foo in bar | filter: xyz";
            expect( repeatParser.parse( expr ) ).to.have.property( "expr", "bar | filter: xyz" );
        });

        it( "should find the track by expression", function() {
            var expr = "foo in bar track by baz";
            expect( repeatParser.parse( expr ) ).to.have.property( "trackBy", "baz" );
        });
    });

    describe( "toNgRepeat method", function() {
        it( "should build object expressions", function() {
            var repeat = {
                key: "foo",
                item: "bar",
                expr: "baz"
            };

            expect( repeatParser.toNgRepeat( repeat ) ).to.equal( "(foo, bar) in baz" );
        });

        it( "should build array expressions", function() {
            var repeat = {
                item: "foo",
                expr: "bar"
            };

            expect( repeatParser.toNgRepeat( repeat ) ).to.equal( "foo in bar" );
        });

        it( "should include track by", function() {
            var repeat = {
                item: "foo",
                expr: "bar",
                trackBy: "baz"
            };

            expect( repeatParser.toNgRepeat( repeat ) ).to.equal( "foo in bar track by baz" );
        });
    });

});