{% extends "../../../layout//docs.swig" %}
{% set docs = "grid" %}

{% block content %}
    <header class="page-header">
        <h2>Grid</h2>
    </header>
    <p class="lead">
        Included within Frontkit, there is an responsive, mobile-first, percent-based grid
        system of 12, 16 and 24 columns that scales up or down as needed.
    </p>

    <section id="classes">
        {{ macros.docsSectionTitle( "Grid class pattern", "classes", 3 ) }}

        <p>
            All grid classes in Frontkit have the following pattern:
            <strong>prefix</strong> + <strong>columns</strong> + <strong>grid size</strong>.
            A base class <code>.column</code> must also be used.
            A valid example is <code>.column.medium-4-12</code>.
        </p>
        <p>
            We think that grids with such class pattern fixes a major problem of other responsive grids:
            <strong>the capability of augmenting styles without HTML refactoring.</strong>
        </p>
        <p>
            Suppose a CSS framework gives you 12 columns per grid row, what is the usual default.
            His classes will look like <code>.medium-4</code> -
            in this example, that's a width of 25%.
        </p>
        <p>
            Now you decide a new page in your app or website will need more than 12 columns - 16,
            for example. Using such framework, you would need to adapt <strong>every</strong> usage
            of your classes to match the new size.
        </p>
        <p>
            This sucks, and that's why we think our grid system is awesome!
        </p>
    </section>

    <section id="options">
        {{ macros.docsSectionTitle( "Grid options", "classes", 3 ) }}
        <p>Below are listed some options that are inherent to each grid size.</p>

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
        <p>TODO</p>
    </section>

    <section id="golden-ratio">
        {{ macros.docsSectionTitle( "Golden Ratio Grid", "goloden-ratio", 3 ) }}
        <p>TODO</p>
    </section>
{% endblock %}