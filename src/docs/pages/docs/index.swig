{% extends "../../layout/docs.swig" %}
{% set docs = "getting-started" %}

{% block content %}
    <h2>Getting Started</h2>
    <p class="lead">
        Getting started with Frontkit is quick and easy. Check the sections below to discover how
        to download Frontkit, start using it, and more.
    </p>

    <section id="download">
        {{ macros.docsSectionTitle( "Download", "download", 3 ) }}
        <p>
            Frontkit can be downloaded in the flavor you like the most.
            Check below for the available packages and installation methods:
        </p>

        <ul class="row list-unstyled download-methods">
            <li class="column small-6-12">
                <h4>
                    <small class="icon icon-flag"></small>
                    Production
                </h4>
                <p>
                    Compiled and minified CSS, JavaScript and font files.
                    No docs or source files are included.
                </p>
                <a href="https://github.com/injoin/frontkit/releases/{{ pkg.version }}/frontkit.zip"
                   class="btn btn-primary">
                    Download package
                </a>
            </li>

            <li class="column small-6-12">
                <h4>
                    <small class="icon icon-code"></small>
                    Source code
                </h4>
                <p>
                    Has the same content as the production package, with the addition of source
                    files for LESS and JavaScript.
                    Useful for customizing sources before building.
                </p>
                <a href="https://github.com/injoin/frontkit/releases/{{ pkg.version }}/frontkit.dev.zip"
                   class="btn btn-primary">
                    Download package
                </a>
            </li>

            <li class="column">
                <h4>
                    <small class="icon icon-ssh"></small>
                    Install with Bower
                </h4>
                <p>
                    Frontkit offers you a <a href="http://bower.io">Bower</a> package.
                    Its contents is the same as the "Source code" package.<br>
                    You can install it by running the following line in your
                    <abbr title="Command Line Interface">CLI</abbr>:
                </p>

                {% highlight bash %}
                $ bower install frontkit --save
                {% endhighlight %}
            </li>
        </ul>
    </section>

    <section id="dependencies">
        {{ macros.docsSectionTitle( "Dependencies", "dependencies", 3 ) }}
        <p>
            The only dependency in order to use Frontkit is
            <a href="https://angularjs.org/">Angular.js</a>, required to run a few Frontkit
            components. The components that require JS stuff are highlighted through the docs.<br>
            If you don't plan to use the components that require JS, then you don't need to include
            Angular.js or Frontkit JavaScript files.
        </p>
    </section>

    <section id="package-contents">
        {{ macros.docsSectionTitle( "Package contents", "package-contents", 3 ) }}
        <p>
            After you have downloaded Frontkit, unzip the compressed folder and check its contents.
            The directory structure you will see is just like the example below:
        </p>

        {% highlight bash %}
        frontkit/
        ├─ fonts/
        │  └─ frontkit.woff
        ├─ src/
        │  ├─ fonts/
        │  ├─ scripts/
        │  └─ styles/
        ├─ frontkit.css
        ├─ frontkit.min.css
        ├─ frontkit.js
        └─ frontkit.min.js
        {% endhighlight %}

        <p>
            <strong>Note:</strong>
            If you have opted for the <a href="#download">production package</a>, the
            <code>src/</code> directory won't be available.
        </p>
    </section>

    <section id="template">
        {{ macros.docsSectionTitle( "Basic Template", "template", 3 ) }}
        <p>
            Start with the following basic HTML template; it's the minimal Frontkit page you can
            build. Customize as you wish so that it matches your needs!
        </p>

        {% highlight xml %}
            <!DOCTYPE html>
            <html lang="en" ng-app="app">
                <head>
                    <title>Frontkit Basic Template</title>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1">

                    <!-- Frontkit CSS files -->
                    <link rel="stylesheet" href="css/frontkit.min.css">
                </head>
                <body>
                    <h1>Hello world!</h1>

                    <!-- Include Angular.js (necessary for the Frontkit's directives) -->
                    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.18/angular.min.js"></script>

                    <!-- Include all Frontkit directives for Angular.js -->
                    <script src="js/frontkit.min.js"></script>
                </body>
            </html>
        {% endhighlight %}
    </section>
{% endblock %}