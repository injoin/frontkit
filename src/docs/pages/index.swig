{% extends "../layout/main.swig" %}

{% set currentPage = "home" %}

{% block page %}
    <main class="container docs-master-head">
        <h1>{{ pkg.title  }}</h1>
        <p class="lead">{{ pkg.description }}</p>
        <div>
            <a href="{{ macros.siteUrl( "docs/index" ) }}#download"
               id="download-button" class="btn btn-large">
                Download Frontkit
            </a>
        </div>
    </main>

    <footer class="container docs-footer">
        <iframe src="http://ghbtns.com/github-btn.html?user=injoin&amp;repo=frontkit&amp;type=watch&amp;count=true"
                style="width: 110px; height: 20px; border: 0; vertical-align: middle"></iframe>
        <iframe src="http://ghbtns.com/github-btn.html?user=injoin&amp;repo=frontkit&amp;type=fork&amp;count=true"
                style="width: 95px; height: 20px; border: 0; vertical-align: middle"></iframe>
    </footer>
{% endblock %}