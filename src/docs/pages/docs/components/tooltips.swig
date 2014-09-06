{% extends "../../../layout/docs.swig" %}
{% set docs = "tooltips" %}

{% block content %}
    <h2>Tooltips</h2>
    <p class="lead">
        A tooltip is a very simple directive that shows a hint in any element using its
        <code>title</code> attribute, but in a much more stylish way.
    </p>

    <section id="example">
        <h3 docs-heading="example">Example</h3>
        <p>
            To start using the tooltip directive, all you need to do is add the <code>tooltip</code>
            attribute to any element with a <code>title</code> attribute.
        </p>

        <div class="example">
            Lorem ipsum dolor sit amet, consectetur
            <abbr title="I'm a tooltip!" tooltip>adipiscing elit</abbr>.
            Curabitur finibus augue eget nibh euismod euismod.
        </div>
        {% highlight xml %}
            Lorem ipsum dolor sit amet, consectetur
            <abbr title="I'm a tooltip!" tooltip>adipiscing elit</abbr>.
            Curabitur finibus augue eget nibh euismod euismod.
        {% endhighlight %}
    </section>
{% endblock %}