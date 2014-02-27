{% extends "../../../layout//docs.swig" %}
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
            It's suitable for usage in any text-based form control, like for example,
            <code>&lt;textarea&gt;</code> and most <code>&lt;input&gt;</code> types:
        </p>
        <ul class="block-grid">
            <li>text</li>
            <li>password</li>
            <li>datetime</li>
            <li>datetime-local</li>
            <li>date</li>
            <li>month</li>
            <li>week</li>
            <li>time</li>
            <li>number</li>
            <li>email</li>
            <li>url</li>
            <li>search</li>
            <li>tel</li>
            <li>color</li>
        </ul>

        <div class="example">
            <input type="text" class="input" placeholder="Type something...">
            <textarea class="input" placeholder="Type something..."></textarea>
        </div>
        {% highlight xml %}
            <input type="text" class="input" placeholder="...">
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