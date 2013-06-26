

//Retrive data from JSON and push it out
$.getJSON('http://jffgrdnr.com/json/data.json', function(data) {
	
	//Build out comments lists
	var attemptsResults="<ul>";

	for (var i in data.attempts){
		var promoterCount = "";
		var passiveCount = "";
		var detractorCount = "";
		var totalAttempts = "";
		var netPromoterScore = "";

		//Create list elements for each type of promoter score
		if(data.attempts[i].answers.score >= 9){
			attemptsResults+="<li class='promoterComment'>" + " <em>Person:</em> " + data.attempts[i].first + " " + data.attempts[i].last + " </br><em>Score:</em> " + data.attempts[i].answers.score + " </br><em>Comment:</em> " + data.attempts[i].answers.comment +"</li>";
		}
		else if(data.attempts[i].answers.score > 6 && data.attempts[i].answers.score < 9){
			attemptsResults+="<li class='passiveComment'>" + " <em>Person:</em> " + data.attempts[i].first + " " + data.attempts[i].last + " </br><em>Score:</em>  " + data.attempts[i].answers.score + " </br><em>Comment:</em> " + data.attempts[i].answers.comment +"</li>";
		}
		else if(data.attempts[i].answers.score <= 6){
			attemptsResults+="<li class='detractorComment'>" + " <em>Person:</em> " + data.attempts[i].first + " " + data.attempts[i].last + " </br><em>Score:</em>  " + data.attempts[i].answers.score + " </br><em>Comment:</em> " + data.attempts[i].answers.comment +"</li>";
		}

	}
	attemptsResults+="</ul>";

	//Insert the comment list items
	$("#commentList").html(attemptsResults);

	//Get promoter count from elements created (yes, it's ugly, I know :(
	promoterCount = $(".promoterComment").length;
	passiveCount = $(".passiveComment").length;
	detractorCount = $(".detractorComment").length;
	totalAttempts = promoterCount + passiveCount + detractorCount;
	promoterPercent = (promoterCount / totalAttempts) * 100;
	passivePercent =  (passiveCount / totalAttempts) * 100;
	detractorPercent = (detractorCount / totalAttempts) * 100;

	//Insert the score percentages
	$("#promoterPercent").html(promoterPercent + " %");
	$("#passivePercent").html(passivePercent + " %");
	$("#detractorPercent").html(detractorPercent + " %");

	//Give bar charts necessary width
	$(".promoter .bar").animate({
		width: promoterPercent}, 1000);
	$(".passive .bar").animate({
		width: passivePercent }, 1000);
	$(".detractor .bar").animate({
		width: detractorPercent }, 1000);

	//Calculate Net Promoter Score
	netPromoterScore = promoterPercent - detractorPercent;
	$(".score .content").html(netPromoterScore);


	//A little timer action for the net promoter score, just for fun :)
	(function($) {
    $.fn.countTo = function(options) {
        // merge the default plugin settings with the custom options
        options = $.extend({}, $.fn.countTo.defaults, options || {});

        // how many times to update the value, and how much to increment the value on each update
        var loops = Math.ceil(options.speed / options.refreshInterval),
            increment = (options.to - options.from) / loops;

        return $(this).each(function() {
            var _this = this,
                loopCount = 0,
                value = options.from,
                interval = setInterval(updateTimer, options.refreshInterval);

            function updateTimer() {
                value += increment;
                loopCount++;
                $(_this).html(value.toFixed(options.decimals));

                if (typeof(options.onUpdate) == 'function') {
                    options.onUpdate.call(_this, value);
                }

                if (loopCount >= loops) {
                    clearInterval(interval);
                    value = options.to;

                    if (typeof(options.onComplete) == 'function') {
                        options.onComplete.call(_this, value);
                    }
                }
            }
        });
    };

    $.fn.countTo.defaults = {
        from: 0,  // the number the element should start at
        to: 100,  // the number the element should end at
        speed: 1000,  // how long it should take to count between the target numbers
        refreshInterval: 100,  // how often the element should be updated
        decimals: 0,  // the number of decimal places to show
        onUpdate: null,  // callback method for every time the element is updated,
        onComplete: null,  // callback method for when the element finishes updating
    };
	})(jQuery);

	jQuery(function($) {
        $('.score .content').countTo({
            from: 0,
            to: netPromoterScore,
            speed: 1000,
            refreshInterval: 50,
            onComplete: function(value) {
                console.debug(this);
            }
        });
    });


});

$(document).ready(function(){
	$("li.breakdown").click(function(){
		$(".scoreHeader").show();
		//Hide all before showing the correct one
		$("#commentList li").hide();
		//Remove selected class from all before applying it
		$(".scoreBreakdown li").removeClass("selected");
		if ($(this).hasClass("promoter")){
			$(".promoterComment").slideDown();
		}
		else if ($(this).hasClass("passive")){
			$(".passiveComment").slideDown();
		}
		else if ($(this).hasClass("detractor")){
			$(".detractorComment").slideDown();
	
		}
		$(this).addClass("selected");
	});
});

