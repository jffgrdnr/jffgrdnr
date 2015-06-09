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
      <div class="main-content">
        <h1 class="page-heading"><?php echo $heading_title; ?></h1>
        <p><?php echo $text_error; ?></p>
        <div class="buttons clearfix">
          <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn"><span><?php echo $button_continue; ?></span></a></div>
        </div>
        <?php echo $content_bottom; ?>
      </div>
    </div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>