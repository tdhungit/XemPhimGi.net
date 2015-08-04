<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    {{ get_title() }}
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <meta name="layout" content="main"/>

    <script type="text/javascript" src="http://www.google.com/jsapi"></script>
    <script>
        var base_url = '{{ url() }}';
    </script>
    <script src="{{ static_url() }}/themes/backend/js/jquery/jquery-1.8.2.min.js" type="text/javascript" ></script>
    <script src="{{ static_url() }}/themes/backend/js/systemJs.js" type="text/javascript" ></script>

    <link href="{{ static_url() }}/themes/backend/css/bootstrap-dialog.min.css" type="text/css" media="screen, projection" rel="stylesheet" />
    <link href="{{ static_url() }}/themes/backend/css/customize-template.css" type="text/css" media="screen, projection" rel="stylesheet" />
</head>

<body>

<div id="body-container">
    <div id="body-content">
        {{ get_content() }}
    </div>
</div>

<script src="{{ static_url() }}/themes/backend/js/bootstrap/bootstrap-transition.js" type="text/javascript" ></script>
<script src="{{ static_url() }}/themes/backend/js/bootstrap/bootstrap-alert.js" type="text/javascript" ></script>
<script src="{{ static_url() }}/themes/backend/js/bootstrap/bootstrap-modal.js" type="text/javascript" ></script>
<script src="{{ static_url() }}/themes/backend/js/bootstrap/bootstrap-dropdown.js" type="text/javascript" ></script>
<script src="{{ static_url() }}/themes/backend/js/bootstrap/bootstrap-scrollspy.js" type="text/javascript" ></script>
<script src="{{ static_url() }}/themes/backend/js/bootstrap/bootstrap-tab.js" type="text/javascript" ></script>
<script src="{{ static_url() }}/themes/backend/js/bootstrap/bootstrap-tooltip.js" type="text/javascript" ></script>
<script src="{{ static_url() }}/themes/backend/js/bootstrap/bootstrap-popover.js" type="text/javascript" ></script>
<script src="{{ static_url() }}/themes/backend/js/bootstrap/bootstrap-button.js" type="text/javascript" ></script>
<script src="{{ static_url() }}/themes/backend/js/bootstrap/bootstrap-collapse.js" type="text/javascript" ></script>
<script src="{{ static_url() }}/themes/backend/js/bootstrap/bootstrap-carousel.js" type="text/javascript" ></script>
<script src="{{ static_url() }}/themes/backend/js/bootstrap/bootstrap-typeahead.js" type="text/javascript" ></script>
<script src="{{ static_url() }}/themes/backend/js/bootstrap/bootstrap-affix.js" type="text/javascript" ></script>
<script src="{{ static_url() }}/themes/backend/js/bootstrap/bootstrap-datepicker.js" type="text/javascript" ></script>
<script src="{{ static_url() }}/themes/backend/js/bootstrap/bootstrap-dialog.min.js" type="text/javascript" ></script>
<script src="{{ static_url() }}/themes/backend/js/jquery/jquery-tablesorter.js" type="text/javascript" ></script>
<script src="{{ static_url() }}/themes/backend/js/jquery/jquery-chosen.js" type="text/javascript" ></script>
<script src="{{ static_url() }}/themes/backend/js/jquery/virtual-tour.js" type="text/javascript" ></script>
</body>
</html>