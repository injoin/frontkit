module.exports = function( grunt ) {
    "use strict";

    // Variable initialization
    var env = process.env.NODE_ENV || "development";
    var liveReload = env === "production" ? false : 35729;

    // Configurations
    grunt.initConfig({
        pkg: grunt.file.readJSON( "package.json" ),

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
                files: [ "src/docs/**/*.swig" ],
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
                    data: {
                        pkg: "<%= pkg %>",
                        env: env,
                        liveReload: liveReload,
                        basePath: process.env.BASE_PATH || "/"
                    },
                    tags: require( "./build/swig-tags" ),
                    swigOptions: {
                        varControls: [ "<%=", "%>" ]
                    }
                },
                expand: true,
                cwd: "src/docs/",
                src: [ "*.swig", "docs/**/*.swig" ],
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

    // Task loading
    grunt.loadNpmTasks( "grunt-contrib-jade" );
    grunt.loadNpmTasks( "grunt-contrib-less" );
    grunt.loadNpmTasks( "grunt-contrib-concat" );
    grunt.loadNpmTasks( "grunt-contrib-watch" );
    grunt.loadNpmTasks( "grunt-contrib-connect" );
    grunt.loadNpmTasks( "grunt-swig2" );

    grunt.registerTask( "default", [
        "less",
        "swig"
    ]);
};