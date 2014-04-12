module.exports = function( grunt ) {
    "use strict";

    // Variable initialization
    var path = require( "path" );
    var config = {};

    config.env = process.env.NODE_ENV || "development";
    config.liveReload = config.env === "production" ? false : 35729;

    // Elapsed time reporting
    require( "time-grunt" )( grunt );

    // Task and config loading
    require( "load-grunt-config" )( grunt, {
        configPath: path.resolve( "build/config" ),
        config: config
    });
    grunt.loadTasks( "build/tasks" );
};