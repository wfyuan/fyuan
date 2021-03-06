<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?><!doctype html>
<html class="no-js">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="<?php echo $SEO['description'];?>">
    <meta name="keywords" content="<?php echo $SEO['keyword'];?>">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><?php echo $title;?></title>
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
    .zanyuContent{ width: 750px; margin: 0 auto; padding-bottom: 70px; }
    .zanyuContent h1{ font-size: 32px; padding-top:70px; margin: 0; margin-bottom:30px;font-weight: bold;}
</style>
<!--头部完-->
<div class="anliBanner">
    <img style="width: 100%;" class="am-img-responsive" src="/touyun/statics/touyun/images/anli/yBanner.jpg">
</div>

<div style="background-color: #fff;">
    <div class="zanyuContent">
         <h1 style="color:#0D5899">公司简介</h1>
        <div class="video-introduce" style="width: 750px;">
            <div class="video" style="width: 750px; height: 387px;">
                <!--  <img src="/touyun/statics/touyun/images/index/vedioimg.jpg"> -->
                <video id="my-video" class="video-js vjs-big-play-centered" controls preload="auto" width="750" height="387"
                       poster="/touyun/statics/touyun/images/about/gsjj.png" data-setup="{}">
                    <source src="/touyun/statics/touyun/mp4/tyvideo.mp4" type="video/mp4">

                </video>
            </div>
        </div>



        <?php echo $content;?>


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

<!-- <div class="footer">
    <div class="container am-cf">
        <div class="mapsite am-fl am-cf">
            <dl>
                <dt>公司简介</dt>
                <dd><a href="">新闻动态</a></dd>
                <dd><a href="">愿景及使命</a></dd>
                <dd><a href="">大事记</a></dd>
                <dd><a href="">专利及荣誉</a></dd>
                <dd><a href="">联系我们</a></dd>
                <dd><a href="">加入我们</a></dd>
            </dl>
            <dl>
                <dt>一物一码</dt>
                <dd><a href="">扫码营销</a></dd>
                <dd><a href="">简单溯源</a></dd>
                <dd><a href="">简单防窜</a></dd>
                <dd><a href="">分销管理</a></dd>
                <dd><a href="">简单防伪</a></dd>
            </dl>
            <dl>
                <dt>众店宝</dt>
                <dd><a href="">产品简介</a></dd>
                <dd><a href="">招商加盟</a></dd>
            </dl>
            <dl>
                <dt>案例中心</dt>
                <dd><a href="">成功案例</a></dd>
                <dd><a href="">客户赞誉</a></dd>
            </dl>
            <dl>
                <dt>行业视界</dt>
                <dd><a href="">市场动态</a></dd>
                <dd><a href="">白皮书</a></dd>
            </dl>
        </div>
        <div class="touyuncode am-fr">
            <p>透云官方微信</p>
            <img src="images/index/wechatcode.png">
        </div>
        <div style="clear: both;"></div>
        <div class="footer-bottom">
            <p>© 2014-2017 SAO.SO 上海透云物联网科技有限公司 版权所有 | 沪ICP12016045号-4 网站地图<br>
                沪公网安备 31010602001034号</p>
        </div>
    </div>
</div> -->
<?php include template("content","tyend"); ?>
</body>
</html>