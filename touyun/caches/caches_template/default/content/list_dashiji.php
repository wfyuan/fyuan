<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?><!doctype html>
<html class="no-js">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="description" content="<?php echo $SEO['description'];?>">
    <meta name="keywords" content="<?php echo $SEO['keyword'];?>">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><?php if(isset($SEO['title']) && !empty($SEO['title'])) { ?><?php echo $SEO['title'];?><?php } ?><?php echo $SEO['site_title'];?></title>
    <link rel="icon" type="image/png" href="assets/i/favicon.png">
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

<style>
    .bigEvent{ width: 800px; margin: 0 auto;; padding-bottom: 100px;}
    .bigEvent .topimg{ width: 241px; height: 88px; margin: 0px auto 0px; padding-top: 60px; padding-bottom: 40px; }

    .eventList{ width: 100%; position: relative; padding: 50px 0 10px; margin-top: 90px;}
    .eventList .line{ width:160px; border-right: 2px solid #0089ff; position: absolute; left: 0; top: 0; height: 100%; }
    .eventList .icon{ width: 18px; height: 18px; position: absolute; top: -10px; right: -10px; }
    .eventList dl{ color: #fff; margin-top: 0;}
    .eventList dl.active{ color: #ffb618;}
    .eventList dt{ width: 160px; font-size: 20px; text-align: right; float: left ; padding-right: 20px; font-weight: normal;}
    .eventList dd{width: 630px; float: left; margin: 0; font-size: 14px; padding: 7px 0 0 20px;}
    .eventList p{ font-size:34px; margin-top: 30px; margin: 0; width: 160px; text-align: right; padding-right: 20px; color: #fff; position: relative;}
    .eventList p:after{ content: ''; width: 8px; height: 8px; background: #fff; position: absolute; right: -3px;; top:25px;; border-radius: 50%;}
</style>
<!--头部完-->
<div class="anliBanner">
    <img style="width: 100%;" class="am-img-responsive" src="/touyun/statics/touyun/images/about/beBanner.jpg">
</div>

<div style="background:url('/touyun/statics/touyun/images/about/bigeventBg.jpg') no-repeat bottom center #003c70">
     <div class="bigEvent">
         <div class="topimg">
             <img src="/touyun/statics/touyun/images/about/bigeventimg1.jpg">
         </div>

         <div class="eventList">
             <div class="line">
                 <div class="icon">
                     <img src="/touyun/statics/touyun/images/about/bigeventIcon.jpg">
                 </div>
             </div>
			 <?php $j="";?>
			 	 <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"content\" data=\"op=content&tag_md5=11464d03b41a63a28fe1d893ee947f37&action=lists&catid=9+order%3D&num=40&order=id+asc&moreinfo=1\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$content_tag = pc_base::load_app_class("content_tag", "content");if (method_exists($content_tag, 'lists')) {$data = $content_tag->lists(array('catid'=>'9 order=','order'=>'id asc','moreinfo'=>'1','limit'=>'40',));}?>
				  <?php $n=1; if(is_array($data)) foreach($data AS $k => $r) { ?>
				  <?php if($j=='') { ?>
				  <?php $j=$r['year']?>
				   <p><?php echo $r['year'];?>年</p>
				  <?php } ?>
				   <?php if($j!==$r['year']) { ?>
				   <p><?php echo $r['year'];?>年</p>
				    <?php $j=$r['year']?>
				   <?php } ?>
				  
				   <dl class="am-cf <?php if($r['isbiaoliang']=='1') { ?>active<?php } ?>">
                 <dt><?php echo $r['month'];?>月</dt>
                 <dd><?php echo $r['content'];?></dd>
             </dl>
						
					<?php $n++;}unset($n); ?>	

				<?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
         <!--     <p>2011年</p>
             <dl class="am-cf active">
                 <dt>8月</dt>
                 <dd>上海透云物联网科技有限公司正式成立</dd>
             </dl>
             <p>2014年</p>
             <dl class="am-cf">
                 <dt>6月</dt>
                 <dd>通过《多码防伪认证系统》高新技术成果转化项目<br>
                     荣膺国家金卡工程金蚂蚁奖之“优秀应用成果奖”、“市场开拓奖”
                 </dd>
             </dl>

             <dl class="am-cf">
                 <dt>9月</dt>
                 <dd>获得上海市“高新技术企业”称号 </dd>
             </dl>

             <dl class="am-cf">
                 <dt>12月</dt>
                 <dd>通过BSI认证的ISO9001:2008和ISO/IEC 27001:2013管理体系认证</dd>
             </dl>

             <p>2016年</p>
             <dl class="am-cf">
                 <dt>1月</dt>
                 <dd>荣膺新华网、人民网“创新中国•企业创新奖”</dd>
             </dl>
             <dl class="am-cf">
                 <dt>3月</dt>
                 <dd>荣膺2015-2016年度“中国互联网+行业创新企业奖”</dd>
             </dl>
             <dl class="am-cf active">
                 <dt>4月</dt>
                 <dd>与新华网就“溯源中国”项目达成战略合作</dd>
             </dl>
             <dl class="am-cf">
                 <dt>5月</dt>
                 <dd>荣获微软中国“微软银牌能力合作伙伴”授权</dd>
             </dl>
             <dl class="am-cf">
                 <dt>9月</dt>
                 <dd>与新华网就“溯源中国”项目达成战略合作。</dd>
             </dl>
             <dl class="am-cf active">
                 <dt>12月</dt>
                 <dd>在香港主板上市，香港联交所交易代码：01332<br>
                     荣获CMMI3证书
                 </dd>
             </dl>

             <p>2017年</p>
             <dl class="am-cf active">
                 <dt>2月</dt>
                 <dd>透云科技母公司正式更名为中国透云科技集团有限公司<br>
                     全资收购信码互通（北京）科技有限公司
                 </dd>
             </dl>
             <dl class="am-cf active">
                 <dt>3月</dt>
                 <dd>推出新零售产品—众店宝
                 </dd>
             </dl>
             <dl class="am-cf">
                 <dt>11月</dt>
                 <dd>荣膺中国财经峰会“2017年度影响力企业”</dd>
             </dl> -->
         </div>
     </div>
</div>





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