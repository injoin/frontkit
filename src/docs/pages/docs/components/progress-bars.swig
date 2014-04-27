{% extends "../../../layout/docs.swig" %}
{% set docs = "progress-bars" %}

{% block content %}
    <h2>Progress Bars</h2>
    <p class="lead">Give feedback on the completion of some task with progress bars.</p>

    <section id="default">
        {{ macros.docsSectionTitle( "Default Example", "default", 3 ) }}
        <p>Default progress bar usage.</p>

        <div class="example">
            <div class="progress">
                <div class="progress-bar" style="width: 50%"></div>
            </div>
        </div>
        {% highlight xml %}
            <div class="progress">
                <div class="progress-bar" style="width: 50%"></div>
            </div>
        {% endhighlight %}
    </section>

    <section id="striped">
        {{ macros.docsSectionTitle( "Striped", "striped", 3 ) }}
        <p>
            Use <code>.progress-striped</code> class to create a striped effect in your progress
            bar.
        </p>

        <div class="example">
            <div class="progress progress-striped">
                <div class="progress-bar" style="width: 65%"></div>
            </div>
        </div>
        {% highlight xml %}
            <div class="progress progress-striped">
                <div class="progress-bar" style="width: 65%"></div>
            </div>
        {% endhighlight %}
    </section>

    <section id="animated">
        {{ macros.docsSectionTitle( "Animated", "animated", 3 ) }}
        <p>
            You can also create an animated progress bar by adding the <code>.active</code> class.
            Note that <code>.progress-striped</code> is also needed to create the effect.
        </p>

        <div class="example">
            <div class="progress progress-striped active">
                <div class="progress-bar" style="width: 65%"></div>
            </div>
        </div>
        {% highlight xml %}
        <div class="progress progress-striped active">
            <div class="progress-bar" style="width: 65%"></div>
        </div>
        {% endhighlight %}
    </section>
{% endblock %}