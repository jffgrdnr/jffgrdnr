<?php
/*
 Template Name: Home
 *
 * @package 	WordPress
 * @subpackage 	Starkers
 * @since 		Starkers 4.0
 */
?>
<?php
/**
 * The template for displaying all pages.
 *
 * This is the template that displays all pages by default.
 * Please note that this is the WordPress construct of pages
 * and that other 'pages' on your WordPress site will use a
 * different template.
 *
 * Please see /external/starkers-utilities.php for info on Starkers_Utilities::get_template_parts()
 *
 * @package 	WordPress
 * @subpackage 	Starkers
 * @since 		Starkers 4.0
 */
?>
<?php Starkers_Utilities::get_template_parts( array( 'parts/shared/html-header') ); ?>
<div id="mainWrapper">
	<div id="navWrapper">
		<nav id="mainNav">
		    <div id="logo">
		        <h1><a href="/">roice krueger</a></h1>
		    </div>
		    <ul id="desktopNav" class="clearfix">
		        <li class="main"><a href="/Read" data-nav="read">Read</a></li>
		        <li class="main"><a href="/Watch" data-nav="watch">Watch</a></li>
		        <li class="main"><a href="/Listen" data-nav="listen">Listen</a></li>
		        <li class="main"><a href="/Leadership" data-nav="leadership">Leadership</a></li>
		        <li class="main"><a href="/Self-Development" data-nav="self">Self Development</a></li>
		        <li class="main"><a href="/Organization" data-nav="org">Organization</a></li>
		        <menu id="mainMenu">
			        <ul data-nav="read">
			            <li>
			            	<h3>Title1</h3>
							<p>Content goes here</p>
			            </li>
			            <li>
			            	<h3>Title1</h3>
							<p>Content goes here</p>
			            </li>
			            <li>
			            	<h3>Title1</h3>
							<p>Content goes here</p>
			            </li>
			            <li>
			            	<h3>Title1</h3>
							<p>Content goes here</p>
			            </li>
			        </ul>
			        <ul data-nav="watch">
			            <li>
			            	<h3>Title2</h3>
							<p>Content goes here</p>
			            </li>
			            <li>
			            	<h3>Title2</h3>
							<p>Content goes here</p>
			            </li>
			            <li>
			            	<h3>Title2</h3>
							<p>Content goes here</p>
			            </li>
			            <li>
			            	<h3>Title2</h3>
							<p>Content goes here</p>
			            </li>
			        </ul>
			        <ul data-nav="listen">
			            <li>
			            	<h3>Title3</h3>
							<p>Content goes here</p>
			            </li>
			            <li>
			            	<h3>Title3</h3>
							<p>Content goes here</p>
			            </li>
			            <li>
			            	<h3>Title3</h3>
							<p>Content goes here</p>
			            </li>
			            <li>
			            	<h3>Title3</h3>
							<p>Content goes here</p>
			            </li>
			        </ul>
			        <ul data-nav="leadership">
			            <li>
			            	<h3>Title4</h3>
							<p>Content goes here</p>
			            </li>
			            <li>
			            	<h3>Title4</h3>
							<p>Content goes here</p>
			            </li>
			            <li>
			            	<h3>Title4</h3>
							<p>Content goes here</p>
			            </li>
			            <li>
			            	<h3>Title4</h3>
							<p>Content goes here</p>
			            </li>
			        </ul>
			        <ul data-nav="self">
			            <li>
			            	<h3>Title5</h3>
							<p>Content goes here</p>
			            </li>
			            <li>
			            	<h3>Title5</h3>
							<p>Content goes here</p>
			            </li>
			            <li>
			            	<h3>Title5</h3>
							<p>Content goes here</p>
			            </li>
			            <li>
			            	<h3>Title5</h3>
							<p>Content goes here</p>
			            </li>
			        </ul>
			        <ul data-nav="org">
			            <li>
			            	<h3>Title6</h3>
							<p>Content goes here</p>
			            </li>
			            <li>
			            	<h3>Title6</h3>
							<p>Content goes here</p>
			            </li>
			            <li>
			            	<h3>Title6</h3>
							<p>Content goes here</p>
			            </li>
			            <li>
			            	<h3>Title6</h3>
							<p>Content goes here</p>
			            </li>
			        </ul>
			    </menu>
		    </ul>
		    <div id="mobileNav">
		    	<i class="fa fa-list drawer"></i>
		    	<ul>
		    		<li><a href="/Read">Read</a></li>
		    		<li><a href="/Watch">Watch</a></li>
		    		<li><a href="/Listen">Listen</a></li>
		    		<li><a href="/Leadership">Leadership</a></li>
		    		<li><a href="/Self-Development">Self Development</a></li>
		    		<li><a href="/Organization">Organization</a></li>
		    	</ul>
		    </div>
		</nav>
	</div>
	<section id="mainContent">
		<section class="center">
			<!-- <img src="<?php echo get_stylesheet_directory_uri(); ?>/img/banner.png" alt="" class="center"> -->
			<img src="<?php echo get_stylesheet_directory_uri(); ?>/img/bryce.jpg" alt="" class="center">
		</section>
	</section>
</div>
<?php Starkers_Utilities::get_template_parts( array( 'parts/shared/footer','parts/shared/html-footer' ) ); ?>