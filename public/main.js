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
	
	$("#a-history").click(function(){		
		$("#history").prop('hidden',false);	
		$("#a-history").prop('hidden',true);
		$("#a-history-hide").prop('hidden',false);	
	});	
	
	$("#a-history-hide").click(function(){
		$("#history").prop('hidden',true);
		$("#a-history").prop('hidden',false);
		$("#a-history-hide").prop('hidden',true);
	});		
});
