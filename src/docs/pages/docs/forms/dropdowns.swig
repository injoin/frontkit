{% extends "../../../layout/docs.swig" %}
{% set docs = "dropdowns" %}

{% block content %}
    <h2>Dropdowns</h2>
    <p class="lead">
        Dropdown is a directive for single or multiple item selection, based in the
        <code>&lt;select&gt;</code> tag.
    </p>

    <section id="single">
        {{ macros.docsSectionTitle( "Single Selection", "single", 3 ) }}
        <p>
            A single selection dropdown is a simple <code>&lt;select&gt;</code> tag which is
            decorated with the <code>dropdown</code> directive.
        </p>

        <div class="example">
            {% raw %}
            <dropdown ng-model="selectedBand">
                <dropdown-items placeholder="Select a rock band...">{{ $dropdown.items[ $index ] }}</dropdown-items>
                <dropdown-options items="band in bands | filter: $dropdown.search" value="band">
                    {{ band }}
                </dropdown-options>
            </dropdown>
            {% endraw %}

            {% raw %}
            <p>You have selected {{ selectedBand }}.</p>
            {% endraw %}
        </div>
        {% highlight xml %}
            <select dropdown placeholder="Select a rock band..." ng-model="selectedBand"
                    ng-options="band for band in bands">
            </select>

            {% raw -%}
            <p>You have selected {{ selectedBand }}.</p>
            {% endraw %}
        {% endhighlight %}
    </section>

    <section id="arguments">
        {{ macros.docsSectionTitle( "Arguments", "arguments", 3 ) }}
        <table class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Type</th>
                    <th>Description</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>placeholder</td>
                    <td>String</td>
                    <td>Define a placeholder for the dropdown.</td>
                </tr>
            </tbody>
        </table>
    </section>
{% endblock %}