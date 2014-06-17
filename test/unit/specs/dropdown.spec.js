describe( "Dropdown Directive", function() {
    "use strict";

    var $rootScope, $document, dropdown, keycodes, compileDirective;
    var $ = angular.element;

    var getEvents = function( element ) {
        // Hacky way to add a new event where we want.
        // Directly from the angular.js source
        return $.cache[ element[ $.expando ] ].events || {};
    };

    beforeEach( module( "templates", "frontkit.dropdown" ) );
    beforeEach( inject(function( $injector ) {
        var $templateCache = $injector.get( "$templateCache" );
        keycodes = $injector.get( "keycodes" );
        $rootScope = $injector.get( "$rootScope" );
        $document = $injector.get( "$document" );

        dropdown = $( $templateCache.get( "fixtures/dropdown.html" ) );
        compileDirective = function() {
            dropdown = $injector.get( "$compile" )( dropdown )( $rootScope );
            $rootScope.$apply();
            return dropdown;
        };
    }));

    it( "should exist", inject(function( $injector ) {
        var getDirective = function() {
            return $injector.get( "dropdownDirective" );
        };

        expect( getDirective ).to.not.throw( Error );
    }));

    // ---------------------------------------------------------------------------------------------

    describe( "ngModel", function() {
        beforeEach(function() {
            dropdown.attr( "ng-model", "foo" );
            compileDirective();
        });

        it( "should be bound to parent scope", function() {
            expect( dropdown.attr( "ng-model" ) ).to.equal( "$parent.foo" );
        });
    });

    // ---------------------------------------------------------------------------------------------

    describe( "options list", function() {
        var optionsElem;

        beforeEach(function() {
            optionsElem = dropdown.find( "dropdown-options" );
        });

        it( "should accept array of options", function() {
            var compiledOptions;

            optionsElem.attr( "items", "option in options" );
            $rootScope.options = [
                "foo",
                "bar",
                "baz"
            ];

            compiledOptions = compileDirective().querySelectorAll( ".dropdown-option" );
            expect( compiledOptions ).to.have.property( "length", 3 );
        });

        it( "should accept hash of options", function() {
            var compiledOptions;

            optionsElem.attr( "items", "(key, value) in options" );
            $rootScope.options = {
                foo: "bar",
                baz: "qux"
            };

            compiledOptions = compileDirective().querySelectorAll( ".dropdown-option" );
            expect( compiledOptions ).to.have.property( "length", 2 );
        });

        it( "should transclude the content for each option", function() {
            var compiledOptions;

            optionsElem.attr( "items", "(key, value) in options" );
            $rootScope.options = {
                foo: "bar"
            };

            optionsElem.html( "{{ key }} {{ value }}" );
            compiledOptions = compileDirective().querySelectorAll( ".dropdown-option" );

            expect( compiledOptions.text() ).to.equal( "foo bar" );
        });
    });

    // ---------------------------------------------------------------------------------------------

    describe( "search input container", function() {
        var input, container, $dropdown;

        beforeEach(function() {
            var oldCompile = compileDirective;

            compileDirective = function() {
                oldCompile();

                container = dropdown.querySelector( ".dropdown-container" );
                input = container.find( "input" );
                $dropdown = dropdown.controller( "dropdown" );

                return dropdown;
            };
        });

        it( "should be bound to the search model", function() {
            compileDirective();
            input.val( "foo" ).triggerHandler( "input" );
            $rootScope.$apply();

            expect( $dropdown.search ).to.equal( "foo" );
        });

        // -----------------------------------------------------------------------------------------

        describe( "on keydown", function() {
            it( "should not allow typing when dropdown is full", function() {
                var events;
                var spy = sinon.spy();

                compileDirective();
                sinon.stub( $dropdown, "isFull" ).returns( true );

                events = getEvents( input[ 0 ] );
                events.keydown.unshift(function( evt ) {
                    evt.preventDefault = spy;
                    evt.keyCode = "a".charCodeAt( 0 );
                });

                input.triggerHandler( "keydown" );
                expect( spy.called ).to.be.ok;
            });

            // -------------------------------------------------------------------------------------

            describe( "backspace", function() {
                var event;

                beforeEach(function() {
                    event = document.createEvent( "Event" );
                    event.initEvent( "keydown", true, true );
                    event.keyCode = keycodes.BACKSPACE;
                });

                it( "should remove last selected item", function() {
                    compileDirective();
                    $dropdown.items = [ "foo" ];
                    input[ 0 ].dispatchEvent( event );

                    expect( $dropdown.items ).to.have.length( 0 );
                });

                it( "should remove all selected item when ctrl is pressed", function() {
                    compileDirective();
                    event.ctrlKey = true;

                    $dropdown.items = [ "foo", "bar" ];
                    input[ 0 ].dispatchEvent( event );

                    expect( $dropdown.items ).to.have.length( 0 );
                });

                it( "should not change items if search is available", function() {
                    compileDirective();
                    $dropdown.search = "foo";
                    $dropdown.items = [ "foo" ];
                    input[ 0 ].dispatchEvent( event );

                    expect( $dropdown.items ).to.have.length( 1 );
                });
            });

            // -------------------------------------------------------------------------------------

            describe( "esc", function() {
                beforeEach(function() {
                    $document.find( "body" ).append( compileDirective() );
                    getEvents( input[ 0 ] ).keydown.unshift(function( evt ) {
                        evt.target = input[ 0 ];
                        evt.keyCode = keycodes.ESCAPE;
                    });
                });

                it( "should blur the input", function() {
                    input[ 0 ].focus();
                    input.triggerHandler( "keydown" );

                    expect( document.activeElement ).to.not.equal( input[ 0 ] );
                });

                it( "should close the options list", function() {
                    input.triggerHandler( "keydown" );
                    expect( $dropdown.open ).to.not.be.ok;
                });
            });

            // -------------------------------------------------------------------------------------

            describe( "tab", function() {
                it( "should close the options list", function() {
                    compileDirective();
                    getEvents( input[ 0 ] ).keydown.unshift(function( evt ) {
                        evt.target = input[ 0 ];
                        evt.keyCode = keycodes.TAB;
                    });

                    input.triggerHandler( "keydown" );
                    expect( $dropdown.open ).to.not.be.ok;
                });
            });

            // -------------------------------------------------------------------------------------

            describe( "enter", function() {
                var spy;

                beforeEach(function() {
                    spy = sinon.spy();

                    compileDirective();
                    getEvents( input[ 0 ] ).keydown.unshift(function( evt ) {
                        evt.target = input[ 0 ];
                        evt.keyCode = keycodes.ENTER;
                        evt.preventDefault = spy;
                    });
                });

                it( "should prevent default action", function() {
                    input.triggerHandler( "keydown" );
                    expect( spy.called ).to.be.ok;
                });

                it( "should open the dropdown if it's not already open", function() {
                    $dropdown.open = false;
                    input.triggerHandler( "keydown" );
                    expect( $dropdown.open ).to.be.ok;
                });

                it( "should add the active option if the dropdown is open", function() {
                    $dropdown.open = true;
                    $dropdown.activeOption = "foo";
                    input.triggerHandler( "keydown" );

                    expect( $dropdown.items ).to.include( "foo" );
                });
            });
        });

        // -----------------------------------------------------------------------------------------

        describe( "on click", function() {
            it( "should focus the input", function() {
                // In order to the element to be focused, it needs to be present in the page
                $document.find( "body" ).append( compileDirective() );
                container.triggerHandler( "click" );

                expect( document.activeElement ).to.equal( input[ 0 ] );
            });
        });

        // -----------------------------------------------------------------------------------------

        describe( "on focus", function() {
            beforeEach(function() {
                compileDirective();
            });

            it( "should open the dropdown if not full", function() {
                var stub = sinon.stub( $dropdown, "isFull" ).returns( false );

                input.triggerHandler( "focus" );
                expect( $dropdown.open ).to.be.ok;

                stub.restore();
            });

            it( "should open the dropdown if full and maxItems = 1", function() {
                var stub = sinon.stub( $dropdown, "isFull" ).returns( true );
                $dropdown.maxItems = 1;

                input.triggerHandler( "focus" );
                expect( $dropdown.open ).to.be.ok;

                stub.restore();
            });

            it( "should not open the dropdown if full and maxItems > 1", function() {
                var stub = sinon.stub( $dropdown, "isFull" ).returns( true );
                $dropdown.maxItems = 2;

                input.triggerHandler( "focus" );
                expect( $dropdown.open ).to.not.be.ok;

                stub.restore();
            });
        });
    });
});