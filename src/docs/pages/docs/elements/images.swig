{% extends "../../../layout/docs.swig" %}
{% set docs = "images" %}

{% block content %}
    <header class="page-header">
        <h2>Images</h2>
    </header>

    <section id="rounded">
        {{ macros.docsSectionTitle( "Rounded", "rounded", 3 ) }}
        <p>
            An image can be rounded when you add the <code>img-rounded</code> class.
            By default, any image will get a 4% <code>border-radius</code>, no matter how big it is.
        </p>

        <div class="example">
            <img data-src="holder.js/150x150" class="img-rounded">
            <img data-src="holder.js/250x200" class="img-rounded">
            <img data-src="holder.js/150x150" class="img-rounded">
        </div>
        {% highlight xml %}
            <img src="..." class="img-rounded">
        {% endhighlight %}
    </section>

    <section id="circular">
        {{ macros.docsSectionTitle( "Circular", "circular", 3 ) }}
        <p>Images will be circular if you add the <code>img-circular</code> class.</p>

        <div class="example">
            <img data-src="holder.js/150x150" class="img-circular">
            <img data-src="holder.js/150x150" class="img-circular">
        </div>
        {% highlight xml %}
            <img src="..." class="img-circular">
        {% endhighlight %}
    </section>

    <section id="thumbnail">
        {{ macros.docsSectionTitle( "Thumbnail", "thumbnail", 3 ) }}
        <p>A image can be bordered by simply adding the <code>img-bordered</code> class.</p>

        <div class="example">
            <img data-src="holder.js/150x150" class="img-bordered">
        </div>
        {% highlight xml %}
        <img src="..." class="img-bordered">
        {% endhighlight %}
    </section>
{% endblock %}