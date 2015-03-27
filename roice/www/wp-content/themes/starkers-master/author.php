<?php
/**
 * The template for displaying Author Archive pages
 *
 * Please see /external/starkers-utilities.php for info on Starkers_Utilities::get_template_parts()
 *
 * @package 	WordPress
 * @subpackage 	Starkers
 * @since 		Starkers 4.0
 */
?>
<?php Starkers_Utilities::get_template_parts( array( 'parts/shared/html-header', 'parts/shared/header' ) ); ?>
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
<?php if ( have_posts() ): the_post(); ?>

<h2>Author Archives: <?php echo get_the_author() ; ?></h2>

<?php if ( get_the_author_meta( 'description' ) ) : ?>
<?php echo get_avatar( get_the_author_meta( 'user_email' ) ); ?>
<h3>About <?php echo get_the_author() ; ?></h3>
<?php the_author_meta( 'description' ); ?>
<?php endif; ?>

<ol>
<?php rewind_posts(); while ( have_posts() ) : the_post(); ?>
	<li>
		<article>
			<h2><a href="<?php esc_url( the_permalink() ); ?>" title="Permalink to <?php the_title(); ?>" rel="bookmark"><?php the_title(); ?></a></h2>
			<time datetime="<?php the_time( 'Y-m-d' ); ?>" pubdate><?php the_date(); ?> <?php the_time(); ?></time> <?php comments_popup_link('Leave a Comment', '1 Comment', '% Comments'); ?>
			<?php the_content(); ?>
		</article>
	</li>
<?php endwhile; ?>
</ol>

<?php else: ?>
<h2>No posts to display for <?php echo get_the_author() ; ?></h2>	
<?php endif; ?>
</div>
<?php Starkers_Utilities::get_template_parts( array( 'parts/shared/footer','parts/shared/html-footer' ) ); ?>