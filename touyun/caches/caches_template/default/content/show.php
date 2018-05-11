<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?><!doctype html>
<html class="no-js">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
     <title><?php if(isset($SEO['title']) && !empty($SEO['title'])) { ?><?php echo $SEO['title'];?><?php } ?><?php echo $SEO['site_title'];?></title>
	<meta name="keywords" content="<?php echo $SEO['keyword'];?>">
	<meta name="description" content="<?php echo $SEO['description'];?>">
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


<style>
.joinContainer{ width: 750px; margin: 0 auto; line-height:25px;background-color: #fff;color: #666;}
.joinContainer h1{ font-size: 24px; color: #333; margin-top: 25px;}
.joinContainer h5{ font-size: 14px; color: #ffb618;}
.joinContainer p{ font-size: 14px; color: #666; margin-top: 1rem;margin-bottom: 1rem;}
.joinContainer img{ margin: 10px 0;}
.am-breadcrumb a{ color: #666;}
    .am-breadcrumb{margin-bottom: 0; border-bottom:1px solid #ededed; font-size: 16px;}
.am-breadcrumb>li+li:before{ content: '';}
</style>
<!--头部完-->
<div class="anliBanner">
    <img style="width: 100%;" class="am-img-responsive" src="/touyun/statics/touyun/images/anli/yBanner.jpg">
</div>

<div style="background-color: #fff; padding: 20px 0">
    <div class="joinContainer">
        <ol class="am-breadcrumb" style=" ">
            <li><a href="#">首页</a></li> &nbsp;&nbsp;>
            <li><a href="<?php echo $CATEGORYS[$catid]['url'];?>"><?php echo $CATEGORYS[$catid]['catname'];?></a></li> &nbsp;&nbsp;>
            <li class="am-active"><?php echo $title;?></li>
            <li class="am-fr"><a href="javascript:;" onclick="javascript :history.back(-1);">返回&nbsp;&nbsp;></a></li>
        </ol>
        <h1 style="line-height:40px;"><?php echo $title;?></h1>
        <p><?php echo $content;?></p>
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