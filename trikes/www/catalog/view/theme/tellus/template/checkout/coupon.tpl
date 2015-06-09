<div class="panel panel-default">
  <div class="panel-heading">
    <h4 class="panel-title"><a href="#collapse-coupon" class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"><?php echo $heading_title; ?> <i class="fa fa-caret-down"></i></a></h4>
  </div>
  <div id="collapse-coupon" class="panel-collapse collapse">
    <div class="panel-body">
      <label class="control-label" for="input-coupon"><?php echo $entry_coupon; ?></label>
      <div class="input-group">
        <input type="text" name="coupon" value="<?php echo $coupon; ?>" placeholder="<?php echo $entry_coupon; ?>" id="input-coupon" class="form-control" />
        <span class="input-group-btn">
        <button type="button" id="button-coupon" data-loading-text="<?php echo $text_loading; ?>"  class="btn"><span><?php echo $button_coupon; ?></span></button>
        </span>
      </div>
      <script type="text/javascript"><!--
$('#button-coupon').on('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/coupon/coupon',
		type: 'post',
		data: 'coupon=' + encodeURIComponent($('input[name=\'coupon\']').val()),
		dataType: 'json',
		beforeSend: function() {
			$('#button-coupon').button('loading');
		},
		complete: function() {
			$('#button-coupon').button('reset');
		},
		success: function(json) {
			$('.alert').remove();

			if (json['error']) {
				$('#collapse-coupon').before('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '<button type="button" class="close" data-dismiss="alert"><i class="fa fa-times"></i></button></div>');
			}

			if (json['redirect']) {
				location = json['redirect'];
			}
		}
	});
});
//--></script>
    </div>
  </div>
</div>
