//JavaScript Document
//made by : 871229893qq.com

$(function(){
 var timer = null;
 var transporter = $('.scrollTop>ul');         //���ʹ�
 var transporterItem = $('.scrollTop>ul>li');  //
 var speed = 40;                               //ÿ�������ƶ��ĸ߶�px��
 var effectTime = 500;                         //ÿ��Ч���˶���ʱ��
 var effectInterval = 4000;                    //ÿ��Ч���˶�ʱ������
 
 transporter.clone( true ).appendTo(transporter); 
	  
 function setTimer(){
	 
 timer = setInterval(function(){   
		 
          transporter.animate({top:transporter.eq(0).position().top - speed},effectTime,function(){
                   
		      if(transporter.eq(0).position().top<-transporter.eq(0).height())
				   {
				   transporter.css('top',-speed)
				   }  	  	   
	   });
				
	 },effectInterval)
	 };

 setTimer();
 
   $('.scrollTop').mouseover(function(){clearInterval(timer)});
   $('.scrollTop').mouseout(function(){setTimer()});
});