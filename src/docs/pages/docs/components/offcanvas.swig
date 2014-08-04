{% extends "../../../layout/docs.swig" %}
{% set docs = "offcanvas" %}

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

    <section id="arguments">
        <h3 docs-heading="arguments">Arguments</h3>

        <table class="table table-bordered table-striped">
            <colgroup>
                <col class="tiny-3-12 medium-2-12">
            </colgroup>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Type</th>
                    <th>Description</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>offcanvas</td>
                    <td>String</td>
                    <td>Contains the expression that will control toggling the offcanvas menu.</td>
                </tr>
                <tr>
                    <td>target-screen</td>
                    <td>String</td>
                    <td>
                        <p>
                            Set the target screen size for the offcanvas menu.<br>
                            By default, there is no target screen size.
                        </p>
                        <p>
                            The value of this attribute can be any of the <a href="{{
                                macros.siteUrl( "docs/structure/responsive-utilities" )
                            }}#visibility">
                                responsive utility classes for visibility
                            </a>, but removing its prefix like <code>show-</code> or
                            <code>hide-</code>.
                        </p>
                    </td>
                </tr>
            </tbody>
        </table>
    </section>
{% endblock %}