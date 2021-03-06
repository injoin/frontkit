{% extends "../../../layout/docs.swig" %}
{% set docs = "code" %}

{% block content %}
    <header class="page-header">
        <h2>Code</h2>
    </header>

    <section id="inline">
        <h3 docs-heading="inline">Inline</h3>
        <p>Wrap simple snippets of code with <code>&lt;code&gt;</code>.</p>

        <div class="example">
            <p>I like to use <code>&lt;div&gt;</code> tags for everything!</p>
        </div>
        {% highlight xml %}
            <code>...</code>
        {% endhighlight %}
    </section>

    <section id="block">
        <h3 docs-heading="block">Block</h3>
        <p>For more lines of code, you should go with the <code>&lt;pre&gt;</code> tag.</p>

        <div class="example">
            <pre><code>&lt;p&gt;That's a nice paragraph!&lt;/p&gt;</code></pre>
        </div>
        {% highlight xml %}
            <pre>...</pre>
        {% endhighlight %}
    </section>

    <section id="keyboard">
        <h3 docs-heading="keyboard">Keyboard</h3>
        <p>
            Want to highlight some keystroke?
            You may use the tag <code>&lt;kbd&gt;</code> for this purpose:
        </p>

        <div class="example">
            <p><kbd>Ctrl</kbd> + <kbd>C</kbd> is used to copy things.</p>
        </div>
        {% highlight xml %}
            <kbd>Ctrl</kbd> + <kbd>C</kbd> is used to copy things.
        {% endhighlight %}
    </section>

    <section id="output">
        <h3 docs-heading="output">Sample Output</h3>
        <p>
            It's also possible to highlight sample output from a computer program by using the
            <code>&lt;samp&gt;</code> tag.
            It has the same styles as the <code>&lt;code&gt;</code>, however it's more semantic.
        </p>

        <div class="example">
            <p>
                The computer said
                <samp>Too much cheese in tray two</samp>
                but I didn't know what that meant.
            </p>
        </div>
        {% highlight xml %}
        <samp>...</samp>
        {% endhighlight %}
    </section>
{% endblock %}