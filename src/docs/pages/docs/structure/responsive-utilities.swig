{% extends "../../../layout/docs.swig" %}
{% set docs = "responsive-utilities" %}

{% block content %}
    <h2>Responsive Utilities</h2>
    <p class="lead">
        Frontkit provides you a lot of powerful classes to deal with eventual differences between
        screen sizes.
    </p>

    <section id="visibility">
        {{ macros.docsSectionTitle( "Visibility", "visibility", 3 ) }}
        <p>
            You can show or hide a element depending on the screen size in a ton of ways.
            Check both tables below to discover how you can do this.
        </p>

        <section id="visibility-visible">
            {{ macros.docsSectionTitle( "Visible by size", "visibility-visible", 4 ) }}
            <p>
                The below table shows classes that are used to make elements visible depending on
                the screen size.
            </p>

            <div class="table-responsive">
                <table class="table table-bordered text-center">
                    <colgroup>
                        <col class="small-2-12">
                        <col class="small-2-12">
                        <col class="small-2-12">
                        <col class="small-2-12">
                        <col class="small-2-12">
                        <col class="small-2-12">
                    </colgroup>
                    <thead>
                        <tr>
                            <th>Class</th>
                            <th>
                                Tiny<br>
                                <small>< 768px</small>
                            </th>
                            <th>
                                Small<br>
                                <small>≥ 768px</small>
                            </th>
                            <th>
                                Medium<br>
                                <small>≥ 980px</small>
                            </th>
                            <th>
                                Large<br>
                                <small>≥ 1200px</small>
                            </th>
                            <th>
                                X-Large<br>
                                <small>≥ 1600px</small>
                            </th>
                        </tr>
                    </thead>

                    <!-- .show-* classes -->
                    <tbody>
                        <tr>
                            <td class="text-right"><code>.show-tiny</code></td>
                            <td class="success">✔</td>
                            <td class="danger">✘</td>
                            <td class="danger">✘</td>
                            <td class="danger">✘</td>
                            <td class="danger">✘</td>
                        </tr>
                        <tr>
                            <td class="text-right"><code>.show-small</code></td>
                            <td class="danger">✘</td>
                            <td class="success">✔</td>
                            <td class="danger">✘</td>
                            <td class="danger">✘</td>
                            <td class="danger">✘</td>
                        </tr>
                        <tr>
                            <td class="text-right"><code>.show-medium</code></td>
                            <td class="danger">✘</td>
                            <td class="danger">✘</td>
                            <td class="success">✔</td>
                            <td class="danger">✘</td>
                            <td class="danger">✘</td>
                        </tr>
                        <tr>
                            <td class="text-right"><code>.show-large</code></td>
                            <td class="danger">✘</td>
                            <td class="danger">✘</td>
                            <td class="danger">✘</td>
                            <td class="success">✔</td>
                            <td class="danger">✘</td>
                        </tr>
                        <tr>
                            <td class="text-right"><code>.show-xlarge</code></td>
                            <td class="danger">✘</td>
                            <td class="danger">✘</td>
                            <td class="danger">✘</td>
                            <td class="danger">✘</td>
                            <td class="success">✔</td>
                        </tr>
                    </tbody>

                    <!-- .show-*-above and .show-*-below classes -->
                    <tbody>
                        <tr>
                            <td class="text-right"><code>.show-medium-above</code></td>
                            <td class="danger">✘</td>
                            <td class="danger">✘</td>
                            <td class="success">✔</td>
                            <td class="success">✔</td>
                            <td class="success">✔</td>
                        </tr>
                        <tr>
                            <td class="text-right"><code>.show-large-above</code></td>
                            <td class="danger">✘</td>
                            <td class="danger">✘</td>
                            <td class="danger">✘</td>
                            <td class="success">✔</td>
                            <td class="success">✔</td>
                        </tr>
                        <tr>
                            <td class="text-right"><code>.show-small-below</code></td>
                            <td class="success">✔</td>
                            <td class="success">✔</td>
                            <td class="danger">✘</td>
                            <td class="danger">✘</td>
                            <td class="danger">✘</td>
                        </tr>
                        <tr>
                            <td class="text-right"><code>.show-medium-below</code></td>
                            <td class="success">✔</td>
                            <td class="success">✔</td>
                            <td class="success">✔</td>
                            <td class="danger">✘</td>
                            <td class="danger">✘</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>

        <section id="visibility-hidden">
            {{ macros.docsSectionTitle( "Hidden by size", "visibility-hidden", 4 ) }}
            <p>
                The below table shows classes that are used to make elements hidden depending on the
                screen size.
            </p>

            <div class="table-responsive">
                <table class="table table-bordered text-center">
                    <colgroup>
                        <col class="small-2-12">
                        <col class="small-2-12">
                        <col class="small-2-12">
                        <col class="small-2-12">
                        <col class="small-2-12">
                        <col class="small-2-12">
                    </colgroup>
                    <thead>
                        <tr>
                            <th>Class</th>
                            <th>
                                Tiny<br>
                                <small>< 768px</small>
                            </th>
                            <th>
                                Small<br>
                                <small>≥ 768px</small>
                            </th>
                            <th>
                                Medium<br>
                                <small>≥ 980px</small>
                            </th>
                            <th>
                                Large<br>
                                <small>≥ 1200px</small>
                            </th>
                            <th>
                                X-Large<br>
                                <small>≥ 1600px</small>
                            </th>
                        </tr>
                    </thead>

                    <!-- .hide-* clsases -->
                    <tbody>
                    <tr>
                        <td class="text-right"><code>.hide-tiny</code></td>
                        <td class="danger">✘</td>
                        <td class="success">✔</td>
                        <td class="success">✔</td>
                        <td class="success">✔</td>
                        <td class="success">✔</td>
                    </tr>
                    <tr>
                        <td class="text-right"><code>.hide-small</code></td>
                        <td class="success">✔</td>
                        <td class="danger">✘</td>
                        <td class="success">✔</td>
                        <td class="success">✔</td>
                        <td class="success">✔</td>
                    </tr>
                    <tr>
                        <td class="text-right"><code>.hide-medium</code></td>
                        <td class="success">✔</td>
                        <td class="success">✔</td>
                        <td class="danger">✘</td>
                        <td class="success">✔</td>
                        <td class="success">✔</td>
                    </tr>
                    <tr>
                        <td class="text-right"><code>.hide-large</code></td>
                        <td class="success">✔</td>
                        <td class="success">✔</td>
                        <td class="success">✔</td>
                        <td class="danger">✘</td>
                        <td class="success">✔</td>
                    </tr>
                    <tr>
                        <td class="text-right"><code>.hide-xlarge</code></td>
                        <td class="success">✔</td>
                        <td class="success">✔</td>
                        <td class="success">✔</td>
                        <td class="success">✔</td>
                        <td class="danger">✘</td>
                    </tr>
                    </tbody>



                    <!-- .hide-*-above and .hide-*-below classes -->
                    <tbody>
                        <tr>
                            <td class="text-right"><code>.hide-small-below</code></td>
                            <td class="danger">✘</td>
                            <td class="danger">✘</td>
                            <td class="success">✔</td>
                            <td class="success">✔</td>
                            <td class="success">✔</td>
                        </tr>
                        <tr>
                            <td class="text-right"><code>.hide-medium-below</code></td>
                            <td class="danger">✘</td>
                            <td class="danger">✘</td>
                            <td class="danger">✘</td>
                            <td class="success">✔</td>
                            <td class="success">✔</td>
                        </tr>
                        <tr>
                            <td class="text-right"><code>.hide-medium-above</code></td>
                            <td class="success">✔</td>
                            <td class="success">✔</td>
                            <td class="danger">✘</td>
                            <td class="danger">✘</td>
                            <td class="danger">✘</td>
                        </tr>
                        <tr>
                            <td class="text-right"><code>.hide-large-above</code></td>
                            <td class="success">✔</td>
                            <td class="success">✔</td>
                            <td class="success">✔</td>
                            <td class="danger">✘</td>
                            <td class="danger">✘</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>
    </section>

    <section id="orientation">
        {{ macros.docsSectionTitle( "Orientation", "orientation", 3 ) }}
        <p>
            A simple way to detect the orientation of your device. On mobile devices, the visibility
            of elements will automatically change whenever you rotate the device. On desktops, the
            orientation is almost always landscape.
        </p>

        <div class="example">
            <span class="show-landscape">You are in landscape orientation.</span>
            <span class="show-portrait">You are in portrait orientation.</span>
        </div>
        {% highlight xml %}
            <span class="show-landscape">You are in landscape orientation.</span>
            <span class="show-portrait">You are in portrait orientation.</span>
        {% endhighlight %}
    </section>
{% endblock %}