{% extends "../../../layout/docs.swig" %}
{% set docs = "dropdowns" %}

{% block content %}
    <h2>Dropdowns</h2>
    <p class="lead">
        Dropdown is a directive for single or multiple item selection, based in the
        <code>&lt;select&gt;</code> tag behavior.
    </p>

    <section id="single">
        {{ macros.docsSectionTitle( "Single Selection", "single", 3 ) }}
        <p>
            A single selection dropdown is a simple <code>&lt;select&gt;</code> tag which is
            decorated with the <code>dropdown</code> directive.
        </p>

        <div class="example">
            {% raw -%}
            <dropdown ng-model="selectedBand">
                <dropdown-items placeholder="Select a rock band...">{{ $dropdown.items[ $index ] }}</dropdown-items>
                <dropdown-options items="band in bands | filter: $dropdown.search">
                    {{ band }}
                </dropdown-options>
            </dropdown>
            {% endraw %}

            {% raw %}
            <p>You have selected {{ selectedBand }}.</p>
            {% endraw %}
        </div>
        {% highlight xml %}
            {% raw %}
                <dropdown ng-model="selectedBand">
                    <dropdown-items placeholder="Select a rock band...">{{ $dropdown.items[ $index ] }}</dropdown-items>
                    <dropdown-options items="band in bands | filter: $dropdown.search">
                        {{ band }}
                    </dropdown-options>
                </dropdown>

                <p>You have selected {{ selectedBand }}.</p>
            {% endraw %}
        {% endhighlight %}
    </section>

    <section id="$dropdown-variable">
        {{ macros.docsSectionTitle(
            "The <code>$dropdown</code> variable",
            "$dropdown-variable", 3
        ) }}
        <p>
            Inside the <code>&lt;dropdown&gt;</code> tag you have the <code>$dropdown</code>
            variable available to you. Below you can find some interesting properties you can use
            to make your dropdown powerful:
        </p>

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
                    <td>search</td>
                    <td>String</td>
                    <td>
                        The current searched value. You can use it to filter the dropdown options.
                    </td>
                </tr>
                <tr>
                    <td>options</td>
                    <td>Array, Object</td>
                    <td>Contains the current dropdown options.</td>
                </tr>
                <tr>
                    <td>items</td>
                    <td>Array</td>
                    <td>
                        Contains the currently selected items. Each value in this array corresponds
                        to a option.
                    </td>
                </tr>
            </tbody>
        </table>
    </section>

    <section id="dropdown">
        {{ macros.docsSectionTitle( "<code>&lt;dropdown&gt;</code>", "dropdown", 3 ) }}
        <p>
            The <code>&lt;dropdown&gt;</code> element is the main element and the container of the
            other dropdown parts. Any HTML you define inside it (except for other documented
            dropdown parts) will not be used when rendering the component.
        </p>

        <div class="example"></div>
        {% highlight xml %}
            <dropdown ng-model="someModel">
                ...
            </dropdown>
        {% endhighlight %}

        <section id="dropdown-arguments">
            {{ macros.docsSectionTitle( "Arguments", "dropdown-arguments", 4 ) }}

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
                        <td>ngModel</td>
                        <td>String</td>
                        <td>Assignable Angular expression to data-bind to.</td>
                    </tr>
                </tbody>
            </table>
        </section>
    </section>

    <section id="dropdown-items">
        {{ macros.docsSectionTitle( "<code>&lt;dropdown-items&gt;</code>", "dropdown-items", 3 ) }}
        <p>
            The <code>&lt;dropdown-items&gt;</code> element contains the template for the selected
            items. Any HTML defined inside it will be used to render the selected items.
        </p>

        <div class="example"></div>
        {% highlight xml %}
            {% raw %}
                <dropdown-items placeholder="This is the placeholder text">
                    <!-- Render the content of the foo property of the current item -->
                    {{ $dropdown.items[ $index ].foo }}
                </dropdown>
            {% endraw %}
        {% endhighlight %}

        <section id="dropdown-items-arguments">
            {{ macros.docsSectionTitle( "Arguments", "dropdown-items-arguments", 4 ) }}

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
                        <td>Search input placeholder text.</td>
                    </tr>
                </tbody>
            </table>
        </section>
    </section>

    <section id="dropdown-options">
        {{ macros.docsSectionTitle(
            "<code>&lt;dropdown-options&gt;</code>",
            "dropdown-options", 3
        ) }}

        <p>
            The <code>&lt;dropdown-options&gt;</code> element contains the template for each option.
            Any HTML you define inside it will be used to render the options.
        </p>

        <div class="example"></div>
        {% highlight xml %}
            {% raw %}
                <!-- You could omit the filter if you don't want to allow searching options -->
                <dropdown-options items="option in options | filter: $dropdown.search">
                    <!-- Render the content of the foo property of the current option -->
                    {{ option.foo }}
                </dropdown>
            {% endraw %}
        {% endhighlight %}

        <section id="dropdown-options-arguments">
            {{ macros.docsSectionTitle( "Arguments", "dropdown-options-arguments", 4 ) }}
            <p>
                The below argument list is only available to the <code>&lt;dropdown-options&gt;</code>
                tag.
            </p>

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
                        <td>items</td>
                        <td>String</td>
                        <td><code>ng-repeat</code> like expression to generate the option list.</td>
                    </tr>
                </tbody>
            </table>
        </section>
    </section>
{% endblock %}