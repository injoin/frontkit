{% extends "../../../layout/docs.swig" %}
{% set docs = "input-groups" %}

{% block content %}
    <header class="page-header">
        <h2>Input Groups</h2>
    </header>

    <p class="lead">
        Input Groups are a way to extend inputs with text, buttons, checkboxes or radio buttons.
        You can place them in either side of your input.
    </p>

    <section id="default-example">
        {{ macros.docsSectionTitle( "Default Example", "default-example", 3 ) }}
        <p>
            Below is a basic example. It uses a <code>.input-group</code> with a input and some
            add-ons. To place add-ons, use <code>.input-group-addon</code> with some text inside.
        </p>

        <div class="example">
            <div class="input-group">
                <span class="input-group-addon">@</span>
                <input class="input" placeholder="Username">
            </div>

            <div class="input-group">
                <input class="input" placeholder="Price">
                <span class="input-group-addon">.00</span>
            </div>

            <div class="input-group">
                <span class="input-group-addon">$</span>
                <input class="input" placeholder="Price">
                <span class="input-group-addon">.00</span>
            </div>
        </div>
        {% highlight xml %}
            <div class="input-group">
                <span class="input-group-addon">@</span>
                <input class="input" placeholder="Username">
            </div>

            <div class="input-group">
                <input class="input" placeholder="Price">
                <span class="input-group-addon">.00</span>
            </div>

            <div class="input-group">
                <span class="input-group-addon">$</span>
                <input class="input" placeholder="Price">
                <span class="input-group-addon">.00</span>
            </div>
        {% endhighlight %}
    </section>

    <section id="button-addons">
        {{ macros.docsSectionTitle( "Button add-ons", "button-addons", 3 ) }}
        <p>
            It's also possible to use button add-ons. To appear correctly, your button needs to be
            wrapped in a <code>.input-group-btn</code>.
        </p>

        <div class="example">
            <div class="row">
                <div class="column medium-6-12">
                    <div class="input-group">
                        <span class="input-group-addon icon icon-search"></span>
                        <input type="text" class="input" placeholder="Search...">
                        <div class="input-group-btn">
                            <button type="button" class="btn btn-default">OK</button>
                        </div>
                    </div>
                </div>
                <div class="column medium-6-12">
                    <div class="input-group">
                        <div class="input-group-btn">
                            <button type="button" class="btn btn-primary">OK</button>
                        </div>
                        <input type="text" class="input" placeholder="Search...">
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section id="checkbox-radio-addons">
        {{ macros.docsSectionTitle( "Checkboxes and radio add-ons", "checkbox-radio-addons", 3 ) }}
        <p>
            You can also place Frontkit checkboxes or radio buttons inside a input group's add-on
            instead of text.
        </p>

        <div class="example">
            <div class="row">
                <div class="column medium-6-12">
                    <div class="input-group">
                        <span class="input-group-addon">
                            <input type="checkbox" checkbox>
                        </span>
                        <input type="text" class="input">
                    </div>
                </div>

                <div class="column medium-6-12">
                    <div class="input-group">
                        <span class="input-group-addon">
                            <input type="radio" radio>
                        </span>
                        <input type="text" class="input">
                    </div>
                </div>
            </div>
        </div>
    </section>
{% endblock %}