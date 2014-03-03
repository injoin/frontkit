{% extends "../../../layout/docs.swig" %}

{% set docs = "typography" %}

{% block content %}
    <header class="page-header">
        <h2>Typography</h2>
    </header>

    <section id="body-copy">
        {{ macros.docsSectionTitle( "Body Copy", "body-copy", 3 ) }}
        <p>
            By default, the body copy of Frontkit is composed of 16px <code>font-size</code>
            and a <code>line-height</code> of 1.42. This is applied to all paragraphs, and makes
            reading easier to anyone.
        </p>

        <div class="example">
            <p>
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent tempor, quam id
                suscipit vestibulum, neque purus dapibus augue, a fringilla odio lectus ut eros.
            </p>
        </div>
        {% highlight xml %}
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent tempor...</p>
        {% endhighlight %}

        <section id="body-copy-lead">
            {{ macros.docsSectionTitle( "Lead Body Copy", "body-copy-lead", 4 ) }}
            <p>
                It's also possible to stand some paragraph out by adding the class <code>.lead</code>.
            </p>

            <div class="example">
                <p class="lead">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                <p>
                    Praesent tempor, quam id suscipit vestibulum, neque purus dapibus
                    augue, a fringilla odio lectus ut eros.
                </p>
            </div>
            {% highlight xml %}
                <p class="lead">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                <p>Praesent tempor, quam id suscipit vestibulum...</p>
            {% endhighlight %}
        </section>
    </section>

    <section id="emphasis">
        {{ macros.docsSectionTitle( "Emphasis", "emphasis", 3 ) }}
        <p>
            Easily emphasize your text only by using HTML5 default tags.
            No extra markup required.
        </p>

        <section id="emphasis-bold">
            {{ macros.docsSectionTitle( "Bold", "emphasis-bold", 4 ) }}
            <p>Used to give more importance to a snippet of text. Makes the text heavier.</p>

            <div class="example">
                <p>This is a text that has <strong>very important parts</strong>.</p>
            </div>
            {% highlight xml %}
                This is a text that has <strong>very important parts</strong>.
            {% endhighlight %}
        </section>

        <section id="emphasis-italics">
            {{ macros.docsSectionTitle( "Italics", "emphasis-italics", 4 ) }}
            <p>To whenever you need to do a snippet of text flashy - but not more than the bold one.</p>

            <div class="example">
                <p>This is <em>really important</em>. You should take note.</p>
            </div>
            {% highlight xml %}
                This is <em>really important</em>. You should take note.
            {% endhighlight %}
        </section>

        <section id="emphasis-small">
            {{ macros.docsSectionTitle( "Small Text", "emphasis-small", 4 ) }}
            <p>
                Useful for de-emphasizing text, making it less flashy
                than the rest of a paragraph or snippet.
            </p>

            <div class="example">
                <p><small>Useless footprint info</small></p>
            </div>
            {% highlight xml %}
                <small>Useless footprint info</small>
            {% endhighlight %}
        </section>
    </section>

    <section id="abbreviations">
        {{ macros.docsSectionTitle( "Abbreviations", "abbreviations", 3 ) }}
        <p>
            In case you need to use abbreviations and/or acronyms, you may want to use the
            <code>&lt;abbr&gt;</code> for this. It gives you an stylized implementation of that tag,
            while keeping styles simple.<br>
            Note that this style is only present when using an <code>title</code> attribute.
        </p>

        <div class="example">
            <p>Do you know when <abbr title="HyperText Markup Language">HTML</abbr> has been created?</p>
        </div>
        {% highlight xml %}
            <p>Do you know when <abbr title="HyperText Markup Language">HTML</abbr> has been created?</p>
        {% endhighlight %}
    </section>

    <section id="addresses">
        {{ macros.docsSectionTitle( "Addresses", "addresses", 3 ) }}
        <p>Used to supply contact information for its neareset ancestor or for the whole page.</p>

        <div class="example">
            <address>
                <strong>Google Inc.</strong><br>
                1600 Amphitheatre Parkway<br>
                Mountain View, CA 94043<br>
                Phone: +1 650-253-0000<br>
                Fax: +1 650-253-0001<br>
            </address>
        </div>
        {% highlight xml %}
            <address>
                <strong>Google Inc.</strong><br>
                1600 Amphitheatre Parkway<br>
                Mountain View, CA 94043<br>
                Phone: +1 650-253-0000<br>
                Fax: +1 650-253-0001<br>
            </address>
        {% endhighlight %}
    </section>

    <section id="blockquotes">
        {{ macros.docsSectionTitle( "Blockquotes", "blockquotes", 3 ) }}
        <p>Used for quoting blocks of content from another source within your document.</p>

        <section>
            <h4>Default Blockquote</h4>
            <p>Simply wrap an <code>&lt;blockquote&gt;</code> around any text.</p>

            <div class="example">
                <blockquote>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</blockquote>
            </div>
            {% highlight xml %}
                <blockquote>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</blockquote>
            {% endhighlight %}
        </section>

        <section id="blockquotes-named">
            {{ macros.docsSectionTitle( "Named Blockquotes", "blockquotes-named", 4 ) }}
            <p>
                Add a element with a <code>.reference</code> class to reference from where this quote
                has been taken, or to identify who is the author.
            </p>

            <div class="example">
                <blockquote>
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                    <span class="reference">Someone famous said this</span>
                </blockquote>
            </div>
            {% highlight xml %}
                <blockquote>
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                    <span class="reference">Someone famous said this</span>
                </blockquote>
            {% endhighlight %}
        </section>
    </section>
{% endblock %}