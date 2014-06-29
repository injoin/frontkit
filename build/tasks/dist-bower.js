module.exports = function( grunt ) {
    "use strict";

    var cheerio;
    var _ = require( "lodash" );

    grunt.registerMultiTask(
        "dist-bower", "Update dist references in HTML files with Bower URLs",
        function() {
            var distRegex;
            var distDir = grunt.config( "cfg.distDir" );
            var repoSlug = grunt.config( "cfg.repoSlug" );
            var version = grunt.config( "package.version" );

            if ( !cheerio ) {
                cheerio = require( "cheerio" );
            }

            distRegex = new RegExp( "/?" + distDir + "/(.+)$" );

            this.filesSrc.forEach(function( src ) {
                var $ = cheerio.load( grunt.file.read( src ) );
                var assets = $( "link[href], script[src]" );

                _.forEach( assets, function( asset ) {
                    var attr, value;
                    asset = $( asset );
                    attr = asset.is( "link" ) ? "href" : "src";
                    value = asset.attr( attr );

                    value = value.replace( distRegex, function( match, file ) {
                        var url = "https://rawgit.com/" + repoSlug + "/" + version + "/";
                        return url + file;
                    });

                    asset.attr( attr, value );
                });

                grunt.file.write( src, $.html() );
                grunt.log.ok( "File " + src.cyan + " updated." );
            });
        }
    );
};