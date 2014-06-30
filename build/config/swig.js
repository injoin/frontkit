module.exports = function( grunt ) {
    "use strict";

    return {
        docs: {
            options: {
                // Use a function, so we can always refresh menu items when there're changes
                data: function() {
                    return {
                        env: "<%= env %>",
                        pkg: "<%= package %>",
                        basePath: process.env.BASE_PATH || "/",
                        menu: grunt.file.readJSON( "build/docs-menu.json" )
                    };
                },

                // Require some extra tags
                tags: require( "../swig-tags" )
            },
            expand: true,
            cwd: "src/docs/pages/",
            src: [ "**/*.swig" ],
            dest: "./",
            ext: ".html"
        }
    };
};