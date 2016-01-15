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
<?php Starkers_Utilities::get_template_parts( array( 'parts/shared/html-header' ) ); ?>
<?php if ( is_page( 'home' ) ) {  ?>
	<main id="homePage">
	    <nav id="imageNav">
	        <ul class="clearfix">
	            <li data-id="about-us">
	                <a href="about-us/">
	                    <img src="<?php echo get_stylesheet_directory_uri(); ?>/img/aboutUs.jpg"/>
	                    <div class="mobileDesc">About Us</div>
	                </a>
	            </li>
	            <li data-id="areas-of-practice">
	                <a href="areas-of-practice/">
	                    <img src="<?php echo get_stylesheet_directory_uri(); ?>/img/areaOfPractice.jpg"/>
	                    <div class="mobileDesc">Areas of Practice</div>
	                </a>
	            </li>
	            <li data-id="attorneys">
	                <a href="attorneys/">
	                    <img src="<?php echo get_stylesheet_directory_uri(); ?>/img/attorneys.jpg"/>
	                    <div class="mobileDesc">Attorneys</div>
	                </a>
	            </li>
	            <li data-id="why-we-win">
	                <a href="why-we-win/">
	                    <img src="<?php echo get_stylesheet_directory_uri(); ?>/img/whyWeWin.jpg"/>
	                    <div class="mobileDesc">Why We Win</div>
	                </a>
	            </li>
	            <li data-id="verdicts-and-results">
	                <a href="verdicts-and-results/">
	                    <img src="<?php echo get_stylesheet_directory_uri(); ?>/img/verdicts.jpg"/>
	                    <div class="mobileDesc">Verdicts &amp; Results</div>
	                </a>
	            </li>
	            <li data-id="hy-news">
	                <a href="hy-news/">
	                    <img src="<?php echo get_stylesheet_directory_uri(); ?>/img/news.jpg"/>
	                    <div class="mobileDesc">HY News</div>
	                </a>
	            </li>
	            <li data-id="testimonials">
	                <a href="testimonials/">
	                    <img src="<?php echo get_stylesheet_directory_uri(); ?>/img/testimonials.jpg"/>
	                    <div class="mobileDesc">Testimonials</div>
	                </a>
	            </li>
	            <li data-id="contact-us">
	                <a href="contact-us/">
	                    <img src="<?php echo get_stylesheet_directory_uri(); ?>/img/contactUs.jpg"/>
	                    <div class="mobileDesc">Contact Us</div>
	                </a>
	            </li>
	        </ul>
	    </nav>
	</main>
	<section class="pageMain">
		<?php the_content(); ?>
	</section>
<?php } else { ?>
	<main class="pageMain">
		<h2 class="pageTitle"><?php the_title(); ?></h2>
		<div class="content clearfix">
			  <?php if ( have_posts() ) while ( have_posts() ) : the_post(); ?>
				<?php the_content(); ?>
				<?#php comments_template( '', true ); ?>
			<?php endwhile; ?>
		</div>
	</main>
<?php } ?>
<?php Starkers_Utilities::get_template_parts( array( 'parts/shared/html-footer' ) ); ?>