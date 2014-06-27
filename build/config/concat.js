module.exports = function( grunt ) {
    "use strict";

    var removeSpecialBanners = function( src ) {
        src = src.replace( /\/\*!.+?\*\//, "" );
        return src;
    };

    return {
        core: {
            src: [
                "src/scripts/frontkit.js",
                "src/scripts/*.js"
            ],
            dest: "dist/frontkit.js"
        },
        "core-tmpl": {
            src: [
                "dist/frontkit.js",
                "src/templates/**/*.js"
            ],
            dest: "dist/frontkit-tmpl.js"
        },
        "banner-css": {
            options: {
                banner: grunt.file.read( "build/banners/banner-css.txt" ),
                process: removeSpecialBanners
            },
            src: "dist/*.css",
            expand: true
        },
        "banner-js": {
            options: {
                banner: grunt.file.read( "build/banners/banner-js.txt" )
            },
            src: "dist/*.js",
            expand: true
        }
    };
};