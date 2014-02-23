{% extends "../layout/main.swig" %}

{% set currentPage = "home" %}

{% block page %}
    <main class="container docs-master-head">
        <h1>{{ pkg.title  }}</h1>
        <p class="lead">{{ pkg.description }}</p>
        <div>
            <iframe src="http://ghbtns.com/github-btn.html?user=injoin&amp;repo=frontkit&amp;type=watch&amp;count=true"
                    style="width:110px; height:20px; border:0"></iframe>
            <iframe src="http://ghbtns.com/github-btn.html?user=injoin&amp;repo=frontkit&amp;type=fork&amp;count=true"
                    style="width:95px; height:20px; border:0"></iframe>
        </div>
    </main>
{% endblock %}