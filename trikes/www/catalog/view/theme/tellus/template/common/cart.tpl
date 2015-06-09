<?php
  $kuler = Kuler::getInstance();
?>
<div id="cart" class="mini-cart">
  <span data-toggle="dropdown" class="btn dropdown-toggle mini-cart__button">
    <div class="mini-cart__header">
      <p id="cart-total">
        <span class="mini-cart__header__total"><?php echo $text_items; ?></span>
      </p>
    </div>
  </span>
  <ul class="dropdown-menu mini-cart__info">
    <?php if ($products || $vouchers) { ?>
    <?php foreach ($products as $product) { ?>
    <li class="row mini-cart__item">
      <div class="col-xs-2 mini-cart__product-image">
        <?php if ($product['thumb']) { ?>
        <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>"
                                                       alt="<?php echo $product['name']; ?>"
                                                       title="<?php echo $product['name']; ?>"/></a>
        <?php } ?>
      </div>
      <div class="col-xs-5 mini-cart__product-name">
        <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
        <?php if ($product['option']) { ?>
        <?php foreach ($product['option'] as $option) { ?>
        <br/>
        -
        <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small>
        <?php } ?>
        <?php } ?>
        <?php if ($product['recurring']) { ?>
        <br/>
        -
        <small><?php echo $text_recurring; ?> <?php echo $product['recurring']; ?></small>
        <?php } ?>
      </div>
      <div class="col-xs-4 mini-cart__product-total"><span class="mini-cart__quantity">x<?php echo $product['quantity']; ?></span>&nbsp;&nbsp;<?php echo $product['price'];?></div>
      <div class="col-xs-1 text-center mini-cart__remove">
        <button type="button" onclick="cart.remove('<?php echo $product['key']; ?>');"
                data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="close"><i class="fa fa-times"></i></button>
      </div>
    </li>
    <?php } ?>
    <?php foreach ($vouchers as $voucher) { ?>
    <li class="row mini-cart__item">
      <div class="col-xs-2 mini-cart__product-image"></div>
      <div class="col-xs-5 mini-cart__product-name">
        <?php echo $voucher['description']; ?>
        <div class="mini-cart__product-quantity">x&nbsp;1</div>
        <div class="mini-cart__product-total"><?php echo $voucher['amount']; ?></div>
      </div>
      <div class="col-xs-2">
        <button type="button" onclick="voucher.remove('<?php echo $voucher['key']; ?>');"
                data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="close"><i class="fa fa-times"></i></button>
      </div>
    </li>
    <?php } ?>
    <li class="mini-cart__total">
      <?php foreach ($totals as $total) { ?>
      <div class="col-xs-12">
        <span><b><?php echo $total['title']; ?>:</b></span>
        <span class="mini-cart__total__price"><?php echo $total['text']; ?></span>
      </div>
      <?php } ?>
    </li>
    <li class="mini-cart__checkout">
      <a class="mini-cart__view-cart-btn btn" href="<?php echo $cart; ?>"><?php echo $text_cart; ?></a>
      <a class="mini-cart__checkout-btn btn" href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a>
    </li>
    <?php } else { ?>
    <li class="mini-cart--empty">
      <p class="text-center"><?php echo $text_empty; ?></p>
    </li>
    <?php } ?>
  </ul>
</div>