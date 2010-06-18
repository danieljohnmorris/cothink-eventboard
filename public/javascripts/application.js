// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function() {
	$("a.starred").hover(function() {
		$("img.star", this).attr("src", "/images/star.png");
	}, function() {
		$("img.star", this).attr("src","/images/star_dimmed.gif");
	});
});