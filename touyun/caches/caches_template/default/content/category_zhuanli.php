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
<div class="anliBanner">
    <img style="width: 100%;" class="am-img-responsive" src="/touyun/statics/touyun/images/shiming/zlBanner.jpg">
</div>
<div class="zhuanTypeWarp">
<Div class="zhuanType1">
    <div class="smContainer am-cf">
        <h1 style="color:#0D5899">专利</h1>
        <ul data-am-widget="gallery" class="zhuanliList am-avg-sm-4 am-gallery-default" data-am-gallery="{ pureview: true }" id="zhuanli">
 <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"content\" data=\"op=content&tag_md5=4ff849f97755313bbb9375b7e12db522&action=lists&catid=11+order%3D&num=25\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$content_tag = pc_base::load_app_class("content_tag", "content");if (method_exists($content_tag, 'lists')) {$data = $content_tag->lists(array('catid'=>'11 order=','limit'=>'25',));}?>

 <?php $n=1; if(is_array($data)) foreach($data AS $key => $val) { ?>           
		   <li>
                <div class="am-gallery-item">
                    <!-- <a href="" class=""> -->
                        <div class="img">
                        <img src="<?php echo $val['thumb'];?>"  />
                        </div>
                        <h3 class="am-gallery-title"><?php echo $val['title'];?></h3>
                   <!--  </a> -->
                </div>
            </li>
   <?php $n++;}unset($n); ?>  
 <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>   
        </ul>
        <div class="getmore" id="showZhuanli">
            <a  href="javascript:;">查看更多</a>
        </div>
    </div>
</Div>

<Div class="zhuanType1">
    <div class="smContainer am-cf">
        <h1 style="padding-top: 120px;color:#0D5899">奖项</h1>
        <ul data-am-widget="gallery" class="zhuanliList am-avg-sm-3 am-gallery-default" data-am-gallery="{ pureview: true }" id="jiangxiang">
				 <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"content\" data=\"op=content&tag_md5=bbd8971a3315c778568ddc363088ebd2&action=lists&catid=12+order%3D&num=25\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$content_tag = pc_base::load_app_class("content_tag", "content");if (method_exists($content_tag, 'lists')) {$data = $content_tag->lists(array('catid'=>'12 order=','limit'=>'25',));}?>

 <?php $n=1; if(is_array($data)) foreach($data AS $key => $val) { ?>           
		   <li>
                <div class="am-gallery-item">
                    <!-- <a href="" class=""> -->
                        <div class="img">
                        <img src="<?php echo $val['thumb'];?>"  />
                        </div>
                        <h3 class="am-gallery-title"><?php echo $val['title'];?></h3>
                   <!--  </a> -->
                </div>
            </li>
   <?php $n++;}unset($n); ?>  
 <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
        </ul>

        <div class="getmore" id="showJiangxiang">
            <a  href="javascript:;">查看更多</a>
        </div>
    </div>

</Div>
</div>

<script>
    $(function(){
        //jiangxiang
        //zhuanli

        $('#zhuanli li:gt(3)').hide();
        $('#jiangxiang li:gt(2)').hide();

        $('#showZhuanli').click(function(){
            $('#zhuanli li:gt(3)').show();
            $(this).hide();
        })

        $('#showJiangxiang').click(function(){
            $('#jiangxiang li:gt(2)').show();
            $(this).hide();
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