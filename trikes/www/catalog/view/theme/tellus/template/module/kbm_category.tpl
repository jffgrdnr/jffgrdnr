<?php echo $header; ?>
	<div class="container">
		<div class="row">
			<?php echo $column_left; ?>
			<?php if ($column_left && $column_right) { ?>
				<?php $class = 'col-md-6 col-lg-6'; ?>
			<?php } elseif ($column_left || $column_right) { ?>
				<?php $class = 'col-md-9 col-lg-9'; ?>
			<?php } else { ?>
				<?php $class = 'col-md-12 col-lg-12'; ?>
			<?php } ?>
			<div id="content" class="<?php echo $class; ?>">
				<?php echo $content_top; ?>
				<ul class="breadcrumb">
					<?php foreach ($breadcrumbs as $breadcrumb) { ?>
					<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
					<?php } ?>
				</ul>
        <div class="blog-header clearfix">
            <div class="page-heading page-heading--blog"><?php echo $category['name']; ?></div>
            <div class="image"><img src="<?php echo $category['image_thumb']; ?>" alt="<?php echo $category['name']; ?>" /></div>
            <?php if ($category['description']) { ?>
              <p class="blog-description"> <?php echo $category['description']; ?> </p>
            <?php } ?>
        </div>
				<?php if ($sub_categories) { ?>
					<div class="sub-categories">
						<h4><?php echo _t('text_sub_categories'); ?></h4>
						<ul>
							<?php foreach ($sub_categories as $sub_category) { ?>
								<li><a href="<?php echo $sub_category['link']; ?>"><?php echo $sub_category['name']; ?></a></li>
							<?php } ?>
						</ul>
					</div>
				<?php } ?>
        <div class="box masonry-container">
				  <div class="article-list clearafter">
					<?php foreach ($articles as $article) { ?>
						<?php if ($column==2) { ?>
							<?php $class = 'col-md-6'; ?>
						<?php } elseif ($column==3) { ?>
							<?php $class = 'col-md-4'; ?>
						<?php } elseif ($column==4) { ?>
							<?php $class = 'col-md-3'; ?>
						<?php } else { ?>
							<?php $class = 'col-md-4'; ?>
						<?php } ?>
						<div class="article <?php echo $class; ?> wow fadeInRight masonry-item" data-wow-offset="100">
							<div class="article-box">
								<div class="article__image">
									<a href="<?php echo $article['link']; ?>" class="article-image">
										<img src="<?php echo $article['featured_image_thumb']; ?>" />
									</a>
								</div>
                <div class="article__header">
                  <h2><a href="<?php echo $article['link']; ?>"><?php echo $article['name']; ?></a></h2>
                  <div class="article__extra-info">
                    <?php if ($article['display_author']) { ?>
                    <?php echo '<span class="article__extra-info__author vcard">'; echo _t('text_by_x', '<a rel="author">'. $article['author_name'] .'</a></span>'); ?>
                    <?php } ?>

                    <?php if ($article['display_category'] && $article['categories']) { ?>
                    <?php echo '<span class="article__extra-info__category">'; ?>
                    <?php echo _t('text_in'); ?>
                    <?php $article_links = array(); ?>
                    <?php foreach ($article['categories'] as $article_category) {
                          $article_links[] = sprintf('<a href="%s">%s</a>', $article_category['link'], $article_category['name']);
                    } ?>
                    <?php echo implode(', ', $article_links); ?>
                    <?php echo '</span>'; ?>
                    <?php } ?>

                    <?php if ($article['display_date']) { ?>
                    <span class="article__extra-info__date"><?php echo _t('text_on'); ?><time><?php echo $article['date_added_formatted'];?></time></span>
                    <?php } ?>

                    <?php if ($article['comment_total'] && $article['display_comment']) { ?>
                    <span class="article__extra-info__comment-total"><a href="<?php echo $article['link']; ?>#comments"><?php echo _t('text_x_comments', $article['comment_total']); ?></a></span>
                    <?php } ?>
                  </div>
                </div>
                <div class="article__content">
                  <div class="article__description">
                    <?php echo $article['description']; ?>
                  </div>
                  <a class="article__read-more" href="<?php echo $article['link']; ?>">
                    <span><?php echo _t('text_read_more'); ?></span>
                  </a>
                </div>
              </div>
						</div>
					<?php } ?>
				</div>
        </div>
        <div class="row">
          <div class="col-xs-12 text-center">
            <?php echo $pagination; ?>
          </div>
        </div>
			</div>
			<?php echo $column_right; ?>
			<?php echo $content_bottom; ?>
		</div>
	</div>
<?php echo $footer; ?>