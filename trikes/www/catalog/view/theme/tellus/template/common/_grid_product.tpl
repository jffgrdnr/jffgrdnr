<?php
$kuler = Kuler::getInstance();
$kuler->language->load('kuler/tellus');
$setting['products_per_row'] = !empty($setting['products_per_row']) ? intval($setting['products_per_row']) : 3;
$lg_col = 4;

if (12 % $setting['products_per_row']) {
	if ($setting['products_per_row'] == 5) {
		$lg_col = 20;
	}
} else {
	$lg_col = 12 / $setting['products_per_row'];
}
?>
<div class="product-layout product-grid col-lg-<?php echo $lg_col; ?> col-md-4 col-sm-6 col-xs-12 <?php if (isset($product['date_end']) && $product['date_end']) echo 'has-deal'; ?>">
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
    <?php if(isset($setting['deal_date']) && $setting['deal_date']) { ?>
    <?php if(isset($product['date_end'])) { ?>
    <?php
			  $parts = array('0000', '00', '00');

			  if ($product['date_end']) {
				  $parts = explode('-', $product['date_end']);
			  }
			?>
    <div class="product-deal-countdown" data-is-deal="<?php echo $product['date_end'] ? 'true' : 'false' ?>" data-product-id="<?php echo $product['product_id'] ?>" data-date-end="<?php echo $product['date_end'] ?>" data-year="<?php echo $parts[0] ?>" data-month="<?php echo $parts[1] ?>" data-day="<?php echo $parts[2] ?>"></div>
    <?php }  ?>
    <?php } //end deal date ?>
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
      <?php if((isset($setting['add']) && $setting['add']) ||(isset($setting['wishlist']) && $setting['wishlist']) || (isset($setting['compare']) && $setting['compare'])) { ?>
      <div class="product-detail button-group <?php if($kuler->mobile->isMobile()) { echo 'product-detail--mobile'; } ?>">
				<button class="product-detail-button product-detail-button--cart" type="button" title="<?php echo $button_cart; ?>" onclick="cart.add('<?php echo $product['product_id']; ?>');">
					<?php echo $button_cart; ?>
				</button>
				<div class="product-detail__row">
					<button class="product-detail-button product-detail-button--wishlist" type="button" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');">
						<?php echo $kuler->language->get('text_button_wishlist'); ?>
					</button>
					<button class="product-detail-button product-detail-button--compare" type="button" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');">
						<?php echo $kuler->language->get('text_button_compare'); ?>
					</button>
				</div>
			</div><!--./product-detail-->
			<?php } //end product buttons ?>
		</div>
    <?php if ($product['special']) { ?>
		<?php if ($kuler->getSkinOption('show_sale_badge')) { ?>
		<div class="product-sale">
			-<?php echo $kuler->calculateSalePercent($product['special'], $product['price']); ?>%
		</div><!--/.product-sale-->
		<?php } ?>
		<?php } //end special ?>
	</div>

</div>