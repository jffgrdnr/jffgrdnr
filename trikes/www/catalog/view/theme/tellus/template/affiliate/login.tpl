<?php echo $header; ?>
<div class="container">
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
	  <?php if ($column_left && $column_right) { ?>
      <?php $class = 'col-lg-6 col-md-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
      <?php $class = 'col-lg-9 col-md-9'; ?>
    <?php } else { ?>
      <?php $class = 'col-lg-12 col-md-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?> form-account form-account--login">
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
      <?php echo $content_top; ?>
      <h1 class="page-heading">
        <?php echo $heading_title; ?>
        <div class="page-heading-description"><?php echo $text_description; ?></div>
      </h1>
      <div class="row">
        <div class="col-sm-6">
            <h2 class="row-heading"><?php echo $text_new_affiliate; ?></h2>
            <div class="login-description login-description__new-customer"><?php echo $text_register_account; ?></div>
          <div class="form-buttons"><a class="btn"
                                        href="<?php echo $register; ?>"><span><?php echo $button_continue; ?></span></a>
          </div>
        </div>
        <div class="col-sm-6">
          <h2 class="row-heading"><?php echo $text_returning_affiliate; ?></h2>
          <p class="account-already"><strong><?php echo $text_i_am_returning_affiliate; ?></strong></p>
          <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
            <div class="form-group">
              <label class="col-sm-4 control-label" for="input-email"><?php echo $entry_email; ?></label>

              <div class="col-sm-8"><input type="text" name="email" value="<?php echo $email; ?>"
                                            placeholder="<?php echo $entry_email; ?>" id="input-email"
                                            class="form-control"/></div>
            </div>
            <div class="form-group">
              <label class="col-sm-4 control-label" for="input-password"><?php echo $entry_password; ?></label>

              <div class="col-sm-8"><input type="password" name="password" value="<?php echo $password; ?>"
                                            placeholder="<?php echo $entry_password; ?>" id="input-password"
                                            class="form-control"/></div>
              </div>
            <div class="form-group form-buttons">
              <a href="<?php echo $forgotten; ?>" class="col-sm-5 control-label forgotten-password"><?php echo $text_forgotten; ?></a>
              <div class="col-sm-7 text-right">
                <button type="submit" class="btn pull-right"><span><?php echo $button_login; ?></span></button>
              </div>
            </div>
              <?php if ($redirect) { ?>
                  <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
                <?php } ?>
          </form>
        </div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>