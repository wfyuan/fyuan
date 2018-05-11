(function($) {
    var defaults = {
        'method': 1,
		'millisecond': 0,
		'text': '倒计时完了'
    };
    $.fn.wfyuan = function(options) {
        var options = $.extend(defaults, options);
        var data = "";
        var _DOM = null;
        var TIMER = null;
        var arr1 = ['天', '时', '分', '秒', '毫秒'];
        createdom = function(dom) {
            _DOM = dom;
            data = dom.attr("data");		
            data = Math.round((new Date(data)).getTime() / 10);		
            reflash();  
			
			if(defaults.millisecond == 0){
				$(_DOM).html("<span class='wfyday'></span><span class='split'></span><span class='wfyhour'></span><span class='split'></span><span class='wfymin'></span><span class='split'></span><span class='wfysec'></span>");	
			}else{
				$(_DOM).html("<span class='wfyday'></span><span class='split'></span><span class='wfyhour'></span><span class='split'></span><span class='wfymin'></span><span class='split'></span><span class='wfysec'></span><span class='split'></span><span class='wfyms'></span>");	 
			}			         		
        };
        function reflash() {			
            var range = data - Math.round((new Date()).getTime() / 10),			
            secday = 8640000,
            sechour = 360000,
            days = parseInt(range / secday),
            hours = parseInt((range % secday) / sechour),
            min = parseInt(((range % secday) % sechour) / 6000),
            sec = parseInt((((range % secday) % sechour) % 6000) / 100);
            haom = (((range % secday) % sechour) % 6000) % 100,
            $(_DOM).find(".wfyday").html(nol(days));
$(_DOM).find(".wfyhour").html(nol(hours));
       $(_DOM).find(".wfymin").html(nol(min));
        $(_DOM).find(".wfysec").html(nol(sec));
           
            TIMER = range;
			/*倒计时结束文字提示*/
			if(range<=0){
				$(_DOM).html(defaults.text)
			}else{
			    	
			}
            if (defaults.method === 1) {
                $(_DOM).find(".split").html(":")
            }else{
                $(_DOM).find(".split").each(function(index, element) {
                    $(this).text(arr1[index])
                });
            }
        }
        nol = function(h) {
            return h > 9 ? h: '0' + h;
        }
        return this.each(function() {
            createdom($(this));
            setInterval(reflash, 10);
        });
    }
})(jQuery);
