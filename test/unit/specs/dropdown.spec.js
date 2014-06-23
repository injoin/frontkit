describe( "Dropdown Directive", function() {
    "use strict";

    var $rootScope, dropdown, $dropdown, keycodes, compileDirective;
    var $ = angular.element;

    var getEvents = function( element ) {
        // Hacky way to add a new event where we want.
        // Directly from the angular.js source
        return $.cache[ element[ $.expando ] ].events || {};
    };

    beforeEach( module( "templates", "frontkit.dropdown" ) );
    beforeEach( inject(function( $injector ) {
        var $document = $injector.get( "$document" );
        var $rootElement = $injector.get( "$rootElement" );
        var $templateCache = $injector.get( "$templateCache" );

        keycodes = $injector.get( "keycodes" );
        $rootScope = $injector.get( "$rootScope" );
        dropdown = $( $templateCache.get( "fixtures/dropdown.html" ) );

        // Append $rootElement to the DOM and also the dropdown
        $document.find( "body" ).append( $rootElement );
        $rootElement.append( dropdown );

        compileDirective = function() {
            dropdown = $injector.get( "$compile" )( dropdown )( $rootScope );

            $rootScope.$apply();
            $dropdown = dropdown.controller( "dropdown" );

            return dropdown;
        };
    }));

    afterEach(function() {
        dropdown.remove();
    });

    it( "should exist", inject(function( $injector ) {
        var getDirective = function() {
            return $injector.get( "dropdownDirective" );
        };

        expect( getDirective ).to.not.throw( Error );
    }));

    it( "should adjust scroll position to the active option", function() {
        var list;

        // Create a few options
        $rootScope.options = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ];

        // Make the dropdown use that options and compile it
        dropdown.find( "dropdown-options" ).attr( "items", "option in options" );
        compileDirective();

        // Find the compiled dropdown options container
        list = dropdown.querySelector( ".dropdown-options" )[ 0 ];

        // Adjust the active option
        $dropdown.activeOption = 10;
        $dropdown.open = true;
        $rootScope.$apply();

        expect( list.scrollTop ).to.be.gt( 0 );

        // Adjust the active option to the first item
        // This is above the current scroll position, so the scroll should be adjusted as well
        $dropdown.activeOption = 1;
        $rootScope.$apply();

        expect( list.scrollTop ).to.equal( list.querySelector( "li" ).offsetTop );
    });

    it( "should close itself when click outside", function() {
        var stopPropagation, close;
        var dropdown = compileDirective()[ 0 ];
        var event = document.createEvent( "Event" );
        event.initEvent( "click", true, true );

        // Create spies
        stopPropagation = sinon.spy( event, "stopPropagation" );
        close = sinon.spy( $dropdown, "close" );

        // When clicking inside, propagation must be stopped
        dropdown.dispatchEvent( event );
        expect( stopPropagation ).to.have.been.called;
        expect( close ).to.not.have.been.called;

        // Reinit the event and spy
        event = document.createEvent( "Event" );
        event.initEvent( "click", true, true );
        stopPropagation = sinon.spy( event, "stopPropagation" );

        // When clicking outside, propagation shouldn't be stopped
        dropdown.parentNode.dispatchEvent( event );
        expect( stopPropagation ).to.not.have.been.called;
        expect( close ).to.have.been.called;
    });

    // ---------------------------------------------------------------------------------------------

    describe( "ngModel", function() {
        beforeEach(function() {
            dropdown.attr( "ng-model", "foo" );
            compileDirective();
        });

        it( "should be bound to parent scope", function() {
            expect( dropdown.attr( "ng-model" ) ).to.equal( "$parent.foo" );
        });

        it( "should set empty array if value is null", function() {
            $rootScope.foo = null;
            $rootScope.$apply();

            expect( $dropdown.items ).to.eql( [] );
        });

        it( "should wrap the value in an array if needed", function() {
            $rootScope.foo = "foo";
            $rootScope.$apply();

            expect( $dropdown.items ).to.eql([ "foo" ]);

            $rootScope.foo = [ "bar" ];
            $rootScope.$apply();

            expect( $dropdown.items ).to.eql([ "bar" ]);
        });
    });

    // ---------------------------------------------------------------------------------------------

    describe( "on add item", function() {
        beforeEach(function() {
            dropdown.find( "dropdown-items" ).text( "{{ $dropdown.items[ $index ] }}" );
            compileDirective();
        });

        it( "should override the array if maxItems = 1", function() {
            $dropdown.maxItems = 1;
            $dropdown.addItem( "foo" );
            expect( $dropdown.items ).to.eql([ "foo" ]);

            $dropdown.addItem( "bar" );
            expect( $dropdown.items ).to.eql([ "bar" ]);
        });

        it( "should push the item in the array if not full and maxItems > 1", function() {
            $dropdown.maxItems = 2;
            $dropdown.addItem( "foo" );
            $dropdown.addItem( "bar" );

            expect( $dropdown.items ).to.eql([ "foo", "bar" ]);
        });

        it( "should not push the item in the array if full and maxItems > 1", function() {
            $dropdown.maxItems = 2;
            $dropdown.addItem( "foo" );
            $dropdown.addItem( "bar" );
            $dropdown.addItem( "baz" );

            expect( $dropdown.items ).to.eql([ "foo", "bar" ]);
        });

        it( "should close the dropdown if full", function() {
            var isFull = sinon.stub( $dropdown, "isFull" ).returns( true );
            var close = sinon.spy( $dropdown, "close" );

            $dropdown.addItem( "foo" );

            expect( isFull ).to.have.been.called;
            expect( close ).to.have.been.called;

            isFull.restore();
            close.restore();
        });

        it( "should not close the dropdown if not full", function() {
            var isFull = sinon.stub( $dropdown, "isFull" ).returns( false );
            var close = sinon.spy( $dropdown, "close" );

            $dropdown.addItem( "foo" );

            expect( isFull ).to.have.been.called;
            expect( close ).to.not.have.been.called;

            isFull.restore();
            close.restore();
        });

        it( "should show added item", function() {
            var items;

            $dropdown.addItem( "foo" );
            $rootScope.$apply();

            items = dropdown.querySelectorAll( ".dropdown-item" );
            expect( $( items[ 0 ] ).text() ).to.equal( "foo" );
        });
    });

    // ---------------------------------------------------------------------------------------------

    describe( "options list", function() {
        var $q, optionsElem;

        beforeEach(inject(function( $injector ) {
            $q = $injector.get( "$q" );
            optionsElem = dropdown.find( "dropdown-options" );
        }));

        it( "should be empty array if value is null", function() {
            optionsElem.attr( "items", "option in options" );
            compileDirective();

            expect( $dropdown.options ).to.eql( [] );
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
            expect( $dropdown.options ).to.eql( $rootScope.options );
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
            expect( $dropdown.options ).to.eql( $rootScope.options );
        });

        it( "should throw error if value not array or object", function() {
            optionsElem.attr( "items", "option in options" );
            $rootScope.options = "foo";

            expect( compileDirective ).to.throw(
                Error,
                "Dropdown options should be array or object!"
            );
        });

        it( "should resolve a promise for options", function() {
            var deferred = $q.defer();
            var options = {
                foo: "bar",
                baz: "qux"
            };

            optionsElem.attr( "items", "option in options" );
            $rootScope.options = deferred.promise;
            compileDirective();

            // Promise not yet resolved. The options must be an empty array for now
            expect( $dropdown.options ).to.eql( [] );

            // Promise resolved. The options must be equal to its value
            deferred.resolve( options );
            $rootScope.$apply();

            expect( $dropdown.options ).to.eql( options );
        });

        it( "should not override promise values", function() {
            var deferred1 = $q.defer();
            var deferred2 = $q.defer();
            var options1 = [ "foo", "bar" ];
            var options2 = [ "baz", "qux" ];

            optionsElem.attr( "items", "option in options" );
            $rootScope.options = deferred1.promise;
            compileDirective();

            $rootScope.options = deferred2.promise;
            deferred2.promise.xyz = 123;
            $rootScope.$apply();

            deferred1.resolve( options1 );
            $rootScope.$apply();
            expect( $dropdown.options ).to.not.eql( options1 );

            deferred2.resolve( options2 );
            $rootScope.$apply();
            expect( $dropdown.options ).to.eql( options2 );
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

    describe( "searchbox", function() {
        var input, container;

        beforeEach(function() {
            var oldCompile = compileDirective;

            compileDirective = function() {
                oldCompile();

                container = dropdown.querySelector( ".dropdown-container" );
                input = container.find( "input" );

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

            it( "should not do anything if dropdown not full and not a special key", function() {
                var events;
                var spy = sinon.spy();

                compileDirective();

                events = getEvents( input[ 0 ] );
                events.keydown.unshift(function( evt ) {
                    evt.preventDefault = spy;
                    evt.keyCode = "a".charCodeAt( 0 );
                });

                input.triggerHandler( "keydown" );
                expect( spy ).to.not.have.been.called;
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
                    compileDirective();
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
                compileDirective();

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

    // ---------------------------------------------------------------------------------------------

    describe( "navigation", function() {
        var input, event;
        var options = [
            "foo",
            "bar",
            "baz",
            "qux",
            "foobar",
            "barbaz"
        ];

        beforeEach(function() {
            $rootScope.options = options;
            dropdown.find( "dropdown-options" )
                    .attr( "items", "option in options" );

            compileDirective();
            input = dropdown.querySelector( ".dropdown-container input" )[ 0 ];

            // Initialize as open by default, not all tests need it as closed
            $dropdown.open = true;

            event = document.createEvent( "Event" );
            event.initEvent( "keydown", true, true );
        });

        describe( "with page up, page down, arrow up or arrow down", function() {
            it( "should open the dropdown if it's not yet", function() {
                $dropdown.open = false;
                event.keyCode = keycodes.PGUP;
                input.dispatchEvent( event );
                expect( $dropdown.open ).to.be.ok;

                $dropdown.open = false;
                event.keyCode = keycodes.PGDOWN;
                input.dispatchEvent( event );
                expect( $dropdown.open ).to.be.ok;

                $dropdown.open = false;
                event.keyCode = keycodes.ARROWDOWN;
                input.dispatchEvent( event );
                expect( $dropdown.open ).to.be.ok;

                $dropdown.open = false;
                event.keyCode = keycodes.ARROWUP;
                input.dispatchEvent( event );
                expect( $dropdown.open ).to.be.ok;
            });

            it( "should use first option as active if previous one is not present", function() {
                $dropdown.activeOption = Date.now();

                sinon.spy( Math, "min" );
                sinon.spy( Math, "max" );

                event.keyCode = keycodes.ARROWDOWN;
                input.dispatchEvent( event );

                expect( Math.min ).to.have.been.calledWith( options.length - 1, 1 );
                Math.min.restore();

                event.keyCode = keycodes.ARROWUP;
                input.dispatchEvent( event );

                expect( Math.max ).to.have.been.calledWith( 0, 0 );
                Math.max.restore();
            });

            it( "should not trigger another digest if same option is active", function() {
                var scope = dropdown.scope();

                $dropdown.activeOption = options[ 0 ];
                sinon.spy( scope, "$safeApply" );

                event.keyCode = keycodes.ARROWUP;
                input.dispatchEvent( event );

                expect( scope.$safeApply ).to.have.not.been.called;
            });
        });

        describe( "with page up", function() {
            it( "should move one page to the top", function() {
                var index = options.length - 1;
                $dropdown.activeOption = options[ index ];

                event.keyCode = keycodes.PGUP;
                input.dispatchEvent( event );

                expect( $dropdown.activeOption ).to.equal( options[ index - 4 ] );
            });
        });

        describe( "with page down", function() {
            it( "should move one page to the bottom", function() {
                var index = 0;
                $dropdown.activeOption = options[ index ];

                event.keyCode = keycodes.PGDOWN;
                input.dispatchEvent( event );

                expect( $dropdown.activeOption ).to.equal( options[ index + 4 ] );
            });
        });

        describe( "with arrow up", function() {
            it( "should move one item to the top", function() {
                $dropdown.activeOption = options[ 1 ];

                event.keyCode = keycodes.ARROWUP;
                input.dispatchEvent( event );

                expect( $dropdown.activeOption ).to.equal( options[ 0 ] );
            });
        });

        describe( "with arrow down", function() {
            it( "should move one item to the bottom", function() {
                $dropdown.activeOption = options[ 0 ];

                event.keyCode = keycodes.ARROWDOWN;
                input.dispatchEvent( event );

                expect( $dropdown.activeOption ).to.equal( options[ 1 ] );
            });
        });
    });

});