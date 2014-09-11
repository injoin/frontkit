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

{% macro socialButton( type ) -%}
    {% if type === "github-stars" %}
        <iframe src="http://ghbtns.com/github-btn.html?user=injoin&amp;repo=frontkit&amp;type=watch&amp;count=true"
                style="width: 80px; height: 20px; border: 0" class="social-button"></iframe>
    {% elseif type === "github-forks" %}
        <iframe src="http://ghbtns.com/github-btn.html?user=injoin&amp;repo=frontkit&amp;type=fork&amp;count=true"
                style="width: 80px; height: 20px; border: 0" class="social-button"></iframe>
    {% elseif type === "twitter-follow" %}
        <a href="https://twitter.com/injoinweb" class="twitter-follow-button social-button" data-show-count="true">
            Follow @injoinweb
        </a>
    {% elseif type === "twitter-tweet" %}
        <a href="https://twitter.com/share" class="twitter-share-button social-button" data-url="http://frontkit.injoin.io"
           data-text="Frontkit, the powerful front-end framework from InJoin" data-via="injoinweb" data-related="injoinweb">
            Tweet
        </a>
    {% endif %}
{%- endmacro %}