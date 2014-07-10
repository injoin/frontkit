{% extends "../../../layout/docs.swig" %}
{% set docs = "helper-classes" %}

{% block content %}
    <h2>Helper Classes</h2>
    <p class="lead">
        Sometimes, you need a few common styles right away in your page.<br>
        Frontkit allows you to get around these occasions by providing a few helper classes.
    </p>

    <section id="visibility">
        <h3 docs-heading="visibility">Visibility</h3>
        <p>Toggle visibility status of any element with <code>.show</code>/<code>.hide</code>.</p>

        {% highlight xml %}
            <span class="show">Visible</span>
            <span class="hide">Hidden</span>
        {% endhighlight %}
    </section>

    <section id="floating">
        <h3 docs-heading="floating">Quick Float</h3>
        <p>
            Set the <code>float</code> CSS attribute of an element with ease.<br>
            To better integrate with right-to-left cultures, we use <code>.pull-start</code> and
            <code>.pull-end</code>, so their functionality can be easily switched to left/right
            (for LTR cultures) or right/left (for RTL cultures).
        </p>

        {% highlight xml %}
            <div class="pull-start">...</div>
            <div class="pull-end">...</div>
        {% endhighlight %}
    </section>

    <section id="text-alignment">
        <h3 docs-heading="text-alignmenet">Text Alignment</h3>
        <p>
            Use any of the left/center/right/justify text alignment styles by applying any of the
            <code>.text-*</code> classes below.
        </p>

        <div class="example">
            <p class="text-left">Left aligned text</p>
            <p class="text-center">Center aligned text</p>
            <p class="text-right">Right aligned text</p>
            <p class="text-justify">Justified text</p>
        </div>
        {% highlight xml %}
            <p class="text-left">Left aligned text</p>
            <p class="text-center">Center aligned text</p>
            <p class="text-right">Right aligned text</p>
            <p class="text-justify">Justified text</p>
        {% endhighlight %}
    </section>

    <section id="contextual-text">
        <h3 docs-heading="contextual-text">Contextual Text Coloring</h3>
        <p>Make your text carry some visual context with colors.</p>

        <div class="example">
            <p class="text-muted">Muted/disabled text</p>
            <p class="text-success">Successful text</p>
            <p class="text-info">Info text</p>
            <p class="text-warning">Warning text</p>
            <p class="text-danger">Danger text</p>
        </div>
        {% highlight xml %}
            <p class="text-muted">Muted/disabled text</p>
            <p class="text-success">Successful text</p>
            <p class="text-info">Info text</p>
            <p class="text-warning">Warning text</p>
            <p class="text-danger">Danger text</p>
        {% endhighlight %}
    </section>
{% endblock %}