{% extends "../../../layout/docs.swig" %}
{% set docs = "block-grid" %}

{% block content %}
    <h2>Block Grid</h2>
    <p class="lead">
        Keep content evenly separated, regardless of the screen size, with the underlying power of
        the Frontkit grid system.<br>
        Block grids are super useful for creating rows of thumbnails, for example - and much more.
    </p>

    <section id="introduction">
        {{ macros.docsSectionTitle( "Introduction", "introduction", 3 ) }}
        <p>
            A block grid is much simpler than the original
            <a href="{{ macros.siteUrl( "structure/grid" ) }}">grid system</a>, although both share
            the same powerful responsive and mobile-first pattern.<br>
            Below you can read a short introduction about the block grid, so you can better
            understand it:
        </p>

        <ul>
            <li>
                The block grid is composed of a parent element (the container) and its children
                (the columns). Each child is evenly separated, depending on the defined classes.
            </li>
            <li>
                The container is composed of the base <code>.block-grid</code> plus one or more
                sizing classes. Sizing classes have the following pattern:
                <code>prefix-block-grid-*</code>. For example: <code>.small-block-grid-5</code>.
            </li>
            <li>Child elements don't need any additional class.</li>
            <li>
                By default, you can use up to 12 elements per row. Want more? Customize this via the
                LESS variable <code>@block-grid-columns</code>.
            </li>
        </ul>

        <p>
            If you did not understand yet what block grid is, please take a look in the
            <a href="#example">examples</a> below.
        </p>
    </section>

    <section id="example">
        {{ macros.docsSectionTitle( "Block Grid Example", "example", 3 ) }}
        <p>
            The below example demonstrate how the block grid behaves: it shows 4 images per row on
            medium and bigger devices, while showing 2 images per row on tiny and small devices.
        </p>

        <div class="example">
            <ul class="block-grid tiny-block-grid-2 medium-block-grid-4">
                <li><img data-src="holder.js/250x120/auto" class="img-responsive img-rounded"></li>
                <li><img data-src="holder.js/250x120/auto" class="img-responsive img-rounded"></li>
                <li><img data-src="holder.js/250x120/auto" class="img-responsive img-rounded"></li>
                <li><img data-src="holder.js/250x120/auto" class="img-responsive img-rounded"></li>
            </ul>
        </div>
        {% highlight xml %}
            <ul class="block-grid tiny-block-grid-2 medium-block-grid-4">
                <li><img src="..." class="img-responsive"></li>
                <li><img src="..." class="img-responsive"></li>
                <li><img src="..." class="img-responsive"></li>
                <li><img src="..." class="img-responsive"></li>
            </ul>
        {% endhighlight %}
    </section>
{% endblock %}