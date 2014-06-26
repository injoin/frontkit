{% extends "../../../layout/docs.swig" %}
{% set docs = "grid" %}

{% block content %}
    <header class="page-header">
        <h2>Grid</h2>
    </header>
    <p class="lead">
        Included within Frontkit, there is an responsive, mobile-first, percent-based grid
        system of 12, 16 and 24 columns that scales up or down as needed.
    </p>

    <section id="introduction">
        {{ macros.docsSectionTitle( "Introduction", "introduction", 3 ) }}
        <p>
            The Frontkit grid system is a powerful way to create page layouts that will work in any
            device. And it's easy to learn, even if you know nothing about grid systems:
        </p>

        <ul>
            <li>
                The grid is composed by columns, rows and a container. Each column can vary in size
                depending on the screen resolution.
            </li>
            <li>
                A column is composed of the base <code>.column</code> class plus another sizing
                class, which determines its width. That sizing class has the following format:
                <code>prefix-*-*</code>. A valid example is <code>.medium-3-12</code>.
            </li>
            <li>
                A row is a simple wrapper for columns. All it takes is a <code>.row</code> class.
            </li>
            <li>
                There's also a wrapper for rows, which can be a <code>.container</code> or a
                <code>.container-fluid</code>. The only difference between them is that the first
                one has a fixed maximum width, while the other doesn't.
            </li>
            <li>
                You can also make use of offseting classes, which set a left margin in the element.
                They follow almost the same pattern as the column classes:
                <code>prefix-offset-*-*</code> - a valid example is <code>.small-offset-6-12</code>.
            </li>
        </ul>

        <p>
            For further info about these topics, take a look below in the
            <a href="#options">Grid options</a> and <a href="#examples">Examples</a> sections.
        </p>
    </section>

    <section id="options">
        {{ macros.docsSectionTitle( "Grid options", "options", 3 ) }}
        <p>
            Below are listed some options that are inherent to each screen size when you use the
            Frontkit grid system.
        </p>

        <div class="table-responsive">
            <table class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th></th>
                        <th>
                            Tiny<br>
                            <small>< 768px</small>
                        </th>
                        <th>
                            Small<br>
                            <small>≥ 768px</small>
                        </th>
                        <th>
                            Medium<br>
                            <small>≥ 980px</small>
                        </th>
                        <th>
                            Large<br>
                            <small>≥ 1200px</small>
                        </th>
                        <th>
                            X-Large<br>
                            <small>≥ 1600px</small>
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th># of columns</th>
                        <td colspan="5">12, 16 and 24</td>
                    </tr>
                    <tr>
                        <th>Class prefix</th>
                        <td><code>.tiny-</code></td>
                        <td><code>.small-</code></td>
                        <td><code>.medium-</code></td>
                        <td><code>.large-</code></td>
                        <td><code>.xlarge-</code></td>
                    </tr>
                    <tr>
                        <th>Container width</th>
                        <td>None, auto</td>
                        <td>750px</td>
                        <td>940px</td>
                        <td>1170px</td>
                        <td>1570px</td>
                    </tr>
                    <tr>
                        <th>Nestable</th>
                        <td colspan="5">Yes</td>
                    </tr>
                    <tr>
                        <th>Offsets</th>
                        <td colspan="5">Yes</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </section>

    <section id="examples">
        {{ macros.docsSectionTitle( "Examples", "examples", 3 ) }}
        <p>
            Remember: <strong>Frontkit is mobile-first!</strong> This means you can code aiming tiny
            devices first. Larger devices will inherit those styles, so you can customize them as
            necessary.
        </p>

        {# Example: Basic grid #}
        <section id="examples-basic">
            {{ macros.docsSectionTitle( "Basic Grid", "examples-basic", 4 ) }}
            <p>
                A simple grid that will vertically stack its columns when the resolution goes below
                a medium resolution. Don't know what is a medium resolution?
                <a href="#options">Take a look here</a>.
            </p>

            <div class="example grid-example">
                <div class="row">
                    <div class="column medium-3-12">3</div>
                    <div class="column medium-3-12">3</div>
                    <div class="column medium-3-12">3</div>
                    <div class="column medium-3-12">3</div>
                </div>
                <div class="row">
                    <div class="column medium-4-12">4</div>
                    <div class="column medium-4-12">4</div>
                    <div class="column medium-4-12">4</div>
                </div>
                <div class="row">
                    <div class="column medium-6-12">6</div>
                    <div class="column medium-6-12">6</div>
                </div>
                <div class="row">
                    <div class="column medium-12-12">12</div>
                </div>
            </div>
            {% highlight xml %}
                <div class="row">
                    <div class="column medium-3-12">3</div>
                    <div class="column medium-3-12">3</div>
                    <div class="column medium-3-12">3</div>
                    <div class="column medium-3-12">3</div>
                </div>
                <div class="row">
                    <div class="column medium-4-12">4</div>
                    <div class="column medium-4-12">4</div>
                    <div class="column medium-4-12">4</div>
                </div>
                <div class="row">
                    <div class="column medium-6-12">6</div>
                    <div class="column medium-6-12">6</div>
                </div>
                <div class="row">
                    <div class="column medium-12-12">12</div>
                </div>
            {% endhighlight %}
        </section>

        {# Example: Fluid #}
        <section id="examples-fluid">
            {{ macros.docsSectionTitle( "Fluid Grid", "examples-fluid", 4 ) }}
            <p>
                Some columns in the example below take different sizes, depending on the screen
                size. Try resizing your browser or viewing this page in different devices to see the
                differences!
            </p>

            <div class="example grid-example">
                <div class="row">
                    <div class="column medium-4-12 tiny-6-12">
                        <span class="show-medium-above">4</span>
                        <span class="show-small-below">6</span>
                    </div>
                    <div class="column medium-4-12 tiny-6-12">
                        <span class="show-medium-above">4</span>
                        <span class="show-small-below">6</span>
                    </div>
                    <div class="column medium-4-12 tiny-12-12">
                        <span class="show-medium-above">4</span>
                        <span class="show-small-below">full</span>
                    </div>
                </div>

                <div class="row">
                    <div class="column small-4-12">
                        <span class="hide-tiny">4</span>
                        <span class="show-tiny">full</span>
                    </div>
                    <div class="column small-6-12 large-4-12">
                        <span class="hide-tiny hide-large-above">6</span>
                        <span class="show-large-above">4</span>
                        <span class="show-tiny">full</span>
                    </div>
                    <div class="column small-2-12 tiny-6-12">
                        <span class="hide-tiny">2</span>
                        <span class="show-tiny">6</span>
                    </div>
                    <div class="column large-2-12 tiny-6-12 small-12-12">
                        <span class="show-large-above">2</span>
                        <span class="hide-tiny hide-large-above">full</span>
                        <span class="show-tiny">6</span>
                    </div>
                </div>
            </div>
            {% highlight xml %}
                <div class="row">
                    <div class="column medium-4-12 tiny-6-12">...</div>
                    <div class="column medium-4-12 tiny-6-12">...</div>
                    <div class="column medium-4-12 tiny-12-12">...</div>
                </div>

                <div class="row">
                    <div class="column small-4-12">...</div>
                    <div class="column small-6-12 large-4-12">...</div>
                    <div class="column small-2-12 tiny-6-12">...</div>
                    <div class="column large-2-12 tiny-6-12 small-12-12">...</div>
                </div>
            {% endhighlight %}
        </section>

        {# Example: Offsets #}
        <section id="examples-offset">
            {{ macros.docsSectionTitle( "Offset column", "examples-offset", 4 ) }}
            <p>
                Sometimes, you need to make a offset between two columns - maybe because there is no
                content in that white space? Frontkit bring you some classes to solve exactly this
                problem.
            </p>

            <div class="example grid-example">
                <div class="row">
                    <div class="column small-4-12">4</div>
                    <div class="column small-4-12 small-offset-4-12">4 offset 4</div>
                </div>
                <div class="row">
                    <div class="column small-3-12 small-offset-3-12">3 offset 3</div>
                    <div class="column small-3-12 small-offset-3-12">3 offset 3</div>
                </div>
            </div>
            {% highlight xml %}
                <div class="row">
                    <div class="column small-4-12">4</div>
                    <div class="column small-4-12 small-offset-4-12">4 offset 4</div>
                </div>
                <div class="row">
                    <div class="column small-3-12 small-offset-3-12">3 offset 3</div>
                    <div class="column small-3-12 small-offset-3-12">3 offset 3</div>
                </div>
            {% endhighlight %}
        </section>
    </section>

    <section id="golden-ratio">
        {{ macros.docsSectionTitle( "Golden Ratio Grid", "golden-ratio", 3 ) }}
        <p>
            The <a href="http://en.wikipedia.org/wiki/Golden_ratio">Golden Ratio</a> is a number
            that indicate a perfectly balanced proportion for design (~1.618). If you like applying
            it to your page layout, Frontkit helps you to achieve this by providing grid classes
            that match the Golden Ratio.
        </p>

        <div class="example grid-example">
            <div class="row">
                <div class="column tiny-golden-long">Long golden section</div>
                <div class="column tiny-golden-short">Short golden section</div>
            </div>
            <div class="row">
                <div class="column tiny-golden-short tiny-offset-golden-long">
                    Short golden section, long golden offset
                </div>
            </div>
            <div class="row">
                <div class="column tiny-golden-long tiny-offset-golden-short">
                    Long golden section, short golden offset
                </div>
            </div>
        </div>
        {% highlight xml %}
            <div class="row">
                <div class="column tiny-golden-long">Long golden section</div>
                <div class="column tiny-golden-short">Short golden section</div>
            </div>
            <div class="row">
                <div class="column tiny-golden-short tiny-offset-golden-long">
                    Short golden section, long golden offset
                </div>
            </div>
            <div class="row">
                <div class="column tiny-golden-long tiny-offset-golden-short">
                    Long golden section, short golden offset
                </div>
            </div>
        {% endhighlight %}
    </section>
{% endblock %}