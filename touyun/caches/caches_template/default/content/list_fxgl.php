<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?><!doctype html>
<html class="no-js">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
     <meta name="description" content="<?php echo $SEO['description'];?>">
    <meta name="keywords" content="<?php echo $SEO['keyword'];?>">
    <meta name="viewport" content="width=device-width, initial-scale=1">
     <title><?php if(isset($SEO['title']) && !empty($SEO['title'])) { ?><?php echo $SEO['title'];?><?php } ?><?php echo $SEO['site_title'];?></title>
     <link rel="icon" type="image/png" href="/touyun/statics/touyun/amaze/i/favicon.png">
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
                <li><a href="#floor1">分销管理活动</a></li>
                <li><a href="#floor2">分销商管理</a></li>
                <li><a href="#floor3">渠道管理</a></li>
                <li><a href="#floor4">促销系统</a></li>
                <li><a href="#floor5">防窜溯源</a></li>
                <li><a href="#floor6">产品价值</a></li>
            </ul>
        </nav>
        <div class="zdDetailWarpRight">
            <h1 style="color:#0D5899">分销管理活动</h1>
            <p>
                透云科技旗下的分销管理产品，可帮助品牌进行分销商管理，通过促销和返利活动增加分销商的积极性，完善供应链中的缺失部分，并可帮助企业进行防窜溯源。</p>

            <p>透云科技分销管理包括分销商管理、渠道管理、促销活动和防窜溯源四大功能。</p>

            <div class="centerImg">
                <img src="/touyun/statics/touyun/images/zhongdianbao/zdImg1.jpg">
            </div>
        </div>
    </div>

    <div class="zdDetailWarpType2" id="floor2">
        <div class="zdDetailWarp">
            <div class="zdDetailWarpRight">
                <h2 style="color:#fff">分销商管理</h2>

                <p class="am-text-white">帮助品牌更高效、便捷地监督管理分销商，了解分销商出入库情况。</p>

                <p class="am-text-white"> 新建和管理分销商/门店账号，为平台、管理、稽查、返利、促销等多种用户环境提供身份认证。</p>

                <p class="am-text-white"> 可针对不同角色设置不同权限，如核销、返利、扫码等</p>

                <p class="am-text-white"> 可按照分销商层级进行管理</p>

                <div class="centerImg">
                    <img src="/touyun/statics/touyun/images/zhongdianbao/zdImg7.png">
                </div>
            </div>
        </div>
    </div>

    <div class="zdDetailWarp" id="floor3">
        <div class="zdDetailWarpRight">
            <h2 style="color:#0D5899">渠道管理</h2>

            <p>可帮助企业对多层级分销商和终端（门店）进行逐级管理，帮助企业进行CRM管理。</p>

            <p>可通过一物一码赋码实现对每一件产品在生产环节的追踪，并通过手机APP方便快捷地了解产品出入库情况，查看仓库的库存量，进行库存盘点对比，形成盈亏单。</p>

            <p> 自下而上的完善分销商系统，实现严格的反向注册审核，提升对每个经销商返利的精准度。
            </p>

            <div class="centerImg am-padding-top-lg">
                <img src="/touyun/statics/touyun/images/zhongdianbao/zdImg2.jpg">

                <p class="am-text-center am-text-gray">产品方便了解产品积压，铺货状况和为调货提供参考</p>
            </div>

            <div class="centerImg am-padding-top-lg am-text-center">
                <img src="/touyun/statics/touyun/images/zhongdianbao/zdImg3.jpg">

                <p class=" am-text-gray">通过规范的出入库管理可以记录产品整个的通路过程</p>
            </div>

            <div class="centerImg am-padding-top-lg am-padding-bottom-lg am-text-center">
                <img src="/touyun/statics/touyun/images/zhongdianbao/zdImg4.jpg">

                <p class=" am-text-gray">平台端审核 &H5审核页</p>
            </div>

        </div>
    </div>

    <div class="zdDetailWarpType2" id="floor4">
        <div class="zdDetailWarp">
            <div class="zdDetailWarpRight">
            <h2 style="color:#fff">促销系统</h2>

            <p class="am-text-white">包括返利、促销和核销三个模块，通过逐层返利、各类促销策略、及线下核销管理的优化助力企业达到促进销量的终极目的。</p>

            <p class="am-text-white">
                促销活动通常供企业品牌管理使用。由分销商、门店、业务员、促销员等角色通过扫码进行奖励，以维护分销商、门店等的客户忠诚度。促销奖励可以是红包，卡券，实物，积分等多种形式。</p>

            <p class="am-text-white">
                自下而上的返利政策，由下级分销商/门店输入上级分销商信息实现对上级分销商的返利。可补全供应链缺失部分，减少窜货可能。精简供应链，减少分销层级，并增加分销商积极性。</p>

            <p class="am-text-white"> 用于支持实物，卡券，线上购物线下领取的核销操作，使线上线下活动进行有效的融合。方便快捷的手机核销方式，便于企业开展对稽查员、送货员等中间环节人员的激励政策。
            </p>

            <div class="centerImg am-text-center am-padding-top">
                <img src="/touyun/statics/touyun/images/zhongdianbao/zdImg8.jpg">

                <p class="am-text-white">返利流程</p>
            </div>

            <div class="img am-text-center am-padding-top am-padding-bottom-lg">
                <img src="/touyun/statics/touyun/images/zhongdianbao/zdImg9.png">

                <p class="am-text-white">核销流程</p>
            </div>
            </div>
        </div>
    </div>

    <div class="zdDetailWarp" id="floor5">
        <div class="zdDetailWarpRight">
            <h2 style="color:#0D5899">防窜溯源</h2>
            <p>通过对产品从生产到分销商流通过程的追踪记录，分销管理产品可帮助企业进行产品的防窜溯源。</p>

            <div class="centerImg">
                <img src="/touyun/statics/touyun/images/zhongdianbao/zdImg5.jpg">
            </div>
            <p class="am-margin-top">三种稽查防窜货为防窜提供基础</p>

            <p> 场景一：层层扫码稽查</p>

            <p> 企业仓管人员使用PDA(手持终端设备)发货给指定分销商，分销商使用手机或PDA(手持终端设备)发货给下级分销商，实行层层精准发货。</p>

            <p> 场景二：终端码稽查
            </p>

            <div class="centerImg">
                <img src="/touyun/statics/touyun/images/zhongdianbao/zdImg6.jpg">

                <p class="am-text-gray">窜货预警&稽查手机APP</p>
            </div>
        </div>
    </div>

    <div class="zdDetailWarpType2" id="floor6">
        <div class="zdDetailWarp">
            <div class="zdDetailWarpRight">
                <h2 style="color:#fff">产品价值</h2>

					<div class="footerText">
						<h3 class="am-text-white"><b>品牌：</b></h3>

						<p class="am-text-white"> 有效管理多层级分销商及其产品流向，通过供应链管理掌握产品流向</p>

						<p class="am-text-white"> 打通供应链线上、线下连接，提供数据支撑，提升运营能力</p>

						<p class="am-text-white"> 建立良好的口碑，确保消费者购买到正品</p>

						<p class="am-text-white"> 稳定市场价格，为防伪防窜提供可信赖的依据</p>

						<h3 class="am-text-white"><b>分销商：</b></h3>

						<p class="am-text-white"> 返利和分销帮助分销商获取更大利益，激发分销商的积极性，让分销商主动向品牌靠拢</p>
						<p class="am-text-white"> 方便查看下级分销商或门店的出货及库存情况</p>
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