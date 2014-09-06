{% extends "../../../layout/docs.swig" %}
{% set docs = "tooltips" %}

{% block content %}
    <h2>Tooltips</h2>
    <p class="lead">TODO</p>

    <section id="example">
        <h3 docs-heading="example">Example</h3>

        <div class="example">
            Lorem ipsum dolor sit amet, consectetur
            <abbr title="I'm a tooltip!" tooltip>adipiscing elit</abbr>.
            Curabitur finibus augue eget nibh euismod euismod.
        </div>
    </section>
{% endblock %}