<h2 class="row-heading"><?php echo $text_instruction; ?></h2>
<div class="well well-sm">
  <p><b><?php echo $text_payable; ?></b></p>
  <p><?php echo $payable; ?></p>
  <b><?php echo $text_address; ?></b><br />
  <p><?php echo $address; ?></p>
  <p><?php echo $text_payment; ?></p>
</div>
<?php global $config; if ($config->get('inline_payment') !== true) { ?>
<div class="buttons">
  <div class="pull-right">
    <button type="button" id="button-confirm" class="btn"><span><?php echo $button_confirm; ?></span></button>
  </div>
</div>
<script type="text/javascript"><!--
$('#button-confirm').on('click', function() {
	$.ajax({ 
		type: 'get',
		url: 'index.php?route=payment/cheque/confirm',
		cache: false,
		beforeSend: function() {
			$('#button-confirm').button('loading');
		},
		complete: function() {
			$('#button-confirm').button('reset');
		},		
		success: function() {
			location = '<?php echo $continue; ?>';
		}		
	});
});
//--></script>
<?php } ?>