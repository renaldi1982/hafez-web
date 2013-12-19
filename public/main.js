$(document).ready(function(){
	$(".fancybox").fancybox({
		beforeShow : function() {
			var alt = this.element.find('img').attr('alt');
			this.inner.find('img').attr('alt',alt);
			this.title = alt;
		}
	});
	$(".google-map").fancybox({
		'type':'iframe'		
	});	
});
