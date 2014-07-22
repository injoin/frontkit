!function( ng ) {
    "use strict";

    var module = ng.module( "frontkit-docs", [
        "headroom",
        "frontkit"
    ]);

    module.directive( "submenu", [
        "$timeout",
        "$document",
        function( $timeout, $document ) {
            var document = $document[ 0 ];
            var definition = {};

            definition.scope = {};
            definition.template =
                "<ul class='nav nav-list'>" +
                    "<li class='nav-item' ng-repeat='heading in headings'>" +
                        "<a href='{{ heading.href }}'>{{ heading.text }}</a>" +
                    "</li>" +
                "</ul>";

            definition.link = function( scope ) {
                $timeout(function() {
                    var headings = document.querySelectorAll(
                        ".docs-content > section > .docs-heading"
                    );
                    scope.headings = [];

                    [].forEach.call( headings, function( heading ) {
                        var text = heading.innerText;
                        var anchor = heading.querySelector( ".docs-anchor" );
                        text = text.replace( anchor.innerText, "" );

                        scope.headings.push({
                            href: anchor.href,
                            text: text.trim()
                        });
                    });
                });
            };

            return definition;
        }
    ]);

    module.directive( "docsHeading", function() {
        var definition = {};

        definition.transclude = true;
        definition.template =
            "<a class='docs-anchor'>#</a> " +
            "<span ng-transclude></span>";

        definition.link = function( scope, element, attr ) {
            var path = attr.docsHeading;
            element.addClass( "docs-heading" );
            element.find( "a" ).attr( "href", "#" + path );
        };

        return definition;
    });

    module.run([
        "$rootScope",
        "$http",
        function( $rootScope, $http ) {
            // Add some bands for dropdowns example
            $rootScope.bands = [
                { name: "AC/DC", genre: "Hard Rock" },
                { name: "Black Sabbath", genre: "Heavy Metal" },
                { name: "Bon Jovi", genre: "Hard Rock" },
                { name: "Dio", genre: "Heavy Metal" },
                { name: "Iron Maiden", genre: "Heavy Metal" },
                { name: "Led Zeppelin", genre: "Hard Rock" },
                { name: "Metallica", genre: "Heavy Metal" },
                { name: "Motorhead", genre: "Heavy Metal" },
                { name: "Red Hot Chili Peppers" },
                { name: "Scorpion", genre: "Heavy Metal" },
                { name: "Sex Pistols", genre: "Punk" },
                { name: "The Beatles" },
                { name: "The Clash", genre: "Punk" },
                { name: "The Ramones", genre: "Punk" },
                { name: "The Who", genre: "Hard Rock" }
            ];

            $http.get( "/assets/meta/icons-list.json" ).success(function( response ) {
                $rootScope.iconCategories = response;
            });
        }
    ]);

}( angular );