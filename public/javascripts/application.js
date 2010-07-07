// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function() {	
	// Highlight starred on hover!
	$(".star a.starred").hover(function() {
		$("img", this).attr("src", "/images/starred.gif");
	}, function() {
		$("img", this).attr("src", "/images/starred_dim.gif");
	});

	// Highlight star on hover!
	$(".star a.unstarred").hover(function() {
		$("img", this).attr("src", "/images/star.gif");
	}, function() {
		$("img", this).attr("src", "/images/star_dim.gif");
	});
	
	$('.event').hover(function(){
		var self      = this;
		$(self).data('stillOver',true);
		setTimeout(function(){
			if($(self).data('stillOver')) $('.preview',self).slideDown();
		},400);
	},function(){
		$(this).data('stillOver',false);
		$('.preview',this).slideUp();
	});
	
});