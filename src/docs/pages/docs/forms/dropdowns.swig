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
            <select dropdown placeholder="Select a rock band..." ng-model="selectedBand" ng-options="band for band in bands">
            </select>

            {% raw %}
            <p>You have selected {{ selectedBand }}.</p>
            {% endraw %}
        </div>
    </section>
{% endblock %}