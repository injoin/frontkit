{% extends "../../../layout/docs.swig" %}
{% set docs = "lists" %}

{% block content %}
    <header class="page-header">
        <h2>Lists</h2>
    </header>

    <section id="unordered">
        {{ macros.docsSectionTitle( "Unordered", "unordered", 3 ) }}
        <p>A list where the order does not explicitly matter.</p>

        <div class="example">
            <ul>
                <li>Lorem ipsum dolor sit amet</li>
                <li>Lorem ipsum dolor sit amet</li>
                <li>
                    Lorem ipsum dolor sit amet
                    <ul>
                        <li>consectetur adipiscing elit</li>
                        <li>consectetur adipiscing elit</li>
                    </ul>
                </li>
            </ul>
        </div>
        {% highlight xml %}
            <ul>
                <li>Lorem ipsum dolor sit amet</li>
                <li>Lorem ipsum dolor sit amet</li>
                <li>
                    Lorem ipsum dolor sit amet
                    <ul>
                        <li>consectetur adipiscing elit</li>
                        <li>consectetur adipiscing elit</li>
                    </ul>
                </li>
            </ul>
        {% endhighlight %}
    </section>

    <section id="ordered">
        {{ macros.docsSectionTitle( "Ordered", "ordered", 3 ) }}
        <p>A list where the order does explicitly matter.</p>

        <div class="example">
            <ol>
                <li>Lorem ipsum dolor sit amet</li>
                <li>Lorem ipsum dolor sit amet</li>
                <li>Lorem ipsum dolor sit amet</li>
            </ol>
        </div>
        {% highlight xml %}
            <ol>
                <li>Lorem ipsum dolor sit amet</li>
                <li>Lorem ipsum dolor sit amet</li>
                <li>Lorem ipsum dolor sit amet</li>
            </ol>
        {% endhighlight %}
    </section>

    <section id="unstyled">
        {{ macros.docsSectionTitle( "Unstyled", "unstyled", 3 ) }}
        <p>
            Removes the default styling of a list.<br>
            <strong>Note:</strong> this does not apply to nested lists.
            You must add the class for any nested list as well.
        </p>

        <div class="example">
            <ul class="list-unstyled">
                <li>Lorem ipsum dolor sit amet</li>
                <li>Lorem ipsum dolor sit amet</li>
                <li>
                    Lorem ipsum dolor sit amet
                    <ul>
                        <li>consectetur adipiscing elit</li>
                        <li>consectetur adipiscing elit</li>
                    </ul>
                </li>
            </ul>
        </div>
        {% highlight xml %}
            <ul class="list-unstyled">
                <li>Lorem ipsum dolor sit amet</li>
                <li>Lorem ipsum dolor sit amet</li>
                <li>
                    Lorem ipsum dolor sit amet
                    <ul>
                        <li>consectetur adipiscing elit</li>
                        <li>consectetur adipiscing elit</li>
                    </ul>
                </li>
            </ul>
        {% endhighlight %}
    </section>

    <section id="inline">
        {{ macros.docsSectionTitle( "Inline", "inline", 3 ) }}
        <p>Place list items side-by-side with a light padding.</p>

        <div class="example">
            <ul class="list-inline">
                <li>Lorem ipsum</li>
                <li>dolor sit amet</li>
            </ul>
        </div>
        {% highlight xml %}
            <ul class="list-inline">
                <li>Lorem ipsum</li>
                <li>dolor sit amet</li>
            </ul>
        {% endhighlight %}
    </section>

    <section id="description">
        {{ macros.docsSectionTitle( "Descriptions", "description", 3 ) }}
        <p>A list of terms and their associated descriptions.</p>

        <div class="example">
            <dl>
                <dt>Lorem ipsum</dt>
                <dd>dolor sit amet</dd>

                <dt>Lorem ipsum</dt>
                <dd>dolor sit amet</dd>

                <dt>Lorem ipsum</dt>
                <dd>dolor sit amet</dd>
            </dl>
        </div>
        {% highlight xml %}
            <dl>
                <dt>Lorem ipsum</dt>
                <dd>dolor sit amet</dd>
            </dl>
        {% endhighlight %}

        <section id="description-inline">
            {{ macros.docsSectionTitle( "Inline Description", "description-inline", 4 ) }}
            <p>
                It's also possible to inline a description list by adding the class
                <code>dl-inline</code> to your <code>&lt;dl&gt;</code>.
            </p>

            <div class="example">
                <dl class="dl-inline">
                    <dt>Lorem ipsum</dt>
                    <dd>dolor sit amet</dd>

                    <dt>Lorem ipsum dolor sit amet</dt>
                    <dd>consectetur adipiscing elit</dd>
                    <dd>consectetur adipiscing elit</dd>

                    <dt>Lorem ipsum</dt>
                    <dd>dolor sit amet</dd>
                </dl>
            </div>
            {% highlight xml %}
            <dl class="dl-inline">
                <dt>Lorem ipsum</dt>
                <dd>dolor sit amet</dd>
            </dl>
            {% endhighlight %}
        </section>
    </section>
{% endblock %}