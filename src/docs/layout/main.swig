{% import "../includes/macros.swig" as macros %}
<!DOCTYPE html>
<html ng-app="frontkit-docs" lang="en">
    <head>
        <title>{{ pkg.title }}</title>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        {# Styles #}
        <link rel="stylesheet" href="{{ macros.baseUrl( "dist/frontkit.css" ) }}">
        <link rel="stylesheet" href="{{ macros.baseUrl( "assets/styles/docs.css" ) }}">
        <link rel="stylesheet" href="{{ macros.baseUrl( "libs/highlightjs/styles/github.css" ) }}">
    </head>
    <body class="{{ currentPage }}">
        <div class="navbar navbar-fixed-top docs-navbar" headroom offset="150">
            <div class="container">
                <a href="/" class="navbar-brand">{{ pkg.title }}</a>
                <nav class="navbar-nav">
                    <ul class="nav">
                        <li class="nav-item {{ macros.activeClass( 'docs' ) }}">
                            <a href="{{ macros.siteUrl( "docs/index" ) }}">Docs</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>

        {% block page %}{% endblock %}

        <script src="{{ macros.baseUrl( "libs/holderjs/holder.js" ) }}"></script>
        <script src="{{ macros.baseUrl( "libs/angular/angular.js" ) }}"></script>
        <script src="{{ macros.baseUrl( "libs/headroom.js/dist/headroom.js" ) }}"></script>
        <script src="{{ macros.baseUrl( "libs/headroom.js/dist/angular.headroom.js" ) }}"></script>
        <script src="{{ macros.baseUrl( "dist/frontkit-tmpl.js" ) }}"></script>
        <script src="{{ macros.baseUrl( "assets/scripts/docs.js" ) }}"></script>
    </body>
</html>