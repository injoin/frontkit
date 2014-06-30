{% extends "../../../layout/docs.swig" %}
{% set docs = "icons" %}

{% block content %}
    <header class="page-header">
        <h2>Icons</h2>
    </header>
    <p class="lead">
        Frontkit includes a subset of {{ icons.length }} icons of the
        <a href="http://www.webhostinghub.com/glyphs/">WebHostingHub Glyphs</a> iconic font, which
        makes easy for you to use flat, vectorized, retina ready icons.
    </p>

    <section id="usage">
        {{ macros.docsSectionTitle( "Usage", "usage", 3 ) }}
        <p>
            To use a Frontkit icon, you must use the <code>.icon</code> class in conjunction with
            the icon class, <a href="#icons-list">available below</a>:
        </p>

        <div class="example">
            <span class="icon icon-home"></span>
        </div>
        {% highlight xml %}
            <span class="icon icon-home"></span>
        {% endhighlight %}
    </section>

    <section id="icons-list">
        {{ macros.docsSectionTitle( "Icons List", "icons-list", 3 ) }}
        <p>
            In the list below you can see a demo of all available icons in Frontkit, grouped by
            category, and their respective classes.
        </p>

        <input type="text" class="input" placeholder="Type to search icons..."
               ng-model="iconSearch">

        {% raw %}
            <section ng-attr-id="icons-list-{{ category | lowercase }}"
                     ng-repeat="(category, icons) in iconCategories"
                     ng-show="( icons | filter: iconSearch ).length" ng-cloak>
                <h4 docs-heading="icons-list-{{ category | lowercase }}">
                    {{ category }}
                </h4>

                <ul class="icons-list block-grid medium-block-grid-4 small-block-grid-3 tiny-block-grid-2">
                    <li ng-repeat="icon in icons | filter: iconSearch">
                        <span class="icon icon-{{ icon }}"></span>
                        <small>icon-{{ icon }}</small>
                    </li>
                </ul>
            </section>
        {% endraw %}
    </section>
{% endblock %}