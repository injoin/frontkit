"use strict";

exports.example = (function() {
    return {
        ends: true,
        parse: parse,
        compile: compile
    };

    function parse( str, line, parser, types, stack ) {
        return true;
    }

    function compile( compiler, args, content, parents, options, blockName ) {
        var output = "";

        output += "_output += '<div class=\"example\">';";
        output += compiler( content, parents, options, blockName );
        output += "_output += '</div>';";
        output += exports.highlight.compile( compiler, [ "\"xml\"" ], content, parents, options, blockName );

        return output;
    }
})();

exports.highlight = (function() {
    var hljs = require( "highlight.js" );
    hljs.tabReplace = "    ";

    return {
        ext: hljs.highlight,
        ends: true,
        parse: parse,
        compile: compile
    };

    function parse( str, line, parser, types ) {
        parser.on( types.VAR, function( token ) {
            this.out.push( "\"" + token.match + "\"" );
            return true;
        });

        return true;
    }

    function compile( compiler, args, content, parents, options, blockName ) {
        var indentationRegex;
        var indentation = Number.MAX_VALUE;
        var output = "";

        content = content.join( "" ).split( "\n" );
        content.forEach(function( line ) {
            var match;

            // Ignore empty lines
            if ( !line || /^\s+$/.test( line ) ) {
                return;
            }

            match = line.match( /^\s+/ );
            indentation = Math.min( match ? match[ 0 ].length : 0, indentation );
        });

        indentationRegex = new RegExp( "^\\s{" + indentation + "}" );
        content = content.map(function( line ) {
            return line.replace( indentationRegex, "" );
        }).join( "\n" ).trim();

        output += "(function() {\n";
        output += " var lang = " + args[ 0 ] + ";\n";
        output += " var __o = _output;\n";
        output += " _output = '';\n";
        output += compiler( [ content ], parents, options, blockName ) + ";\n";
        output += " __o += '<pre class=\"highlight language-' + lang + '\">';\n";
        output += " __o += _ext.highlight(" + args[ 0 ] + ", _output).value;\n";
        output += " __o += '</pre>';\n";
        output += " _output = __o;\n";
        output += "})();\n";

        return output;
    }
})();