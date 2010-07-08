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
	
	var slide = function(event,context,up) {
		var isClickable = ['title','event','preview'].some(function(clazz){return $(event.target).hasClass(clazz);});
		if(isClickable) {
			console.log(up ? 'slideUp' : 'slideDown');
			$('.preview',context)[ up ? 'slideUp' : 'slideDown']();
		}
	};
	
	$('.event').toggle(function(event){
		slide(event,this,false);
	},function(event){
		slide(event,this,true);
	});
	
});