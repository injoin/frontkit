{% import "../includes/macros.swig" as macros %}
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>{{ pkg.title }}</title>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        {# Styles #}
        <link rel="stylesheet" href="{{ macros.baseUrl( "dist/frontkit.css" ) }}">
        <link rel="stylesheet" href="{{ macros.baseUrl( "assets/styles/docs.css" ) }}">
        <link rel="stylesheet" href="{{ macros.baseUrl( "assets/vendor/highlightjs.css" ) }}">
    </head>
    <body class="{{ currentPage }}">
        <div class="navbar navbar-fixed-top docs-navbar">
            <div class="container">
                <a href="/" class="navbar-brand">{{ pkg.title }}</a>
                <nav class="navbar-nav">
                    <ul class="nav">
                        <li class="nav-item {{ macros.activeClass( 'docs' ) }}">
                            <a href="{{ macros.siteUrl( "docs/index" ) }}">Docs</a>
                        </li>
                        <li class="nav-item {{ macros.activeClass( 'unit' ) }}">
                            <a href="{{ macros.siteUrl( "index" ) }}">Unit Tests</a>
                        </li>
                        <li class="nav-item {{ macros.activeClass( 'visual' ) }}">
                            <a href="{{ macros.siteUrl( "index" ) }}">Visual Tests</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>

        {% block page %}{% endblock %}

        <script src="{{ macros.baseUrl( "assets/vendor/holder.js" ) }}"></script>
    </body>
</html>