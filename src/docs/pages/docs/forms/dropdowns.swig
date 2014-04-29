{% extends "../../../layout/docs.swig" %}
{% set docs = "dropdowns" %}

{% block content %}
    <h2>Dropdowns</h2>
    <p class="lead">
        A dropdown is a single or multiple selection components which have their options hidden by
        default.
    </p>

    <section>
        <div class="example">
            <select dropdown>
                <option value="AC/DC">AC/DC</option>
                <option value="The Beatles">The Beatles</option>
            </select>
        </div>
    </section>
{% endblock %}