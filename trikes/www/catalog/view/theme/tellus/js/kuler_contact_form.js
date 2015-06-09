jQuery(function () {
	var $form = $('.kcf-module form');

	$form.on('submit', function (evt) {
		evt.preventDefault();
		var $this = $(this);

		$.ajax({
			url: this.action,
			type: 'POST',
			dataType: 'json',
			data: $this.serialize(),
			beforeSend: function () {
				$this.find('button')
					.before(Kuler.waitHtml)
					.prop('disabled', true);

				$this.find('.error').remove();
			},
			success: function (response) {
				if (response.status) {
					kulerAlert('success', response.message);
                    $this.find('.form-group').removeClass('has-error');
				} else {
					if (response.fields) {
						if (response.fields['name']) {
							$this.find('.kcf-field-name').append('<span class="error">'+ response.fields['name'] +'</span>')
                            $this.find('.kcf-field-name').addClass('has-error');
						}

						if (response.fields['email']) {
							$this.find('.kcf-field-email').append('<span class="error">'+ response.fields['email'] +'</span>')
                            $this.find('.kcf-field-email').addClass('has-error');
						}

						if (response.fields['enquiry']) {
							$this.find('.kcf-field-enquiry').append('<span class="error">'+ response.fields['enquiry'] +'</span>')
                            $this.find('.kcf-field-enquiry').addClass('has-error');
						}
					}
				}
			},
			complete: function() {
				$this.find('button').prop('disabled', false);
				$this.find('.wait').remove();
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(xhr.responseText);
			}
		});
	});
});