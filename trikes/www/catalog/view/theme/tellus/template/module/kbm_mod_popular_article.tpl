<div id="kbm-article--popular-<?php echo $module; ?>" class="kbm-articles kbm-articles--popular">
  <div class="box kuler-module">
    <?php if ($show_title) { ?>
      <div class="box-heading"><span><?php echo $title; ?></span></div>
    <?php } ?>
      <div class="box-content">
	      <div class="row articles">
		      <?php foreach ($articles as $article) { ?>
            <div class="col-sm-6 col-xs-12 article wow fadeInUp" data-wow-offset="100">
              <div class="row">
                <?php if ($product_featured_image) { ?>
                <div class="col-sm-4 col-xs-12 article__image">
                  <a href="<?php echo $article['link']; ?>" ><img src="<?php echo $article['featured_image_thumb']; ?>" alt="<?php echo $article['name']; ?>" /></a>
                </div>
                <?php } ?>
                <div class="col-sm-8 col-xs-12 article__info">
                  <a href="<?php echo $article['link']; ?>" class="article__title"><?php echo $article['name']; ?></a>
                  <span class="article__date"><?php echo $article['date_added_formatted']; ?></span>
                  <?php if ($product_description) { ?>
                  <p class="article__description"><?php echo $article['description']; ?></p>
                  <?php } ?>
                </div>
              </div>
            </div>
		      <?php } ?>
	      </div>
      </div>
  </div>
</div>