{% extends "../../../layout/docs.swig" %}
{% set docs = "navbar" %}

{% block content %}
    <header class="page-header">
        <h2>Navbar</h2>
    </header>
    <p class="lead">Navbars are meta components that primarily serve as navigation containers for your page.</p>

    <section id="default">
        {{ macros.docsSectionTitle( "Default Navbar", "default", 3 ) }}

        <p>
            The default navbar occupies a whole row, and isn't sticked
            neither to the top or the bottom of the page, unlike other tastes of navbars.
        </p>

        <div class="example">
            <div class="navbar">
                <a href="#" class="navbar-brand">Project</a>

                <button class="navbar-toggle pull-end">
                    <i class="icon"></i>
                    Toggle Navigation
                </button>

                <div class="navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li class="nav-item active"><a href="#">Link</a></li>
                        <li class="nav-item"><a href="#">Link</a></li>
                        <li class="nav-item"><a href="#">Link</a></li>
                    </ul>

                    <form class="navbar-form pull-end">
                        <input type="search" class="input" placeholder="Search...">
                        <button class="btn btn-default">OK</button>
                    </form>
                </div>
            </div>
        </div>
        {% highlight xml %}
            <div class="navbar">
                <a href="#" class="navbar-brand">Project</a>

                <ul class="nav navbar-nav">
                    <li class="nav-item active"><a href="#">Link</a></li>
                    <li class="nav-item"><a href="#">Link</a></li>
                    <li class="nav-item"><a href="#">Link</a></li>
                </ul>

                <form class="navbar-form pull-end">
                    <input type="search" class="input" placeholder="Search...">
                    <button class="btn btn-default">OK</button>
                </form>
            </div>
        {% endhighlight %}
    </section>

    <section id="components">
        {{ macros.docsSectionTitle( "Components", "components", 3 )  }}
        <p>
            There are various components that are tightly integrated with the navbar.
            Here you'll be able to see what are them and how to use them.
        </p>

        <section id="component-brand">
            {{ macros.docsSectionTitle( "Brand", "component-brand", 4 ) }}
            <p>The brand is, normally, the project name, or the site name.</p>

            <div class="example">
                <div class="navbar">
                    <a href="#" class="navbar-brand">Brand</a>
                </div>
            </div>
            {% highlight xml %}
                <div class="navbar">
                    <a href="#" class="navbar-brand">Brand</a>
                </div>
            {% endhighlight %}
        </section>

        <section id="component-nav">
            {{ macros.docsSectionTitle( "Navs", "component-nav", 4 ) }}

            <p>
                You can add some <a href="{{ macros.url( "components/nav" ) }}">navigation menus</a>
                to your navbar as well.
            </p>

            <div class="example">
                <div class="navbar">
                    <a href="#" class="navbar-brand">Brand</a>
                    <ul class="nav navbar-nav">
                        <li class="nav-item active"><a href="#">Active Link</a></li>
                        <li class="nav-item"><a href="#">Link</a></li>
                        <li class="nav-item"><a href="#">Link</a></li>
                    </ul>
                </div>
            </div>
            {% highlight xml %}
                <div class="navbar">
                    <a href="#" class="navbar-brand">Brand</a>
                    <ul class="nav navbar-nav">
                        <li class="nav-item active"><a href="#">Active Link</a></li>
                        <li class="nav-item"><a href="#">Link</a></li>
                        <li class="nav-item"><a href="#">Link</a></li>
                    </ul>
                </div>
            {% endhighlight %}
        </section>

        <section id="component-form">
            {{ macros.docsSectionTitle( "Forms", "component-form", 4 ) }}
            <p>You may also put some inline form in your navbar.</p>

            <div class="example">
                <div class="navbar">
                    <form class="navbar-form">
                        <input type="search" class="input" placeholder="Search...">
                        <button class="btn btn-default">OK</button>
                    </form>
                </div>
            </div>
            {% highlight xml %}
                <div class="navbar">
                    <form class="navbar-form">
                        ...
                    </form>
                </div>
            {% endhighlight %}
        </section>

        <section id="component-text">
            {{ macros.docsSectionTitle( "Navbar Text", "component-text", 4 ) }}
            <p>
                If you want to put plain text inside your navbar, you can do so by wrapping it
                with a <code>.navbar-text</code> class, which will properly align your text.
            </p>

            <div class="example">
                <div class="navbar">
                    <a href="#" class="navbar-brand">Brand</a>
                    <p class="navbar-text pull-end">Signed in as Whachacha</p>
                </div>
            </div>
            {% highlight xml %}
                <div class="navbar">
                    <a href="#" class="navbar-brand">Brand</a>
                    <p class="navbar-text pull-end">...</p>
                </div>
            {% endhighlight %}
        </section>

        <section id="component-links">
            {{ macros.docsSectionTitle( "Non-nav Links", "component-links", 4 ) }}
            <p>
                It's also possible to make non-nav links inherit the proper styles from the navbar component.
                All you have to do is put your links the <code>.navbar-link</code> link.
            </p>

            <div class="example">
                <div class="navbar">
                    <a href="#" class="navbar-brand">Brand</a>
                    <p class="navbar-text pull-end">Signed in as <a href="#" class="navbar-link">Whachacha</a></p>
                </div>
            </div>
            {% highlight xml %}
                <p class="navbar-text pull-end">Signed in as <a href="#" class="navbar-link">Whachacha</a></p>
            {% endhighlight %}
        </section>
    </section>
{% endblock %}