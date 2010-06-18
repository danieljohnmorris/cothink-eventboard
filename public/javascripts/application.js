// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function() {
	$("a.star").hover(function() {
		$("img", this).attr("src", "/images/star.png");
	}, function() {
		$("img", this).attr("src","/images/star_dim.png");
	});
});