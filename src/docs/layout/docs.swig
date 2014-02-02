{% extends "main.swig" %}
{% set active = "docs" %}
{% import "../includes/macros.swig" as macros %}

{% block page %}
    <header class="hero-unit docs-master-head">
        <div class="container">
            <div class="row">
                <div class="col medium-8 x-large-9">
                    <h1>{{ pkg.title }}</h1>
                    <p>{{ pkg.description }}</p>
                </div>
            </div>
        </div>
    </header>

    <main class="container">
        <div class="row">
            <div class="col small-4 large-3">
                <aside class="docs-sidebar">
                    {% for menuId, data in menu %}
                    <ul class="nav nav-list">
                        <li class="nav-header">{{ data.label }}</li>

                        {% for id, label in data.items -%}
                        <li class="nav-item {{ macros.docsClass( id ) }}">
                            <a href="{{ macros.siteUrl( "docs/" + menuId + "/" + id ) }}">
                                {{ label }}
                            </a>
                        </li>
                        {%- endfor %}
                    </ul>
                    {% endfor %}
                </aside>
            </div>

            <div class="col small-8 large-9">
                <article class="docs-content">
                    {% block content %}{% endblock %}
                </article>
            </div>
        </div>
    </main>
{% endblock %}