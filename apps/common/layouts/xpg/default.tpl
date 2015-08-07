<!DOCTYPE html>
<html lang="vi" class="app" xmlns="http://www.w3.org/1999/xhtml" xmlns:og="http://ogp.me/ns#" xmlns:fb="http://www.facebook.com/2008/fbml" itemscope="itemscope" itemtype="http://schema.org/NewsArticle">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="utf-8" />
    <title>Xem Phim Gì</title>
    <meta name="description" content="app, web app, responsive, admin dashboard, admin, flat, flat ui, ui kit, off screen nav"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
    <link rel="stylesheet" href="{{ static_url(theme_uri) }}css/bootstrap.css" type="text/css"/>
    <link rel="stylesheet" href="{{ static_url(theme_uri) }}css/animate.css" type="text/css"/>
    <link rel="stylesheet" href="{{ static_url(theme_uri) }}css/font-awesome.min.css" type="text/css"/>
    <link rel="stylesheet" href="{{ static_url(theme_uri) }}css/simple-line-icons.css" type="text/css"/>
    <link rel="stylesheet" href="{{ static_url(theme_uri) }}css/font.css" type="text/css"/>
    <link rel="stylesheet" href="{{ static_url(theme_uri) }}css/app.css" type="text/css"/>
    <!--[if lt IE 9]>
    <script src="{{ static_url(theme_uri) }}js/ie/html5shiv.js"></script>
    <script src="{{ static_url(theme_uri) }}js/ie/respond.min.js"></script>
    <script src="{{ static_url(theme_uri) }}js/ie/excanvas.js"></script>
    <![endif]-->
    <script>
        var base_url = '{{ url() }}';
    </script>
</head>
<body class="">
<section class="vbox">
    <header class="bg-white-only header header-md navbar navbar-fixed-top-xs">
        <div class="navbar-header aside-md bg-info dk">
            <a class="btn btn-link visible-xs" data-toggle="class:nav-off-screen,open" data-target="#nav,html">
                <i class="icon-list"></i>
            </a>
            <a href="{{ url() }}" class="navbar-brand text-lt">
                <i class="icon-earphones"></i>
                <img src="{{ static_url(theme_uri) }}images/logo.png" alt="." class="hide">
                <span class="hidden-nav-xs m-l-sm">XPG</span>
            </a>
            <a class="btn btn-link visible-xs" data-toggle="dropdown" data-target=".user">
                <i class="icon-settings"></i>
            </a>
        </div>
        <ul class="nav navbar-nav hidden-xs">
            <li>
                <a href="#nav,.navbar-header" data-toggle="class:nav-xs,nav-xs" class="text-muted">
                    <i class="fa fa-indent text"></i>
                    <i class="fa fa-dedent text-active"></i>
                </a>
            </li>
        </ul>
        <form action="{{ url('/') }}" method="get" class="navbar-form navbar-left input-s-lg m-t m-l-n-xs hidden-xs" role="search" style="min-width: 400px;">
            <div class="form-group">
                <div class="input-group">
                    <span class="input-group-btn">
                        <button type="submit" class="btn btn-sm bg-white btn-icon rounded"><i class="fa fa-search"></i></button>
                    </span>
                    <input type="text" name="q" class="form-control input-sm no-border rounded" placeholder="Videos ...">
                </div>
            </div>
        </form>
    </header>
    <section>
        <section class="hbox stretch">
            <!-- .aside -->
            <aside class="bg-black dk aside-md hidden-print" id="nav">
                <section class="vbox">
                    <section class="w-f-md scrollable">
                        <div class="slim-scroll" data-height="auto" data-disable-fade-out="true" data-distance="0"
                             data-size="10px" data-railOpacity="0.2">

                            <!-- nav -->
                            <nav class="nav-primary hidden-xs">
                                <ul class="nav" data-ride="collapse" id="xpg-movies-categories"></ul>
                            </nav>
                            <!-- / nav -->
                        </div>
                    </section>
                </section>
            </aside>
            <!-- /.aside -->
            <section id="content">
                {{ get_content() }}
                <a href="#" class="hide nav-off-screen-block" data-toggle="class:nav-off-screen,open" data-target="#nav,html"></a>
            </section>
        </section>
    </section>
</section>
<script src="{{ static_url(theme_uri) }}js/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="{{ static_url(theme_uri) }}js/bootstrap.js"></script>
<!-- App -->
<script src="{{ static_url(theme_uri) }}js/app.js"></script>
<script src="{{ static_url(theme_uri) }}js/slimscroll/jquery.slimscroll.min.js"></script>
<script src="{{ static_url(theme_uri) }}js/app.plugin.js"></script>
<!-- video player -->
<link href="http://vjs.zencdn.net/4.12/video-js.css" rel="stylesheet">
<link rel="stylesheet" href="{{ static_url(theme_uri) }}css/player.css" type="text/css"/>
<script src="http://vjs.zencdn.net/4.12/video.js"></script>
<!-- end video player -->
</body>
</html>