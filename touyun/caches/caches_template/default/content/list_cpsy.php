<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?><!doctype html>
<html class="no-js">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><?php if(isset($SEO['title']) && !empty($SEO['title'])) { ?><?php echo $SEO['title'];?><?php } ?><?php echo $SEO['site_title'];?></title>
	<meta name="keywords" content="<?php echo $SEO['keyword'];?>">
	<meta name="description" content="<?php echo $SEO['description'];?>">
    <meta name="viewport" content="width=device-width, initial-scale=1">
   
    <link rel="icon" type="image/png" href="/touyun/statics/touyun/assets/i/favicon.png">
    <!--公用的样式和js-->
    <link rel="stylesheet" href="/touyun/statics/touyun/amaze/css/amazeui.min.css">
    <link rel="stylesheet" href="/touyun/statics/touyun/css/common/app.css">
    <script src="/touyun/statics/touyun/js/common/jquery-1.11.2.min.js"></script>
    <script src="/touyun/statics/touyun/amaze/js/amazeui.min.js"></script>
    <script src="/touyun/statics/touyun/js/common/app.js"></script>
    <!--公用的over-->
</head>
<body>
<!--首页专用的js，css-->
<link rel="stylesheet" href="/touyun/statics/touyun/css/index/index.css">
<?php include template("content","tyheader"); ?>
<!--头部完-->
<style>

</style>
<!--案例列表-->
<div class="anliBanner">
    <img style="width: 100%;" class="am-img-responsive" src="/touyun/statics/touyun/images/onecode/yBanner.jpg">
