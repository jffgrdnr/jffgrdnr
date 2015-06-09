<div class="row">
  <div class="col-sm-6">
    <h2 class="row-heading"><?php echo $text_new_customer; ?></h2>
    <p class="login-description"><?php echo $text_checkout; ?></p>
    <div class="radio">
      <label>
        <?php if ($account == 'register') { ?>
        <input type="radio" name="account" value="register" checked="checked" />
        <?php } else { ?>
        <input type="radio" name="account" value="register" />
        <?php } ?>
        <?php echo $text_register; ?></label>
    </div>
    <?php if ($checkout_guest) { ?>
    <div class="radio">
      <label>
        <?php if ($account == 'guest') { ?>
        <input type="radio" name="account" value="guest" checked="checked" />
        <?php } else { ?>
        <input type="radio" name="account" value="guest" />
        <?php } ?>
        <?php echo $text_guest; ?></label>
    </div>
    <?php } ?>
    <p class="login-description"><?php echo $text_register_account; ?></p>
    <div class="form-buttons">
      <button type="button" id="button-account" data-loading-text="<?php echo $text_loading; ?>" class="btn pull-right">
        <span><?php echo $button_continue; ?></span>
      </button>
    </div>
  </div>
  <div class="col-sm-6 form-horizontal">
    <h2 class="row-heading"><?php echo $text_returning_customer; ?></h2>
    <p class="login-description"><?php echo $text_i_am_returning_customer; ?></p>
    <div class="form-group">
      <label class="col-sm-4 control-label" for="input-email"><?php echo $entry_email; ?></label>

      <div class="col-sm-8"><input type="text" name="email" value="" placeholder="<?php echo $entry_email; ?>"
                                    id="input-email" class="form-control"/></div>
    </div>
    <div class="form-group">
      <label class="col-sm-4 control-label" for="input-password"><?php echo $entry_password; ?></label>

      <div class="col-sm-8"><input type="password" name="password" value=""
                                    placeholder="<?php echo $entry_password; ?>" id="input-password"
                                    class="form-control"/></div>
    </div>
    <div class="form-group form-buttons">
      <a href="<?php echo $forgotten; ?>" class="col-sm-4 control-label"><?php echo $text_forgotten; ?></a>
      <div class="col-sm-8">
        <button type="button" id="button-login" data-loading-text="<?php echo $text_loading; ?>" class="btn pull-right">
          <span><?php echo $button_login; ?></span>
        </button>
      </div>
    </div>
  </div>
</div>
