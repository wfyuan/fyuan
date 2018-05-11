<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?><!doctype html>
<html class="no-js">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><?php if(isset($SEO['title']) && !empty($SEO['title'])) { ?><?php echo $SEO['title'];?><?php } ?><?php echo $SEO['site_title'];?></title>

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
<script src="/touyun/statics/touyun/js/index/index.js"></script>
<!-- <div class="index-nav">
    <div class="container am-cf">
        <ul class="nav am-cf am-fl">
              <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"content\" data=\"op=content&tag_md5=70f0453b28d3b62324557276e5c8c8f2&action=category&catid=0&num=5&siteid=%24siteid&order=listorder+ASC\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$content_tag = pc_base::load_app_class("content_tag", "content");if (method_exists($content_tag, 'category')) {$data = $content_tag->category(array('catid'=>'0','siteid'=>$siteid,'order'=>'listorder ASC','limit'=>'5',));}?>
            <?php $n=1;if(is_array($data)) foreach($data AS $r) { ?>
           <li> <a href="<?php echo $r['url'];?>"><?php echo $r['catname'];?></a></li>
			<?php if($n==3) { ?> <li class="case1"><a href=""><img src="/touyun/statics/touyun/images/index/nav-logo.png"> </a></li><?php } ?>
            <?php $n++;}unset($n); ?>
            <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
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
<!--头部完-->
<style>
    .anliList{ background-color: #fff;}
    .anliWarp{ width: 750px; margin: 0 auto; position: relative; padding: 40px 0 50px; }
    .anliWarp img:hover{ opacity: 0.6; }
    .anliWarp img{ transition: 0.5s; }
    .searchbox{ width: 100%; margin-bottom: 50px; }
    .searchbox input{  width: 260px; float: right; height: 34px; font-size: 16px; padding-left: 5px; outline: none; -webkit-appearance: none; border: 1px solid #ddd; }
</style>
<!--案例列表-->
<div class="anliBanner">
    <img class="am-img-responsive" src="/touyun/statics/touyun/images/anli/anlibanner.jpg">
</div>
<div class="anliList">
    <div class="anliWarp" style="">
        <div class="searchbox">
            <input type="text" placeholder="请输入行业">
        </div>
        <ul data-am-widget="gallery" class="am-gallery am-avg-sm-3 am-gallery-default" data-am-gallery="{ pureview: false }" >
  
  			
				 <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"content\" data=\"op=content&tag_md5=aeff04ed02bbd722df076af47baff6ba&action=lists&catid=24+order%3D&num=25\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$content_tag = pc_base::load_app_class("content_tag", "content");if (method_exists($content_tag, 'lists')) {$data = $content_tag->lists(array('catid'=>'24 order=','limit'=>'25',));}?>

 <?php $n=1; if(is_array($data)) foreach($data AS $key => $val) { ?>
 <li>
                <div class="am-gallery-item">
                    <a href="<?php echo $val['url'];?>">
                        <img src="<?php echo $val['thumb'];?>"/>
                    </a>
                </div>
            </li>
 
 
 
 
 
 <?php $n++;}unset($n); ?>

 <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
         <!--    <li>
                <div class="am-gallery-item">
                    <a href="">
                        <img src="/touyun/statics/touyun/images/anli/customer1.png"/>
                    </a>
                </div>
            </li>
            <li>
                <div class="am-gallery-item">
                    <a href="">
                        <img src="/touyun/statics/touyun/images/anli/customer2.png"/>
                    </a>
                </div>
            </li>
            <li>
                <div class="am-gallery-item">
                    <a href="">
                        <img src="/touyun/statics/touyun/images/anli/customer3.png"/>
                    </a>
                </div>
            </li>
            <li>
                <div class="am-gallery-item">
                    <a href="">
                        <img src="/touyun/statics/touyun/images/anli/customer4.png"/>
                    </a>
                </div>
            </li>
            <li>
                <div class="am-gallery-item">
                    <a href="">
                        <img src="/touyun/statics/touyun/images/anli/customer5.png"/>
                    </a>
                </div>
            </li>
            <li>
                <div class="am-gallery-item">
                    <a href="">
                        <img src="/touyun/statics/touyun/images/anli/customer6.png"/>
                    </a>
                </div>
            </li>
            <li>
                <div class="am-gallery-item">
                    <a href="">
                        <img src="/touyun/statics/touyun/images/anli/customer7.png"/>
                    </a>
                </div>
            </li>
            <li>
                <div class="am-gallery-item">
                    <a href="">
                        <img src="/touyun/statics/touyun/images/anli/customer8.png"/>
                    </a>
                </div>
            </li>
            <li>
                <div class="am-gallery-item">
                    <a href="">
                        <img src="/touyun/statics/touyun/images/anli/customer9.png"/>
                    </a>
                </div>
            </li>
            <li>
                <div class="am-gallery-item">
                    <a href="">
                        <img src="/touyun/statics/touyun/images/anli/customer10.png"/>
                    </a>
                </div>
            </li>
            <li>
                <div class="am-gallery-item">
                    <a href="">
                        <img src="/touyun/statics/touyun/images/anli/customer11.png"/>
                    </a>
                </div>
            </li>
            <li>
                <div class="am-gallery-item">
                    <a href="">
                        <img src="/touyun/statics/touyun/images/anli/customer12.png"/>
                    </a>
                </div>
            </li>
            <li>
                <div class="am-gallery-item">
                    <a href="">
                        <img src="/touyun/statics/touyun/images/anli/customer1.png"/>
                    </a>
                </div>
            </li> -->
        </ul>
    </div>
</div>
<!--案例列表完-->


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
<?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"content\" data=\"op=content&tag_md5=b43f1459ac702900c8d44c91a5e796dd&action=category&catid=0&num=25&siteid=%24siteid&order=listorder+ASC\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$content_tag = pc_base::load_app_class("content_tag", "content");if (method_exists($content_tag, 'category')) {$data = $content_tag->category(array('catid'=>'0','siteid'=>$siteid,'order'=>'listorder ASC','limit'=>'25',));}?>
            <?php $n=1; if(is_array($data)) foreach($data AS $k => $r) { ?>
			<dl>
                <dt><?php echo $r['catname'];?></dt>
				<?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"content\" data=\"op=content&tag_md5=050b6fa64652ce6258bc9e7d61f5b7cc&action=category&catid=%24k&num=10&siteid=%24siteid&order=listorder+ASC\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$content_tag = pc_base::load_app_class("content_tag", "content");if (method_exists($content_tag, 'category')) {$data = $content_tag->category(array('catid'=>$k,'siteid'=>$siteid,'order'=>'listorder ASC','limit'=>'10',));}?>
				 <?php $n=1;if(is_array($data)) foreach($data AS $r) { ?>
                <dd><a href="<?php echo $r['url'];?>"><?php echo $r['catname'];?></a></dd>
				 <?php $n++;}unset($n); ?>
				<?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
            </dl>
            <?php $n++;}unset($n); ?>
            <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
        </div>
        <div class="touyuncode am-fr">
            <p>透云官方微信</p>
            <img src="/touyun/statics/touyun/images/index/wechatcode.png">
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