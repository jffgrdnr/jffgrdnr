/****************************************
	/js/v1/slider.js
*****************************************/
(function ($) {
	$.fn.slider = function () {
		return this.each(function () {
			this
				.on('change.form', function () {
					var $this = $(this);
					$this
						.next('label')
						/* Make certain each slider element gets only one click event */
						.one('mousemove.form', function () {
							$this.blur();
						});
				})
				.find('.sliderHandle')
				.on('mousedown.form touchstart.form', 'span', function (e) {
					var newX = false,
						lastPageX = false,
						sideSpacing = 4,
						$sliderBtn = $(this),
						$sliderHandle = $sliderBtn.parent(),
						inputId = $sliderHandle.closest('label').attr('for'),
						$slider = $('#' + inputId),
						currentlyChecked = $slider.prop('checked'),
						selectorToThisSlider = 'label[for="' + inputId + '"] .sliderHandle',
						currentLeftX = $sliderBtn.position().left,
						/* Getting native event x coordinate, whether desktop or touch enabled device */
						startPageX = e.originalEvent && e.originalEvent.touches ? e.originalEvent.touches[0].pageX : e.pageX,
						minX = sideSpacing,
						maxX = parseInt($sliderHandle.css('width'), 10) - parseInt($sliderBtn.css('width'), 10) - sideSpacing;
					function slide() {
						$sliderHandle.removeClass('sliding slidingToOn slidingToOff').off('.slider');
						$sliderBtn.css('left', '');
						$(document).off('.slider');
						setTimeout(function () {
							/* Set current */
							$slider.prop('checked', (Math.abs(startPageX - lastPageX) / (maxX - minX) > .3) || !newX ? !currentlyChecked : currentlyChecked);
						});
						return false;
					}
					$sliderHandle.addClass('sliding').on('mouseleave.form.slider', slide);
					$(document)
						.on('mousemove.form.slider touchmove.form.slider', selectorToThisSlider, function (e) {
							lastPageX = e.originalEvent && e.originalEvent.touches ? e.originalEvent.touches[0].pageX : e.pageX;
							newX = currentLeftX + lastPageX - startPageX;
							if (newX <= minX) {
								newX = minX;
							} else if (newX >= maxX) {
								newX = maxX;
							}
							if ((currentLeftX === minX && (newX - sideSpacing || 1) / (maxX - minX) > .3) || (currentLeftX === maxX && (newX - sideSpacing) / (maxX - minX) > .7)) {
								$sliderHandle.addClass('slidingToOn').removeClass('slidingToOff');
							} else {
								$sliderHandle.addClass('slidingToOff').removeClass('slidingToOn');
							}
							$sliderBtn.css('left', newX);
							return false;
						})
						.on('mouseup.form.slider touchend.form.slider', slide);
					return false;
				});
		});
	};
})(jQuery);
/* Auto instantiating only those not explicitly excluded */
$(function (){
	$('.slider:not([data-auto-instantiate="off"])').slider();
});