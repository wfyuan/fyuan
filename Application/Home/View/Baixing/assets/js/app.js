
$(function() {
    var $fullText = $('.admin-fullText');
    $('#admin-fullscreen').on('click', function() {
      $.AMUI.fullscreen.toggle();
    });

    $(document).on($.AMUI.fullscreen.raw.fullscreenchange, function() {
      $fullText.text($.AMUI.fullscreen.isFullscreen ? '退出全屏' : '开启全屏');
    });


    $('.gybj').hide();
    $('button#BTN').click(function(){
      $('.gybj').show();
    });
    $('button#BTN_2').click(function(){
	    $('.gybj').hide();
    });
    
    
});

