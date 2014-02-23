{% extends "../../../layout//docs.swig" %}
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
                            Forgot your password?
                        </p>
                    </div>

                    <div class="form-group">
                        <label class="form-checkbox">
                            <input type="checkbox">
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
                        <input type="text" id="login-username" class="input" placeholder="Type your username...">
                    </div>

                    <div class="form-group">
                        <label for="login-password">Password:</label>
                        <input type="password" id="login-password" class="input" placeholder="Type your password...">
                    </div>

                    <div class="form-group">
                        <label class="form-checkbox">
                            <input type="checkbox">
                            Remember me
                        </label>
                    </div>

                    <button type="submit" class="btn btn-primary">Login</button>
                </fieldset>
            </form>
        {% endhighlight %}
    </section>
{% endblock %}