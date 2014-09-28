{% extends "../layout/main.swig" %}

{% set currentPage = "home" %}

{% block page %}
    <main class="container docs-master-head">
        <h1>
            {{ pkg.title  }}

            <span class="docs-version">v{{ pkg.version }}</span>
        </h1>
        <p class="lead">{{ pkg.description }}</p>
        <div>
            <a href="{{ macros.siteUrl( "docs/index" ) }}#download"
               id="download-button" class="btn btn-large">
                Download Frontkit
            </a>
        </div>
    </main>

    <footer class="container docs-footer">
        <ul class="list-inline">
            <li>{{ macros.socialButton( "github-stars" ) }}</li>
            <li>{{ macros.socialButton( "github-forks" ) }}</li>
            <li>{{ macros.socialButton( "twitter-tweet" ) }}</li>
            <li>{{ macros.socialButton( "twitter-follow" ) }}</li>
        </ul>
    </footer>
{% endblock %}