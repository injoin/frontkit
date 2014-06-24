module.exports = function( grunt ) {
    "use strict";

    var ICON_REGEX = /^.@\{icon-prefix\}-([a-z0-9-]+?) \{/;
    var _ = require( "lodash" );

    grunt.registerMultiTask( "icons", function() {
        var categories = this.options({
            categories: null
        }).categories;

        if ( typeof categories === "string" && categories ) {
            if ( /\.yml$/i.test( categories ) ) {
                categories = grunt.file.readYAML( categories );
            } else {
                categories = grunt.file.readJSON( categories );
            }
        }

        this.files.forEach(function( fileObj ) {
            var actualIcons = [];
            var icons = {};

            // Find all icons with the pattern
            fileObj.src.forEach(function( file ) {
                var contents = grunt.file.read( file );
                contents.split( "\n" ).forEach(function( line ) {
                    var match = line.match( ICON_REGEX );

                    if ( match ) {
                        actualIcons.push( match[ 1 ] );
                    }
                });
            });

            // Initialize categories arrays
            _.forEach( categories, function( iconList, category ) {
                if ( iconList === true ) {
                    iconList = actualIcons;
                } else {
                    iconList = iconList.filter( function( icon ) {
                        var index = actualIcons.indexOf( icon );
                        var exists = index > -1;

                        if ( exists ) {
                            actualIcons.splice( index, 1 );
                        }

                        return exists;
                    });
                }

                icons[ category ] = iconList;
            });

            icons = JSON.stringify( icons, null, 4 );
            grunt.file.write( fileObj.dest, icons );
            grunt.log.ok( "File " + fileObj.dest.cyan + " created." );
        });
    });
};