/****************************************
	/js/v1/callout.js
*****************************************/
;(function ($) {
	"use strict";
	/* Callout defaults */
	var defaults = {
		'style': 'light', /* 'light' (default) | 'dark' | 'alt' */
		'type': 'click', /* 'click' (default) | 'hover' | 'cursor' (follows mouse) | 'custom' (bind your own events) */
		'content': '', /* Accepts string / text, HTML, or element selector */
		'classes': '', /* Class(es) to add to #calloutContent (separate with space, no dot) */
		'calloutClasses': '', /* Class(es) to add to .callout (separate with space, no dot) */
		'disableAutofocusOnOpen': false, /* Boolean. Set to true to manually handle focus on open */
		'position': 'bottom', /* Position of callout relative to trigger: 'bottom' (default) | 'left' | 'right' */
		'align': 'center', /* Direction callout "flows" to (relative to trigger): 'center' (default) | 'left' | 'right' (Does not apply to { position: 'left' } or { position: 'right' }) */
		'hidePointer': false, /* Set to true to hide pointer */
		'keepContentInPlace': true, /* True keeps content in DOM; False removes it from DOM */
		'showDelay': 100, /* Show delay time in ms for 'hover' callouts */
		'hideDelay': 100, /* Hide delay time in ms for 'hover' callouts */
		'onOpen': false, /* function ($trigger) { } Callback to run *before* callout opens */
		'onAfterOpen': false, /* function ($trigger) { } Callback to run *after* callout opens */
		'onClose': false /* function ($trigger) { } Callback to run *before* callout closes */
	},
	closeTimer,
	showDelayTimer,
	isTouchDevice = 'ontouchstart' in window || (window.DocumentTouch && document instanceof DocumentTouch);
	$.fn.callout = function (options) {
		return this.each(function () {
			var $trigger = $(this),
				$window = $(window),
				isInputField,
				hideDelayTimer,
				calloutWrap = $('#callout'),
				calloutContent = $('#calloutContent'),
				calloutPointer = $('#calloutPointer'),
				calloutDefaultWidth,
				calloutMinWidth = Math.max(240, parseInt(calloutWrap.css('min-width'), 10)),
				modalScrollPos = 0,
				windowPadding = 8, /* Space callouts leave on each side of window */
				calloutTouches = {},
				settings = $.extend({}, defaults, options);
			/* visible, focusable, and tabbable functions for accessibility when opening a callout */
			function visible(element) {
				return $.expr.filters.visible(element) &&
					!$(element).parents().andSelf().filter(function () {
						return $.css(this, "visibility") === "hidden";
					}).length;
			}
			function focusable(element, isTabIndexNotNaN) {
				var map,
					mapName,
					img,
					nodeName = element.nodeName.toLowerCase();
				if ("area" === nodeName) {
					map = element.parentNode;
					mapName = map.name;
					if (!element.href || !mapName || map.nodeName.toLowerCase() !== "map") {
						return false;
					}
					img = $("img[usemap=#" + mapName + "]")[0];
					return !!img && visible(img);
				}
				return (/input|select|textarea|button|object/.test(nodeName) ? !element.disabled : "a" === nodeName ? element.href || isTabIndexNotNaN : isTabIndexNotNaN) && visible(element);
			}
			function tabbable(element) {
				var tabIndex = $.attr(element, "tabindex"),
					isTabIndexNaN = isNaN(tabIndex);
				return (isTabIndexNaN || tabIndex >= 0) && focusable(element, !isTabIndexNaN);
			}
			function resetCalloutContent() {
				calloutWrap
					.add(calloutContent)
					.add(calloutPointer)
					.removeAttr('style class');
				calloutContent
					.attr("role", "")
					.off("keydown.callout")
					.addClass('calloutContent');
				calloutWrap.addClass('callout');
				calloutPointer.addClass('calloutPointer');
				$('#modal, html').off('.callout');
				calloutWrap
					.add('html')
					.off('.callout');
			}
			function hideCallout(runOnClose) {
				var $openCalloutTrigger = $('.calloutTrigger.active'),
					openCalloutSettings = $openCalloutTrigger.data('callout-settings'),
					inModal = $openCalloutTrigger.closest('#modal').length > 0;
				if (!$openCalloutTrigger.length) { /* Callout was already closed */
					return;
				}
				if (runOnClose && openCalloutSettings.onClose !== false) {
					openCalloutSettings.onClose($openCalloutTrigger);
				}
				resetCalloutContent();
				if (openCalloutSettings.keepContentInPlace) {
					$('#calloutContentPlaceholder').replaceWith($(openCalloutSettings.content));
				} else {
					calloutContent
						.children()
						.remove();
				}
				/* Deactivate active trigger */
				$openCalloutTrigger.removeClass('hover active');
			}
			function positionCallout(position, align, lastRun) {
				var windowWidth = $window.outerWidth(),
					triggerHeight = $trigger.outerHeight(),
					triggerWidth = $trigger.outerWidth(),
					triggerPos = $trigger.offset(),
					leftOfTrigger = triggerPos.left,
					centerOfTrigger = leftOfTrigger + (triggerWidth / 2),
					rightOfTrigger = leftOfTrigger + triggerWidth,
					topOfTrigger = triggerPos.top,
					bottomOfTrigger = topOfTrigger + triggerHeight,
					calloutTempWidth = calloutContent.outerWidth(),
					calloutInputOffset = 16, /* from CSS: .callout margin-left + .calloutContent left (for .calloutCursor) */
					calloutOffset = 24, /* from CSS: .calloutContent left or right value */
					inModal = $trigger.closest('#modal').length > 0,
					calloutContentHeight,
					currentMarginBottom,
					newMarginBottom,
					calloutIsPastModalArea;
				/* Reset position */
				calloutWrap
					.removeClass('calloutPositionBottom calloutPositionTop calloutPositionLeft calloutPositionRight calloutAlignLeft calloutAlignCenter calloutAlignMiddle calloutAlignRight calloutAlignTop')
					.add(calloutContent)
					.add(calloutPointer)
					.removeAttr('style');
				/* Set default width */
				calloutContent.css({ 'width': calloutDefaultWidth });
				if (isInputField) {
					/* Input field tooltip */
					calloutContent.css({
						'max-width': triggerWidth,
						'width': calloutDefaultWidth
					});
					calloutWrap
						.addClass('calloutPositionBottom')
						.css({
							'left': leftOfTrigger,
							'top': bottomOfTrigger
						});
				} else if (settings.type === 'cursor') {
					/* Cursor callout */
					calloutContent.css('width', calloutTempWidth);
					$trigger.on('mousemove.callout', function (e) {
						calloutWrap
							.css({
								'left': Math.max(calloutInputOffset + windowPadding, Math.min(e.pageX, windowWidth - windowPadding - calloutContent.outerWidth() + calloutInputOffset)),
								'top': e.pageY
							});
						if (e.pageX > windowWidth + calloutInputOffset - calloutContent.outerWidth()) {
							calloutPointer.css({ 'left': Math.min(e.pageX - calloutWrap.offset().left - (calloutInputOffset / 2), calloutContent.outerWidth() - 48) }); /* 48 = keeps pointer centered inside of callout */
						} else {
							calloutPointer.css({ 'left': 0 });
						}
					});
					calloutWrap.addClass('calloutPositionBottom');
				} else {
					/* Sets callout's default position */
					if (!position) {
						position = settings.position;
					}
					/* Sets callout's default alignment */
					if (!align) {
						align = settings.align;
					}
					calloutWrap.css({ 'left': centerOfTrigger });
					/* Align callout content */
					switch (align) {
						case ('left'):
							calloutWrap.addClass('calloutAlignLeft');
							calloutContent.css({
								'max-width': Math.max(centerOfTrigger + calloutOffset - windowPadding, calloutMinWidth),
								'right': (triggerWidth < parseInt(calloutPointer.css('width'), 10)) ? -calloutOffset : -triggerWidth / 2
							});
							break;
						case ('right'):
							calloutWrap.addClass('calloutAlignRight');
							calloutContent.css({
								'left': -triggerWidth / 2,
								'max-width': Math.max(windowWidth - centerOfTrigger + calloutOffset - windowPadding, calloutMinWidth)
							});
							break;
						default:
							if (position === 'left' || position === 'right') {
								switch (align) {
									case ('top'):
										calloutWrap
										.addClass('calloutAlignTop')
										.css({ 'top': topOfTrigger + triggerHeight / 2 });
										calloutContent.css({ 'top': - triggerHeight / 2 });
										break;
									case ('bottom'):
										calloutWrap
										.addClass('calloutAlignBottom')
										.css({ 'top': bottomOfTrigger - triggerHeight / 2 });
										calloutContent.css({ 'bottom': - triggerHeight / 2 });
										break;
									default:
										calloutWrap
										.addClass('calloutAlignMiddle')
										.css({ 'top': topOfTrigger + (triggerHeight / 2) - (calloutWrap.outerHeight() / 2) });
										calloutContent.css({ 'top': '-' + (calloutContent.outerHeight() / 2) + 'px' });
										break;
								}
							} else {
								calloutWrap.addClass('calloutAlignCenter');
								calloutContent.css({ 'left': -Math.abs(calloutContent.outerWidth() / 2) });
								/* Tweak if off page right */
								if (calloutContent.offset().left + calloutContent.outerWidth() - $(document).scrollLeft() > windowWidth) {
									calloutContent.css({
										'left': -Math.abs(calloutContent.outerWidth() / 2) + (windowWidth - calloutContent.offset().left - calloutContent.outerWidth()) + $(document).scrollLeft() - windowPadding,
										'max-width': windowWidth - (windowPadding * 2)
									});
								}
								/* Tweak if off page left */
								if (calloutContent.offset().left < 0) {
									calloutContent.css({
										'left': -Math.abs(leftOfTrigger) - (triggerWidth / 2) + windowPadding,
										'max-width': windowWidth - (windowPadding * 2)
									});
								}
							}
							break;
					}
					/* Position the callout content */
					switch (position) {
						case 'left':
							calloutWrap
								.addClass('calloutPositionLeft')
								.css({ 'left': leftOfTrigger - calloutWrap.outerWidth() });
							calloutContent.css({ 'max-width': Math.max(leftOfTrigger - windowPadding - parseInt(calloutContent.css('margin-left'), 10) - parseInt(calloutContent.css('margin-right'), 10), calloutMinWidth) });
							break;
						case 'right':
							calloutWrap
								.addClass('calloutPositionRight')
								.css({ 'left': rightOfTrigger });
							calloutContent.css({ 'max-width': Math.max(windowWidth - rightOfTrigger - windowPadding - parseInt(calloutContent.css('margin-left'), 10) - parseInt(calloutContent.css('margin-right'), 10), calloutMinWidth) });
							break;
						case 'top':
							calloutWrap
								.addClass('calloutPositionTop')
								.css({ 'top': topOfTrigger - calloutWrap.outerHeight() });
							break;
						default:
							calloutWrap
								.addClass('calloutPositionBottom')
								.css({ 'top': bottomOfTrigger });
							break;
					}
					/* Tweak vertical position if out of viewport */
					calloutContentHeight = calloutContent.outerHeight();
					/* If callout is off-bottom... */
					if (calloutContent.offset().top + calloutContentHeight > $window.scrollTop() + $window.outerHeight()) {
						if (position === 'left' || position === 'right') {
							calloutContent.css({ 'top': Math.max(parseInt(calloutContent.css('top'), 10) - (calloutContent.offset().top + calloutContentHeight - $window.scrollTop() - $window.outerHeight() + windowPadding), -Math.abs(calloutContentHeight - calloutOffset)) });
						}
					}
					/* If callout is off-top... */
					if (calloutContent.offset().top < $window.scrollTop()) {
						if (position === 'left' || position === 'right') {
							calloutContent.css({ 'top': Math.min(parseInt(calloutContent.css('top'), 10) + ($window.scrollTop() - calloutContent.offset().top + windowPadding), -Math.abs(calloutOffset)) });
						}
						/* If position === top, position bottom */
						if (position === 'top' && !lastRun) {
							positionCallout('bottom', 'center', true);
						}
					}
					/* Tweak horizontal position if out of viewport */
					if (calloutContent.offset().left < 0 || windowWidth < calloutContent.offset().left + calloutContent.outerWidth()) {
						if (!lastRun) {
							positionCallout((settings.position === 'left' || settings.position === 'right') ? 'bottom' : settings.position, 'center', true);
						}
					}
					/* Adjust modal height so callout is fully visible. */
					if (inModal && !lastRun && calloutWrap.hasClass('calloutPositionBottom')) {
						if (isTouchDevice) {
							calloutIsPastModalArea = calloutContent.offset().top + calloutContent.outerHeight() > $('#modal').height();
						} else {
							calloutIsPastModalArea = $('#modal').scrollTop() + calloutContent.offset().top + calloutContent.outerHeight() - Math.max($('body').scrollTop(), $('html').scrollTop()) > Math.max($('#modal').outerHeight(), $('#modalContents').outerHeight());
						}
						if (calloutIsPastModalArea) {
							positionCallout('top', align, true);
						}
					}
				}
			}
			function resetShowTimer() {
				if (showDelayTimer) {
					clearTimeout(showDelayTimer);
					showDelayTimer = null;
				}
			}
			function hideDelay() {
				hideDelayTimer = setTimeout(function () {
					if (!$('.calloutTrigger').hasClass('hover') && !calloutWrap.hasClass('hover')) {
						resetShowTimer();
						hideCallout(true);
					}
				}, settings.hideDelay);
			}
			function resetHideTimer() {
				if (hideDelayTimer) {
					clearTimeout(hideDelayTimer);
					hideDelayTimer = null;
				}
			}
			function focusOnCallout() {
				var newScrollTop,
					oldScrollTop;
				/* Focus on callout contents and remove event on blur if it is not an input */
				if ($trigger.is('input, textarea')) {
					return;
				}
				oldScrollTop = Math.max($('body').scrollTop(), $('html').scrollTop());
				$("#calloutContent")
					.focus()
					.off("keydown.callout")
					.on("keydown.callout", function (e) {
						var tabbableElements,
							focusedElement,
							$this = $(this);
						if (e.keyCode === 9) {
							tabbableElements = $this.find("*").filter(function () {
								return tabbable(this);
							});
							focusedElement = $this.find(":focus") || $this;
							if ((e.shiftKey && (focusedElement.get(0) === tabbableElements.first().get(0) || $("#calloutContent:focus").length))
								|| (!e.shiftKey && focusedElement.get(0) === tabbableElements.last().get(0))
								|| (focusedElement.eq(0).is('[type="radio"]')
									&& ((e.shiftKey && focusedElement.eq(0).attr("name") === tabbableElements.first().eq(0).attr("name"))
										|| (!e.shiftKey && focusedElement.eq(0).attr("name") === tabbableElements.last().eq(0).attr("name"))))) {
								$trigger.focus();
								hideCallout(true);
							}
						}
					});
				newScrollTop = Math.max($('body').scrollTop(), $('html').scrollTop());
				if (newScrollTop !== oldScrollTop) {
					$('body, html').scrollTop(oldScrollTop);
				}
			}
			function showCallout() {
				var preventClose = false;
				clearTimeout(closeTimer);
				/* Store settings onto trigger for use in the hideCallout function */
				$trigger.data('callout-settings', settings);
				/* Add content to callout */
				if (settings.keepContentInPlace) {
					$trigger.data('callout-content').before('<span id="calloutContentPlaceholder" style="display:none;"></span>');
				}
				calloutContent.html($trigger.data('callout-content'));
				/* Add html click event */
				if (!calloutWrap.hasClass('calloutTypeCursor') && settings.type !== 'custom') {
					$('html')
						.on('touchstart.callout', function (e) {
							calloutTouches.x = e.originalEvent.touches ? e.originalEvent.touches[0].pageX : e.pageX;
							calloutTouches.y = e.originalEvent.touches ? e.originalEvent.touches[0].pageY : e.pageY;
						})
						.on('click.callout touchend.callout', function (e) {
							if (!preventClose && !$(e.srcElement || e.target || e.originalEvent.originalTarget).closest('#callout').length) {
								if (e.type === 'click') {
									hideCallout(true);
								} else if (!isInputField && Math.max(Math.abs(calloutTouches.x - e.originalEvent.changedTouches[0].pageX), Math.abs(calloutTouches.y - e.originalEvent.changedTouches[0].pageY)) < 5) {
									closeTimer = setTimeout(function () {
										hideCallout(true);
										preventClose = false;
									}, 500);
									preventClose = true;
								}
							}
						});
				}
				/* Add callout hover events */
				if (settings.type === 'hover' || settings.type === 'cursor') {
					calloutWrap
						.on('mouseenter.callout', function () {
							calloutWrap.addClass('hover');
							resetHideTimer();
						})
						.on('mouseleave.callout', function () {
							calloutWrap.removeClass('hover');
							hideDelay();
						});
				}
				/* Run onOpen */
				if (settings.onOpen !== false) {
					settings.onOpen($trigger);
				}
				/* Set callout style */
				if (settings.style === 'dark') {
					calloutWrap.addClass('calloutStyleDark bgDark');
				} else if (settings.style === 'alt') {
					calloutWrap.addClass('calloutStyleAlt');
				}
				/* Add custom classes */
				if (settings.classes) {
					calloutContent.addClass(settings.classes);
				}
				if (settings.calloutClasses) {
					calloutWrap.addClass(settings.calloutClasses);
				}
				if ($trigger.attr('data-callout-classes')) {
					calloutContent.addClass($trigger.attr('data-callout-classes'));
				}
				if ($trigger.attr('data-callout-wrap-classes')) {
					calloutContent.addClass($trigger.attr('data-callout-wrap-classes'));
				}
				/* Show / hide pointer */
				if (settings.hidePointer) {
					calloutWrap.addClass('calloutHidePointer');
				}
				/* Set original width (once) */
				if (!calloutDefaultWidth || $trigger.data('callout-updated')) {
					if (isInputField) {
						/* Removes default max-width from CSS */
						calloutContent.css({ 'max-width': 'none' });
					}
					calloutDefaultWidth = Math.ceil(calloutWrap
						.css({
							'display': 'block',
							'left': '0',
							'top': '0',
							'width': 'auto'
						})
						.find(calloutContent)
						.css({
							'position': 'relative',
							'width': 'auto'
						})
						[0].getBoundingClientRect().width);
					calloutWrap
						.add(calloutContent)
						.removeAttr('style');
					$trigger.removeData('callout-updated');
				}
				/* Activate callout and position */
				calloutWrap
					.addClass('active')
					.on('click.callout', function (e) {
						e.stopPropagation();
					})
					.on('click.callout', '.calloutMenu .link', function () {
						$(this).one('mouseleave.callout', function () {
							$(this).blur(); /* Remove focus per UX */
						});
					});
				/* Callout type */
				if (isInputField) {
					calloutWrap.addClass('calloutTypeInput');
				}
				if (settings.type === 'cursor') {
					calloutWrap.addClass('calloutTypeCursor');
					calloutContent.css({ 'width': Math.min(parseInt(calloutDefaultWidth, 10), $window.outerWidth() - (windowPadding * 2)) });
				}
				positionCallout();
				/* Adjust z-index if inside of modal */
				if ($trigger.closest('#modal').length > 0) {
					modalScrollPos = $('#modal').scrollTop();
					calloutWrap
						.css({
							'margin-top': -modalScrollPos,
							'top': '+=' + modalScrollPos,
							'z-index': 1010
						});
					/* Scroll event inside modal */
					$('#modal').on('scroll.callout', function () {
						calloutWrap.css({ 'margin-top': -$(this).scrollTop() });
					});
				}
				$trigger.addClass('hover active');
				if ($('#calloutContent').find("*").filter(function () { return tabbable(this); }).length) {
					$('#calloutContent').attr("role", "alertdialog");
					if (settings.type !== 'hover' && settings.disableAutofocusOnOpen !== true) {
						focusOnCallout();
					}
				} else {
					$('#calloutContent').attr("role", "alert");
				}
				if (settings.onAfterOpen !== false) {
					settings.onAfterOpen($trigger);
				}
			}
			function destroyCallout() {
				resetShowTimer();
				if ($trigger.hasClass('active')) {
					hideCallout(true);
				}
				if (!$('.calloutTrigger.active').length && $('#callout.active').length && $('#calloutContent:empty').length) {
					resetCalloutContent();
				}
				$trigger
					.off('.callout')
					.removeClass('calloutTrigger iconAfter iconArrowSmallDownAfter')
					.removeData('callout-content');
			}
			function showDelay() {
				showDelayTimer = setTimeout(function () {
					if ($('.calloutTrigger.active').not($trigger).length) {
						hideCallout(true);
					}
					if ($trigger.hasClass('hover') && !$trigger.hasClass('active') && !calloutWrap.hasClass('active')) {
						resetHideTimer();
						showCallout();
					}
				}, Math.max(100, settings.showDelay));
			}
			function addEvents() {
				var preventClick = true;
				if (isInputField) {
					$trigger.on(($trigger.is('select') ? 'mouseenter.callout ' : '') + 'focus.callout open.callout', function () {
						showCallout();
					}).on('blur.callout close.callout', function () {
						hideCallout(true);
					}).on('click.callout', function (e) {
						e.stopPropagation();
					});
				} else if (settings.type === 'custom') {
					$trigger
						.on('open.callout', function () {
							showCallout();
						})
						.on('close.callout', function () {
							hideCallout(true);
						});
				} else if (settings.type === 'hover' || settings.type === 'cursor') {
					$trigger
						.on('mouseenter.callout open.callout', function () {
							$trigger.addClass('hover');
							showDelay();
							preventClick = true;
							setTimeout(function () {
								preventClick = false;
							}, 600); /* Magic number after 300ms delay on touch devices */
						})
						.on('mouseleave.callout close.callout', function () {
							$trigger.removeClass('hover');
							hideDelay();
						});
					if (isTouchDevice) {
						/* If you want the hover callout to be triggered separately
							than the click event, you must use event delegation to
							bind your click event. */
						$trigger.on('click.callout', function () {
							if (preventClick) {
								return false;
							}
						});
					}
				} else {
					$trigger
						.on('click.callout', function (e) {
							if ($trigger.hasClass('active')) {
								/* Hide if $trigger is active */
								hideCallout(true);
							} else {
								/* Otherwise close other callout, then show */
								if (calloutWrap.hasClass('active')) {
									hideCallout(true);
								}
								showCallout();
							}
							e.stopPropagation();
							if ($trigger.is('a')) {
								e.preventDefault();
							}
						})
						.on('open.callout', function () {
							if ($trigger.hasClass('active')) {
								return;
							}
							/* Otherwise close other callout, then show */
							if (calloutWrap.hasClass('active')) {
								hideCallout(true);
							}
							showCallout();
						})
						.on('close.callout', function () {
							hideCallout(true);
						});
				}
				/* Reposition on browser resize and hide callout */
				$window.on((isTouchDevice ? 'orientationchange' : 'resize') + '.callout', function () {
					if (calloutWrap.hasClass('active')) {
						hideCallout(false);
					}
				});
			}
			function initCallout() {
				/* Check where callout content comes from */
				if (settings.content) {
					try {
						if ($(settings.content).closest('body').length) { /* Don't use .find() due to differences between jQuery 1.7 and 1.11 */
							$trigger.data('callout-content', $(settings.content));
							$trigger.data('callout-content').addClass('calloutDomContent');
						} else {
							settings.keepContentInPlace = false;
							$trigger.data('callout-content', settings.content);
						}
					} catch (e) {
						settings.content = "<div>" + settings.content + "</div>";
						settings.keepContentInPlace = false;
						$trigger.data('callout-content', settings.content);
					}
				} else if ($trigger.attr('data-callout')) {
					settings.keepContentInPlace = false;
					$trigger.data('callout-content', $trigger.attr('data-callout'));
				} else if ($trigger.attr('title')) {
					settings.keepContentInPlace = false;
					$trigger.data('callout-content', $trigger.attr('title'));
				} else {
					return true;
				}
				/* Re-initialize if already initialized */
				$trigger
					.off('.callout')
					.addClass('calloutTrigger')
					.not('.calloutTooltip')
					.not('.iconLeaf, .iconShakyLeaf, .iconBars, input, select, textarea, .calloutTriggerNoArrow')
					.addClass('iconAfter iconArrowSmallDownAfter')
					.not('.ancBtn')
					.not('.photo')
					.not(':empty')
					.filter(function () {
						var $e = $(this),
							$c = $e.children(),
							$l = $c.length,
							$f = $c.first();
						return $l ? !($l === 1 && $f.is("span") && $.trim($e.text()) === $.trim($f.text())) : $.trim($e.text());
					})
					.wrapInner('<span>');
				/* Settings for form input */
				if ($trigger.is('input, select, textarea')) {
					isInputField = true;
					settings.style = 'dark';
					settings.hidePointer = true;
					settings.position = 'bottom';
				}
				/* Check HTML and update settings */
				if ($trigger.hasClass('calloutStyleDark')) {
					settings.style = 'dark';
				} else if ($trigger.hasClass('calloutStyleAlt')) {
					settings.style = 'alt';
				}
				if ($trigger.hasClass('calloutTypeHover')) {
					settings.type = 'hover';
				} else if ($trigger.hasClass('calloutTypeCursor')) {
					settings.type = 'cursor';
				} else if ($trigger.hasClass('calloutTypeCustom')) {
					settings.type = 'custom';
				}
				if ($trigger.hasClass('calloutPositionTop')) {
					settings.position = 'top';
				} else if ($trigger.hasClass('calloutPositionRight')) {
					settings.position = 'right';
				} else if ($trigger.hasClass('calloutPositionLeft')) {
					settings.position = 'left';
				}
				if ($trigger.hasClass('calloutAlignLeft')) {
					settings.align = 'left';
				} else if ($trigger.hasClass('calloutAlignRight')) {
					settings.align = 'right';
				} else if ($trigger.hasClass('calloutAlignTop')) {
					settings.align = 'top';
				} else if ($trigger.hasClass('calloutAlignBottom')) {
					settings.align = 'bottom';
				}
				if ($trigger.hasClass('calloutHidePointer')) {
					settings.hidePointer = true;
				}
				/* Add icon to tooltips */
				if ($trigger.hasClass('calloutTooltip')) {
					$trigger
						.addClass('link iconAfter iconHelpAfter')
						.not(':has(span)')
						.not(':empty')
						.wrapInner('<span>');
				}
				// /* Settings for left & right positioned callouts */
				// if (settings.position === 'left' || settings.position === 'right') {
				// 	settings.align = 'center';
				// }
				/* Add events */
				addEvents();
			}
			/* Check options or initialize */
			switch (options) {
				case 'destroy':
					destroyCallout();
					break;
				case 'open':
					$trigger.trigger('open.callout');
					break;
				case 'close':
					$trigger.trigger('close.callout');
					break;
				case 'focus':
					focusOnCallout();
					break;
				default:
					initCallout();
					break;
			}
		});
	};
	$.callout = {};
	$.callout.close = function () {
		var $trigger = $('.calloutTrigger.active');
		if ($trigger.length) {
			$trigger.trigger('close.callout')
		}
	};
	$.callout.content = function ($trigger, newContent) {
		$trigger
			.data('callout-content', newContent)
			.data('callout-updated', true);
		if ($trigger.hasClass('active')) {
			$('#calloutContent').html(newContent);
		}
	};
	/* Initialize the callout */
	$(function () {
		/* Add callout to page */
		if (!$('#callout').length) {
			$('<div id="callout" class="callout"><div id="calloutContent" class="calloutContent" tabindex="-1"></div><div id="calloutPointer" class="calloutPointer"><div id="calloutPointerShadow" class="calloutPointerShadow"></div></div></div>').appendTo('body');
		}
		/* Actually initialize anything with the data-callout attr */
		$('[data-callout]').callout();
	});
}(jQuery));