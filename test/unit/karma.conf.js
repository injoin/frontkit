module.exports = function( config ) {
    "use strict";

    config.set({
        // base path that will be used to resolve all patterns (eg. files, exclude)
        basePath: "../..",
        frameworks: [ "mocha" ],
        files: [
            // Deps
            "libs/jquery/dist/jquery.js",
            "libs/angular/angular.js",

            // Sources
            "dist/frontkit.js",

            // Test Libs
            "libs/angular-mocks/angular-mocks.js",
            "libs/chai/chai.js",
            "libs/sinonjs/sinon.js",

            // Specs
            "test/unit/specs/**/*.spec.js"
        ],
        exclude: [],
        preprocessors: {},
        reporters: [ "progress" ],
        port: 9876,
        colors: true,
        logLevel: config.LOG_INFO,
        autoWatch: false,
        browsers: [ "PhantomJS", "Chrome", "Firefox" ],

        // Stop running after 1.5 minutes
        captureTimeout: 90000,

        // CI mode
        // This is set when running via grunt
        singleRun: true,

        // SauceLabs configs
        sauceLabs: {
            testName: "Frontkit",
            recordScreenshots: true,
            startConnect: true,
            tunnelIdentifier: process.env.TRAVIS_JOB_RUNNER
        },
        customLaunchers: {
            SL_Chrome: {
                base: "SauceLabs",
                browserName: "chrome"
            },
            SL_Firefox: {
                base: "SauceLabs",
                browserName: "firefox"
            }
        }
    });

    // When running via Travis CI
    if ( process.env.TRAVIS ) {
        config.transports = [ "xhr-polling" ];
        config.reporters = [ "dots" ];
        config.browsers = [ "PhantomJS" ].concat( Object.keys( config.customLaunchers ) );
    }
};