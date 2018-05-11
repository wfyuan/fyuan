//tou yun public css
var app = {

}


$(function () {
    $('#asidePart li').hover(function () {
        $(this).find('.mobileCont').fadeIn();
    },function () {
        $(this).find('.mobileCont').fadeOut();
    })


    // 返回顶部
    $('#asidePart li.case4').click(function () {
        backTop();
    })


    $('.index_nav li.am-parent').hover(function () {
        $(this).addClass('am-open');
        $(this).find('ul').addClass('am-in')
    },function () {
        $(this).removeClass('am-open');
        $(this).find('ul').removeClass('am-in')
    })


})


function backTop() {
    $("html,body").animate({scrollTop:0}, 500);
}