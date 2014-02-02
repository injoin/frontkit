{% extends "../../layout/docs.swig" %}
{% set docs = "grid" %}

{% block content %}
    <header class="page-header">
        <h2>Grid</h2>
    </header>
    <p class="lead">
        Included within Frontkit, there is an responsive, mobile-first, percent-based grid
        system of 12 columns that scales up or down as needed.
    </p>

    <section id="options">
        <h3>Grid Options</h3>
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
                        <td colspan="5">12 (default)</td>
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

    <p><strong>TODO:</strong> create examples</p>
{% endblock %}