<?php
$kuler = Kuler::getInstance();
$kuler->language->load('kuler/tellus');
$theme = $kuler->getTheme();
$kuler->addScript(array(
	"catalog/view/theme/$theme/js/lib/jquery.elevatezoom.js",
	"catalog/view/theme/$theme/js/product.js"
), true);

global $config;
?>
<?php echo $header; ?>
<div class="container">

  <div class="row">
    <?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
      <?php $class = 'col-lg-6 col-md-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
      <?php $class = 'col-lg-9 col-md-9'; ?>
    <?php } else { ?>
      <?php $class = 'col-lg-12 col-md-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>">
      <ul class="breadcrumb row">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
          <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
      <?php echo $content_top; ?>
      <div class="main-content row">
        <div class="col-sm-12">
          <?php if ($thumb || $images) { ?>
            <div class="thumbnails">
              <?php if ($thumb) { ?>
                <div class="thumbnails__big-image" style="position: relative; max-width: <?php echo $config->get('config_image_thumb_width'); ?>px; max-height: <?php echo $config->get('config_image_thumb_height'); ?>px;">
                  <a href="<?php echo $popup; ?>" class="product-image-link">
                    <img id="main-image" src="<?php echo $thumb; ?>" data-zoom-image="<?php echo $popup; ?>"/>
                  </a>
                  <?php if ($special) { ?>
                    <?php if ($kuler->getSkinOption('show_save_percent')) { ?>
                      <div class="product-save-precent">
                        <span><?php echo $kuler->translate($kuler->getSkinOption('save_text')); ?></span> <?php echo $kuler->calculateSalePercent($special, $price); ?>%
                      </div>
                    <?php } ?>
                  <?php } ?>
                </div>
              <?php } ?>
              <?php if ($images) { ?>
                <div class="thumbnails__list-image owl-carousel" id="image-additional">
                  <?php foreach ($images as $image) { ?>
                    <div>
                      <a title="<?php echo $heading_title; ?>" class="product-image-link" href="<?php echo $image['popup']; ?>" data-image="<?php echo $image['popup']; ?>" data-zoom-image="<?php echo $image['popup']; ?>">
                        <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
                      </a>
                    </div>
                  <?php } ?>
                </div>
                <script type="text/javascript">
                  $(function() {
                    $('.thumbnails__list-image').owlCarousel({
                      dots: false,
                      loop:true,
                      margin:5,
                      responsive:{
                        0:{
                          items:2
                        },
                        600:{
                          items:3
                        },
                        1000:{
                          items:5
                        }
                      }
                    });
                  });
                </script>
              <?php } ?>
            </div>
          <?php } ?>
        </div>
        <div id="product" class="col-sm-12 product-info ">
          <div class="row">
            <div class="col-xs-12 product-info__center">
              <h1 class="product-name"><?php echo $heading_title; ?></h1>
              <?php if ($review_status) { ?>
                <div class="product-review">
                  <p>
                    <?php for ($i = 1; $i <= 5; $i++) { ?>
                      <?php if ($rating < $i) { ?>
                        <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
                      <?php } else { ?>
                        <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
                      <?php } ?>
                    <?php } ?>
                    <a href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?php echo $reviews; ?></a> / <a id="write-review" href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?php echo $text_write; ?></a>
                  </p>
                </div>
              <?php } ?>
            </div>
            <!-- LEFT -->
            <div class="col-md-6 product-info__left">
              <ul class="list-unstyled product-details">
                <?php if ($manufacturer) { ?>
                <li>
                  <?php if ($kuler->getSkinOption('show_brand_logo')) { ?>
                  <span class="brand-logo"><?php echo $text_manufacturer; ?></span>
                  <a class="brand-logo" href="<?php echo $manufacturers; ?>">
                    <img src="<?php echo $kuler->getManufacturerImage($product_id); ?>" alt="<?php echo $manufacturer; ?>" />
                  </a>
                  <?php } else { ?>
                  <span><?php echo $text_manufacturer; ?></span>
                  <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a>
                  <?php } ?>
                </li>
                <?php } ?>
                <li><span><?php echo $text_model; ?></span> <?php echo $model; ?></li>
                <?php if ($reward) { ?>
                <li><span><?php echo $text_reward; ?></span> <?php echo $reward; ?></li>
                <?php } ?>
                <li><span><?php echo $text_stock; ?></span> <?php echo $stock; ?></li>
              </ul>
              <div class="form-group quantity">
                <label class="control-label quantity_label" for="input-quantity"><?php echo $entry_qty; ?></label>
                <?php if (!$kuler->getSkinOption('show_number_quantity')) { ?>
                  <input type="text" name="quantity" size="2" value="<?php echo $minimum; ?>" class="form-control quantity__input" id="input-quantity"  />
                <?php } else { ?>
                  <button type="button" id="qty-dec" class="quantity__button">-</button>
                  <input type="text" name="quantity" size="2" id="input-quantity" class="form-control dynamic-number quantity__input" value="<?php echo $minimum; ?>" data-min="<?php echo $minimum; ?>" data-dec="#qty-dec" data-inc="#qty-inc" />
                  <button type="button" id="qty-inc" class="quantity__button">+</button>
                <?php } ?>
                <input type="hidden" name="product_id" size="2" value="<?php echo $product_id; ?>" />
              </div>
            </div>
            <!-- /LEFT -->
            <!-- RIGHT -->
            <div class="col-md-6 product-info__right">
              <div class="product-options">
                <?php if ($options) { ?>
                  <h3><?php echo $text_option; ?></h3>
                  <?php foreach ($options as $option) { ?>
                    <?php if ($option['type'] == 'select') { ?>
                      <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                        <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                        <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
                          <option value=""><?php echo $text_select; ?></option>
                          <?php foreach ($option['product_option_value'] as $option_value) { ?>
                            <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                              <?php if ($option_value['price']) { ?>
                                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                              <?php } ?>
                            </option>
                          <?php } ?>
                        </select>
                      </div>
                    <?php } ?>
                    <?php if ($option['type'] == 'radio') { ?>
                      <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                        <label class="control-label"><?php echo $option['name']; ?></label>
                        <div id="input-option<?php echo $option['product_option_id']; ?>">
                          <?php foreach ($option['product_option_value'] as $option_value) { ?>
                            <div class="radio">
                              <label>
                                <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                                <?php echo $option_value['name']; ?>
                                <?php if ($option_value['price']) { ?>
                                  (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                <?php } ?>
                              </label>
                            </div>
                          <?php } ?>
                        </div>
                      </div>
                    <?php } ?>
                    <?php if ($option['type'] == 'checkbox') { ?>
                      <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                        <label class="control-label"><?php echo $option['name']; ?></label>
                        <div id="input-option<?php echo $option['product_option_id']; ?>">
                          <?php foreach ($option['product_option_value'] as $option_value) { ?>
                            <div class="checkbox">
                              <label>
                                <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                                <?php echo $option_value['name']; ?>
                                <?php if ($option_value['price']) { ?>
                                  (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                <?php } ?>
                              </label>
                            </div>
                          <?php } ?>
                        </div>
                      </div>
                    <?php } ?>
                    <?php if ($option['type'] == 'image') { ?>
                      <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                        <label class="control-label"><?php echo $option['name']; ?></label>
                        <div id="input-option<?php echo $option['product_option_id']; ?>">
                          <?php foreach ($option['product_option_value'] as $option_value) { ?>
                            <div class="radio">
                              <label>
                                <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                                <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> <?php echo $option_value['name']; ?>
                                <?php if ($option_value['price']) { ?>
                                  (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                <?php } ?>
                              </label>
                            </div>
                          <?php } ?>
                        </div>
                      </div>
                    <?php } ?>
                    <?php if ($option['type'] == 'text') { ?>
                      <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                        <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                        <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                      </div>
                    <?php } ?>
                    <?php if ($option['type'] == 'textarea') { ?>
                      <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                        <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                        <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
                      </div>
                    <?php } ?>
                    <?php if ($option['type'] == 'file') { ?>
                      <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                        <label class="control-label"><?php echo $option['name']; ?></label>
                        <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
                        <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
                      </div>
                    <?php } ?>
                    <?php if ($option['type'] == 'date') { ?>
                      <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                        <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                        <div class="input-group date">
                          <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                    <span class="input-group-btn">
                    <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                    </span></div>
                      </div>
                    <?php } ?>
                    <?php if ($option['type'] == 'datetime') { ?>
                      <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                        <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                        <div class="input-group datetime">
                          <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                    <span class="input-group-btn">
                    <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                    </span></div>
                      </div>
                    <?php } ?>
                    <?php if ($option['type'] == 'time') { ?>
                      <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                        <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                        <div class="input-group time">
                          <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                    <span class="input-group-btn">
                    <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                    </span></div>
                      </div>
                    <?php } ?>
                  <?php } ?>
                <?php } ?>
                <?php if ($recurrings) { ?>
                  <hr>
                  <h3><?php echo $text_payment_recurring ?></h3>
                  <div class="form-group required">
                    <select name="recurring_id" class="form-control">
                      <option value=""><?php echo $text_select; ?></option>
                      <?php foreach ($recurrings as $recurring) { ?>
                        <option value="<?php echo $recurring['recurring_id'] ?>"><?php echo $recurring['name'] ?></option>
                      <?php } ?>
                    </select>
                    <div class="help-block" id="recurring-description"></div>
                  </div>
                <?php } ?>
                <?php if ($kuler->getSkinOption('show_custom_block')) { ?>
                  <div class="custom-block"><?php echo $kuler->translate($kuler->getSkinOption('custom_block_content')); ?></div>
                <?php } ?>
                <?php if ($price) { ?>
                  <ul class="list-unstyled">
                    <?php if (!$special) { ?>
                      <li class="product-price"><?php echo $price; ?></li>
                    <?php } else { ?>
                      <li class="product-price">
                        <span class="product-price--new"><?php echo $special; ?></span>
                        <span class="product-price--old"><?php echo $price; ?></span>
                        <?php if ($kuler->getSkinOption('show_save_percent')) { ?>
                          <div class="product-save-precent">
                            <span><?php echo $kuler->translate($kuler->getSkinOption('save_text')); ?></span> <?php echo $kuler->calculateSalePercent($special, $price); ?>%
                          </div>
                        <?php } ?>
                      </li>
                    <?php } ?>
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
                <div class="product-detail">
                  <button type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" title="<?php echo $button_cart; ?>" class="col-xs-8 product-detail-button product-detail-button--cart">
                    <?php echo $button_cart; ?>
                  </button>
                  <div class="product-detail__row">
                    <button type="button" class="col-xs-2 product-detail-button product-detail-button--wishlist" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product_id; ?>');">
                      <?php echo $kuler->language->get('text_button_wishlist'); ?>
                    </button>
                    <button type="button" class="col-xs-2 product-detail-button product-detail-button--compare" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product_id; ?>');">
                      <?php echo $kuler->language->get('text_button_compare'); ?>
                    </button>
                  </div>
                </div>
                <?php if ($kuler->getSkinOption('default_sharing')) { ?>
                  <div class="product-share"><!-- AddThis Button BEGIN -->
                    <!-- AddThis Button BEGIN -->
                    <div class="addthis_toolbox addthis_default_style"><a class="addthis_button_facebook_like" fb:like:layout="button_count"></a> <a class="addthis_button_tweet"></a> <a class="addthis_button_pinterest_pinit"></a> <a class="addthis_counter addthis_pill_style"></a></div>
                    <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-515eeaf54693130e"></script>
                    <!-- AddThis Button END -->
                  </div>
                <?php } ?>
                <?php if ($minimum > 1) { ?>
                  <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?></div>
                <?php } ?>
              </div>
            </div><!-- /RIGHT -->
          </div>
        </div>
        <div class="col-lg-12">
          <div class="product-tabs">
            <ul class="nav nav-tabs">
              <li class="active"><a href="#tab-description" data-toggle="tab"><span><?php echo $tab_description; ?></span></a></li>
              <?php if ($attribute_groups) { ?>
                <li><a href="#tab-specification" data-toggle="tab"><span><?php echo $tab_attribute; ?></span></a></li>
              <?php } ?>
              <?php if ($review_status) { ?>
                <li><a href="#tab-review" data-toggle="tab" id="review-tab-title"><span><?php echo $tab_review; ?></span></a></li>
              <?php } ?>
              <?php if ($kuler->getSkinOption('show_custom_tab_1')) { ?>
                <li><a data-toggle="tab" href="#tab-custom-tab-1"><span><?php echo $kuler->translate($kuler->getSkinOption('custom_tab_1_title')); ?></span></a></li>
              <?php } ?>
              <?php if ($kuler->getSkinOption('show_custom_tab_2')) { ?>
                <li><a data-toggle="tab" href="#tab-custom-tab-2"><span><?php echo $kuler->translate($kuler->getSkinOption('custom_tab_2_title')); ?></span></a></li>
              <?php } ?>
            </ul>
            <div class="tab-content">
              <div class="tab-pane active" id="tab-description"><?php echo $description; ?></div>
              <?php if ($attribute_groups) { ?>
                <div class="tab-pane" id="tab-specification">
                  <table class="table table-bordered">
                    <?php foreach ($attribute_groups as $attribute_group) { ?>
                      <thead>
                      <tr>
                        <td colspan="2"><strong><?php echo $attribute_group['name']; ?></strong></td>
                      </tr>
                      </thead>
                      <tbody>
                      <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                        <tr>
                          <td><?php echo $attribute['name']; ?></td>
                          <td><?php echo $attribute['text']; ?></td>
                        </tr>
                      <?php } ?>
                      </tbody>
                    <?php } ?>
                  </table>
                </div>
              <?php } ?>
              <?php if ($review_status) { ?>
                <div class="tab-pane" id="tab-review">
                  <form class="form-horizontal">
                    <div id="review"></div>
                    <h2><?php echo $text_write; ?></h2>
                    <div class="form-group required">
                      <div class="col-lg-12 col-sm-12">
                        <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                        <input type="text" name="name" value="" id="input-name" class="form-control" />
                      </div>
                    </div>
                    <div class="form-group required">
                      <div class="col-lg-12 col-sm-12">
                        <label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
                        <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
                        <div class="help-block"><?php echo $text_note; ?></div>
                      </div>
                    </div>
                    <div class="form-group required">
                      <div class="col-lg-12 col-sm-12">
                        <label class="control-label"><?php echo $entry_rating; ?></label>
                        &nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
                        <input type="radio" name="rating" value="1" />
                        &nbsp;
                        <input type="radio" name="rating" value="2" />
                        &nbsp;
                        <input type="radio" name="rating" value="3" />
                        &nbsp;
                        <input type="radio" name="rating" value="4" />
                        &nbsp;
                        <input type="radio" name="rating" value="5" />
                        &nbsp;<?php echo $entry_good; ?></div>
                    </div>
                    <div class="form-group required">
                      <div class="col-lg-12 col-sm-12">
                        <label class="control-label" for="input-captcha"><?php echo $entry_captcha; ?></label>
                        <input type="text" name="captcha" value="" id="input-captcha" class="form-control" />
                      </div>
                    </div>
                    <div class="form-group">
                      <div class="col-lg-12 col-sm-12"> <img src="index.php?route=tool/captcha" alt="" id="captcha" /> </div>
                    </div>
                    <div class="buttons">
                      <div class="pull-right">
                        <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn"><span><?php echo $button_continue; ?></span></button>
                      </div>
                    </div>
                  </form>
                </div>
              <?php } ?>
              <?php if ($kuler->getSkinOption('show_custom_tab_1')) { ?>
                <div id="tab-custom-tab-1" class="tab-pane">
                  <?php echo $kuler->translate($kuler->getSkinOption('custom_tab_1_content')); ?>
                </div>
              <?php } ?>
              <?php if ($kuler->getSkinOption('show_custom_tab_2')) { ?>
                <div id="tab-custom-tab-2" class="tab-pane">
                  <?php echo $kuler->translate($kuler->getSkinOption('custom_tab_2_content')); ?>
                </div>
              <?php } ?>
            </div>
          </div>
        </div>
      </div>
      <?php if ($products && $kuler->getSkinOption('show_related_products')) { ?>
        <div class="product-related">
          <div class="box-heading">
            <span><?php echo $text_related; ?></span>
          </div>
          <div class="row">
            <?php foreach ($products as $product) { ?>
            <?php if ($column_left && $column_right) { ?>
            <?php $class = 'col-lg-6 col-md-6 col-sm-6 col-xs-12'; ?>
            <?php } elseif ($column_left || $column_right) { ?>
            <?php $class = ' col-lg-4 col-md-6 col-sm-6 col-xs-12'; ?>
            <?php } else { ?>
            <?php $class = 'col-lg-3 col-md-3 col-sm-6 col-xs-12'; ?>
            <?php } ?>
              <div class="product-layout product-grid <?php echo $class; ?>">
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
                  <?php if ($product['special']) { ?>
                  <?php if ($kuler->getSkinOption('enable_swap_image')) { ?>
                  <div class="product-sale">
                    -<?php echo $kuler->calculateSalePercent($product['special'], $product['price']); ?>%
                  </div><!--/.product-sale-->
                  <?php } ?>
                  <?php } //end special ?>
                  <div class="product-right-info hidden">

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
          </div>
        </div>
      <?php } ?>
      <?php if ($tags) { ?>
      <p><?php echo $text_tags; ?>
        <?php for ($i = 0; $i < count($tags); $i++) { ?>
        <?php if ($i < (count($tags) - 1)) { ?>
        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
        <?php } else { ?>
        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
        <?php } ?>
        <?php } ?>
      </p>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php if ($kuler->getSkinOption('related_products_style') == 'slider') { ?>
<script type="text/javascript"><!--
  $(function(){
    $('.product-related > .row').owlCarousel({
      stagePadding:30,
      dots: false,
      nav: true,
      autoHeight:true,
      items:1
    });
  });
  //--></script>
<?php } ?>
<script type="text/javascript"><!--
$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
	$.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
		dataType: 'json',
		beforeSend: function() {
			$('#recurring-description').html('');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			
			if (json['success']) {
				$('#recurring-description').html(json['success']);
			}
		}
	});
});
//--></script> 
<script type="text/javascript"><!--
$('#button-cart').on('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-cart').button('loading');
		},
		complete: function() {
			$('#button-cart').button('reset');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						var element = $('#input-option' + i.replace('_', '-'));
						
						if (element.parent().hasClass('input-group')) {
							element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						} else {
							element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						}
					}
				}
				
				if (json['error']['recurring']) {
					$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
				}
				
				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');
			}
			
			if (json['success']) {
        kulerAlert('success', json['success']);
				
				$('#cart-total').html(json['total']);
				
				$('html, body').animate({ scrollTop: 0 }, 'slow');
				
				$('#cart > ul').load('index.php?route=common/cart/info ul li');
			}
		}
	});
});
//--></script> 
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});

