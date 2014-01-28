{% extends "../../layout/docs.swig" %}
{% set docs = "nav" %}

{% block content %}
    <h2>Nav</h2>
    <p class="lead">
        Navs are navigation components. They share a common markup and a common base <code>.nav</code>
        class, what makes it easier to switch styles.
    </p>

    <section>
        <h3>Nav Lists</h3>

        <div class="example">
            <ul class="nav nav-list">
                <li class="nav-header">Header</li>
                <li class="nav-item"><a href>Item 1</a></li>
                <li class="nav-item"><a href>Item 2</a></li>
            </ul>
        </div>
        {% highlight xml %}
            <ul class="nav nav-list">
                <li class="nav-header">Header</li>
                <li class="nav-item"><a href>Item 1</a></li>
                <li class="nav-item"><a href>Item 2</a></li>
            </ul>
        {% endhighlight %}
    </section>

    <section>
        <h3>Nav Lists</h3>

        <div class="example">
            <ul class="nav nav-list">
                <li class="nav-header">Header</li>
                <li class="nav-item"><a href>Item 1</a></li>
                <li class="nav-item"><a href>Item 2</a></li>
            </ul>
        </div>
        {% highlight xml %}
            <ul class="nav nav-list">
                <li class="nav-header">Header</li>
                <li class="nav-item"><a href>Item 1</a></li>
                <li class="nav-item"><a href>Item 2</a></li>
            </ul>
        {% endhighlight %}
    </section>
{% endblock %}