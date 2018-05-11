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
<!-- <div class="index-nav">
    <div class="container am-cf">
        <ul class="nav am-cf am-fl">
             <li><a href="">关于透云</a></li>
             <li><a href="">一物一码</a></li>
             <li><a href="">众店宝</a></li>
             <li class="case1"><a href=""><img src="images/index/nav-logo.png"> </a></li>
             <li><a href="">案例中心</a></li>
             <li><a href="">行业视界</a></li>
        </ul>
        <div class="nav-focus am-fr">
             <ul class="focus am-cf">
                 <li><a class="case1" href=""></a> </li>
                 <li><a class="case2" href=""></a> </li>
                 <li><a class="case3" href=""></a> 021-61820853</li>
             </ul>
        </div>
    </div>
</div> -->
<?php include template("content","tyheader"); ?>
<style>
.joinContainer{ width: 750px; margin: 0 auto; background-color: #fff; padding: 40px; color: #666;}
    .joinContainer a{ color: #333;}
.joinContainer th{ font-size: 18px; font-weight: normal; color: #ffb618;}
</style>
<!--头部完-->
<div class="anliBanner">
    <img style="width: 100%;" class="am-img-responsive" src="/touyun/statics/touyun/images/anli/yBanner.jpg">
</div>

<div style="background-color: #f4f4f4; padding: 40px 0">
    <div class="joinContainer">
        <table class="am-table am-table-hover">
            <thead>
            <tr>
                <th style="color:#0D5899">职位名称</th>
                <th style="color:#0D5899">职位类别</th>
                <th class="am-text-right" style="color:#0D5899">职位地点</th>
            </tr>
            </thead>
            <tbody>
			 <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"content\" data=\"op=content&tag_md5=8712c35cb26fa20bcfcccaf7c40be7f1&action=lists&catid=14+order%3D&num=10&page=%24page&moreinfo=1\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$content_tag = pc_base::load_app_class("content_tag", "content");if (method_exists($content_tag, 'lists')) {$pagesize = 10;$page = intval($page) ? intval($page) : 1;if($page<=0){$page=1;}$offset = ($page - 1) * $pagesize;$content_total = $content_tag->count(array('catid'=>'14 order=','moreinfo'=>'1','limit'=>$offset.",".$pagesize,'action'=>'lists',));$pages = pages($content_total, $page, $pagesize, $urlrule);$data = $content_tag->lists(array('catid'=>'14 order=','moreinfo'=>'1','limit'=>$offset.",".$pagesize,'action'=>'lists',));}?>

 <?php $n=1; if(is_array($data)) foreach($data AS $key => $val) { ?>
            <tr>
                <td><a href="<?php echo $val['url'];?>"> <?php echo $val['title'];?></a></td>
                <td><?php echo $val['zwlb'];?></td>
                <td class="am-text-right"><?php echo $val['address'];?></td>
            </tr>
			 
 <?php $n++;}unset($n); ?>


          
            </tbody>
        </table>

        <div class="pager" style="margin-top: 30px;">
            <p>
			<?php echo $pages;?>
               <!--  <a href="">上一页</a>
                <a class="active" href="">1</a>
                <a href="">2</a>
                <a href="">3</a>
                <a href="">4</a>
                <a href="">4</a>
                <a href="">下一页</a> -->
            </p>
        </div>
 <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
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