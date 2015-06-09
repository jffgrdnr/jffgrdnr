<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
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
      <h2 class="page-heading"><?php echo $text_address_book; ?></h2>
      <?php if ($addresses) { ?>
      <table class="table table-hover">
        <?php foreach ($addresses as $result) { ?>
        <tr>
          <td class="text-left"><?php echo $result['address']; ?></td>
          <td class="text-right"><a href="<?php echo $result['update']; ?>" class="btn"><span><?php echo $button_edit; ?></span></a> &nbsp; <a href="<?php echo $result['delete']; ?>" class="btn"><span><?php echo $button_delete; ?></span></a></td>
        </tr>
        <?php } ?>
      </table>
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <?php } ?>
      <div class="buttons clearfix">
        <div class="pull-left"><a href="<?php echo $back; ?>" class="btn"><span><?php echo $button_back; ?></span></a></div>
        <div class="pull-right"><a href="<?php echo $insert; ?>" class="btn"><span><?php echo $button_new_address; ?></span></a></div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>