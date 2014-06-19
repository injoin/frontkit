module.exports = function( config ) {
    "use strict";

    config.set({
        // base path that will be used to resolve all patterns (eg. files, exclude)
        basePath: "../..",
        frameworks: [ "mocha", "sinon-chai" ],
        files: [
            // Deps
            "libs/angular/angular.js",

            // Sources
            "src/scripts/*.js",
            "src/templates/**/*.html",

            // Test Libs
            "libs/angular-mocks/angular-mocks.js",

            // Fixtures
            "test/unit/fixtures/**/*.html",

            // Specs
            "test/unit/specs/**/*.spec.js"
        ],
        exclude: [],
        preprocessors: {
            "**/*.html": [ "ng-html2js" ],
            "src/scripts/*.js": [ "coverage" ]
        },
        reporters: [ "dots", "coverage" ],
        port: 9876,
        colors: true,
        logLevel: config.LOG_INFO,
        autoWatch: false,
        browsers: [ "PhantomJS", "Chrome", "Firefox" ],

        ngHtml2JsPreprocessor: {
            stripPrefix: "src/|test/unit/",
            moduleName: "templates"
        },

        coverageReporter: {
            type: "lcov",
            dir: "test/coverage/"
        },

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
        config.browsers = [ "PhantomJS" ].concat( Object.keys( config.customLaunchers ) );
    }
};
