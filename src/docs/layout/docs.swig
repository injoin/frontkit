{% extends "main.swig" %}
{% set active = "docs" %}
{% import "../includes/macros.swig" as macros %}

{% block page %}
    <header class="hero-unit docs-master-head">
        <div class="container">
            <div class="row">
                <div class="col medium-8 x-large-9">
                    <h1><%= pkg.title %></h1>
                    <p><%= pkg.description %></p>
                </div>
            </div>
        </div>
    </header>

    <main class="container">
        <div class="row">
            <div class="col medium-4 xlarge-3">
                <aside class="docs-sidebar">
                    <ul class="nav nav-list">
                        <li class="nav-header">
                            Elements
                        </li>
                        <li class="nav-item <%= macros.docsClass( 'typography' ) %>">
                            <a href="docs/elements/typography.html">Typography</a>
                        </li>
                        <li class="nav-item <%= macros.docsClass( 'code' ) %>">
                            <a href="docs/elements/code.html">Code</a>
                        </li>
                        <li class="nav-item <%= macros.docsClass( 'lists' ) %>">
                            <a href="docs/elements/lists.html">Lists</a>
                        </li>
                        <li class="nav-item <%= macros.docsClass( 'inputs' ) %>">
                            <a href="docs/elements/inputs.html">Inputs</a>
                        </li>
                        <li class="nav-item <%= macros.docsClass( 'checkbox' ) %>">
                            <a href="docs/elements/checkbox.html">Checkbox/Radio</a>
                        </li>
                        <li class="nav-item <%= macros.docsClass( 'buttons' ) %>">
                            <a href="docs/elements/buttons.html">Buttons</a>
                        </li>
                        <li class="nav-item <%= macros.docsClass( 'images' ) %>">
                            <a href="docs/elements/images.html">Images</a>
                        </li>
                    </ul>

                    <ul class="nav nav-list">
                        <li class="nav-header">
                            Components
                        </li>

                        <li class="nav-item <%= macros.docsClass( 'hero-unit' ) %>">
                            <a href="docs/components/hero-unit.html">Hero Unit</a>
                        </li>

                        <li class="nav-item <%= macros.docsClass( 'labels' ) %>">
                            <a href="docs/components/labels.html">Labels</a>
                        </li>

                        <li class="nav-item <%= macros.docsClass( 'nav' ) %>">
                            <a href="docs/components/nav.html">Nav</a>
                        </li>
                    </ul>
                </aside>
            </div>

            <div class="col medium-8 xlarge-9">
                <article class="docs-content">
                    {% block content %}{% endblock %}
                </article>
            </div>
        </div>
    </main>
{% endblock %}