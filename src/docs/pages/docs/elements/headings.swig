{% extends "../../../layout/docs.swig" %}
{% set docs = "headings" %}

{% block content %}
    <header class="page-header">
        <h2>Headings</h2>
    </header>

    <section id="default">
        {{ macros.docsSectionTitle( "Default Headings", "default", 3 ) }}
        <p>
            The default headings of Frontkit are the same tags you already know from plain HTML:
            from <code>&lt;h1&gt;</code> to <code>&lt;h6&gt;</code>.
        </p>

        <div class="example">
            <h1>h1. Frontkit heading</h1>
            <h2>h2. Frontkit heading</h2>
            <h3>h3. Frontkit heading</h3>
            <h4>h4. Frontkit heading</h4>
            <h5>h5. Frontkit heading</h5>
            <h6>h6. Frontkit heading</h6>
        </div>
        {% highlight xml %}
            <h1>...</h1>
            <h2>...</h2>
            <h3>...</h3>
            <h4>...</h4>
            <h5>...</h5>
            <h6>...</h6>
        {% endhighlight %}
    </section>

    <section id="page-header">
        {{ macros.docsSectionTitle( "Page Headers", "page-header", 3 ) }}
        <p>Page headers create a beautiful, light style to separate between page sections.</p>

        <div class="example">
            <div class="page-header">
                <h3>Lorem Ipsum</h3>
            </div>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
        </div>
        {% highlight xml %}
            <div class="page-header">
                <h3>Lorem Ipsum</h3>
            </div>
        {% endhighlight %}
    </section>
{% endblock %}