{% extends "../../../layout/docs.swig" %}
{% set docs = "overlay" %}

{% block content %}
    <header class="page-header">
        <h2>Overlay</h2>
    </header>
    <p class="lead">
        A overlay is a simple, semi-transparent element that covers other elements.
    </p>

    <section id="example">
        <h3 docs-heading="example">Example</h3>

        <div class="example">
            <p>This text is blocked by the overlay element</p>
            <div class="overlay"></div>
        </div>
        {% highlight xml %}
            <p>This text is blocked by the overlay element</p>
            <div class="overlay"></div>
        {% endhighlight %}
    </section>
{% endblock %}