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
<!--白皮书页面-->
<div class="anliBanner">
    <img style="width: 100%;" class="am-img-responsive" src="/touyun/statics/touyun/images/shiming/zlBanner.jpg">
</div>


<div class="alList">
    <ul class="zlListCont am-cf">
	<?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"content\" data=\"op=content&tag_md5=3b7f2f6bf317738b3ddc3f9d593eeb1f&action=lists&catid=%24catid&order=id+DESC&moreinfo=1&num=10&page=%24page\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$content_tag = pc_base::load_app_class("content_tag", "content");if (method_exists($content_tag, 'lists')) {$pagesize = 10;$page = intval($page) ? intval($page) : 1;if($page<=0){$page=1;}$offset = ($page - 1) * $pagesize;$content_total = $content_tag->count(array('catid'=>$catid,'order'=>'id DESC','moreinfo'=>'1','limit'=>$offset.",".$pagesize,'action'=>'lists',));$pages = pages($content_total, $page, $pagesize, $urlrule);$data = $content_tag->lists(array('catid'=>$catid,'order'=>'id DESC','moreinfo'=>'1','limit'=>$offset.",".$pagesize,'action'=>'lists',));}?>

 <?php $n=1; if(is_array($data)) foreach($data AS $key => $val) { ?>
        <li>
            <div class="img">
           <a href="<?php echo $val['url'];?>">
               <img src="<?php echo $val['thumb'];?>">
           </a>
            </div>
            <p><a href="<?php echo $val['url'];?>"> <?php echo $val['title'];?></a></p>
			 <?php $xiazai = string2array($val['downfiles']);?>
			 <?php $j=0;?>
			 <?php $n=1;if(is_array($xiazai)) foreach($xiazai AS $b) { ?>
			<?php if($j==0) { ?>
            <a class="download am-btn am-btn-default" href="<?php echo $b['fileurl'];?>"  target="_blank">下载</a>
			<?php } ?>
			<?php $j++;?>
			<?php $n++;}unset($n); ?>
        </li>
		 <?php $n++;}unset($n); ?>
    </ul>

    <div class="pager">
        <p>
           	<?php echo $pages;?>
        </p>
    </div>
 <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
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