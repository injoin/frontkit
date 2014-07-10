{% extends "../../../layout/docs.swig" %}
{% set docs = "forms" %}

{% block content %}
    <header class="page-header">
        <h2>Forms</h2>
    </header>
    <p class="lead">Forms are collections of user input controls.</p>

    <section id="default">
        <h3 docs-heading="default">Default Example</h3>
        <p>Below is a very simple, yet very common, form example: a login page.</p>

        <div class="example">
            <form method="post" action="#">
                <fieldset>
                    <legend>Administration</legend>

                    <div class="form-group">
                        <label for="login-username1">Username:</label>
                        <input type="text" id="login-username1" class="input" placeholder="Type your username...">
                    </div>

                    <div class="form-group">
                        <label for="login-password1">Password:</label>
                        <input type="password" id="login-password1" class="input" placeholder="Type your password...">
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
                        <label for="login-username1">Username:</label>
                        <input type="text" id="login-username1" class="input" placeholder="...">
                    </div>

                    <div class="form-group">
                        <label for="login-password1">Password:</label>
                        <input type="password" id="login-password1" class="input" placeholder="...">
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
        <h3 docs-heading="inline">Inline Form</h3>
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

    <section id="horizontal">
        <h3 docs-heading="horizontal">Horizontal Form</h3>
        <p>
            When you need to align your forms horizontally, you can add a
            <code>.form-horizontal</code> to your form, and then use
            <a href="{{ macros.siteUrl( "docs/structure/grid" ) }}">Frontkit' grid classes</a> to
            change the width of labels and controls. Note that your <code>.form-group</code>s will
            behave as grid rows, so you don't need to add <code>.row</code> to them.
        </p>

        <div class="example">
            <form class="form-horizontal">
                <div class="form-group">
                    <label for="login-username2" class="column small-3-12">Username:</label>
                    <div class="column small-9-12">
                        <input type="text" id="login-username2" class="input"
                               placeholder="Type your username...">
                    </div>
                </div>

                <div class="form-group">
                    <label for="login-password2" class="column small-3-12">Password:</label>
                    <div class="column small-9-12">
                        <input type="password" id="login-password2" class="input"
                               placeholder="Type your password...">

                        <p class="form-help-block">
                            <a href="#">Forgot your password?</a>
                        </p>
                    </div>
                </div>

                <div class="form-group">
                    <div class="column small-9-12 small-offset-3-12">
                        <button type="button" class="btn btn-primary">Login</button>
                    </div>
                </div>
            </form>
        </div>
        {% highlight xml %}
            <form class="form-horizontal">
                <div class="form-group">
                    <label for="login-username2" class="column small-3-12">Username:</label>
                    <div class="column small-9-12">
                        <input type="text" id="login-username2" class="input"
                               placeholder="Type your username...">
                    </div>
                </div>

                <div class="form-group">
                    <label for="login-password2" class="column small-3-12">Password:</label>
                    <div class="column small-9-12">
                        <input type="password" id="login-password2" class="input"
                               placeholder="Type your password...">

                        <p class="form-help-block">
                            <a href="#">Forgot your password?</a>
                        </p>
                    </div>
                </div>

                <div class="form-group">
                    <div class="column small-9-12 small-offset-3-12">
                        <button type="button" class="btn btn-primary">Login</button>
                    </div>
                </div>
            </form>
        {% endhighlight %}
    </section>
{% endblock %}