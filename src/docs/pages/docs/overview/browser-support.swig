{% extends "../../../layout/docs.swig" %}
{% set docs = "browser-support" %}

{% block content %}
    <h2>Browser and Device Support</h2>
    <p class="lead">
        Frontkit support a wide range of browsers, but obviously we have some limitations.<br>
        You can check this page to see the supported browsers, their version and the OS.
    </p>

    <section id="supported-browsers">
        {{ macros.docsSectionTitle( "Supported Browsers", "supported-browsers", 3 ) }}
        <p>
            We support the last 2 versions of each browser below. However, for Internet Explorer,
            the support is wider: from version 9 and up. This is due to the still high percentage
            of IE9 users compared to the other versions.
        </p>

        <table class="table table-bordered">
            <thead>
                <tr>
                    <th></th>
                    <th>Chrome</th>
                    <th>Firefox</th>
                    <th>Internet Explorer</th>
                    <th>Safari</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th>Android</th>
                    <td class="success">✔</td>
                    <td class="success">✔</td>
                    <td rowspan="4">N/A</td>
                    <td>N/A</td>
                </tr>
                <tr>
                    <th>iOS</th>
                    <td class="success">✔</td>
                    <td>N/A</td>
                    <td class="success">✔</td>
                </tr>
                <tr>
                    <th>Linux</th>
                    <td class="success">✔</td>
                    <td class="success">✔</td>
                    <td>N/A</td>
                </tr>
                <tr>
                    <th>Mac OS X</th>
                    <td class="success">✔</td>
                    <td class="success">✔</td>
                    <td class="success">✔</td>
                </tr>
                <tr>
                    <th>Windows</th>
                    <td class="success">✔</td>
                    <td class="success">✔</td>
                    <td class="success">✔ - IE9+</td>
                    <td class="danger">✘</td>
                </tr>
            </tbody>
        </table>

        <p>
            Other browsers may work as well, however, we won't officially cover them.
        </p>
    </section>
{% endblock %}