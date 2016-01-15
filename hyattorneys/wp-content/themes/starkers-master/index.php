<?php
/**
 * The main template file
 * This is the most generic template file in a WordPress theme
 * and one of the two required files for a theme (the other being style.css).
 * It is used to display a page when nothing more specific matches a query.
 * E.g., it puts together the home page when no home.php file 
 *
 * Please see /external/starkers-utilities.php for info on Starkers_Utilities::get_template_parts()
 *
 * @package 	WordPress
 * @subpackage 	Starkers
 * @since 		Starkers 4.0
 */
?>
<?php Starkers_Utilities::get_template_parts( array( 'parts/shared/html-header' ) ); ?>
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
    <div class="content card">
        <p>At the law firm of High & Younes, LLC., attorneys Justin High & Frank Younes, along with their staff, take the time necessary to develop a real attorney - client relationship.  We believe it is important to listen to each client and relate to their needs so that we can best understand them and act in a manner that best represents each individual’s needs.  We are a general practice firm located in the heart of Omaha, Nebraska specializing in the areas of Workers’ Compensation, Personal Injury, and Family Law.  We pride ourselves in handling cases in an aggressive and ethical manner to provide our clients with the best result and experience possible in each circumstance. </p>
        <p>The attorneys at High & Younes, LLC., will go the extra mile for each client regardless of whether they are dealing with a work injury, car accident, slip and fall, divorce, family law, or child support matter.  For each client all of these situations are extremely important and potentially life change, and that is the way that we treat them.</p>
        <div class="rotators clearfix">
            <div class="card">test 1</div>
            <div class="card">test 2</div>
            <div class="card">test 3</div>
        </div>
    </div>
</section>
<?php Starkers_Utilities::get_template_parts( array( 'parts/shared/html-footer') ); ?>