<?php
  $kuler = Kuler::getInstance();
  $kuler->language->load('kuler/tellus');
?>
<?php echo $header; ?>
<div class="container">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
      <?php $class = 'col-lg-6 col-md-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
      <?php $class = 'col-lg-9 col-md-9'; ?>
    <?php } else { ?>
      <?php $class = 'col-lg-12 col-md-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>">
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
      <div class="main-content">
      <?php echo $content_top; ?>
      <h2 class="category-info__title"><?php echo $heading_title; ?></h2>
      <?php if ($thumb || $description) { ?>
      <div class="category-info row">
        <?php if ($description) { ?>
          <div class="col-md-8 col-xs-12 category-info__description"><?php echo $description; ?></div>
        <?php } ?>
        <?php if ($thumb && !$kuler->getSkinOption('hide_category_image')) { ?>
          <div class="col-md-4 col-xs-12 category-info__image"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" /></div>
        <?php } ?>
      </div>
      <?php } ?>
      <?php if ($categories) { ?>
        <div class="refine-search">
          <h3 class="row-heading"><?php echo $text_refine; ?></h3>
          <div <?php if (!$kuler->getSkinOption('sub_categories_image_carousel')) { ?> class="no-carousel" style="display:block" <?php } else { ?> class="owl-carousel"  <?php } ?>>
            <?php foreach ($kuler->getSubCategories($kuler->request->get['path'], $categories) as $sub_category) { ?>
            <div>
              <?php if ($kuler->getSkinOption('sub_category_image') && $sub_category['thumb']) { ?>
              <?php $size = $kuler->getSkinOption('sub_category_image_size'); ?>
              <a class="refine-search__image" href="<?php echo $sub_category['href']; ?>" style="width: <?php echo $size; ?>px;">
                <img src="<?php echo $sub_category['thumb']; ?>" alt="<?php echo $sub_category['name']; ?>" height="<?php echo $size; ?>" width="<?php echo $size; ?>" />
              </a>
              <?php } else { ?>
              <a class="refine-search__image" href="<?php echo $sub_category['href']; ?>">
                <img src="image/no_image.png" alt="<?php echo $sub_category['name']; ?>" />
              </a>
              <?php } ?>
              <a class="refine-search__name" href="<?php echo $sub_category['href']; ?>"><?php echo $sub_category['name']; ?></a>
            </div>
            <?php } ?>
          </div>
        </div>
        <?php if ($kuler->getSkinOption('sub_categories_image_carousel')) { ?>
        <script type="text/javascript">
          $(function () {
            $('.owl-carousel').owlCarousel({
              loop:true,
              margin:10,
              responsive:{
                0:{
                  items:2
                },
                600:{
                  items:4
                },
                1000:{
                  items:6
                }
              }
            });
          });
        </script>
        <?php } ?>
      <?php } //end refine search ?>
      <?php if ($products) { ?>
      <div class="product-filter">
        <div class="row">
          <div class="col-lg-2 col-md-2">
            <div class="btn-group">
              <button type="button" id="list-view" data-toggle="tooltip" title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>
              <button type="button" id="grid-view" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>
            </div>
          </div>
          <div class="col-lg-3 col-md-3">
            <a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a>
          </div>
          <div class="col-lg-2 col-md-2 text-right">
            <label class="control-label" for="input-sort"><?php echo $text_sort; ?></label>
          </div>
          <div class="col-lg-2 col-md-2 text-right">
            <select id="input-sort" class="form-control" onchange="location = this.value;">
              <?php foreach ($sorts as $sorts) { ?>
                <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                  <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
                <?php } else { ?>
                  <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
                <?php } ?>
              <?php } ?>
            </select>
          </div>
          <div class="col-lg-1 col-md-1 text-right">
            <label class="control-label" for="input-limit"><?php echo $text_limit; ?></label>
          </div>
          <div class="col-lg-2 col-md-2 text-right">
            <select id="input-limit" class="form-control" onchange="location = this.value;">
              <?php foreach ($limits as $limits) { ?>
                <?php if ($limits['value'] == $limit) { ?>
                  <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
                <?php } else { ?>
                  <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
                <?php } ?>
              <?php } ?>
            </select>
          </div>
        </div>
      </div>
    </div>

      <!--product section-->
      <div class="row product-section">
        <?php foreach ($products as $product) { ?>
        <div class="product-layout product-list col-lg-12 col-xs-12">
          <div class="product-wrapper">

	          <?php if ($product['thumb']) { ?>
		          <div class="product-thumb">
			          <div class="product-thumb__primary">
				          <a href="<?php echo $product['href']; ?>">
					          <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" />
				          </a>
			          </div>
			          <?php if ($images = $kuler->getProductImages($product['product_id'])) { ?>
				          <?php if(!$kuler->mobile->isMobile() && $kuler->getSkinOption('enable_swap_image')){ ?>
					          <?php $size = $kuler->getImageSizeByPath($product['thumb']); ?>
					          <div class="product-thumb__secondary">
                      <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
						          <img src="<?php echo $kuler->resizeImage($images[0], $size['width'], $size['height']); ?>" alt="<?php echo $product['name']; ?>"/>
					          </div>
				          <?php } ?>
			          <?php } //end swap image ?>
                <?php if (Kuler::getInstance()->getSkinOption('show_quick_view')) { ?>
                <a class="product-detail-button product-detail-button--quick-view" href="<?php echo Kuler::getInstance()->getQuickViewUrl($product); ?>" title="<?php echo $kuler->translate($kuler->getSkinOption('view_button_text')); ?>"><?php echo $kuler->translate($kuler->getSkinOption('view_button_text')); ?></a>
                <?php } //end show quick-view button ?>
              </div><!--/.produc-thumb-->
	          <?php } else { ?>
		          <div class="product-thumb product-thumb--no-image">
			          <img src="image/no_image.png" alt="<?php echo $product['name']; ?>" />
		          </div><!--/.product-thumb--no-image-->
	          <?php } //end product thumb ?>

            <div class="product-bottom-info">

              <div class="product-name">
                <a href="<?php echo $product['href']; ?>">
                  <?php echo $product['name']; ?>
                </a>
              </div>

              <?php if($product['rating']) { ?>
              <div class="product-rating">
                <?php for ($i = 1; $i <= 5; $i++) { ?>
                <?php if ($product['rating'] < $i) { ?>
                <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                <?php } else { ?>
                <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                <?php } ?>
                <?php } ?>
              </div>
              <?php } //end product rating ?>

              <div class="product-description hidden">
                <p><?php echo $product['description']; ?></p>
              </div>

              <div class="product-price">
                <?php if (!$product['special']) { ?>
                <?php echo $product['price']; ?>
                <?php } else { ?>
                <span class="product-price--new"><?php echo $product['special']; ?></span>
                <span class="product-price--old"><?php echo $product['price']; ?></span>
                <?php } ?>
              </div>

              <div class="product-detail button-group <?php if($kuler->mobile->isMobile()) { echo 'product-detail--mobile'; } ?>">
                <button class="product-detail-button product-detail-button--cart" type="button" title="<?php echo $button_cart; ?>" onclick="cart.add('<?php echo $product['product_id']; ?>');">
                  <?php echo $button_cart; ?>
                </button>
                <div class="product-detail__row">
                  <button class="product-detail-button product-detail-button--wishlist" type="button" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');">
                    <?php echo  $kuler->language->get('text_button_wishlist'); ?>
                  </button>
                  <button class="product-detail-button product-detail-button--compare" type="button" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');">
                    <?php echo  $kuler->language->get('text_button_compare'); ?>
                  </button>
                </div>
              </div><!--./product-detail-->
            </div>
	          <?php if ($product['special']) { ?>
              <?php if ($kuler->getSkinOption('show_sale_badge')) { ?>
                <div class="product-sale">
                  -<?php echo $kuler->calculateSalePercent($product['special'], $product['price']); ?>%
                </div><!--/.product-sale-->
              <?php } ?>
	          <?php } //end special ?>

            <div class="product-left-info hidden">

              <div class="product-name">
                <a href="<?php echo $product['href']; ?>">
                  <?php echo $product['name']; ?>
                </a>
              </div>

              <?php if($product['rating']) { ?>
              <div class="product-rating">
                <?php for ($i = 1; $i <= 5; $i++) { ?>
                <?php if ($product['rating'] < $i) { ?>
                <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                <?php } else { ?>
                <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                <?php } ?>
                <?php } ?>
              </div>
              <?php } //end product rating ?>

              <div class="product-description">
                <p><?php echo $product['description']; ?></p>
              </div>

              <div class="product-detail button-group">
                <button class="product-detail-button product-detail-button--cart" type="button" title="<?php echo $button_cart; ?>" onclick="cart.add('<?php echo $product['product_id']; ?>');">
                  <?php echo $button_cart; ?>
                </button>
                <div class="product-detail__row">
                  <button class="product-detail-button product-detail-button--wishlist" type="button" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');">
                    <?php echo  $kuler->language->get('text_button_wishlist'); ?>
                  </button>
                  <button class="product-detail-button product-detail-button--compare" type="button" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');">
                    <?php echo  $kuler->language->get('text_button_compare'); ?>
                  </button>
                </div>
              </div><!--./product-detail-->
            </div>
          </div>
        </div>
        <?php } ?>

      </div><!--/product section-->

      <!--pagination-->
      <div class="row">
        <div class="col-xs-12 text-center">
          <?php echo $pagination; ?>
          <p class="pagination__result"><?php echo $results; ?></p>
        </div>
      </div><!--/pagination-->
      <?php } ?>
      <?php if (!$categories && !$products) { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons clearfix">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn"><span><?php echo $button_continue; ?></span></a></div>
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>