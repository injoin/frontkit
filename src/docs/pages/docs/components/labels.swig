{% extends "../../../layout/docs.swig" %}
{% set docs = "labels" %}

{% block content %}
    <header class="page-header">
        <h2>Labels</h2>
    </header>
    <p class="lead">Give your components some labels for easily distinguish them from the others.</p>

    <section id="default">
        {{ macros.docsSectionTitle( "Label Options", "options", 3 ) }}
        <p>
            Below are exemplified all available options of labels in Frontkit.
            Switching the styles is as easy as changing the <code>label-*</code> class suffix.
        </p>

        <div class="example">
            <span class="label label-default">Default</span>
            <span class="label label-success">Success</span>
            <span class="label label-info">Info</span>
            <span class="label label-warning">Warning</span>
            <span class="label label-danger">Danger</span>
        </div>
        {% highlight xml %}
            <!-- Default label -->
            <span class="label label-default">Default</span>

            <!-- Success label -->
            <span class="label label-success">Success</span>

            <!-- Info label -->
            <span class="label label-info">Info</span>

            <!-- Warning label -->
            <span class="label label-warning">Warning</span>

            <!-- Danger label -->
            <span class="label label-danger">Danger</span>
        {% endhighlight %}
    </section>
{% endblock %}