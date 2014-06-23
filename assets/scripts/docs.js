!function( ng ) {
    "use strict";

    var module = ng.module( "frontkit-docs", [
        "headroom",
        "frontkit"
    ]);

    module.directive( "submenu", [
        "$document",
        function( $document ) {
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
            };

            return definition;
        }
    ]);

    module.run([ "$rootScope", function( $rootScope ) {
        // Add some bands for dropdowns example
        $rootScope.bands = [
            "AC/DC",
            "Black Sabbath",
            "Bon Jovi",
            "Dio",
            "Iron Maiden",
            "Led Zeppelin",
            "Metallica",
            "Motorhead",
            "Red Hot Chili Peppers",
            "Scorpion",
            "Sex Pistols",
            "The Beatles",
            "The Clash",
            "The Ramones",
            "The Who"
        ];
    }]);

}( angular );