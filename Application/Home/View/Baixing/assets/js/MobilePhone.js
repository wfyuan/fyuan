// JavaScript Document
$(function(){
	
	
	var num = 61;
	var timer = null;
	
	$('.TheCountdown').click(function(){		
		clearInterval(timer)
		
	timer = setInterval(function(){
		
		if(num>=1){
			
		num --;		
		
		$('.TheCountdown').html(num+' s')
		$('.TheCountdown').css('background','#ccc')	
		
		
	    } else{
			$('.TheCountdown').html('重新获取')
			$('.TheCountdown').css('background','#ff8087')
			$('button').css('border','#ccc solid 1px')
			num = 61;
			clearInterval(timer)
			}
		
		
		
		},1000)
	
	})
		
	
});