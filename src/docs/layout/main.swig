{% import "../includes/macros.swig" as macros %}
<!DOCTYPE html>
<html lang="en">
    <head>
        <title><%= pkg.title %></title>

        <base href="<%= basePath %>">

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        {# Styles #}
        <link rel="stylesheet" href="assets/styles/docs.css">
        <link rel="stylesheet" href="assets/vendor/highlightjs.css">
    </head>
    <body class="<%= currentPage %>">
        <div class="navbar navbar-fixed-top docs-navbar">
            <div class="container">
                <a href="/" class="navbar-brand"><%= pkg.title %></a>
                <nav class="navbar-nav">
                    <ul class="nav">
                        <li class="nav-item <%= macros.activeClass( 'docs' ) %>"><a href="docs/index.html">Docs</a></li>
                        <li class="nav-item <%= macros.activeClass( 'unit' ) %>"><a href="index.html">Unit Tests</a></li>
                        <li class="nav-item <%= macros.activeClass( 'visual' ) %>"><a href="index.html">Visual Tests</a></li>
                    </ul>
                </nav>
            </div>
        </div>

        {% block page %}{% endblock %}

        <script src="assets/vendor/holder.js"></script>
    </body>
</html>