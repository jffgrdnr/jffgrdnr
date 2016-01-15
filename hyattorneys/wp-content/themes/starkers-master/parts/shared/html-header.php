<!doctype html>
<html>
<head>
	<meta charset="utf-8">
    <title><?php bloginfo( 'name' ); ?><?php wp_title( '|' ); ?></title>
    <!-- Head content from header section -->
    <!--[if IE 7]><script>document.documentElement.className += " ie ie7";</script><![endif]-->
    <!--[if IE 8]><script>document.documentElement.className += " ie ie8";</script><![endif]-->
    <!--[if IE 9]><script>document.documentElement.className += " ie ie9";</script><![endif]-->
	<meta charset="<?php bloginfo( 'charset' ); ?>" />
  	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="pingback" href="<?php bloginfo( 'pingback_url' ); ?>" />
	<link rel="shortcut icon" href="<?php echo get_stylesheet_directory_uri(); ?>/img/favicon.ico"/>
	<?php wp_head(); ?>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content=" " />
    <link rel="canonical" href="" />
    <script>
    var isTouchDevice = 'ontouchstart' in window || (window.DocumentTouch && document instanceof DocumentTouch);
    document.documentElement.className += (isTouchDevice ? ' touch' : ' noTouch');
    </script>
    <link rel="shortcut icon" href="http://hyattorneys.com/wp-content/themes/HyllcTheme/favicon.ico" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
    <link href='http://fonts.googleapis.com/css?family=Cantarell:400,700' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,900,300italic,400italic' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Abel' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Neuton:300,400' rel='stylesheet' type='text/css'>
    <!--[if lte IE 9]><script src="http://c.mfcreative.com/js/html5shiv.js"></script><![endif]-->
</head>
<body class="<?php global $post;
$pagename = $post->post_name;
echo '' . $pagename;?>">
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.4";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
<div class="wrapper godaddy">
    <nav id="mobileNav">
        <i class="fa fa-reorder" id="mobileTrigger"> <span>Menu</span></i>
        <ul>
            <li data-id="about-us">
                <a href="<?php get_site_url(); ?>/about-us/">About Us</a>
            </li>
            <li data-id="areas-of-practice" class="parent">
                <a href="javascript:void(0);" class="parent">Areas of Practice</a>
                <ul class="extend">
                    <li>
                        <a href="<?php get_site_url(); ?>/catastrophic-injury/">Catastrophic Injury</a>
                    </li>
                    <li>
                        <a href="<?php get_site_url(); ?>/workers-compensation/">Workers Compensation</a>
                    </li>
                    <li>
                        <a href="<?php get_site_url(); ?>/family-law/">Family Law / Divorce</a>
                    </li>
                    <li>
                        <a href="<?php get_site_url(); ?>/wrongful-death/">Wrongful Death</a>
                    </li>
                </ul>
            </li>
            <li data-id="attorneys" class="parent">
                <a href="javascript:void(0);" class="parent">Attorneys</a>
                <ul class="extend">
                    <li>
                        <a href="<?php get_site_url(); ?>/justin-high/">Justin High</a>
                    </li>
                    <li>
                        <a href="<?php get_site_url(); ?>/frank-younes/">Frank Younes</a>
                    </li>
                </ul>
            </li>
            <li data-id="why-we-win">
                <a href="<?php get_site_url(); ?>/why-we-win/">Why We Win</a>
            </li>
            <li data-id="verdicts-and-results">
                <a href="<?php get_site_url(); ?>/verdicts-and-results/">Verdicts &amp; Results</a>
            </li>
            <li data-id="hy-news">
                <a href="<?php get_site_url(); ?>/hy-news/">HY News</a>
            </li>
            <li data-id="testimonials">
                <a href="<?php get_site_url(); ?>/testimonials/">Testimonials</a>
            </li>
            <li data-id="contact-us">
                <a href="<?php get_site_url(); ?>/contact-us/">Contact Us</a>
            </li>
        </ul>
    </nav>
    <header id="mainHeader">
        <a href="<?php get_site_url(); ?>/"><img id="logo" src="<?php echo get_stylesheet_directory_uri(); ?>/img/logoMoved.png" /></a>
    </header>
    <nav id="mainNav" class="clearfix">
        <ul>
            <li data-id="about-us">
                <a href="<?php get_site_url(); ?>/about-us/">About Us</a>
            </li>
            <li data-id="areas-of-practice">
                <a href="<?php get_site_url(); ?>/areas-of-practice/" class="parent">Areas of Practice</a>
                <ul class="extend">
                    <li>
                        <a href="<?php get_site_url(); ?>/catastrophic-injury/">Catastrophic Injury</a>
                    </li>
                    <li>
                        <a href="<?php get_site_url(); ?>/workers-compensation/">Workers Compensation</a>
                    </li>
                    <li>
                        <a href="<?php get_site_url(); ?>/family-law/">Family Law / Divorce</a>
                    </li>
                    <li>
                        <a href="<?php get_site_url(); ?>/wrongful-death/">Wrongful Death</a>
                    </li>
                </ul>
            </li>
            <li data-id="attorneys">
                <a href="<?php get_site_url(); ?>/attorneys/" class="parent">Attorneys</a>
                <ul class="extend">
                    <li>
                        <a href="<?php get_site_url(); ?>/justin-high/">Justin High</a>
                    </li>
                    <li>
                        <a href="<?php get_site_url(); ?>/frank-younes/">Frank Younes</a>
                    </li>
                </ul>
            </li>
            <li data-id="why-we-win">
                <a href="<?php get_site_url(); ?>/why-we-win/">Why We Win</a>
            </li>
            <li data-id="verdicts-and-results">
                <a href="<?php get_site_url(); ?>/verdicts-and-results/">Verdicts &amp; Results</a>
            </li>
            <li data-id="hy-news">
                <a href="<?php get_site_url(); ?>/hy-news/">HY News</a>
            </li>
            <li data-id="testimonials">
                <a href="<?php get_site_url(); ?>/testimonials/">Testimonials</a>
            </li>
            <li data-id="contact-us">
                <a href="<?php get_site_url(); ?>/contact-us/">Contact Us</a>
            </li>
        </ul>
    </nav>
