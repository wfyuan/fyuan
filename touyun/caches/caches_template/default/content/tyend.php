<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?><div class="footer" id="footer">
    <div class="container1000 am-cf">
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
            <p class='am-text-center'>扫一扫，关注透云</p>
            <img src="/touyun/statics/touyun/images/index/wechatcode.png">
        </div>
        <div style="clear: both;"></div>
        <div class="footer-bottom">
            <p>© 2014-2018 SAO.SO 上海透云物联网科技有限公司 版权所有 | 沪ICP12016045号-4 网站地图<br>
                沪公网安备 31010602001034号1111</p>
        </div>
    </div>
</div>