$(document).ready(function(){
	$(".in_search").focus(function () {
		if ( $(this).val() == 'i.e: Design, London')
			$(this).val('');
	}); 
	
	$("#popup").hide();
	
	$('.bannerimages').innerfade({ 
	speed: 750, 
	timeout: 4000, 
	containerheight: '281px'
	});
					
					
});

function parseRequest(data) {
	var child 	= data.documentElement.firstChild;
	while (child) {
		if ('cmd' == child.nodeName) {
			var obj = {};
			xajax.parseAttributes(child,obj);
			
			if( obj.cmd=='as' )
				eval( 'document.getElementById("'+obj.id+'").'+obj.property+'="'+child.firstChild.nodeValue+'";' );
		}
			
		child = child.nextSibling;
	}
}

function popup( action, data, width, height ) {
	$("#popup").hide();

	//if( !ajax_controller )
	//	ajax_controller = 'xajax'

	//data.xjxfun		= ajax_action + 'Ajax';
	//data.xjxr		= 1233759944231;

	//$.post( '/'+ajax_controller+'/xajax', data, function(data){ parseRequest(data) }, "xml" )
	eval( "xajax_" + action + "('" + data + "')" );
	$("#popup").show();
// 	$("#popup").css('width','1000px');
// 	$("#popinner").css('width','1000px');
}


function closepopup() {
	$("#popup").hide();
	$("#popinner").html('');
}


function make_address() {
	d.getElementById('address_search').value = ''
	
	if( d.getElementById('postcode').value )
		d.getElementById('address_search').value += ( d.getElementById('address_search').value ? ', ' : '' ) + d.getElementById('postcode').value;

	if( d.getElementById('country').value )
		d.getElementById('address_search').value += ( d.getElementById('address_search').value ? ', ' : '' ) + countries[d.getElementById('country').value];

	move(function(stat){
		if(stat) {
			d.getElementById('submit').style.display = 'block';
			d.getElementById('form').action = '/user/savesignup';
		}
		else {
			d.getElementById('submit').style.display = 'none';
			d.getElementById('form').action = '';
		}
	});
}

function popconfirm(message,url) {
    var answer = confirm(message)
    if (answer)
        document.location.href = url;

	return false; 
}