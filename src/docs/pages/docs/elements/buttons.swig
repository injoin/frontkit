{% extends "../../../layout/docs.swig" %}
{% set docs = "buttons" %}

{% block content %}
    <header class="page-header">
        <h2>Buttons</h2>
    </header>
    <p class="lead">Buttons denote some possible action for the user.</p>

    <section id="options">
        {{ macros.docsSectionTitle( "Button Options", "options", 3 ) }}
        <p>
            Frontkit comes with a variety of button classes that allow you to quickly create a
            semantic, informational button.
        </p>

        <div class="example">
            <button type="button" class="btn btn-default">Default</button>
            <button type="button" class="btn btn-primary">Primary</button>
            <button type="button" class="btn btn-success">Success</button>
            <button type="button" class="btn btn-warning">Warning</button>
            <button type="button" class="btn btn-info">Info</button>
            <button type="button" class="btn btn-danger">Danger</button>
            <button type="button" class="btn btn-link">Link</button>
        </div>
        {% highlight xml %}
            <!-- Standard button -->
            <button type="button" class="btn btn-default">Default</button>

            <!-- Button that indicates a primary action -->
            <button type="button" class="btn btn-primary">Primary</button>

            <!-- Button to indicate an successful, positive action -->
            <button type="button" class="btn btn-success">Success</button>

            <!-- Button for informational actions -->
            <button type="button" class="btn btn-info">Info</button>

            <!-- Button that indicates caution must be taken -->
            <button type="button" class="btn btn-warning">Warning</button>

            <!-- Button to indicate some negative or destructive action -->
            <button type="button" class="btn btn-danger">Danger</button>

            <!-- A button that look like a link -->
            <button type="button" class="btn btn-link">Link</button>
        {% endhighlight %}
    </section>

    <section id="states">
        {{ macros.docsSectionTitle( "States", "states", 3 ) }}
        <p>A button can have a few configurable states.</p>

        <div class="example">
            <button type="button" class="btn btn-default active">Active button</button>
            <button type="button" class="btn btn-default" disabled>Disabled button</button>
            <button type="button" class="btn btn-info disabled">Disabled button</button>
        </div>
        {% highlight xml %}
            <button type="button" class="btn btn-default active">Active button</button>
            <button type="button" class="btn btn-default" disabled>Disabled button</button>
            <button type="button" class="btn btn-info disabled">Disabled button</button>
        {% endhighlight %}
    </section>

    <section id="sizes">
        {{ macros.docsSectionTitle( "Sizes", "sizes", 3 ) }}
        <p>A button can vary in size, from tiny to extra large.</p>

        <div class="example">
            <p>
                <button type="button" class="btn btn-primary btn-xlarge">Extra Large Button</button>
                <button type="button" class="btn btn-default btn-xlarge">Extra Large Button</button>
            </p>

            <p>
                <button type="button" class="btn btn-primary btn-large">Large Button</button>
                <button type="button" class="btn btn-default btn-large">Large Button</button>
            </p>

            <p>
                <button type="button" class="btn btn-primary">Normal Button</button>
                <button type="button" class="btn btn-default">Normal Button</button>
            </p>

            <p>
                <button type="button" class="btn btn-primary btn-small">Small Button</button>
                <button type="button" class="btn btn-default btn-small">Small Button</button>
            </p>

            <p>
                <button type="button" class="btn btn-primary btn-tiny">Tiny Button</button>
                <button type="button" class="btn btn-default btn-tiny">Tiny Button</button>
            </p>
        </div>
        {% highlight xml %}
            <p>
                <button type="button" class="btn btn-primary btn-xlarge">Extra Large Button</button>
                <button type="button" class="btn btn-default btn-xlarge">Extra Large Button</button>
            </p>
            <p>
                <button type="button" class="btn btn-primary btn-large">Large Button</button>
                <button type="button" class="btn btn-default btn-large">Large Button</button>
            </p>
            <p>
                <button type="button" class="btn btn-primary">Normal Button</button>
                <button type="button" class="btn btn-default">Normal Button</button>
            </p>
            <p>
                <button type="button" class="btn btn-primary btn-small">Small Button</button>
                <button type="button" class="btn btn-default btn-small">Small Button</button>
            </p>
            <p>
                <button type="button" class="btn btn-primary btn-tiny">Tiny Button</button>
                <button type="button" class="btn btn-default btn-tiny">Tiny Button</button>
            </p>
        {% endhighlight %}
    </section>

    <section id="groups">
        {{ macros.docsSectionTitle( "Button Groups", "groups", 3 ) }}
        <p>Buttons can be grouped together.</p>

        <div class="example">
            <div class="btn-group">
                <button type="button" class="btn btn-default">One</button>
                <button type="button" class="btn btn-default">Two</button>
                <button type="button" class="btn btn-default">Three</button>
            </div>
        </div>
        {% highlight xml %}
            <div class="btn-group">
                <button type="button" class="btn btn-default">One</button>
                <button type="button" class="btn btn-default">Two</button>
                <button type="button" class="btn btn-default">Three</button>
            </div>
        {% endhighlight %}

        <section id="groups-state">
            {{ macros.docsSectionTitle( "Shared state", "groups-state", 4 ) }}
            <p>
                When using button groups, you are able to share state between them.
                Just add the desired state class in the <code>.btn-group</code> container.
            </p>

            <div class="example">
                <div class="btn-group disabled">
                    <button type="button" class="btn btn-default">Disabled 1</button>
                    <button type="button" class="btn btn-default">Disabled 2</button>
                </div>
                <div class="btn-group active">
                    <button type="button" class="btn btn-default">Active 1</button>
                    <button type="button" class="btn btn-default">Active 2</button>
                </div>
            </div>
            {% highlight xml %}
                <div class="btn-group disabled">
                    <button type="button" class="btn btn-default">Disabled 1</button>
                    <button type="button" class="btn btn-default">Disabled 2</button>
                </div>
                <div class="btn-group active">
                    <button type="button" class="btn btn-default">Active 1</button>
                    <button type="button" class="btn btn-default">Active 2</button>
                </div>
            {% endhighlight %}
        </section>
    </section>
{% endblock %}