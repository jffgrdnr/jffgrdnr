jQuery(document).ready(function ($) {
    console.log("site.js loaded");
    $("#imageNav li").mouseenter(function () {
        var myData = $(this).data("id");
        console.log(myData);
        $("#mainNav li").removeClass("active");
        $("#mainNav li[data-id='" + myData + "']").addClass("active");
    });
    $("#imageNav li").mouseleave(function () {
        $("#mainNav li").removeClass("active");
    });
    $("#mainNav li").mouseenter(function () {
        if ($(window).width() > 1024) {
            var thisMenu = $(this).find(".extend");
            thisMenu.slideDown();
        }
    });
    $("#mainNav li").mouseleave(function () {
        if ($(window).width() > 1024) {
            var thisMenu = $(this).find(".extend");
            thisMenu.slideUp();
        }
    });
    $("#mobileNav li:not('.parent') a").click(function (){
        $("#mobileNav li a").removeClass("active");
        $(this).addClass("active");
        $("#mobileNav ul").slideUp();
    });
    $("#mobileNav li.parent").on("click", function () {
        var thisMenu = $(this).find(".extend"),
            otherMenus = $(".extend");
        if (thisMenu.hasClass("active")) {
            thisMenu.slideUp();
            thisMenu.removeClass("active");
        } else {
            otherMenus.slideUp();
            thisMenu.slideDown();
            thisMenu.addClass("active");
        }
    });
    $("#mobileTrigger").on("click", function () {
        var mobileMenu = $("#mobileNav"),
            mobileList = $("#mobileNav > ul");
        if (mobileMenu.hasClass("active")){
            mobileList.slideUp();
            mobileMenu.removeClass("active");
        } else {
            mobileList.slideDown();
            mobileMenu.addClass("active");
        }
    });
    
});


