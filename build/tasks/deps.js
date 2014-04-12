module.exports = function( grunt ) {
    "use strict";

    var bower;
    var _ = require( "lodash" );

    grunt.registerTask( "deps", "Install Bower dependencies if needed", function( arg ) {
        var dir, file, cfg, deps, installed, logger;

        // Asynchronous task control for Grunt
        var done = this.async();

        // If Bower have not been instantiated yet, we'll do this now
        if ( !bower ) {
            bower = require( "bower" );
        }

        // Use configuration as specified in .bowerrc, or use defaults otherwise
        dir = bower.config.directory || "bower_components";
        file = bower.config.json || "bower.json";

        // Read the cfg file now
        cfg = grunt.file.readJSON( file );

        // Pick production dependencies of this cfg
        deps = _.keys( cfg.dependencies || {} );

        // Pick currently installed assets
        installed = grunt.file.expand({
            cwd: dir
        }, "*/.bower.json" ).map(function( asset ) {
            return asset.replace( "/.bower.json", "" );
        });

        // Maybe add dev dependencies to the list?
        if ( arg !== "production" ) {
            deps = deps.concat( _.keys( cfg.devDependencies || {} ) );
        }

        // Do we have differences in the installed stuff?
        if ( _.difference( deps, installed ).length ) {
            // Instantiate the install command
            logger = bower.commands.install( [], {
                production: arg === "production"
            });

            logger.on( "end", function() {
                grunt.log.ok( "Installed dependencies with success!" );
                done();
            });
            logger.on( "error", function() {
                grunt.fatal( "Could not install Bower dependencies!" );
                done( false );
            });
        } else {
            grunt.log.ok( "No dependencies need to be installed." );
            done();
        }
    });
};