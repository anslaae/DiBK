if (typeof jQuery !== 'undefined') {
	(function($) {
		$('#spinner').ajaxStart(function() {
			$(this).fadeIn();
		}).ajaxStop(function() {
			$(this).fadeOut();
		});
	})(jQuery);
}

function flytt(item)
{    
    if(item.parentNode.id == "egenskaper"){
        item.parentNode.removeChild(item);
        $("#valgteEgenskaper").append(item);        
    } else {
        item.parentNode.removeChild(item);
        $("#egenskaper").append(item);
    }
}
