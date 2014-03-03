{% extends "../../../layout/docs.swig" %}
{% set docs = "tables" %}

{% block content %}
    <header class="page-header">
        <h2>Tables</h2>
    </header>

    <section id="basic">
        {{ macros.docsSectionTitle( "Basic Table", "basic", 3 ) }}
        <p>
            A very simple and efficient table style.
            Just add the base class <code>.table</code> to any table, and you're done.<br>
            If this class name sounds redundant to you: we decided on it because the amounts of
            3rd parties that make use of table elements (like datepickers/calendars, etc).
        </p>

        <div class="example">
            <table class="table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Name</th>
                        <th>Login</th>
                        <th>Score</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>John Doe</td>
                        <td>john.doe</td>
                        <td>29</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>Chuck Testa</td>
                        <td>chuck.testa</td>
                        <td>38</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>Chuck Norris</td>
                        <td>chuck.norris</td>
                        <td>59</td>
                    </tr>
                </tbody>
            </table>
        </div>
        {% highlight xml %}
            <table class="table">
                ...
            </table>
        {% endhighlight %}
    </section>

    <section id="striped">
        {{ macros.docsSectionTitle( "Striped Rows", "striped", 3 ) }}
        <p>
            To give zebra-striping to any table, simply add the <code>.table-striped</code> class.
            Note that this will only affect rows within an <code>&lt;tbody&gt;</code>.
        </p>

        <div class="example">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Name</th>
                        <th>Login</th>
                        <th>Score</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>John Doe</td>
                        <td>john.doe</td>
                        <td>29</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>Chuck Testa</td>
                        <td>chuck.testa</td>
                        <td>38</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>Chuck Norris</td>
                        <td>chuck.norris</td>
                        <td>59</td>
                    </tr>
                </tbody>
            </table>
        </div>
        {% highlight xml %}
            <table class="table table-striped">
                ...
            </table>
        {% endhighlight %}
    </section>

    <section id="bordered">
        {{ macros.docsSectionTitle( "Bordered Table", "bordered", 3 ) }}
        <p>
            A table can have all borders highlighted.
            Do to that, just add the <code>.table-bordered</code> class.
        </p>

        <div class="example">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Name</th>
                        <th>Login</th>
                        <th>Score</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>John Doe</td>
                        <td>john.doe</td>
                        <td>29</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>Chuck Testa</td>
                        <td>chuck.testa</td>
                        <td>38</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>Chuck Norris</td>
                        <td>chuck.norris</td>
                        <td>59</td>
                    </tr>
                </tbody>
            </table>
        </div>
        {% highlight xml %}
            <table class="table table-bordered">
                ...
            </table>
        {% endhighlight %}
    </section>

    <section id="hover">
        {{ macros.docsSectionTitle( "Hover State", "hover", 3 ) }}
        <p>
            You're able to show a hover state on table rows within a <code>&lt;tbody&gt;</code> -
            just add the <code>.table-hover</code> class.
        </p>

        <div class="example">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Name</th>
                        <th>Login</th>
                        <th>Score</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>John Doe</td>
                        <td>john.doe</td>
                        <td>29</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>Chuck Testa</td>
                        <td>chuck.testa</td>
                        <td>38</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>Chuck Norris</td>
                        <td>chuck.norris</td>
                        <td>59</td>
                    </tr>
                </tbody>
            </table>
        </div>
        {% highlight xml %}
            <table class="table table-hover">
                ...
            </table>
        {% endhighlight %}
    </section>

    <section id="contextual">
        {{ macros.docsSectionTitle( "Contextual classes", "contextual", 3 ) }}
        <p>You are able to give rows and cells different colors by applying contextual classes.</p>

        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Class</th>
                    <th>Description</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><code>.active</code></td>
                    <td>Applies the hover color to a particular row or cell</td>
                </tr>
                <tr>
                    <td><code>.success</code></td>
                    <td>Indicates a successful action</td>
                </tr>
                <tr>
                    <td><code>.warning</code></td>
                    <td>Indicates a warning for a row or cell</td>
                </tr>
                <tr>
                    <td><code>.danger</code></td>
                    <td>Indicates a potentialy dangerous action</td>
                </tr>
                <tr>
                    <td><code>.info</code></td>
                    <td>Indicates a informational change or action</td>
                </tr>
            </tbody>
        </table>

        <div class="example">
            <table class="table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Column 1</th>
                        <th>Column 2</th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="active">
                        <td>1</td>
                        <td>Lorem ipsum</td>
                        <td>dolor sit amet</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>Lorem ipsum</td>
                        <td>dolor sit amet</td>
                    </tr>
                    <tr class="success">
                        <td>3</td>
                        <td>Lorem ipsum</td>
                        <td>dolor sit amet</td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td>Lorem ipsum</td>
                        <td>dolor sit amet</td>
                    </tr>
                    <tr class="danger">
                        <td>5</td>
                        <td>Lorem ipsum</td>
                        <td>dolor sit amet</td>
                    </tr>
                    <tr>
                        <td>6</td>
                        <td>Lorem ipsum</td>
                        <td>dolor sit amet</td>
                    </tr>
                    <tr class="warning">
                        <td>7</td>
                        <td>Lorem ipsum</td>
                        <td>dolor sit amet</td>
                    </tr>
                    <tr>
                        <td>8</td>
                        <td>Lorem ipsum</td>
                        <td>dolor sit amet</td>
                    </tr>
                    <tr class="info">
                        <td>9</td>
                        <td>Lorem ipsum</td>
                        <td>dolor sit amet</td>
                    </tr>
                </tbody>
            </table>
        </div>
        {% highlight xml %}
            <!-- On rows -->
            <tr class="active">...</tr>
            <tr class="success">...</tr>
            <tr class="warning">...</tr>
            <tr class="danger">...</tr>
            <tr class="info">...</tr>
        
            <!-- On cells - both td and th -->
            <tr>
                <td class="active">...</td>
                <td class="success">...</td>
                <td class="warning">...</td>
                <td class="danger">...</td>
                <td class="info">...</td>
            </tr>
        {% endhighlight %}
    </section>

    <section id="responsive">
        {{ macros.docsSectionTitle( "Responsive Tables", "responsive", 3 ) }}
        <p>
            Make big tables scroll in small devices (&lt; 960px) by wrapping them in a element with
            the <code>.table-responsive</code> class.
        </p>

        <div class="example">
            <div class="table-responsive">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Column Heading</th>
                            <th>Column Heading</th>
                            <th>Column Heading</th>
                            <th>Column Heading</th>
                            <th>Column Heading</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>Cell Content</td>
                            <td>Cell Content</td>
                            <td>Cell Content</td>
                            <td>Cell Content</td>
                            <td>Cell Content</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>Cell Content</td>
                            <td>Cell Content</td>
                            <td>Cell Content</td>
                            <td>Cell Content</td>
                            <td>Cell Content</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>Cell Content</td>
                            <td>Cell Content</td>
                            <td>Cell Content</td>
                            <td>Cell Content</td>
                            <td>Cell Content</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        {% highlight xml %}
            <div class="table-responsive">
                <table class="table">
                    ...
                </table>
            </div>
        {% endhighlight %}
    </section>
{% endblock %}