{% extends "../../../layout/docs.swig" %}
{% set docs = "inputs" %}

{% block content %}
    <header class="page-header">
        <h2>Inputs</h2>
    </header>
    <p class="lead">Inputs are simple form controls that allow the user to enter information.</p>

    <section class="default">
        {{ macros.docsSectionTitle( "Default Input", "default", 3 ) }}
        <p>
            The default input has a light style.
            It's suitable for usage in selects and any text-based form control, like for example,
            <code>&lt;textarea&gt;</code> and most <code>&lt;input&gt;</code> types:
        </p>
        <ul class="block-grid small-block-grid-3">
            <li><span class="icon icon-ok"></span> text</li>
            <li><span class="icon icon-ok"></span> password</li>
            <li><span class="icon icon-ok"></span> datetime</li>
            <li><span class="icon icon-ok"></span> datetime-local</li>
            <li><span class="icon icon-ok"></span> date</li>
            <li><span class="icon icon-ok"></span> month</li>
            <li><span class="icon icon-ok"></span> week</li>
            <li><span class="icon icon-ok"></span> time</li>
            <li><span class="icon icon-ok"></span> number</li>
            <li><span class="icon icon-ok"></span> email</li>
            <li><span class="icon icon-ok"></span> url</li>
            <li><span class="icon icon-ok"></span> search</li>
            <li><span class="icon icon-ok"></span> tel</li>
            <li><span class="icon icon-ok"></span> color</li>
        </ul>

        <div class="example">
            <input type="text" class="input" placeholder="Type something...">
            <select class="input">
                <option value="">Select something...</option>
                <option value="apples">Apples</option>
                <option value="bananas">Bananas</option>
                <option value="potatoes">Potatoes</option>
            </select>
            <textarea class="input" placeholder="Type something..."></textarea>
        </div>
        {% highlight xml %}
            <input type="text" class="input" placeholder="...">
            <select class="input">
                ...
            </select>
            <textarea class="input" placeholder="..."></textarea>
        {% endhighlight %}
    </section>

    <section id="states">
        {{ macros.docsSectionTitle( "States", "states", 3 ) }}
        <p>
            To provide feedback to your users about something going on in the page,
            you may use any of the below states in your inputs:
        </p>

        <section id="state-focus">
            {{ macros.docsSectionTitle( "Focus State", "state-focus", 4 ) }}
            <p>Demonstrate that the user is currently interacting with the input.</p>

            <div class="example">
                <input type="text" class="input" id="focused-input" placeholder="Focused input">
            </div>
        </section>

        <section id="state-disabled">
            {{ macros.docsSectionTitle( "Disabled/Read-only States", "state-disabled", 4 ) }}
            <p>Disallow interaction with the input by giving it a disabled/read-only style.</p>

            <div class="example">
                <input type="text" class="input" placeholder="I'm disabled!" disabled>
                <input type="text" class="input" placeholder="I'm read-only!" readonly>
            </div>
            {% highlight xml %}
                <input type="text" class="input" disabled>
                <input type="text" class="input" readonly>
            {% endhighlight %}
        </section>

        <section id="state-validation">
            {{ macros.docsSectionTitle( "Validation States", "state-validation", 4 ) }}
            <p>You are able to use some validation states with inputs as well.</p>

            <div class="example">
                <input type="text" class="input validation-success" value="Successful input!">
                <input type="text" class="input validation-error" value="I have a error!">
                <input type="text" class="input validation-warning" value="I have a warning!">
            </div>
            {% highlight xml %}
                <input type="text" class="input validation-success">
                <input type="text" class="input validation-error">
                <input type="text" class="input validation-warning">
            {% endhighlight %}
        </section>
    </section>
{% endblock %}