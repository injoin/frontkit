{% extends "../../../layout/docs.swig" %}
{% set docs = "navbar" %}

{% block content %}
    <header class="page-header">
        <h2>Offcanvas</h2>
    </header>
    <p class="lead">
        Place some off canvas menu beside the page content.
        Great for mobile navigation.
    </p>

    <section id="example">
        <h3 docs-heading="introduction">Example</h3>

        <div class="example">
            <div offcanvas="offcanvasExample">
                <header class="page-header">
                    <h3>Offcanvas menu</h3>
                </header>
                <p>
                    Hey, congratulations, you have found the offcanvas example menu!<br>
                    Click anywhere in the page to hide me again.
                </p>
            </div>

            <button type="button" class="btn"
                    ng-click="$event.stopPropagation(); offcanvasExample = !offcanvasExample">
                Click to show the offcanvas menu
            </button>
        </div>
        {% highlight xml %}
            <div offcanvas="offcanvasExample">
                <header class="page-header">
                    <h3>Offcanvas menu</h3>
                </header>
                <p>
                    Hey, congratulations, you have found the offcanvas example menu!<br>
                    Click anywhere in the page to hide me again.
                </p>
            </div>

            <button type="button" class="btn"
                    ng-click="$event.stopPropagation(); offcanvasExample = !offcanvasExample">
                Click to show the offcanvas menu
            </button>
        {% endhighlight %}
    </section>
{% endblock %}