</div>
<div class="anliList">
    <div class="zdDetailWarp" id="floor1">
        <nav class="anli-fixedNav" id="fixedNav" data-am-scrollspynav="{offsetTop: 45}">
            <ul>
                <li><a href="#floor1">产品溯源</a></li>
                <li><a href="#floor2">三大应用</a></li>
                <li><a href="#floor3">五大行业</a></li>
                <li><a href="#floor4">成功案例</a></li>
            </ul>
        </nav>
        <div class="zdDetailWarpRight" style="padding-bottom:30px;">
            <h1 style="color:#0D5899">产品溯源</h1>
            <p>
                透云溯源平台是基于物联网技术打造的开放、共享的食品溯源信息平台。平台以RFID及二维码标签为载体，可帮助食品、农产品等打通生产、检验检疫、监管和消费各个环节。消费者通过智能手机扫描商品二维码，即可查询产品的原材料、生产及运输等信息，为消费者提供全面、透明、统一的食品溯源公共信息服务，帮助消费者买到安全、放心的产品。食品溯源信息平台的建立可切实有效地降低各类安全风险，有利于构建人人参与、社会共治的消费新环境。
            </p>
        </div>
    </div>


    <div class="zdDetailWarpType2" id="floor2">
        <div class="zdDetailWarp">
            <div class="zdDetailWarpRight">
                <h2 style="color:#fff;">三大应用</h2>
                <div class="footerText">
                    <h3 class="am-text-white"><b>农村物流体系建设：</b></h3>
                    <p class="am-text-white">建设县级物流分拨中心和物流仓储信息管理系统，主要负责网销商品的品控分拣、打包配送，可实现集采统储、互采分销、统配统送、协调售后服务、信息发布和信息共享功能，通过系统实现物流小包信息的查询和物流信息发布。</p>
                    <p class="am-text-white"> 建设乡镇、村物流服务站点，充分整合县内快递企业在乡、村的配送及代收代发业务，由物流分拨中心开展集中配送、集中代收代发服务。</p>
                    <h3 class="am-text-white"><b>农产品供应链体系建设：</b></h3>
                    <p class="am-text-white">建立电子商务大数据中心，与商务部《农村电子商务和社区商业信息系统》无缝对接，可即时采集上报各服务网点运营数据，并对全县电子商务产业发展进行全面系统的监测、统计和分析。</p>
                    <p class="am-text-white">构建电子商务平台下的供应链管理模式，做好产品供求信息和产品价格信息，保持农产品供需稳定对接于供应链平台，防止信息不对称，对农产品产销形成稳定预期。
                    </p>
                    <div class="centerImg">
                    <img src="/touyun/statics/touyun/images/onecode/jdsy1.png" width="500">
                    </div>

                    <h3 class="am-text-white"><b>重要产品追溯</b></h3>

                    <p class="am-text-white">通过RFID、二维码等技术，为成品做身份标识，实现由下而上的信息追溯，可明确界定生产流通中每个环节的责任主体，记录生产加工的全过程质量安全信息，建立健全的安全溯源体系。</p>
                    <p class="am-text-white">搭建农产品质量安全监管平台、品控及溯源管理平台、数码防伪平台、品牌产品防窜监管平台、农产品可追溯查询平台等，实现库存管理、订单管理、预售管理，及农产品全程追溯体系。</p>
                    <div class="centerImg">
                        <img src="/touyun/statics/touyun/images/onecode/jdsy2.png" width="600">
                    </div>
                    <p class="am-text-center am-text-white">多元灵活产品管理</p>


                    <h3 class="am-text-white"><b>食品安全</b></h3>

                    <p class="am-text-white">
                        按照“源头可溯、去向可追、风险可控、公众参与”的基本要求，以“一物一码”为总体思路，构建数据驱动、多方协同的食品安全治理模式，建立覆盖种植养殖、生产加工、仓储物流、终端销售、检验检测、政府监管、企业管理、公众查询等各环节的食品安全追溯管理体系，实现食品质量安全的全覆盖、全链条可追溯，保障广大群众饮食安全的知情权和监督权，促进食品安全状况的稳步提升。，及农产品全程追溯体系。
                    </p>

                    <div class="centerImg">
                        <img src="/touyun/statics/touyun/images/onecode/jdsy3.png" width="660">
                    </div>

                </div>
            </div>
        </div>
    </div>
    <div class="zdDetailWarp" id="floor3">
         <div class="zdDetailWarpRight">
             <h2 style="color:#0D5899">五大行业</h2>
             <p>透云的溯源平台目前已服务包括种植、养殖、加工、水产和流通等行业，可帮助打通行业中的各生产/流通环节，打造全过程的信息化管理，实现产品的全覆盖、全链条可追溯。</p>
             <div class="centerImg">
                 <img src="/touyun/statics/touyun/images/onecode/jdsy5.jpg">
             </div>

         </div>
    </div>

