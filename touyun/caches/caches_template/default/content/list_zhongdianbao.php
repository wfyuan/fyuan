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

<!--案例列表-->
<div class="anliBanner">
    <img style="width: 100%;" class="am-img-responsive" src="/touyun/statics/touyun/images/zhongdianbao/zBanner.jpg">
</div>
<div class="anliList">
    <div class="zdDetailWarp" id="floor1">
        <nav class="anli-fixedNav" id="fixedNav" data-am-scrollspynav="{offsetTop: 45}">
		 <?php $j=1;?>
		<?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"content\" data=\"op=content&tag_md5=719e6b6937f5f17e68adb04bc6b90842&action=lists&catid=21+order%3D&num=3\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$content_tag = pc_base::load_app_class("content_tag", "content");if (method_exists($content_tag, 'lists')) {$data = $content_tag->lists(array('catid'=>'21 order=','limit'=>'3',));}?>
            <ul>
			  <?php $n=1; if(is_array($data)) foreach($data AS $k => $r) { ?>
				
                <li><?php if($j==1) { ?><a href="#floor1"><?php } ?>
				<?php if($j==2) { ?><a href="#floor2"><?php } ?>
				<?php if($j==3) { ?><a href="#floor3"><?php } ?>
				
				<?php echo $r['title'];?></a></li>
				
				 <?php $j++;?>
				<?php $n++;}unset($n); ?>	
              <!--   <li><a href="#function">功能</a></li>
                <li><a href="#ep">设备及<br>配件</a></li> -->
            </ul>
		<?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>	
        </nav>
			 <?php $a=1;?>
		<?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"content\" data=\"op=content&tag_md5=0d238bb718c04774cd7e9c1469b58dc3&action=lists&catid=21+order%3D&num=3&moreinfo=1\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$content_tag = pc_base::load_app_class("content_tag", "content");if (method_exists($content_tag, 'lists')) {$data = $content_tag->lists(array('catid'=>'21 order=','moreinfo'=>'1','limit'=>'3',));}?>
        <!-- <div class="zgoodsBrief" id="about">
            <h1>产品简介</h1>
            <p>“众店宝”是透云科技旗下一款智能新零售产品，它包括面向零售门店的“透云智售”和面向品牌的“透云智购”。</p>
            <p> “透云智售”包括门店智能设备、店主端APP应用和消费者端应用。旨在帮助店主高效实现出入库管理、电子记账对账、在线支付（包括微信、支付宝、 闪付等）、在线订货、会员系统、线上销售并享受品牌零售促销活动及实物兑奖优惠，以提高零售便利小店销售收入，实现利润最大化。</p>
            <p> “透云智购”包括供货系统、精准广告投放系统、分销及新品促销活动系统、会员系统及数据洞察服务，致力于帮助品牌打通经销商、零售小店和消费者层层环节，建立品牌专属的完整生态，降低销售成本、提高营销效率。
            </p>
            <div class="img">
                <img class="am-img-responsive" src="images/zhongdianbao/zbrief.jpg">
            </div>
        </div> -->
		<?php $n=1; if(is_array($data)) foreach($data AS $k => $r) { ?>
		<?php if($a==1) { ?>
		<div class="zgoodsBrief zdDetailWarpRight"  style="padding-bottom:0px;">
            <h1 style="color:#0D5899;"><?php echo $r['title'];?></h1>
           <?php echo $r['content'];?>
        </div>
		<?php } ?>
		 <?php $a++;?>
			<?php $n++;}unset($n); ?>	
		<?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
        </div>
 <?php $b=1;?>
		<?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"content\" data=\"op=content&tag_md5=602a22ade165072ab68515fd927494d3&action=lists&catid=21+order%3D&num=3&moreinfo=1\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$content_tag = pc_base::load_app_class("content_tag", "content");if (method_exists($content_tag, 'lists')) {$data = $content_tag->lists(array('catid'=>'21 order=','moreinfo'=>'1','limit'=>'3',));}?>
		<?php $n=1; if(is_array($data)) foreach($data AS $k => $r) { ?>
		<?php if($b==2) { ?>

		<div class="zdDetailWarpType2" id="floor2">
            <div class="zdDetailWarp">
             <div class="zdDetailWarpRight zfunction">
                   <h2 style="color:#fff;"><?php echo $r['title'];?></h2>
                   <!--<?php echo $r['content'];?>-->
                   <div class="am-avg-sm-3 am-padding-bottom">
                       <div class="am-u-sm-4 am-padding-left-0">
                           <h3 class="am-text-white"><b>进销存管理：</b></h3>
                           <p class="am-text-white">快速录入商品清单，创建商品库<br />
                               即时库存情况更新<br />
                               库存不足自动提醒</p>
                       </div>
                       <div class="am-u-sm-4  am-padding-left-0">
                           <h3 class="am-text-white"><b>促销活动管理：</b></h3>
                           <p class="am-text-white">切实享受多重品牌促销优惠<br />
                               优先成为品牌&ldquo;一物一码&rdquo;实物兑换<br>点，直享品牌补贴<br />
                               自行定制门店促销活动</p>
                       </div>
                       <div class="am-u-sm-4  am-padding-left-0">
                           <h3 class="am-text-white"><b>电子记账：</b></h3>
                           <p class="am-text-white">交易流水直接生成电子账单<br />
                               历史账单一键查询</p>
                       </div>
                   </div>



                     <h4 class="am-text-white"><b>在线订货：</b></h4>
                    <p  class="am-text-white">100+快消品牌鼎力合作，确保进货价格更低，轻松赚更多；亚马劲线上订货平台，快速订货，低价更实惠</p>
                     <h4 class="am-text-white"><b>线上门店：</b></h4>
                 <p class="am-text-white">开设线上门店吸引更多附近客流，对接店主或第三方配送</p>
                     <h4 class="am-text-white"><b>多种支付：</b></h4>
                 <p class="am-text-white">提供包括微信、支付宝、 闪付等多种支付方式，一扫即买，收银更轻松</p>


             </div>
            </div>
        </div>
		<?php } ?>
		<?php $b++;?>
<?php $n++;}unset($n); ?>	
		<?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
		
		
		 <?php $c=1;?>
		<?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"content\" data=\"op=content&tag_md5=0d238bb718c04774cd7e9c1469b58dc3&action=lists&catid=21+order%3D&num=3&moreinfo=1\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$content_tag = pc_base::load_app_class("content_tag", "content");if (method_exists($content_tag, 'lists')) {$data = $content_tag->lists(array('catid'=>'21 order=','moreinfo'=>'1','limit'=>'3',));}?>
		<?php $n=1; if(is_array($data)) foreach($data AS $k => $r) { ?>
		<?php if($c==3) { ?>
       <!--  <div class="zGoodsParts" id="ep">
            <div class="anliDetailWarp">
            <h1>设备及配件</h1>
            <p>门店智能设备：小屏为店主操作界面，大屏为消费者显示界面<br>
                店主端APP应用：轻松管理门店<br>
                消费者端应用：线上下单、送货上门、简单快捷<br>
                加购可得与设备适配的收银盒、小票打印机、扫描枪等配件
            </p>
            <div class="img">
                <img src="images/zhongdianbao/zparts.jpg">
            </div>
            <h3>贴心服务：</h3>
            <div class="zService">
                <h4>• &nbsp;&nbsp;&nbsp;&nbsp; 免费上门安装并录入商品</h4>
                <h4>• &nbsp;&nbsp;&nbsp;&nbsp; 7*12小时服务热线</h4>
                <h4>• &nbsp;&nbsp;&nbsp;&nbsp; 小店专员定期上门服务</h4>
            </div>
            </div>
        </div> -->
		 <div class="zGoodsParts zdDetailWarp " id="floor3">
            <div class="zdDetailWarpRight">
              <h2 style="color:#0D5899;"><?php echo $r['title'];?></h2>
           <?php echo $r['content'];?>
            </div>
        </div> 
		<?php } ?>
				<?php $c++;?>
<?php $n++;}unset($n); ?>	
		<?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
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