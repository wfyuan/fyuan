/**
 * Created by Albert on 2018/2/25.
 */
$(function () {

    industrySet();

    $('#distpicker5').distpicker({
        autoSelect: false
    });

    // 数字++++++++++效果
    var numadd1 = new dataAdd($('#rollNum1'));
    numadd1.init();

    var numadd2 = new dataAdd($('#rollNum2'));
    numadd2.init();

    var numadd3 = new dataAdd($('#rollNum3'));
    numadd3.init();

    // 新增自动弹出框
    layer.open({
        type: 1,
        title: false,
        shift:2,
        time:5000,
        closeBtn: 0,
        area: ['286px','528px'],
        skin: 'layui-layer-nobg', //没有背景色
        shadeClose: true,
        content: $('#openHimself')
    });


    $('#register_form').submit(function () {
        $data = $(this).serializeArray();
        var post_data = {};
        for(i in $data){
            //赋值给对象
            post_data[$data[i].name] = $.trim($data[i].value);
        }


        $.post('',post_data,function (data) {

            if(data.status){
                // 注册成功弹窗
                layer.open({
                    type: 1,
                    title: false,
                    shift:2,
                    closeBtn: 0,
                    area: ['350px','220px'],
                    shadeClose: true,
                    content: $('#registerSuccess')
                });
            }else{
                layer.msg('注册失败')
            }

        },'json')

    })





});


function dataAdd(obj) {
    this.originNum = obj.html();
    this.time = (1000 / (this.originNum / 10)).toFixed(2);
    this.addNum = Math.ceil(obj.html()/1000);
    this.num = 0;
    this.init = function () {
        var _this = this;
        var index = setInterval(function () {
            if (_this.num <= _this.originNum) {
                _this.num +=_this.addNum;
                obj.html(_this.num)
            } else {
                _this.num = _this.originNum;
                clearInterval(index);
                obj.html(_this.num)
            }
        }, _this.time);
    }
}



// 设置行业
function industrySet() {
    var html = '';
    for (j in industry) {
        html += "<option value='" + j + "'>" + j + "</option>"
    }
    $('#industryBig').html(html);

    var html3 = '';
    for (q in industry['食品']) {
        html3 += "<option value='" + industry['食品'][q] + "'>" + industry['食品'][q] + "</option>"
    }
    $('#industrySmall').html(html3);

    $('#industryBig').change(function () {
        var industrySmallCont = industry[$(this).val()];
        var html2 = '';
        for (i in industrySmallCont) {
            html2 += "<option value='" + industrySmallCont[i] + "'>" + industrySmallCont[i] + "</option>"
        }
        $('#industrySmall').html(html2);
    })
}