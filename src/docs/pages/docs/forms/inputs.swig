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
            <div class="form-group">
                <input type="text" class="input" placeholder="Type something...">
            </div>

            <div class="form-group">
                <select class="input">
                    <option value="">Select something...</option>
                    <option value="apples">Apples</option>
                    <option value="bananas">Bananas</option>
                    <option value="potatoes">Potatoes</option>
                </select>
            </div>

            <div class="form-group">
                <textarea class="input" placeholder="Type something..."></textarea>
            </div>
        </div>
        {% highlight xml %}
            <input type="text" class="input" placeholder="...">
            <select class="input">
                ...
            </select>
            <textarea class="input" placeholder="..."></textarea>
        {% endhighlight %}

        <p>
            You're allowed to use <code>.input</code> as a wrapper for form controls as well.
            The same result applies:
        </p>
        <div class="example example-inputs">
            <div class="input">
                <input type="text" placeholder="Type something...">
            </div>
            <div class="input">
                <select>
                    <option value="">Select something...</option>
                    <option value="apples">Apples</option>
                    <option value="bananas">Bananas</option>
                    <option value="potatoes">Potatoes</option>
                </select>
            </div>
            <div class="input">
                <textarea placeholder="Type something..."></textarea>
            </div>
        </div>
        {% highlight xml %}
            <div class="input">
                <input type="text" placeholder="Type something...">
            </div>
            <div class="input">
                <select>
                    <option value="">Select something...</option>
                    <option value="apples">Apples</option>
                    <option value="bananas">Bananas</option>
                    <option value="potatoes">Potatoes</option>
                </select>
            </div>
            <div class="input">
                <textarea placeholder="Type something..."></textarea>
            </div>
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
                <div class="form-group">
                    <input type="text" class="input" id="focused-input" placeholder="Focused input">
                </div>
            </div>
        </section>

        <section id="state-disabled">
            {{ macros.docsSectionTitle( "Disabled/Read-only States", "state-disabled", 4 ) }}
            <p>Disallow interaction with the input by giving it a disabled/read-only style.</p>

            <div class="example">
                <div class="form-group">
                    <input type="text" class="input" placeholder="I'm disabled!" disabled>
                </div>
                <div class="form-group">
                    <input type="text" class="input" placeholder="I'm read-only!" readonly>
                </div>
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
                <div class="form-group">
                    <input type="text" class="input validation-success" value="Successful input!">
                </div>

                <div class="form-group">
                    <input type="text" class="input validation-error" value="I have a error!">
                </div>

                <div class="form-group">
                    <input type="text" class="input validation-warning" value="I have a warning!">
                </div>
            </div>
            {% highlight xml %}
                <input type="text" class="input validation-success">
                <input type="text" class="input validation-error">
                <input type="text" class="input validation-warning">
            {% endhighlight %}
        </section>
    </section>

    <section id="sizes">
        {{ macros.docsSectionTitle( "Sizes", "sizes", 3 ) }}
        <p>A input can vary in size, from tiny to extra large.</p>

        <div class="example example-inputs">
            <input type="text" class="input input-xlarge" placeholder="Extra Large input">
            <div class="input input-large">
                <input type="text" placeholder="Large input">
            </div>
            <input type="text" class="input" placeholder="Normal input">
            <select class="input input-small"><option>Small input</option></select>
            <input type="text" class="input input-tiny" placeholder="Tiny input">
        </div>
        {% highlight xml %}
            <input type="text" class="input input-xlarge" placeholder="Extra Large input">
            <div class="input input-large">
                <input type="text" placeholder="Large input">
            </div>
            <input type="text" class="input" placeholder="Normal input">
            <select class="input input-small"><option>Small input</option></select>
            <input type="text" class="input input-tiny" placeholder="Tiny input">
        {% endhighlight %}
    </section>

    <section id="icons">
        {{ macros.docsSectionTitle( "Icons", "icons", 3 ) }}
        <p>
            It's quite common that people want to place an icon inside a input, either to show
            feedback about validation, or maybe show the type of the input (username, password,
            date, etc).
        </p>
        <p>
            You'll need to use the <code>.input</code> as a wrapper with an additional
            <code>.input-icon</code>. This is to fix the padding of the input, so the input text
            doesn't go below the icon.
        </p>

        <div class="example example-inputs">
            <div class="input input-icon">
                <input type="text" placeholder="Type your username...">
                <span class="icon icon-user"></span>
            </div>

            <div class="input input-icon">
                <input type="text" placeholder="Type your password...">
                <span class="icon icon-lock"></span>
            </div>
        </div>
        {% highlight xml %}
            <div class="input input-icon">
                <input type="text" placeholder="Type your username...">
                <span class="icon icon-user"></span>
            </div>

            <div class="input input-icon">
                <input type="text" placeholder="Type your password...">
                <span class="icon icon-lock"></span>
            </div>
        {% endhighlight %}

        <p>
            You're able to place icons in the right side as well. Just add
            <code>.input-icon-end</code> to your input wrapper:
        </p>
        <div class="example">
            <div class="input input-icon input-icon-end">
                <input type="text" placeholder="Type a movie name...">
                <span class="icon icon-film"></span>
            </div>
        </div>
        {% highlight xml %}
            <div class="input input-icon input-icon-end">
                <input type="text" placeholder="Type a movie name...">
                <span class="icon icon-film"></span>
            </div>
        {% endhighlight %}
    </section>
{% endblock %}