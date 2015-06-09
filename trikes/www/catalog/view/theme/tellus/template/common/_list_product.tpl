<?php $kuler = Kuler::getInstance(); ?>
<div class="product-layout product-list col-xs-12">
	<div class="row">
		<div class="col-xs-4 left">
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
              <div class="product-thumb__secondary hidden-xs hidden-sm hidden-md">
                <img src="<?php echo $kuler->resizeImage($images[0], $size['width'], $size['height']); ?>" alt="<?php echo $product['name']; ?>""/>
              </div>
            <?php } ?>
          <?php } //end swap image ?>
          <?php if((isset($setting['add']) && $setting['add']) ||(isset($setting['wishlist']) && $setting['wishlist']) || (isset($setting['compare']) && $setting['compare'])) { ?>
          <div class="product-detail button-group hidden-xs hidden-sm hidden-md">
            <div class="product-detail__group-buttons">
							<?php if(isset($setting['add']) && $setting['add']) { ?>
							<button class="product-detail-button product-detail-button--cart" type="button" title="<?php echo $button_cart; ?>" onclick="cart.add('<?php echo $product['product_id']; ?>');">
                <?php echo $button_cart; ?>
							</button>
							<?php } ?>
							<?php if(isset($setting['wishlist']) && $setting['wishlist']) { ?>
              <button class="product-detail-button product-detail-button--wishlist" type="button" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');">
                <?php echo $kuler->language->get('text_button_wishlist'); ?>
              </button>
              <?php } ?>
							<?php if(isset($setting['compare']) && $setting['compare']) { ?>
							<button class="product-detail-button product-detail-button--compare" type="button" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');">
                <?php echo $kuler->language->get('text_button_compare'); ?>
							</button>
							<?php } ?>
							<?php if (Kuler::getInstance()->getSkinOption('show_quick_view')) { ?>
							<button class="product-detail-button product-detail-button--quick-view">
								<a href="<?php echo Kuler::getInstance()->getQuickViewUrl($product); ?>" title="<?php echo $kuler->translate($kuler->getSkinOption('view_button_text')); ?>"><?php echo $kuler->translate($kuler->getSkinOption('view_button_text')); ?>
									<i class="fa fa-eye"></i>
								</a>
							</button>
							<?php } ?>

						</div>
          </div>
          <?php } //end product buttons ?>
				</div><!--/.product-thumb-->
			<?php } else { ?>
				<div class="product-thumb product-thumb--no-image">
					<img src="image/no_image.png" alt="<?php echo $product['name']; ?>" />
				</div><!--/.product-thumb--no-image-->
			<?php } //end product thumb ?>
		</div>
		<div class="col-xs-8 right">
			<?php if(isset($setting['name']) && $setting['name']) { ?>
				<h4 class="product-name">
					<a href="<?php echo $product['href']; ?>">
						<?php echo $product['name']; ?>
					</a>
				</h4>
			<?php } //end product name ?>
      <?php if(isset($setting['rating']) && $setting['rating']) { ?>
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
			<?php if(isset($setting['price']) && $setting['price']) { ?>
				<p class="product-price">
					<?php if (!$product['special']) { ?>
						<?php echo $product['price']; ?>
					<?php } else { ?>
						<span class="product-price--new"><?php echo $product['special']; ?></span>
						<span class="product-price--old"><?php echo $product['price']; ?></span>
					<?php } ?>
				</p>
			<?php } //end product price ?>
			<?php if (isset($setting['description']) && $setting['description']) { ?>
			<div class="product-description">
				<?php echo $product['description']; ?>
			</div>
			<?php } //end product description ?>
		</div>
	</div>
</div>