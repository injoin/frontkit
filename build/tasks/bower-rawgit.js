module.exports = function( grunt ) {
    "use strict";

    var bower, cheerio;
    var path = require( "path" );
    var _ = require( "lodash" );

    grunt.registerMultiTask(
        "bower-rawgit", "Update Bower module references in HTML files with rawgit.com url",
        function() {
            var dir, installed, bowerPkgRegex;

            // Quick fail: depend on "deps" task, so we ensure that every bower dep is here
            this.requires( "deps" );

            // Load bower and cheerio libs if they haven't been loaded yet
            if ( !bower || !cheerio ) {
                bower = require( "bower" );
                cheerio = require( "cheerio" );
            }

            // Use the configured bower dir, or use the default bower_components
            dir = bower.config.directory || "bower_components";

            // Create a hash of what is installed in bower and its respective .bower.json file
            installed = {};
            grunt.file.expand( dir + "/*/.bower.json" ).forEach(function( file ) {
                // Read the JSON file
                var json = grunt.file.readJSON( file );

                // Clean the name of the file to find out the depname
                var depname = path.basename( file.replace( "/.bower.json", "" ) );

                installed[ depname ] = json;
            });

            // Regex used to discover if a asset is a bower package.
            // The only assumption we make is that it must reside inside the configured directory.
            bowerPkgRegex = new RegExp( "/?" + dir + "/(.+?)/" );

            this.filesSrc.forEach(function( src ) {
                // Load the contents of the file as HTML
                var $ = cheerio.load( grunt.file.read( src ) );

                // Find link/scripts in this document
                var assets = $( "link[href], script[src]" );

                _.forEach( assets, function( asset ) {
                    var attr, value;
                    asset = $( asset );
                    attr = asset.is( "link" ) ? "href" : "src";
                    value = asset.attr( attr );

                    value = value.replace( bowerPkgRegex, function( match, depname ) {
                        var dep = installed[ depname ];
                        var slug = dep._source.replace( "git://github.com/", "" )
                                              .replace( ".git", "" );
                        var url = "https://rawgit.com/" + slug + "/";

                        // Use tag if it exists or commit otherwise.
                        // Also add a trailing slash
                        url += ( dep._resolution.tag || dep._resolution.commit ) + "/";

                        return url;
                    });

                    asset.attr( attr, value );
                });

                grunt.file.write( src, $.html() );
                grunt.log.ok( "File " + src.cyan  + " updated." );
            });
        }
    );
};