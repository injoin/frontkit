!function( ng ) {
    "use strict";

    var module = ng.module( "frontkit.dropdown", [
        "templates/dropdown/single.html",
        "templates/dropdown/multiple.html"
    ]);

    module.directive( "dropdown", function() {
        var definition = {};

        definition.restrict = "A";
        definition.replace = true;
        definition.templateUrl = function( $element, $attr ) {
            return "templates/dropdown/" + ( $attr.multiple ? "multiple" : "single" ) + ".html";
        };

        definition.scope = {};
        definition.controller = function() {
        };

        definition.link = function() {

        };

        return definition;
    });
}( angular );