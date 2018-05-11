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
.joinContainer{ width: 840px; margin: 0 auto; background-color: #fff;color: #666; padding-bottom: 60px;}
.newslist{ margin: 0; padding: 0;}
.newslist li{ padding-bottom: 30px;}
.newslist li .img{ width: 180px; height: 120px; overflow: hidden; float: left;}
.newslist li .img img{ width: 100%;}
.newslist li .img img:hover{ opacity: 0.8;}
.newslist li .text{ width:630px; float: right;}
.newslist li .text h4{ font-size: 18px; margin: 0; font-weight: bold; padding-bottom: 30px;}
.newslist li .text h4 a{ color: #333;}
.newslist li .text h4 a:hover{ color: #0d5899; }
.newslist li .text h4 span{ font-size: 14px; font-weight: normal; color: #999; padding-left: 30px; float: right; padding-top: 4px;}
/*.newslist li .text h5{ font-size: 14px; padding: 10px 0 5px; margin: 0;color: #009bd3;}*/
.newslist li .text p{ font-size: 16px; margin: 0;}
.am-breadcrumb{margin-bottom: 0; border-bottom:1px solid #ededed; font-size: 18px; padding: 20px 0; margin-bottom: 30px;}
.am-breadcrumb a{  color: #666;}
.am-breadcrumb>li+li:before{ content: '';}
</style>
<!--头部完-->
<div class="anliBanner">
    <img style="width: 100%;" class="am-img-responsive" src="/touyun/statics/touyun/images/anli/yBanner.jpg">
</div>

<div style="background-color: #fff; padding: 0px 0">
    <div class="joinContainer">
        <ol class="am-breadcrumb" style=" ">
            <li><a href="<?php echo $CATEGORYS[$catid]['url'];?>"><?php echo $CATEGORYS[$catid]['catname'];?></a></li>
        </ol>

<?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"content\" data=\"op=content&tag_md5=11e982198282a77f17ebf8d7a1dede5e&action=lists&catid=%24catid&num=10&order=id+DESC&page=%24page\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$content_tag = pc_base::load_app_class("content_tag", "content");if (method_exists($content_tag, 'lists')) {$pagesize = 10;$page = intval($page) ? intval($page) : 1;if($page<=0){$page=1;}$offset = ($page - 1) * $pagesize;$content_total = $content_tag->count(array('catid'=>$catid,'order'=>'id DESC','limit'=>$offset.",".$pagesize,'action'=>'lists',));$pages = pages($content_total, $page, $pagesize, $urlrule);$data = $content_tag->lists(array('catid'=>$catid,'order'=>'id DESC','limit'=>$offset.",".$pagesize,'action'=>'lists',));}?>
        <ul class="newslist">
		<?php $n=1;if(is_array($data)) foreach($data AS $r) { ?>
            <li class="am-cf">
                <div class="img">
                    <a href="<?php echo $r['url'];?>">
                        <img src="<?php echo $r['thumb'];?>"  style="width:180px;">
                    </a>
                </div>
                <div class="text">
                    <h4><a href="<?php echo $r['url'];?>"><?php echo str_cut($r[title], 74);?></a>
                        <span><?php echo date('Y-m-d H:i:s',$r[inputtime]);?></span>
                    </h4>

                  <p><?php echo $r['description'];?></p>
                </div>
            </li>
   <?php $n++;}unset($n); ?>
        </ul>
      <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>  
        <div class="pager" style="margin-top: 30px;">
           <!--  <p>
                <a href="">上一页</a>
                <a class="active" href="">1</a>
                <a href="">2</a>
                <a href="">3</a>
                <a href="">4</a>
                <a href="">4</a>
                <a href="">下一页</a>
            </p> --><?php echo $pages;?>
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