module.exports = function( grunt ) {
    return {
        docs: {
            options: {
                // Use a function, so we can always refresh menu items when there're changes
                data: function() {
                    return {
                        env: "<%= env %>",
                        pkg: "<%= package %>",
                        basePath: process.env.BASE_PATH || "/",
                        iconCategories: grunt.file.readJSON( "build/icons-list.json" ),
                        menu: grunt.file.readJSON( "build/docs-menu.json" )
                    };
                },

                // Require some extra tags
                tags: require( "../swig-tags" )
            },
            expand: true,
            cwd: "src/docs/pages/",
            src: [ "**/*/*.swig" ],
            dest: "./",
            ext: ".html"
        }
    };
};