<div class="zdDetailWarpType2" >
        <div class="zdDetailWarp" id="floor4">
            <div class="zdDetailWarpRight">
                <h2 style="color:#fff">成功案例</h2>
				<div class="footerText">
					<h3 class="am-text-white"><b>溯源河北</b></h3>
					<p class="am-text-white">
						透云科技与新华网、河北省商务厅携手创建了全国首个省级“溯源中国”公共服务云平台。该平台于2016年12月1日正式上线，可实现农副产品“从田间地头到餐桌”的全程可追溯。为河北食品安全及优质农产品上行保驾护航，并推进了健康中国的建设，帮助消费者实现“舌尖上、餐桌上的安全”。
					</p>
					<div class="centerImg">
						<img src="/touyun/statics/touyun/images/onecode/jdsy4.jpg" width="500">
					</div>

					<h3 class="am-text-white"><b>溯源广西</b></h3>
					<p class="am-text-white">
						透云科技与广西省商务厅合作建立了广西公共服务云平台。本项目能够建设一个统一管理的溯源平台，将标签使用方、销售终端商家、消费者和政府监管部门直接联系起来，政府、行业协会可随机或定期的抽查追溯平台各环节的准确性、合规合法性等，有效监管所辖区域的种植、农残检测、食品加工、物流流通，通过数据分析进行全省种植数据管理、提升应急管理能力，从而制约假冒和伪造生产活动，有效保护消费者的权益，降低监管成本。
					</p>
					<div class="centerImg">
						<img src="/touyun/statics/touyun/images/onecode/jdsy6.png" width="500">
					</div>

					<h3 class="am-text-white"><b>中国普甜食品控股有限公司</b></h3>
					<p class="am-text-white">
						中国普甜食品控股有限公司是一家集生猪育种、饲养、屠宰加工为一体的食品现代化信息企业。通过透云科技的溯源信息平台，可对企业进行深入调研沟通，结合企业垂直管理业务模式，有效管理生猪的养殖、运输、屠宰、包装等各个环节，实现猪肉产品全流程质量追溯。
					</p>
					<div class="centerImg">
						<img src="/touyun/statics/touyun/images/onecode/jdsy7.png" width="260">
					</div>

					<h3 class="am-text-white"><b>中乔大三农实业集团</b></h3>
					<p class="am-text-white">
						透云科技与中乔大三农实业集团建设溯源项目。该项目于2017年6月份建设完成，通过该项目使企业实现了农产品信息追溯，翻盖企业的富硒粮、富硒菜、富硒肉蛋茶等农产品。
					</p>
					<p class="am-text-white">
						为企业搭建的智慧农场项目，可帮助企业实时查看、预警土壤地块的生长环境信息。通过现场传感器，能帮助农民随时了解光、温、水、气、土壤环境等参数，预测农产品长势和产量，减少化学农药投入，并实现自动化控制。
					</p>
					<!--<div class="centerImg">
						<img src="/touyun/statics/touyun/images/onecode/jdsy8.jpg" width="500">
					</div>-->
					<div class="centerImg">
						<img class="" src="/touyun/statics/touyun/images/onecode/jdsy9.png" width="500">
					</div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--案例列表完-->

<script>
    $(function () {
        var heightL = $("#floor1").offset().top;
        var footerT = $("#footer").offset().top;
        var barHeight = $('#fixedNav').height();

        var fixedNavL = ($(window).width()-800)/2 - 150;

        var floor =  $("div[id*='floor']");
        var jumbotronTop = ''
        var currentID = '';

        $(window).scroll(function () {
            var scrollTop = $(document).scrollTop();
            if(scrollTop>heightL){
                $('#fixedNav').css({'position':'fixed','left':fixedNavL+'px','top':'72px'})
            }else{
                $('#fixedNav').css({'position':'absolute','left': '-50px','top':'40px'})
            }
            var scrollTop =  $(window).scrollTop();
            if(scrollTop>=(footerT-barHeight)){
                $('#fixedNav').hide();
            }else{
                $('#fixedNav').show();
            }
            floor.each(function() {
                var $this = $(this);
                jumbotronTop = parseInt($this.offset().top);//获取当前楼层的高度
                if (scrollTop > (jumbotronTop - 260)) {
                    currentID =　$this.attr("id").slice(5);
                }else {
                    return false;
                };
            })

            if(currentID%2 == 0){
                $('#fixedNav').addClass('active');
            }else{
                $('#fixedNav').removeClass('active');
            }
        })
    })
</script>
<!--右边的操作部分-->
<div class="aside-opation" id="asidePart">
    <ul class="asideList">
        <li class="case1">
            <p><a href="">在线<br>客服</a></p>
        </li>
        <li class="case2">
            <p>电话<br>热线</p>
            <div class="mobileCont">
                <div class="close">
                    <span class="am-icon-remove"></span>
                </div>
                <h4>联系我们</h4>
                <h5><span class="am-icon-phone"></span> 021-61820853</h5>
            </div>
        </li>
        <li class="case3">
            <p>扫码<br>关注</p>
            <div class="mobileCont">
                <div class="close">
                    <span class="am-icon-remove"></span>
                </div>
                <img src="/touyun/statics/touyun/images/index/wechatcode.png">
                <h3>透云官方微信</h3>
            </div>
        </li>
        <li class="case4">

        </li>
    </ul>
</div>

<?php include template("content","tyend"); ?>

</body>
</html>