(function ($) {
    "use strict";
    var Modal,
        version = 3,
        isIe8 = $('html').hasClass('ie8'),
        /* detect ie8 and earlier without $.browser for 1.11.0 */
        isIe9 = $('html').hasClass('ie9'); /* detect ie9 without $.browser for 1.11.0 */
    /* Use the newer version if the file is included twice and one version is newer than the other. */
    if ($.modal && version <= $.modal.version) {
        return false;
    }
    /* Setup modal object with defaults */
    Modal = {};
    Modal.defaults = {
        hideCloseBtn: false,
        closeOnBkgClick: true,
        closeOnEscape: true,
        fade: 200,
        isMarketing: false,
        showLoading: false,
        width: '',
        title: '',
        $trigger: false,
        onOpen: function () { return; },
        onClose: function () { return; }
    };
    Modal.isOpen = false;
    Modal.isTouchDevice = 'ontouchstart' in window || (window.DocumentTouch && document instanceof DocumentTouch);
    console.log(Modal.isTouchDevice);
    Modal.paddingLeftRight = 40; /* Left and right padding on desktop view */
    Modal.widthTransition = 410; /* Animation width time */
    Modal.openButton = false;
    /* Add marker to allow for styles changes based on whether the device supports touch or not */
    Modal.addToPage = function () {
        $('<section id="modal" aria-describedby="modalHeader" aria-expanded="true" role="alertdialog"><div id="modalCenter"></div><div id="modalContents" tabIndex="-1"><button class="closeBtn" id="modalClose" title="Close modal" type="button"></button></div></section>').appendTo('body');
        /* Add events */
        $('#modalClose').on('click.modal', function () {
            $('body').trigger('closeModal.modal');
        });
        $('#modalContents').on('click.modal', function () {
            Modal.stopClosing = true;
        });
    };
    Modal.setTitle = function (title, $currentModalContents) {
        var $modalContents = $('#modalContents');
        if ($currentModalContents === false) {
            $currentModalContents = $('#modalContents').find('.modalActive');
        }
        $modalContents.children('#modalHeader').remove();
        if (title) {
            $currentModalContents.before('<h4 id="modalHeader" class="modalHeader">' + title + '</h4>');
        }
        if (title || $currentModalContents.find('.modalHeader').length) {
            $modalContents.addClass('modalHasTitle');
        } else {
            $modalContents.removeClass('modalHasTitle');
        }
    };
    Modal.centerModal = function () {
        var windowHeight = $('html').height(),
            $modalContents = $('#modalContents'),
            modalHeight = $modalContents.outerHeight();
        $('#modalCenter').css({
            "margin-bottom": (-modalHeight / 2) + "px"
        });
        modalHeight += parseInt($modalContents.css('margin-top'), 10) + parseInt($modalContents.css('margin-bottom'), 10);
        if (Modal.isTouchDevice) {
            if (modalHeight <= windowHeight) {
                $('body, #modal').height(windowHeight);
            } else {
                $('body, #modal').height(modalHeight);
            }
        }
        $('#modal').scrollTop(0);
    };
    Modal.resizeModal = function (width) {
        Modal.setWidth(width);
        if (isIe8) {
            Modal.centerModal();
        } else {
            setTimeout(Modal.centerModal, Modal.widthTransition);
        }
    };
    Modal.setWidth = function (width) {
        /* Add width if there is one, reset width from previous modal */
        var $modalContents = $('#modalContents');
        if (width && String(width).indexOf("%") !== -1) {
            $modalContents.css('width', width);
        } else if (width) {
            if ($(window).width() < 768 && !$modalContents.hasClass('modalCustomPadding')) {
                Modal.paddingLeftRight = 20;
            }
            $modalContents.css('width', parseInt(width, 10) + Modal.paddingLeftRight);
        } else {
            $modalContents.css('width', '');
        }
    };
    Modal.showLoading = function (loading) {
        if (loading) {
            $('#modalContents').addClass('modalLoading');
        } else {
            $('#modalContents').removeClass('modalLoading');
        }
    };
    $.fn.modal = function (options) {
        var addEvents,
            closeModal,
            openModal,
            removeEvents,
            $this = this,
            settings = $.extend({}, Modal.defaults, options);
        settings.el = this; /* Need to save 'this' into settings to allow for modal after modal functionality */
        settings.windowPosition = [0, 0];
        Modal.stopClosing = false;
        Modal.isAnimating = false;
        /* Title should be passed in via the data-title attribute */
        /* These lines are temporary and are to fix past implementations. */
        if ($this.attr('title')) {
            $this.attr('data-title', $this.attr('title'));
            $this.removeAttr('title');
        }
        if (!settings.title && $this.attr('data-title')) {
            settings.title = $this.attr('data-title');
        }
        if (settings.$trigger) {
            settings.$trigger.attr('aria-controls', 'modal');
        }
        addEvents = function () {
            $('body').on('closeModal.modal', function () {
                $('#modal').animate({
                    opacity: 0
                }, (settings.fade / 2), 'linear', function () {
                    closeModal();
                });
            });
            $(window).on('resize.modal orientationchange.modal', function () {
                /* Without setTimeout here Android devices report the */
                /* incorrect height when trying to center the modal */
                setTimeout(Modal.centerModal, 300);
            });
            if (settings.closeOnBkgClick) {
                $('#modal').on('click.modal', function () {
                    /* Allow for events attached via live or on to propogate without closing modal */
                    if (!Modal.stopClosing && !Modal.isAnimating) {
                        $('body').trigger('closeModal.modal');
                    }
                    Modal.stopClosing = false;
                });
            }
            if (settings.closeOnEscape) {
                $('body').on('keydown.modal', function (event) {
                    if (!event.isDefaultPrevented() && event.keyCode && event.keyCode === 27) {
                        $('#modalContents').find(':focus').blur(); /* IE fix */
                        $('body').trigger('closeModal.modal');
                        event.preventDefault();
                        return false;
                    }
                });
            }
        };
        /* Remove specific modal events, title, and optional classes */
        closeModal = function (alreadyOpen) {
            var $modal = $('#modal');
            if (alreadyOpen !== true) {
                Modal.isOpen = false;
                $('html').removeClass('modalOpen');
                $('body').css('padding-right', '').height('');
                $modal.removeAttr('style');
                $('#modalCenter').removeClass('modalCentered');
                $('#modalContents').attr({
                    'style': '',
                    'role': ''
                });
                Modal.showLoading(false);
                window.scrollTo(settings.windowPosition[0], settings.windowPosition[1]);
                if (Modal.openButton) {
                    Modal.openButton
                        .removeAttr("aria-expanded") /* Focus on and remove aria-expanded from button that opened modal */
                        .focus();
                }
                $modal.removeAttr("aria-expanded");
                Modal.openButton = false;
            }
            removeEvents();
            if (Modal.previousSettings.el.data('dynamic')) {
                Modal.previousSettings.el.remove();
            } else {
                Modal.previousSettings.el.hide().removeClass('modalActive');
            }
            Modal.previousSettings.onClose($this);
            return Modal.previousSettings.windowPosition;
        };
        /* visible, focusable, and tabbable functions for accessibility when opening a modal */
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
        openModal = function () {
            var $modal,
                $modalContents,
                $modalImages,
                imageLength,
                screenWidth = $(window).width(),
                scrollbarWidth = 0,
                imageCount = 0;
            /* Add modal to page if not present */
            if (!$('#modal').length) {
                Modal.addToPage();
            }
            $modal = $('#modal');
            $modalContents = $('#modalContents');
            /* If a previous modal is open, close it, then store the proper scroll location */
            if (Modal.isOpen) {
                settings.windowPosition = closeModal(true);
            } else if ($(document).scrollTop() >= $('html').scrollTop()) {
                settings.windowPosition = [$(document).scrollLeft(), $(document).scrollTop()];
            } else {
                settings.windowPosition = [$('html').scrollLeft(), $('html').scrollTop()];
            }
            if (!Modal.isOpen) {
                $modal.attr("aria-expanded", "true");
                if (settings.$trigger) {
                    Modal.openButton = settings.$trigger.attr("aria-expanded", "true");
                }
            }
            /* Warn if they passed in an invalid selector */
            if ($this === undefined || $this.length === 0) {
                if (window.console) {
                    console.warn('Modal contents not found. Check your selector.');
                }
                return false;
            }
            /* Mark dynamic content to be able to remove it later */
            if ($('body').find($this).length > 0) {
                $this.data('dynamic', false);
            } else {
                $this.data('dynamic', true);
            }
            /* Move the element into the modal container */
            if ($this.parent() !== $modalContents) {
                $this.appendTo('#modalContents');
            }
            $this.show().addClass('modalActive');
            $('html').addClass('modalOpen');
            /* Focus on modal contents and remove event on blur */
            $("#modalContents")
                .attr('role', 'alertdialog')
                .focus()
                .on("keydown.modal", function (e) {
                    /* Tab only within modal */
                    var tabbableElements = $(this).find("*").filter(function () {
                            return tabbable(this);
                        }),
                        focusedElement = $(this).find(":focus");
                    if (e.keyCode === 9) {
                        if (e.shiftKey && focusedElement.get(0) === tabbableElements.first().get(0)) {
                            e.preventDefault();
                            tabbableElements.last().focus();
                        } else if (!e.shiftKey && focusedElement.get(0) === tabbableElements.last().get(0)) {
                            e.preventDefault();
                            tabbableElements.first().focus();
                        } else if ($("#modalContents:focus").length) {
                            e.preventDefault();
                            $("#modalClose").focus();
                        }
                    }
                });
            scrollbarWidth = $(window).width() - screenWidth;
            $('body').css('padding-right', (parseInt($('body').css('padding-right'), 10) + scrollbarWidth) + 'px');
            /* Scroll to top of page on touch devices */
            if (Modal.isTouchDevice) {
                window.scrollTo(0, 0);
            } else {
                window.scrollTo(settings.windowPosition[0], settings.windowPosition[1]);
            }
            Modal.setTitle(settings.title, $this);
            /* Add loading icon if requested */
            Modal.showLoading(settings.showLoading);
            /* Handle marketing options */
            if (settings.isMarketing || settings.useCustomPadding) {
                $modalContents.addClass('modalCustomPadding');
                Modal.paddingLeftRight = 0;
            } else {
                $modalContents.removeClass('modalCustomPadding');
                Modal.paddingLeftRight = 40;
            }
            /* Add width if passed in */
            Modal.setWidth(settings.width);
            /* Remove close button if necessary */
            if (settings.hideCloseBtn) {
                $modalContents.addClass('modalHideClose');
            } else {
                $modalContents.removeClass('modalHideClose');
            }
            /* Add Events that modal specific */
            addEvents();
            settings.onOpen($this);
            /* We don't call centerModal if modal is already open so CSS transition can complete first */
            /* But <= IE9 doesn't support transitions, so center immediately */
            if (!Modal.isOpen || isIe8 || isIe9) {
                $modal.show();
                Modal.centerModal();
            }
            /* Catch-most for when .load fails. Also fixes Android */
            setTimeout(Modal.centerModal, Modal.widthTransition);
            $modalImages = $this.is('img') ? $this : $this.find('img');
            imageLength = $modalImages.length;
            /* Recenter the modal after images load (many browsers) */
            if (imageLength > 0) {
                $modalImages.load(function () {
                    imageCount += 1;
                    if (imageCount === imageLength) {
                        Modal.centerModal();
                    }
                });
            }
            Modal.isAnimating = true;
            setTimeout(function () {
                Modal.isAnimating = false;
            }, settings.fade + 300);
            $modal.animate({
                opacity: 1
            }, settings.fade, 'linear', function () {
                /* .modalCentered Exists to prevent transition until after first load */
                $('#modalCenter').addClass('modalCentered');
                $('#modalContents').animate({
                    opacity: 1
                }, (settings.fade / 2), 'linear');
            });
            /* For modal after modal functionality */
            Modal.previousSettings = settings;
            /* Set marker that modal is open */
            Modal.isOpen = true;
        };
        removeEvents = function () {
            $('body, #modal').off('.modal');
            $(window).off('.modal');
        };
        /* Actually open the modal */
        openModal();
        return this;
    };
    $(function () {
        if (Modal.isTouchDevice) {
            $('html').addClass('touch');
        } else {
            $('html').addClass('noTouch');
        }
    });
    /* Publicly expose a few shorthand methods */
    $.modal = {};
    $.modal.center = function () {
        Modal.centerModal();
    };
    $.modal.close = function () {
        $('body').trigger('closeModal.modal');
    };
    $.modal.showLoading = function (loading) {
        Modal.showLoading(loading);
    };
    $.modal.resize = function (width) {
        Modal.resizeModal(width);
    };
    $.modal.title = function (title) {
        Modal.setTitle(title, false);
    };
    $.modal.preventClosing = function () {
        Modal.stopClosing = true;
    };
    $.modal.version = version;
}(jQuery));
