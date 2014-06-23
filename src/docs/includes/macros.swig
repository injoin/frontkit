{# Prints 'active' if the current docs active menu is 'which' #}
{% macro docsClass( which ) -%}
    {% if docs === which %}
        active
    {% endif %}
{%- endmacro %}

{# Prints 'active' if the current global active menu is 'which' #}
{% macro activeClass( which ) -%}
    {% if active === which %}
        active
    {% endif %}
{%- endmacro %}

{# Prints a url to a .html file #}
{% macro siteUrl( page ) -%}
    {{ basePath + page }}.html
{%- endmacro %}

{# Prints a url #}
{% macro baseUrl( path ) -%}
    {{ basePath + path }}
{%- endmacro %}

{% macro docsSectionTitle( label, path, level ) %}
    <h{{ level }} class="docs-heading">
        <a href="#{{ path }}" class="docs-anchor">#</a>
        {% autoescape false %}{{ label }}{% endautoescape %}
    </h{{ level }}>
{% endmacro %}