{% extends "../../../layout/docs.swig" %}
{% set docs = "checkboxes" %}

{% block content %}
    <h2>Checkboxes / Radio buttons</h2>
    <p class="lead">
        Checkboxes and radio buttons are native form controls for multiple and single selection,
        respectively. Frontkit includes directives for applying cool styles to them.
    </p>

    <section id="introduction">
        {{ macros.docsSectionTitle( "Introduction", "introduction", 3 ) }}
        <p>
            The <code>checkbox</code> and <code>radio</code> directives made available by Frontkit
            are simple directives that only apply styles to the respective HTML form controls.<br>
            They take no arguments and are not conflicting with Angular's respective native version.
        </p>
    </section>

    <section id="checkboxes">
        {{ macros.docsSectionTitle( "Checkboxes", "checkboxes", 3 ) }}
        <p>For checkboxes, you can use the <code>checkbox</code> directive as an attribute.</p>

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

    <section id="radios">
        {{ macros.docsSectionTitle( "Radio buttons", "radios", 3 ) }}
        <p>For radio buttons, you can use the <code>radio</code> directive as an attribute.</p>

        <div class="example">
            <ul class="list-unstyled" ng-init="radio = { value: 1 }">
                <li ng-repeat="i in [ 1, 2, 3 ]">
                    <label>
                        <input type="radio" radio ng-model="radio.value"
                               value="{% raw %}{{ i }}{% endraw %}">
                        {% raw %}Option {{ i }}{% endraw %}
                    </label>
                </li>
            </ul>

            <p>Option {% raw %}{{ radio.value }}{% endraw %} is selected</p>
        </div>
        {% highlight xml %}
            <ul class="list-unstyled" ng-init="radio = { value: 1 }">
                <li ng-repeat="i in [ 1, 2, 3 ]">
                    <label>
                        <input type="radio" radio ng-model="radio.value"
                               value="{% raw %}{{ i }}{% endraw %}">
                        {% raw %}Option {{ i }}{% endraw %}
                    </label>
                </li>
            </ul>
        {% endhighlight %}
    </section>
{% endblock %}