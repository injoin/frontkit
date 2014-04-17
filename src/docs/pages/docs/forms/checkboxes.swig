{% extends "../../../layout/docs.swig" %}
{% set docs = "checkboxes" %}

{% block content %}
    <h2>Checkboxes</h2>
    <p class="lead">
        Frontkit includes a <code>checkbox</code> directive that applies cool styles to your
        checkboxes.
    </p>

    <section id="examples">
        {{ macros.docsSectionTitle( "Examples", "examples", 3 ) }}
        <p>Below you can't find some examples on how to use the checkbox.</p>

        <section id="example-default">
            {{ macros.docsSectionTitle( "Single checkbox", "example-default", 4 ) }}
            <p>
                The default usage of the Frontkit checkbox is by simply using the <code>checkbox</code>
                directive. Don't worry - it will not conflict with Angular's native checkbox directive.
            </p>

            <div class="example">
                <label>
                    <input type="checkbox" checkbox>
                    Check me please
                </label>
            </div>
            {% highlight xml %}
                <input type="checkbox" checkbox>
            {% endhighlight %}
        </section>

        <section id="example-list">
            {{ macros.docsSectionTitle( "Checkboxes list", "example-list", 4 ) }}
            <p>
                Below is an example of how to create a list of checkboxes.
                You will probably want to do something more useful, of course!
            </p>

            <div class="example">
                <ul class="list-unstyled" ng-init="checkboxList = { 2: true, 5: true }">
                    <li ng-repeat="i in [ 1, 2, 3, 4, 5 ]">
                        <label>
                            <input type="checkbox" checkbox ng-model="checkboxList[ i ]">
                            {% raw %}Option {{ i }}{% endraw %}
                        </label>
                    </li>
                </ul>

                Model:
                <pre>{% raw %}{{ checkboxList }}{% endraw %}</pre>
            </div>
            {% highlight xml %}
                <ul class="list-unstyled" ng-init="checkboxList = { 2: true, 5: true }">
                    <li ng-repeat="i in [ 1, 2, 3, 4, 5 ]">
                        <label>
                            <input type="checkbox" checkbox ng-model="checkboxList[ i ]">
                            {% raw %}Option {{ i }}{% endraw %}
                        </label>
                    </li>
                </ul>
            {% endhighlight %}
        </section>
    </section>
{% endblock %}