{% extends "../../../layout/docs.swig" %}
{% set docs = "hero-unit" %}

{% block content %}
    <header class="page-header">
        <h2>Hero Unit</h2>
    </header>

    <p class="lead">
        A lightweight but awesome component to showcase your key content, for example.
        Good for marketing purposes!
    </p>

    <div class="example">
        <div class="hero-unit">
            <h1>Hello world</h1>
            <p class="lead">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                Praesent blandit vehicula erat et tempus.
            </p>
            <button class="btn btn-primary" type="button">Download</button>
        </div>
    </div>
    {% highlight xml %}
        <div class="hero-unit">
            <h1>...</h1>
            <p>...</p>
        </div>
    {% endhighlight %}
{% endblock %}