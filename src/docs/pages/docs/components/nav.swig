{% extends "../../../layout/docs.swig" %}
{% set docs = "nav" %}

{% block content %}
    <h2>Nav</h2>
    <p class="lead">
        Navs are navigation components. They share a common markup and a common base <code>.nav</code>
        class, what makes it easier to switch styles.
    </p>

    <section id="nav-lists">
        {{ macros.docsSectionTitle( "Nav Lists", "nav-lists", 3 ) }}
        <p>Nav lists are vertical navigations that have light styles.</p>

        <div class="example">
            <ul class="nav nav-list">
                <li class="nav-header">Header</li>
                <li class="nav-item"><a href="#">Item</a></li>
                <li class="nav-item active"><a href="#">Active Item</a></li>
                <li class="nav-item"><a href="#">Item</a></li>
            </ul>
        </div>
        {% highlight xml %}
            <ul class="nav nav-list">
                <li class="nav-header">Header</li>
                <li class="nav-item"><a href="#">Item</a></li>
                <li class="nav-item active"><a href="#">Active Item</a></li>
                <li class="nav-item"><a href="#">Item</a></li>
            </ul>
        {% endhighlight %}
    </section>
{% endblock %}