$('.time').datetimepicker({
	pickDate: false
});

$('button[id^=\'button-upload\']').on('click', function() {
	var node = this;
	
	$('#form-upload').remove();
	
	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');
	
	$('#form-upload input[name=\'file\']').trigger('click');
	
	$('#form-upload input[name=\'file\']').on('change', function() {
		$.ajax({
			url: 'index.php?route=tool/upload',
			type: 'post',
			dataType: 'json',
			data: new FormData($(this).parent()[0]),
			cache: false,
			contentType: false,
			processData: false,
			beforeSend: function() {
				$(node).button('loading');
			},
			complete: function() {
				$(node).button('reset');
			},
			success: function(json) {
				$('.text-danger').remove();
				
				if (json['error']) {
					$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
				}
				
				if (json['success']) {
					alert(json['success']);
					
					$(node).parent().find('input').attr('value', json['code']);
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	});
});
//--></script> 
<script type="text/javascript"><!--
$('#review').delegate('.pagination a', 'click', function(e) {
  e.preventDefault();

    $('#review').fadeOut('slow');

    $('#review').load(this.href);

    $('#review').fadeIn('slow');
});

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').on('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
		beforeSend: function() {
			$('#button-review').button('loading');
		},
		complete: function() {
			$('#button-review').button('reset');
			$('#captcha').attr('src', 'index.php?route=tool/captcha#'+new Date().getTime());
			$('input[name=\'captcha\']').val('');
		},
		success: function(json) {
			$('.alert-success, .alert-danger').remove();
			
			if (json['error']) {
				$('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}
			
			if (json['success']) {
				$('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');
				
				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').prop('checked', false);
				$('input[name=\'captcha\']').val('');
			}
		}
	});
});

//--></script> 
<?php echo $footer; ?>