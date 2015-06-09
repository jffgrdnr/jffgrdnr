<?php
  $kuler = Kuler::getInstance();
  $kuler->language->load('kuler/tellus');
$theme = $kuler->getTheme();
?>
<!doctype html>
<html class="quickview">
<head>
	<title><?php echo $heading_title; ?></title>
	<base href="<?php echo $base; ?>" />
	<?php
	$kuler->addStyle(array(
		"catalog/view/javascript/bootstrap/css/bootstrap.min.css",
		"catalog/view/theme/$theme/stylesheet/_grid.css",
		"catalog/view/theme/$theme/stylesheet/stylesheet.css",
		"catalog/view/theme/$theme/stylesheet/jquery.mCustomScrollbar.min.css",
		"catalog/view/javascript/font-awesome/css/font-awesome.min.css",
	));
	?>
	<!-- {STYLES} -->
	<?php
	$kuler->addScript(array(
    'catalog/view/javascript/jquery/jquery-2.1.1.min.js',
    'catalog/view/javascript/bootstrap/js/bootstrap.min.js',
		'catalog/view/javascript/common.js',
    "catalog/view/theme/$theme/js/lib/headroom.min.js",
    "catalog/view/theme/$theme/js/lib/jQuery.headroom.min.js",
		"catalog/view/theme/$theme/js/utils.js"
	));
  $kuler->addScript('catalog/view/theme/' . $theme . '/js/lib/jquery.mCustomScrollbar.concat.min.js', true);
	?>
	<!-- {SCRIPTS} -->
</head>
<body class="<?php echo $kuler->getBodyClass(); ?>">
<div id="content">
	<div class="product-info">
    <div class="row">
      <?php if ($thumb || $images) { ?>
      <div class="col-md-4 col-sm-4 col-xs-12">
        <?php if ($thumb) { ?>
        <div class="image">
	        <a href="<?php echo $product_url; ?>" target="_top" title="<?php echo $heading_title; ?>" >
		        <img id="main-image" src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
	        </a>
        </div>
        <?php } ?>
        <?php if ($images) { ?>
        <div class="image-additional">
          <?php foreach ($images as $image) { ?>
          <a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>"><img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>
          <?php } ?>
        </div>
        <?php } ?>
      </div>
      <?php } ?>
      <div class="col-md-8 col-sm-8 col-xs-12">
        <h1 class="product-name"><?php echo $heading_title; ?></h1>
        <ul class="list-unstyled product-options">
          <h2><?php echo $kuler->language->get('text_product_details'); ?></h2>
          <?php if ($price) { ?>
          <ul class="list-unstyled">
            <li class="product-price">
              <?php if (!$special) { ?>
              <?php echo $price; ?>
              <?php } else { ?>
              <span class="product-price--new"><?php echo $special; ?></span>
              <span class="product-price--old"><?php echo $price; ?></span>
              <?php } ?>
            </li>
            <?php if ($tax && $kuler->getSkinOption('show_tax')) { ?>
            <li><span class="product-price-tax"><?php echo $text_tax; ?> <?php echo $tax; ?></span></li>
            <?php } ?>
            <?php if ($points) { ?>
            <li><?php echo $text_points; ?> <?php echo $points; ?></li>
            <?php } ?>
            <?php if ($discounts) { ?>
            <li>
              <hr>
            </li>
            <?php foreach ($discounts as $discount) { ?>
            <li><?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?></li>
            <?php } ?>
            <?php } ?>
          </ul>
          <?php } ?>
          <?php if ($manufacturer) { ?>
          <li>
            <?php if ($kuler->getSkinOption('show_brand_logo')) { ?>
            <a href="<?php echo $manufacturers; ?>">
              <img src="<?php echo $kuler->getManufacturerImage($product_id); ?>" alt="<?php echo $manufacturer; ?>" />
            </a>
            <?php } else { ?>
            <?php echo $text_manufacturer; ?>
            <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a>
            <?php } ?>
          </li>
          <?php } ?>
          <li><?php echo $text_model; ?> <?php echo $model; ?></li>
          <?php if ($reward) { ?>
          <li><?php echo $text_reward; ?> <?php echo $reward; ?></li>
          <?php } ?>
          <li><?php echo $text_stock; ?> <?php echo $stock; ?></li>
        </ul>
        <?php if ($review_status) { ?>
        <div class="product-review">
          <?php for ($i = 1; $i <= 5; $i++) { ?>
          <?php if ($rating < $i) { ?>
          <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
          <?php } else { ?>
          <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
          <?php } ?>
          <?php } ?>
        </div>
        <?php } ?>
        <div class="product-description">
		      <?php if ($limit = $kuler->getSkinOption('product_description_limit')) { ?>
			      <?php echo substr(strip_tags($description), 0, $limit) . "..."; ?>
		      <?php } else { ?>
			      <?php echo $description; ?>
		      <?php } ?>
	      </div>
        <div class="product-detail">
          <button type="button" id="btn_add_to_cart" data-loading-text="<?php echo $text_loading; ?>" class="btn">
            <span><?php echo $button_cart; ?></span>
          </button>
          <a href="<?php echo $product_url; ?>" target="_top" class="btn">
            <span><?php echo $kuler->translate($kuler->getSkinOption('more_details_button_text')); ?></span>
          </a>
        </div>
      </div>
  </div>
	</div>
</div>
<!-- {BODY_SCRIPTS} -->
<script>
	$('#btn_add_to_cart').on('click', function (evt) {
		evt.preventDefault();

		parent.window.cart.add('<?php echo $product_id; ?>');
	});

  $('.image-additional a').on('click', function () {
    $('#main-image').attr('src', this.href);

    return false;
  });
  (function($){
    $(window).load(function(){

      $("#content").mCustomScrollbar({
          theme:"dark-3",
          scrollInertia: 200
      });

    });
  })(jQuery);
</script>
</body>
</html>