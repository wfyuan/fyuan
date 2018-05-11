<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?><!doctype html>
<html class="no-js">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="<?php echo $SEO['description'];?>">
    <meta name="keywords" content="<?php echo $SEO['keyword'];?>">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><?php if(isset($SEO['title']) && !empty($SEO['title'])) { ?><?php echo $SEO['title'];?><?php } ?><?php echo $SEO['site_title'];?></title>
    <link rel="icon" type="image/png" href="/touyun/statics/touyun/assets/i/favicon.png">
    <!--公用的样式和js-->
    <link rel="stylesheet" href="/touyun/statics/touyun/amaze/css/amazeui.min.css">
    <link rel="stylesheet" href="/touyun/statics/touyun/css/common/app.css">
    <script src="/touyun/statics/touyun/js/common/jquery-1.11.2.min.js"></script>
    <script src="/touyun/statics/touyun/amaze/js/amazeui.min.js"></script>
    <script src="/touyun/statics/touyun/js/layer/layer.js"></script>
    <script src="/touyun/statics/touyun/js/common/app.js"></script>
    <!--公用的over-->
</head>
<body>
<!--首页专用的js，css-->
<link rel="stylesheet" href="/touyun/statics/touyun/css/index/index.css">
<?php include template("content","tyheader"); ?>
<style>
    .zanyuContent{ width: 800px; margin: 0 auto; padding: 60px 0; }
    .am-list>li{ padding:30px 0 50px!important; border: 0!important; border-bottom: 1px solid #dedede!important; margin: 0!important;}
    .am-list-news-default .am-list .am-list-item-text{   overflow: auto;
         text-overflow: clip; -webkit-line-clamp: 50; max-height: 26em; }

    .thislist .am-list-item-hd{font-size: 22px; font-weight: bold;}
    .thislist .am-list-item-hd a{ color: #333;}
    .thislist .am-list-item-text{ font-size: 16px; line-height: 26px!important; color: #333!important;}
    .thislist img{transition: 0.5s;}
    .thislist img:hover{ transform: scale(1.6); -webkit-transform: scale(1.6); }
</style>
<!--头部完-->
<div class="anliBanner">
    <img style="width: 100%;" class="am-img-responsive" src="/touyun/statics/touyun/images/anli/yBanner.jpg">
</div>

<div style="background-color: #fff;">
<div class="zanyuContent">
<div data-am-widget="list_news" class="am-list-news am-list-news-default am-margin-top-0 thislist">
    <div class="am-list-news-bd">
        <ul class="am-list">
		
		<?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"content\" data=\"op=content&tag_md5=1f124f34d09861c04ed7d7f0bb8016a2&action=lists&catid=26+order%3D&num=8&moreinfo=1+\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$content_tag = pc_base::load_app_class("content_tag", "content");if (method_exists($content_tag, 'lists')) {$data = $content_tag->lists(array('catid'=>'26 order=','moreinfo'=>'1 ','limit'=>'8',));}?>
		<?php $n=1; if(is_array($data)) foreach($data AS $k => $r) { ?>
		<li class="am-g am-list-item-desced am-list-item-thumbed am-list-item-thumb-left">
                <div class="am-u-sm-3 am-list-thumb"  >
                    <!--<a href="<?php echo $r['url'];?>" class="">-->
                        <img data-address=""  src="<?php echo $r['thumb'];?>" />
                        <!--<img class="big<?php echo $k;?>" style="display: none" src="<?php echo $r['thumb'];?>" />-->
                    <!--</a>-->
                </div>

                <div class=" am-u-sm-9 am-list-main">
                    <h3 class="am-list-item-hd">
                        <!--<a href="<?php echo $r['url'];?>"><?php echo $r['title'];?></a>-->
                        <a href="javascript:;" style="color:#0D5899"><?php echo $r['title'];?></a>
                    </h3>
                    <div class="am-list-item-text">
					<?php echo $r['content'];?>
					</div>
                </div>
            </li>
				<?php $n++;}unset($n); ?>	
		<?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
            <!--<script>-->
                <!--function tanchu(img){-->
                    <!--// var img = img.find('.big');-->
                    <!--console.log(img)-->
                    <!--layer.open({-->
                        <!--type: 1,-->
                        <!--title: false,-->
                        <!--closeBtn: 0,-->
                        <!--//shade:false,-->
                        <!--//area: '516px',-->
                        <!--//skin: 'layui-layer-nobg', //没有背景色-->
                        <!--shadeClose: true,-->
                        <!--content: img-->
                    <!--});-->
                <!--}-->
            <!--</script>-->
            <!--缩略图在标题左边-->
            <!-- <li class="am-g am-list-item-desced am-list-item-thumbed am-list-item-thumb-left">
                <div class="am-u-sm-3 am-list-thumb">
                    <a href="" class="">
                        <img src="/touyun/statics/touyun/images/anli/zyImg1.jpg"/>
                    </a>
                </div>

                <div class=" am-u-sm-9 am-list-main">
                    <h3 class="am-list-item-hd">
                        <a href="" class="" style="color: #666;">致上海透云科技公司的感谢信</a>
                    </h3>
                    <div class="am-list-item-text">恒大地产集团有限公司是上海透云科技公司的战略合作伙伴。自2014年起双方陆续在恒大冰泉、恒大兴安粮油，咔哇熊奶粉等产业的互联网营销方面紧密合作，先后合作建设了一瓶一码，一品一码，一罐一码等信息化系统。上海透云科技公司为恒大集团信息化工作提供全面支持，针对我司成立了专 业团队，各团队成员在恒大地产集团服务支持中工作积极，响应迅速，工作计划及执行力都很好，在高强度高要求的工作压力下保障了恒大冰泉、粮油、乳业等产业体系的业务拓展和服务支撑。</div>
                    <div class="am-list-item-text am-text-right">恒大地产集团有限公司</div>

                </div>
            </li>
            <li class="am-g am-list-item-desced am-list-item-thumbed am-list-item-thumb-left">
                <div class="am-u-sm-3 am-list-thumb">
                    <a href="" class="">
                        <img src="/touyun/statics/touyun/images/anli/zyImg1.jpg"/>
                    </a>
                </div>

                <div class=" am-u-sm-9 am-list-main">
                    <h3 class="am-list-item-hd">
                        <a href="" class="" style="color: #666;">上海透云物联网科技有限公司：</a>
                    </h3>

                    <div class="am-list-item-text">我是透云科技的用户内蒙古草原鑫河食品有限公司，非常感谢贵司全体参与我公司防伪 溯源项目的员工，贵公司训练有素，在过往的合作中所有员工 本着耐心、细致、诚实的工作态度为项目保驾护航。从2014年6月合作开始，基于双方的紧密沟通与及时协调至目前为止项目一直稳定、安全的运行着。贵司参与项目的人员实际上用行动维护了你们公司，替公司做了宣传广告。我司将继续与透云科技展开紧密合作。</div>
                    <div class="am-list-item-text am-text-right">内蒙古草原鑫河食品有限公司</div>
                        <div class="am-list-item-text am-text-right">2016年1月15日</div>

                </div>
            </li> -->
		
        </ul>
    </div>
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