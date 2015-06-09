<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
	  <?php if ($column_left && $column_right) { ?>
      <?php $class = 'col-lg-6 col-md-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
      <?php $class = 'col-lg-9 col-md-9'; ?>
    <?php } else { ?>
      <?php $class = 'col-lg-12 col-md-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1 class="page-heading"><?php echo $heading_title; ?></h1>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
        <fieldset>
          <legend><?php echo $text_password; ?></legend>
          <div class="form-group required">
            <label class="col-sm-3 control-label" for="input-password"><?php echo $entry_password; ?></label>
            <div class="col-sm-9">
              <input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
              <?php if ($error_password) { ?>
              <div class="text-danger"><?php echo $error_password; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-3 control-label" for="input-confirm"><?php echo $entry_confirm; ?></label>
            <div class="col-sm-9">
              <input type="password" name="confirm" value="<?php echo $confirm; ?>" placeholder="<?php echo $entry_confirm; ?>" id="input-confirm" class="form-control" />
              <?php if ($error_confirm) { ?>
              <div class="text-danger"><?php echo $error_confirm; ?></div>
              <?php } ?>
            </div>
          </div>
        </fieldset>
        <div class="buttons clearfix">
          <div class="pull-left"><a href="<?php echo $back; ?>" class="btn"><span><?php echo $button_back; ?></span></a></div>
          <div class="pull-right">
            <button type="submit" class="btn"><span><?php echo $button_continue; ?></span></button>
          </div>
        </div>
      </form>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>