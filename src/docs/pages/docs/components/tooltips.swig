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

        <div class="example" ng-init="tooltip = 'I\'m a tooltip!'">
            <form class="form-horizontal">
                <div class="form-group">
                    <label class="column small-3-12 medium-4-12 large-3-12">Tooltip content:</label>
                    <div class="column small-5-12">
                        <input type="text" class="input" ng-model="tooltip" placeholder="Type...">
                    </div>
                </div>
            </form>

            {% raw -%}
            <p>
                Lorem ipsum dolor sit amet, consectetur
                <a href title="{{ tooltip }}" tooltip>adipiscing elit</a>.
                Curabitur finibus augue eget nibh euismod euismod.
            </p>
            {% endraw %}
        </div>
        {% highlight xml %}
            Lorem ipsum dolor sit amet, consectetur
            <abbr title="I'm a tooltip!" tooltip>adipiscing elit</abbr>.
            Curabitur finibus augue eget nibh euismod euismod.
        {% endhighlight %}
    </section>
{% endblock %}