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
		        <h1>roice krueger</h1>
		    </div>
		    <ul class="clearfix">
		        <li><a href="" data-nav="read">Read</a></li>
		        <li><a href="" data-nav="watch">Watch</a></li>
		        <li><a href="" data-nav="listen">Listen</a></li>
		        <li><a href="" data-nav="leadership">Leadership</a></li>
		        <li><a href="" data-nav="self">Self Development</a></li>
		        <li><a href="" data-nav="org">Organization</a></li>
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
		</nav>
	</div>
	<?php if ( have_posts() ) while ( have_posts() ) : the_post(); ?>
	<h2><?php the_title(); ?></h2>
	<?php the_content(); ?>
	<?php comments_template( '', true ); ?>
	<?php endwhile; ?>
</div>
<?php Starkers_Utilities::get_template_parts( array( 'parts/shared/footer','parts/shared/html-footer' ) ); ?>