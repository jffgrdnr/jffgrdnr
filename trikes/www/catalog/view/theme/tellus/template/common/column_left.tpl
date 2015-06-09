<?php if ($modules) { ?>
<column id="column-left" class="col-lg-3 col-md-3 hidden-xs hidden-sm side-bar">
  <?php foreach ($modules as $module) { ?>
  <?php echo $module; ?>
  <?php } ?>
</column>
<?php } ?>