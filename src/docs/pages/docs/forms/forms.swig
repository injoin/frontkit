{% extends "../../../layout/docs.swig" %}
{% set docs = "forms" %}

{% block content %}
    <header class="page-header">
        <h2>Forms</h2>
    </header>
    <p class="lead">Forms are collections of user input controls.</p>

    <section id="default">
        {{ macros.docsSectionTitle( "Default Example", "default", 3 ) }}
        <p>Below is a very simple, yet very common, form example: a login page.</p>

        <div class="example">
            <form method="post" action="#">
                <fieldset>
                    <legend>Administration</legend>

                    <div class="form-group">
                        <label for="login-username">Username:</label>
                        <input type="text" id="login-username" class="input" placeholder="Type your username...">
                    </div>

                    <div class="form-group">
                        <label for="login-password">Password:</label>
                        <input type="password" id="login-password" class="input" placeholder="Type your password...">
                        <p class="form-help-block">
                            <a href="#">Forgot your password?</a>
                        </p>
                    </div>

                    <div class="form-group">
                        <label class="form-checkbox">
                            <input type="checkbox" checkbox>
                            Remember me
                        </label>
                    </div>

                    <button type="submit" class="btn btn-primary">Login</button>
                </fieldset>
            </form>
        </div>
        {% highlight xml %}
            <form method="post" action="#">
                <fieldset>
                    <legend>Administration</legend>

                    <div class="form-group">
                        <label for="login-username">Username:</label>
                        <input type="text" id="login-username" class="input" placeholder="...">
                    </div>

                    <div class="form-group">
                        <label for="login-password">Password:</label>
                        <input type="password" id="login-password" class="input" placeholder="...">
                        <p class="form-help-block">
                            <a href="#">Forgot your password?</a>
                        </p>
                    </div>

                    <div class="form-group">
                        <label class="form-checkbox">
                            <input type="checkbox" checkbox>
                            Remember me
                        </label>
                    </div>

                    <button type="submit" class="btn btn-primary">Login</button>
                </fieldset>
            </form>
        {% endhighlight %}
    </section>

    <section id="inline">
        {{ macros.docsSectionTitle( "Inline Form", "inline", 3 ) }}
        <p>
            Add <code>.form-inline</code> to inline all controls of a form. Note that this only applies when you
            have a 768px wide viewport.
        </p>

        <div class="example">
            <form action="#" class="form-inline">
                <div class="form-group">
                    <input type="text" class="input" placeholder="Username">
                </div>
                <div class="form-group">
                    <input type="password" class="input" placeholder="Password">
                </div>
                <button type="button" class="btn btn-primary">OK</button>
            </form>
        </div>
        {% highlight xml %}
            <form action="#" class="form-inline">
                <div class="form-group">
                    <input type="text" class="input" placeholder="Username">
                </div>
                <div class="form-group">
                    <input type="password" class="input" placeholder="Password">
                </div>
                <button type="button" class="btn btn-primary">OK</button>
            </form>
        {% endhighlight %}
    </section>
{% endblock %}