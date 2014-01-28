{% macro docsClass( which ) %}
    {% if docs === which %}
        active
    {% endif %}
{% endmacro %}

{% macro activeClass( which ) %}
    {% if active === which %}
        active
    {% endif %}
{% endmacro %}