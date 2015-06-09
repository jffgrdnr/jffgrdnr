<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($attention) { ?>
  <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $attention; ?>
    <button type="button" class="close" data-dismiss="alert"><i class="fa fa-times"></i></button>
  </div>
  <?php } ?>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
    <button type="button" class="close" data-dismiss="alert"><i class="fa fa-times"></i></button>
  </div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert"><i class="fa fa-times"></i></button>
  </div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
	  <?php if ($column_left && $column_right) { ?>
      <?php $class = 'col-lg-6 col-md-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
      <?php $class = 'col-lg-9 col-md-9'; ?>
    <?php } else { ?>
      <?php $class = 'col-lg-12 col-md-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1 class="page-heading"><?php echo $heading_title; ?>
        <?php if ($weight) { ?>
        &nbsp;(<?php echo $weight; ?>)
        <?php } ?>
      </h1>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <div class="table-responsive">
          <table class="table table-cart-info">
            <thead>
              <tr>
                <td class="text-center table-cart-info__image"><?php echo $column_image; ?></td>
                <td class="text-left table-cart-info__name"><?php echo $column_name; ?></td>
                <td class="text-left table-cart-info__model"><?php echo $column_model; ?></td>
                <td class="text-left table-cart-info__quantity"><?php echo $column_quantity; ?></td>
                <td class="text-right table-cart-info__price"><?php echo $column_price; ?></td>
                <td class="text-right table-cart-info__total"><?php echo $column_total; ?></td>
              </tr>
            </thead>
            <tbody>
              <?php foreach ($products as $product) { ?>
              <tr>
                <td class="text-center table-cart-info__image"><?php if ($product['thumb']) { ?>
                  <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
                  <?php } ?></td>
                <td class="text-left table-cart-info__name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                  <?php if (!$product['stock']) { ?>
                  <span class="text-danger">***</span>
                  <?php } ?>
                  <?php if ($product['option']) { ?>
                  <?php foreach ($product['option'] as $option) { ?>
                  <br />
                  <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
                  <?php } ?>
                  <?php } ?>
                  <?php if ($product['reward']) { ?>
                  <br />
                  <small><?php echo $product['reward']; ?></small>
                  <?php } ?>
                  <?php if ($product['recurring']) { ?>
                  <br />
                  <span class="label label-info"><?php echo $text_recurring_item; ?></span> <small><?php echo $product['recurring']; ?></small>
                  <?php } ?></td>
                <td class="text-left table-cart-info__model"><?php echo $product['model']; ?></td>
                <td class="text-left table-cart-info__quantity"><div class="input-group btn-block" style="max-width: 200px;">
                    <input type="text" name="quantity[<?php echo $product['key']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" class="form-control" />
                    <span>
                      <button type="submit" data-toggle="tooltip" title="<?php echo $button_update; ?>" class="btn"><i class="fa fa-refresh text-info"></i></button>
                      <button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn" onclick="cart.remove('<?php echo $product['key']; ?>');"><i class="fa fa-times-circle text-danger"></i></button>
                    </span>
                  </div>
                </td>
                <td class="text-right table-cart-info__price"><?php echo $product['price']; ?></td>
                <td class="text-right total"><?php echo $product['total']; ?></td>
              </tr>
              <?php } ?>
              <?php foreach ($vouchers as $vouchers) { ?>
              <tr>
                <td></td>
                <td class="text-left table-cart-info__name"><?php echo $vouchers['description']; ?></td>
                <td class="text-left"></td>
                <td class="text-left"><div class="input-group btn-block" style="max-width: 200px;">
                    <input type="text" name="" value="1" size="1" disabled="disabled" class="form-control" />
                    <span class="input-group-btn"><button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn" onclick="voucher.remove('<?php echo $vouchers['key']; ?>');"><i class="fa fa-times-circle"></i></button></span></div></td>
                <td class="text-right"><?php echo $vouchers['amount']; ?></td>
                <td class="text-right"><?php echo $vouchers['amount']; ?></td>
              </tr>
              <?php } ?>
            </tbody>
          </table>
        </div>
      </form>
      <?php if ($coupon || $voucher || $reward || $shipping) { ?>
      <h2><?php echo $text_next; ?></h2>
      <p><?php echo $text_next_choice; ?></p>
      <div class="panel-group" id="accordion"><?php echo $coupon; ?><?php echo $voucher; ?><?php echo $reward; ?><?php echo $shipping; ?></div>
      <?php } ?>
      <br />
      <div class="row cart-total">
        <div class="col-sm-4 col-sm-offset-8">
          <table class="table">
            <?php foreach ($totals as $total) { ?>
            <tr>
              <td><strong><?php echo $total['title']; ?>:</strong></td>
              <td><?php echo $total['text']; ?></td>
            </tr>
            <?php } ?>
          </table>
        </div>
      </div>
      <div class="buttons text-center">
        <a href="<?php echo $continue; ?>" class="btn"><span><?php echo $button_shopping; ?></span></a>
        <a href="<?php echo $checkout; ?>" class="btn"><span><?php echo $button_checkout; ?></span></a>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>