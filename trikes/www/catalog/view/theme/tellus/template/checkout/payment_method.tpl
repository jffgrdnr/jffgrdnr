<?php if ($error_warning) { ?>
<div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
<?php } ?>
<?php if ($payment_methods) { ?>
<?php if (!Kuler::getInstance()->getSkinOption('enable_one_page_checkout')) { ?>
<p><?php echo $text_payment_method; ?></p>
<?php } ?>
<?php foreach ($payment_methods as $payment_method) { ?>
<div class="radio">
  <label>
    <?php if ($payment_method['code'] == $code || !$code) { ?>
    <?php $code = $payment_method['code']; ?>
    <input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" checked="checked" />
    <?php } else { ?>
    <input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" />
    <?php } ?>
    <?php echo $payment_method['title']; ?>
    <?php if ($payment_method['terms']) { ?>
    (<?php echo $payment_method['terms']; ?>)
    <?php } ?>
  </label>
</div>
<?php } ?>
<?php } ?>
<?php if (!Kuler::getInstance()->getSkinOption('enable_one_page_checkout')) { ?>
<p><strong><?php echo $text_comments; ?></strong></p>
<p>
  <textarea name="comment" rows="8" class="form-control"><?php echo $comment; ?></textarea>
</p>
<?php if ($text_agree) { ?>
<div class="buttons">
  <label for="input-agree">
    <?php if ($agree) { ?>
    <input id="input-agree" type="checkbox" name="agree" value="1" checked="checked" />
    <?php } else { ?>
    <input id="input-agree" type="checkbox" name="agree" value="1" />
    <?php } ?>
    <?php echo $text_agree; ?>
  </label>
  <button type="button" id="button-payment-method" data-loading-text="<?php echo $text_loading; ?>" class="btn pull-right"><span><?php echo $button_continue; ?></span></button>
</div>
<?php } else { ?>
<div class="buttons">
  <div class="pull-right">
    <button type="button" id="button-payment-method" data-loading-text="<?php echo $text_loading; ?>" class="btn"><span><?php echo $button_continue; ?></span></button>
  </div>
</div>
<?php } ?>
<?php } ?>