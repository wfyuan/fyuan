Array.min = function( array ){
	return Math.min.apply( Math, array );
};

Array.prototype.indexOf = function(obj){
	for(var i=0; i<this.length; i++){
		if(this[i]==obj){
			return i;
		}
	}
	return -1;
}

;(function () {
	
	'use strict';

	// iPad and iPod detection	
	var isiPad = function(){
		return (navigator.platform.indexOf("iPad") != -1);
	};

	var isiPhone = function(){
	    return (
			(navigator.platform.indexOf("iPhone") != -1) || 
			(navigator.platform.indexOf("iPod") != -1)
	    );
	};



	// OffCanvass
	var offCanvass = function() {
		$('body').on('click', '.js-fh5co-menu-btn, .js-fh5co-offcanvass-close', function(){
			$('#fh5co-offcanvass').toggleClass('fh5co-awake');
		});
	};

	// Click outside of offcanvass
	var mobileMenuOutsideClick = function() {
		$(document).click(function (e) {
	    var container = $("#fh5co-offcanvass, .js-fh5co-menu-btn");
	    if (!container.is(e.target) && container.has(e.target).length === 0) {
	    	if ( $('#fh5co-offcanvass').hasClass('fh5co-awake') ) {
	    		$('#fh5co-offcanvass').removeClass('fh5co-awake');
	    	}
	    }
		});

		$(window).scroll(function(){
			if ( $(window).scrollTop() > 500 ) {
				if ( $('#fh5co-offcanvass').hasClass('fh5co-awake') ) {
		    		$('#fh5co-offcanvass').removeClass('fh5co-awake');
		    	}
	    	}
		});
	};

	// Magnific Popup
	
	var magnifPopup = function() {
		$('.image-popup').magnificPopup({
			type: 'image',
			removalDelay: 300,
			mainClass: 'mfp-with-zoom',
			titleSrc: 'title',
			gallery:{
				enabled:true
			},
			zoom: {
				enabled: true, // By default it's false, so don't forget to enable it

				duration: 300, // duration of the effect, in milliseconds
				easing: 'ease-in-out',
				opener: function(openerElement) {
				    return openerElement.is('img') ? openerElement : openerElement.find('img');
				}
			}
		});
	};

	var animateBoxWayPoint = function() {
		if ($('.animate-box').length > 0) {
			$('.animate-box').waypoint( function( direction ) {
				if( direction === 'down' && !$(this).hasClass('animated') ) {
					$(this.element).addClass('bounceIn animated');
				}
			} , { offset: '75%' } );
		}
	};

	var getMinIndex = function getMinIndex() {
		var columns = [];
		$('.column').each(function (i) {
			columns.push($(this).height())
		})
		var minNum =  eval("Math.min(" + columns.toString() + ")");
		var index = columns.indexOf( minNum );
		return index;
	}


	var page = 2;
	var maxPage = 0;
	var addImgdata = function addImgdata() {
		var params = {}
		params.p = page++;
		$.post('/Home/xiuxian/newestimagesJson',params,function (data) {
			var imgList = data.contentlist;

			maxPage = data.allPages;
			for(let i= 0; i<imgList.length; i++) {
				var index =  getMinIndex();
				$('.column').eq(index).append(`<div class="item">
				<div class="animate-box">
					<a href="${imgList[i].img}" class="image-popup fh5co-board-img">
					<img src="${imgList[i].img}" alt="${imgList[i].title}">
					</a>
					</div>
					<div class="fh5co-desc">
					${imgList[i]['title']}<br>${imgList[i].ct}
				</div>
				</div>`);

				animateBoxWayPoint();
				magnifPopup();
			}

			$('#addImgdata').attr('disabled',false);
			$('#addImgdata').html('加载更多');
		},'json')



	}

	$(function(){
		magnifPopup();
		offCanvass();
		mobileMenuOutsideClick();
		animateBoxWayPoint();
		
		$('#addImgdata').click(function () {
			$(this).attr('disabled',true);
			$(this).html('加载中。。。。');
			addImgdata();
		})
	});
}());