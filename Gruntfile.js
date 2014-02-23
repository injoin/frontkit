module.exports = function( grunt ) {
    "use strict";

    // Variable initialization
    var env = process.env.NODE_ENV || "development";
    var liveReload = env === "production" ? false : 35729;

    // Configurations
    grunt.initConfig({
        /* Variables
        ----------------------------------------------------------------------------------------- */
        pkg: grunt.file.readJSON( "package.json" ),
        env: env,
        liveReload: liveReload,

        /* Watch
        ----------------------------------------------------------------------------------------- */
        watch: {
            options: {
                spawn: false,
                livereload: liveReload
            },
            styles: {
                files: [
                    "libs/**/*.css",
                    "src/styles/*.less"
                ],
                tasks: [ "less:main" ]
            },
            scripts: {
                files: [ "src/scripts/*.js" ],
                tasks: []
            },
            docsHTML: {
                files: [ "src/docs/**/*.swig", "build/*.json" ],
                tasks: [ "swig:docs" ]
            },
            docsCSS: {
                files: [ "assets/**/*.less", "<%= watch.styles.files %>" ],
                tasks: [ "less:docs" ]
            }
        },

        /* Styles
        ----------------------------------------------------------------------------------------- */
        less: {
            main: {
                options: {
                    sourceMap: true,
                    sourceMapFilename: "dist/frontkit.css.map",
                    sourceMapBasepath: "src/styles/",
                    sourceMapRootpath: "/",
                    outputSourceFiles: true
                },
                src: "src/styles/frontkit.less",
                dest: "dist/frontkit.css"
            },
            docs: {
                src: "assets/styles/docs.less",
                dest: "assets/styles/docs.css"
            }
        },

        /* Docs
        ----------------------------------------------------------------------------------------- */
        swig: {
            docs: {
                options: {
                    // Use a function, so we can always refresh menu items when there're changes
                    data: function() {
                        return {
                            env: "<%= env %>",
                            pkg: "<%= pkg %>",
                            basePath: process.env.BASE_PATH || "/",
                            menu: grunt.file.readJSON( "build/docs-menu.json" )
                        };
                    },

                    // Require some extra tags
                    tags: require( "./build/swig-tags" )
                },
                expand: true,
                cwd: "src/docs/pages/",
                src: [ "**/*.swig" ],
                dest: "./",
                ext: ".html"
            }
        },
        connect: {
            docs: {
                options: {
                    port: 8000,
                    livereload: liveReload,
                    keepalive: true
                }
            }
        }
    });

    // Elapsed time reporting
    require( "time-grunt" )( grunt );

    // Task loading
    require( "load-grunt-tasks" )( grunt );
    grunt.loadTasks( "build/tasks" );

    // Aliases
    grunt.registerTask( "docs", [ "less:docs", "swig" ] );
    grunt.registerTask( "package", [ "less:main" ] );
    grunt.registerTask( "default", [ "deps", "package", "docs" ] );
};