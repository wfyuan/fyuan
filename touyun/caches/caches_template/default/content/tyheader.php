<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?><div class="index-nav">
    <div class="container am-cf">
        <div class="index_nav">
        <nav class="am-menu  am-menu-dropdown2">
            <a href="javascript: void(0)" class="am-menu-toggle">
                <i class="am-menu-toggle-icon am-icon-bars"></i>
            </a>
            <ul class="am-menu-nav am-avg-sm-4 am-collapse">
			<?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"content\" data=\"op=content&tag_md5=70f0453b28d3b62324557276e5c8c8f2&action=category&catid=0&num=5&siteid=%24siteid&order=listorder+ASC\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$content_tag = pc_base::load_app_class("content_tag", "content");if (method_exists($content_tag, 'category')) {$data = $content_tag->category(array('catid'=>'0','siteid'=>$siteid,'order'=>'listorder ASC','limit'=>'5',));}?>
			<?php $j=0;?>
				  <?php $n=1; if(is_array($data)) foreach($data AS $k => $r) { ?>
				  <?php $j++;?>
				<li class="am-parent">
                    <a href="##" class="parenta" ><?php echo $r['catname'];?></a>

                    <ul class="am-menu-sub am-collapse  am-avg-sm-2 ">
					<?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"content\" data=\"op=content&tag_md5=8ad593f69a30d0c1d8b82e8cae1668a8&action=category&catid=%24k&num=8&siteid=%24siteid&order=listorder+ASC\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$content_tag = pc_base::load_app_class("content_tag", "content");if (method_exists($content_tag, 'category')) {$data = $content_tag->category(array('catid'=>$k,'siteid'=>$siteid,'order'=>'listorder ASC','limit'=>'8',));}?>
						<?php $n=1;if(is_array($data)) foreach($data AS $v) { ?>
                        <li><a href="<?php echo $v['url'];?>" <?php if($_GET["catid"]==$v["catid"]) { ?>style="color:#1BC2FF;"<?php } ?>><?php echo $v['catname'];?></a></li>
                     <?php $n++;}unset($n); ?>
						 <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
                    </ul>
					<?php if($j==3) { ?> <li class="case1"><a href="/touyun/"><img src="/touyun/statics/touyun/images/index/nav-logo.png"> </a></li><?php } ?>

                </li>

				<?php $n++;}unset($n); ?>

			 <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
			 <!--   <li class="am-parent">
                    <a href="##" class="parenta" >关于透云</a>
                    <ul class="am-menu-sub am-collapse  am-avg-sm-2 ">
                        <li><a href="##">新闻动态</a></li>
                        <li><a href="##">愿景及使命</a></li>
                        <li><a href="##">大事记</a></li>
                        <li><a href="##">专利及荣誉</a></li>
                        <li><a href="##">联系我们</a></li>
                        <li><a href="##">加入我们</a></li>
                    </ul>
                </li>
                <li class="am-parent">
                    <a href="##" class="parenta" >一物一码</a>
                    <ul class="am-menu-sub am-collapse  am-avg-sm-3 ">
                        <li><a href="##">扫码营销</a></li>
                        <li><a href="##">简单溯源</a></li>
                        <li><a href="##">简单防窜</a></li>
                        <li><a href="##">分销管理</a></li>
                        <li><a href="##">简单防伪</a></li>
                    </ul>
                </li>

                <li class="am-parent">
                    <a href="#c3" class="parenta" >众店宝</a>
                    <ul class="am-menu-sub am-collapse  am-avg-sm-4 ">
                        <li><a href="##">产品简介</a></li>
                        <li><a href="##">招商加盟</a></li>
                    </ul>
                </li>
                <li class="case1"><img src="images/index/nav-logo.png"></li>
                <li class="am-parent">
                    <a href="##" class="parenta" >案例中心</a>
                    <ul class="am-menu-sub am-collapse  am-avg-sm-3 ">
                        <li><a href="##">成功案例</a></li>
                        <li><a href="##">客户赞誉</a></li>
                    </ul>
                </li>
                <li class="am-parent">
                    <a href="##" class="parenta" >行业视界</a>
                    <ul class="am-menu-sub am-collapse  am-avg-sm-3 ">
                        <li><a href="##">市场动态</a></li>
                        <li><a href="##">白皮书</a></li>
                    </ul>
                </li> -->
            </ul>

        </nav>
        </div>

        <div class="nav-focus">
             <ul class="focus am-cf">
                 <li>
                     <a class="case1" href="javascript:;"></a>
                     <div class="topCodebg">
                         <img src="/touyun/statics/touyun/images/index/wechatcode.png">
                         <span>透云官方微信</span>
                     </div>
                 </li>
                 <li>
                     <!--<a target="_blank" class="case2" href="https://weibo.com/TouYunTech"></a>-->
                     <a class="case2" href="javascript:;"></a>
                     <div class="topCodebg">
                         <img src="/touyun/statics/touyun/images/index/wechatcode.png">
                         <span>透云官方微博</span>
                     </div>
                 </li>
                 <li><a class="case3" href="javascript:;"></a> 021-61820853</li>
             </ul>
        </div>
    </div>
</div>
<div style="height:72px;"></div>