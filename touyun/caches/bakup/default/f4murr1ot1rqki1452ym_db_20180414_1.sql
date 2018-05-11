# phpcms bakfile
# version:PHPCMS V9
# time:2018-04-14 21:58:47
# type:phpcms
# phpcms:http://www.phpcms.cn
# --------------------------------------------------------


DROP TABLE IF EXISTS `v9_admin`;
CREATE TABLE `v9_admin` (
  `userid` mediumint(6) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `roleid` smallint(5) DEFAULT '0',
  `encrypt` varchar(6) DEFAULT NULL,
  `lastloginip` varchar(15) DEFAULT NULL,
  `lastlogintime` int(10) unsigned DEFAULT '0',
  `email` varchar(40) DEFAULT NULL,
  `realname` varchar(50) NOT NULL DEFAULT '',
  `card` varchar(255) NOT NULL,
  `lang` varchar(6) NOT NULL,
  PRIMARY KEY (`userid`),
  KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO `v9_admin` VALUES('1','phpcms','d84c0e2a628ce777adecc14b48085e50','1','h3JJbM','61.129.122.78','1523705715','222@qq.com','','','');

DROP TABLE IF EXISTS `v9_admin_panel`;
CREATE TABLE `v9_admin_panel` (
  `menuid` mediumint(8) unsigned NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` char(32) DEFAULT NULL,
  `url` char(255) DEFAULT NULL,
  `datetime` int(10) unsigned DEFAULT '0',
  UNIQUE KEY `userid` (`menuid`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_admin_role`;
CREATE TABLE `v9_admin_role` (
  `roleid` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `rolename` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`roleid`),
  KEY `listorder` (`listorder`),
  KEY `disabled` (`disabled`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO `v9_admin_role` VALUES('1','超级管理员','超级管理员','0','0');
INSERT INTO `v9_admin_role` VALUES('2','站点管理员','站点管理员','0','0');
INSERT INTO `v9_admin_role` VALUES('3','运营总监','运营总监','1','0');
INSERT INTO `v9_admin_role` VALUES('4','总编','总编','5','0');
INSERT INTO `v9_admin_role` VALUES('5','编辑','编辑','1','0');
INSERT INTO `v9_admin_role` VALUES('7','发布人员','发布人员','0','0');

DROP TABLE IF EXISTS `v9_admin_role_priv`;
CREATE TABLE `v9_admin_role_priv` (
  `roleid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL,
  `c` char(20) NOT NULL,
  `a` char(20) NOT NULL,
  `data` char(30) NOT NULL DEFAULT '',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  KEY `roleid` (`roleid`,`m`,`c`,`a`,`siteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_anli`;
CREATE TABLE `v9_anli` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` char(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO `v9_anli` VALUES('1','28','0','蒙牛优益C营销案例','','http://www.wfyuan.com/touyun/uploadfile/2018/0305/20180305105537765.png','蒙牛','','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=28&id=1','0','99','1','0','phpcms','1520262603','1523465941');

DROP TABLE IF EXISTS `v9_anli_data`;
CREATE TABLE `v9_anli_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content1` mediumtext NOT NULL,
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `content2` mediumtext NOT NULL,
  `sxtime` varchar(255) NOT NULL DEFAULT '',
  `fmsl` varchar(255) NOT NULL DEFAULT '',
  `xmneed` mediumtext NOT NULL,
  `sxgn` mediumtext NOT NULL,
  `content3` mediumtext NOT NULL,
  `toppic` varchar(255) NOT NULL DEFAULT '',
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO `v9_anli_data` VALUES('1','<img alt=\"\" src=\"http://www.wfyuan.com/touyun/uploadfile/2018/0305/20180305111134263.jpg\" style=\"width: 505px; height: 208px;\" />','','0','10000','','0','1','','&bull; &nbsp;&nbsp;&nbsp;&nbsp; 通过扫码赢取现金红包，吸引消费者购买产品，提高产品销量<br />\r\n&bull; &nbsp;&nbsp;&nbsp;&nbsp; 通过扫码签到获取抽奖机会，吸引消费者多次购买产品，提升购买粘性<br />\r\n&bull; &nbsp;&nbsp;&nbsp;&nbsp; 通过灵活调整奖品数量、中奖率方式锁定更多的消费者<br />\r\n&bull; &nbsp;&nbsp;&nbsp;&nbsp; 扫码获取大量消费者数据协助企业更好地追踪产品营销成果，优化营销策略<br />\r\n','2017.06','上亿','扫码促销 消费者互动','产品促销/大数据分析/营销活动管理','<p>扫码抽奖；与大众点评资源方合作</p>\r\n<p>&bull; &nbsp;&nbsp;&nbsp;&nbsp; 强大的研发团队和技术平台优势，满足客户的定制化需求<br />\r\n&bull; &nbsp;&nbsp;&nbsp;&nbsp; 系统的安全性和抗压性保障活动资金安全<br />\r\n&bull; &nbsp;&nbsp;&nbsp;&nbsp; 营销创意优化，提升消费者体验度，扩大品牌影响</p>\r\n','http://www.wfyuan.com/touyun/uploadfile/2018/0412/20180412125851959.jpg');

DROP TABLE IF EXISTS `v9_announce`;
CREATE TABLE `v9_announce` (
  `aid` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` char(80) NOT NULL,
  `content` text NOT NULL,
  `starttime` date NOT NULL DEFAULT '0000-00-00',
  `endtime` date NOT NULL DEFAULT '0000-00-00',
  `username` varchar(40) NOT NULL,
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` smallint(5) unsigned NOT NULL DEFAULT '0',
  `passed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `style` char(15) NOT NULL,
  `show_template` char(30) NOT NULL,
  PRIMARY KEY (`aid`),
  KEY `siteid` (`siteid`,`passed`,`endtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_attachment`;
CREATE TABLE `v9_attachment` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module` char(15) NOT NULL,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `filename` char(50) NOT NULL,
  `filepath` char(200) NOT NULL,
  `filesize` int(10) unsigned NOT NULL DEFAULT '0',
  `fileext` char(10) NOT NULL,
  `isimage` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isthumb` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `downloads` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uploadtime` int(10) unsigned NOT NULL DEFAULT '0',
  `uploadip` char(15) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `authcode` char(32) NOT NULL,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`),
  KEY `authcode` (`authcode`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO `v9_attachment` VALUES('1','content','11','20160505001128_58601_thumb.jpg','2018/0414/20180414070734324.jpg','9386','jpg','1','0','0','1','1523704054','61.129.122.78','1','114ede342b4011e33f9df488ad9b3e69','1');
INSERT INTO `v9_attachment` VALUES('2','content','11','20160520012504_31802_thumb.png','2018/0414/20180414075116713.png','58422','png','1','0','0','1','1523706676','61.129.122.78','1','6069807ba993c7ccc73a68090fce3ce8','1');
INSERT INTO `v9_attachment` VALUES('3','content','11','20160520012430_13294_thumb.png','2018/0414/20180414075141842.png','62684','png','1','0','0','1','1523706701','61.129.122.78','1','078ba3fa0ed167fa7bea2d55fa93cb0c','1');
INSERT INTO `v9_attachment` VALUES('4','content','11','20160520012336_27164_thumb.png','2018/0414/20180414075218852.png','69089','png','1','0','0','1','1523706738','61.129.122.78','1','7fe35e5df59e55032cb0745635c7b7c3','1');
INSERT INTO `v9_attachment` VALUES('5','content','11','20160520012247_97616_thumb.png','2018/0414/20180414075305117.png','76435','png','1','0','0','1','1523706785','61.129.122.78','1','5f6d720923e8c737a72335f1905bdc4f','1');
INSERT INTO `v9_attachment` VALUES('6','content','11','20160523180644_40122_thumb.jpg','2018/0414/20180414075328893.jpg','10083','jpg','1','0','0','1','1523706808','61.129.122.78','1','fa41c4e501a5ddcc2c096ea3a4ad48da','1');
INSERT INTO `v9_attachment` VALUES('7','content','11','20160520012208_66588_thumb.png','2018/0414/20180414075350429.png','60853','png','1','0','0','1','1523706830','61.129.122.78','1','199293ad692b8f94b3187a3e6fbaccf7','1');
INSERT INTO `v9_attachment` VALUES('8','content','11','20160520012111_38284_thumb.png','2018/0414/20180414075418612.png','59005','png','1','0','0','1','1523706858','61.129.122.78','1','4a9e188658808f712ccad5763876ec80','1');
INSERT INTO `v9_attachment` VALUES('9','content','11','20160523113248_95858_thumb.jpg','2018/0414/20180414075437733.jpg','9749','jpg','1','0','0','1','1523706877','61.129.122.78','1','73dae91f6ae87e86f4bbebbb5deb5716','1');
INSERT INTO `v9_attachment` VALUES('10','content','11','20160520011948_92454_thumb.png','2018/0414/20180414075456903.png','57370','png','1','0','0','1','1523706896','61.129.122.78','1','4c4d5bdd09ca01b13ca26be90fd3de6b','1');
INSERT INTO `v9_attachment` VALUES('11','content','12','20160519004857_76317_thumb.jpg','2018/0414/20180414075541775.jpg','15405','jpg','1','0','0','1','1523706941','61.129.122.78','1','cc9134ce1d494beae8acd26a35c075e9','1');
INSERT INTO `v9_attachment` VALUES('12','content','12','20160519004916_89021_thumb.jpg','2018/0414/20180414075600711.jpg','16252','jpg','1','0','0','1','1523706960','61.129.122.78','1','a8cea986f088d22a49d385e922017249','1');
INSERT INTO `v9_attachment` VALUES('13','content','12','20160519004936_99208_thumb.jpg','2018/0414/20180414075616235.jpg','22802','jpg','1','0','0','1','1523706976','61.129.122.78','1','ed39a10b5612dd12ed5230e0aa040740','1');
INSERT INTO `v9_attachment` VALUES('14','content','12','20160519005013_28768_thumb.jpg','2018/0414/20180414075643759.jpg','18874','jpg','1','0','0','1','1523707003','61.129.122.78','1','def94b840dc87c72a24e03f78ee9e8b8','1');
INSERT INTO `v9_attachment` VALUES('15','content','12','20160519005222_93088_thumb.jpg','2018/0414/20180414075657958.jpg','10509','jpg','1','0','0','1','1523707017','61.129.122.78','1','84f4fdbdaaab1582c8b6224149a58c8f','1');
INSERT INTO `v9_attachment` VALUES('16','content','12','20160602171038_86084_thumb.jpg','2018/0414/20180414075714285.jpg','22065','jpg','1','0','0','1','1523707034','61.129.122.78','1','1a0c55c7bc3484379c17707826defe5d','1');
INSERT INTO `v9_attachment` VALUES('17','content','12','20160602171059_87297_thumb.png','2018/0414/20180414075733579.png','203465','png','1','0','0','1','1523707053','61.129.122.78','1','c54085771561b87a1b283d22ae981c51','1');
INSERT INTO `v9_attachment` VALUES('18','content','12','20171227140422_32728_thumb.jpg','2018/0414/20180414075750461.jpg','8856','jpg','1','0','0','1','1523707070','61.129.122.78','1','b6bacad79dc9932e77ebb6a1e3d653d5','1');
INSERT INTO `v9_attachment` VALUES('19','content','24','20160728134533_90470.jpg','2018/0414/20180414084256223.jpg','128324','jpg','1','0','0','1','1523709776','61.129.122.78','1','ddb1218a37adb4e5c89025d49dae55f3','1');
INSERT INTO `v9_attachment` VALUES('20','content','28','20160515100800_72023.png','2018/0414/20180414090017870.png','513631','png','1','0','0','1','1523710817','61.129.122.78','1','818ecfc1ff022ebb8ca0aba63ae6121e','1');
INSERT INTO `v9_attachment` VALUES('21','content','28','20160515100838_41706.png','2018/0414/20180414090030210.png','67908','png','1','0','0','1','1523710830','61.129.122.78','1','b0aec4b6b7a04df512534354ba6a3d28','1');
INSERT INTO `v9_attachment` VALUES('22','content','28','20160519021740_73712.jpg','2018/0414/20180414090630226.jpg','244364','jpg','1','0','0','1','1523711190','61.129.122.78','1','6404e57dbb6a663cf15efa4a9b107ffb','1');
INSERT INTO `v9_attachment` VALUES('23','content','28','20160519021620_54968.jpg','2018/0414/20180414090740370.jpg','274497','jpg','1','0','0','1','1523711259','61.129.122.78','1','ad1e7d0a908089099433e0287450f24f','1');
INSERT INTO `v9_attachment` VALUES('24','content','28','20160519030026_81284.jpg','2018/0414/20180414090829968.jpg','78364','jpg','1','0','0','1','1523711309','61.129.122.78','1','e4bd87056054a396e01541425c7c9889','1');
INSERT INTO `v9_attachment` VALUES('25','content','28','20160519030210_19938.jpg','2018/0414/20180414090839831.jpg','35245','jpg','1','0','0','1','1523711319','61.129.122.78','1','0c26d2724ac38e43888e83c21852793b','1');
INSERT INTO `v9_attachment` VALUES('26','content','28','20160519030251_96098.jpg','2018/0414/20180414090851108.jpg','37966','jpg','1','0','0','1','1523711331','61.129.122.78','1','06e634859b073bf48917bbee97b59b0b','1');
INSERT INTO `v9_attachment` VALUES('27','content','28','20160519030606_73722.jpg','2018/0414/20180414090927960.jpg','472415','jpg','1','0','0','1','1523711367','61.129.122.78','1','05ef1166fdb2a506745f8ae68e0cee91','1');
INSERT INTO `v9_attachment` VALUES('28','content','28','20160519030843_11646.jpg','2018/0414/20180414091000523.jpg','25816','jpg','1','0','0','1','1523711400','61.129.122.78','1','42868104e5b4567c98ebc978995e9b80','1');
INSERT INTO `v9_attachment` VALUES('29','content','28','20160519031116_12058.jpg','2018/0414/20180414091038238.jpg','61433','jpg','1','0','0','1','1523711438','61.129.122.78','1','e4383793200d465bbc8c400fb62249f1','1');
INSERT INTO `v9_attachment` VALUES('30','content','28','20160519031320_72750.jpg','2018/0414/20180414091131369.jpg','226715','jpg','1','0','0','1','1523711491','61.129.122.78','1','4cac7c5151c62bd5f5e9ea3c2700910d','1');
INSERT INTO `v9_attachment` VALUES('31','content','28','20160519031633_61902.jpg','2018/0414/20180414091231471.jpg','31889','jpg','1','0','0','1','1523711551','61.129.122.78','1','2d74f7a7f4fbe57cda56172678332b24','1');
INSERT INTO `v9_attachment` VALUES('32','content','28','20160519031927_95043.jpg','2018/0414/20180414091310582.jpg','85723','jpg','1','0','0','1','1523711590','61.129.122.78','1','b53ac83ff56c7cfdf4b386c4992c0212','1');
INSERT INTO `v9_attachment` VALUES('33','content','28','20160519032258_76402.jpg','2018/0414/20180414091341505.jpg','25155','jpg','1','0','0','1','1523711621','61.129.122.78','1','59474490e3e79c5fa66a600e6fe5bdc3','1');
INSERT INTO `v9_attachment` VALUES('34','content','28','20160519032436_20851.jpg','2018/0414/20180414091434844.jpg','77824','jpg','1','0','0','1','1523711674','61.129.122.78','1','3c3769a074607e854db8d37cd0014270','1');
INSERT INTO `v9_attachment` VALUES('35','content','28','20160602111621_50705.jpg','2018/0414/20180414091513578.jpg','138753','jpg','1','0','0','1','1523711713','61.129.122.78','1','6a08f8a52141dc3a8a019dd109188607','1');
INSERT INTO `v9_attachment` VALUES('36','content','28','20160613151739_44946.jpg','2018/0414/20180414091546583.jpg','14153','jpg','1','0','0','1','1523711746','61.129.122.78','1','bca69f8fc0dbc92620ac54669766c633','1');
INSERT INTO `v9_attachment` VALUES('37','content','28','20160613153447_21167.jpg','2018/0414/20180414091621260.jpg','18285','jpg','1','0','0','1','1523711781','61.129.122.78','1','5481b6e8b0286054ad29acaf50846ea2','1');
INSERT INTO `v9_attachment` VALUES('38','content','26','20160524103022_13962.jpg','2018/0414/20180414092003295.jpg','1141908','jpg','1','0','0','1','1523712003','61.129.122.78','1','95285b453f2cfa76e838d78e09c7f8ab','1');
INSERT INTO `v9_attachment` VALUES('39','content','26','20160524113259_22433.jpg','2018/0414/20180414092314593.jpg','89570','jpg','1','0','0','1','1523712194','61.129.122.78','1','e220c5472626644ec70fc994b1116ba2','1');
INSERT INTO `v9_attachment` VALUES('40','content','29','20160520105433_21828.jpg','2018/0414/20180414092453686.jpg','649115','jpg','1','0','0','1','1523712293','61.129.122.78','1','8383b346ab38dfd6cb60904d7106a0f5','1');
INSERT INTO `v9_attachment` VALUES('41','content','29','20160520105529_73468.jpg','2018/0414/20180414092507435.jpg','17789','jpg','1','0','0','1','1523712307','61.129.122.78','1','d3914ba6e0d020f569fd06f84524cc76','1');
INSERT INTO `v9_attachment` VALUES('42','content','29','20160627112105_24800.pdf','2018/0414/20180414092833312.pdf','8396404','pdf','0','0','0','1','1523712513','61.129.122.78','1','5730261f145ecda375f83fc9caf6bcf1','1');
INSERT INTO `v9_attachment` VALUES('43','content','29','20180111142241_34518.png','2018/0414/20180414093409579.png','14557','png','1','0','0','1','1523712849','61.129.122.78','1','a308dca09187fca2b98deffd73438ab3','1');
INSERT INTO `v9_attachment` VALUES('44','content','29','20180111142101_13610.png','2018/0414/20180414093625722.png','33918','png','1','0','0','1','1523712985','61.129.122.78','1','bf94ca711bf5e3320c3c8cebcffbd75a','1');
INSERT INTO `v9_attachment` VALUES('45','content','29','20180111142132_35333.png','2018/0414/20180414093647765.png','52816','png','1','0','0','1','1523713007','61.129.122.78','1','33ba9b89eec4f523027e12365189c0b9','1');
INSERT INTO `v9_attachment` VALUES('46','content','29','20170323115509_25933_thumb.jpg','2018/0414/20180414093815983.jpg','13575','jpg','1','0','0','1','1523713095','61.129.122.78','1','b4a2e13c40aed2443e32f35a70d132e5','1');
INSERT INTO `v9_attachment` VALUES('47','content','28','20160613155635_31419 (1).jpg','2018/0414/20180414094057825.jpg','25501','jpg','1','0','0','1','1523713257','61.129.122.78','1','1c162869af82c35b4119ee8fdffa1e66','1');
INSERT INTO `v9_attachment` VALUES('48','content','28','20160613160809_23812.jpg','2018/0414/20180414094134483.jpg','18821','jpg','1','0','0','1','1523713294','61.129.122.78','1','2bf929c0f5386e78474ce0591538c147','1');
INSERT INTO `v9_attachment` VALUES('49','content','28','20160613163517_88617.jpg','2018/0414/20180414094248476.jpg','15459','jpg','1','0','0','1','1523713368','61.129.122.78','1','6fbd08d88ea18d80599aebd467d5319c','1');
INSERT INTO `v9_attachment` VALUES('50','content','28','20160613170445_23177.jpg','2018/0414/20180414094333584.jpg','17546','jpg','1','0','0','1','1523713413','61.129.122.78','1','ac335205d6a3afb5f9a793711f308349','1');
INSERT INTO `v9_attachment` VALUES('51','content','28','20160613171839_96833.jpg','2018/0414/20180414094409669.jpg','35398','jpg','1','0','0','1','1523713449','61.129.122.78','1','024f903352babf007a3cb1c814598fd4','1');
INSERT INTO `v9_attachment` VALUES('52','content','28','20160623144852_82303.jpg','2018/0414/20180414094444825.jpg','13216','jpg','1','0','0','1','1523713484','61.129.122.78','1','b5c99cffb9c6a289f8392c5b75ad2e9e','1');
INSERT INTO `v9_attachment` VALUES('53','content','33','alone-icon1.gif','2018/0414/20180414094447837.gif','359659','gif','1','0','0','1','1523713487','120.206.223.4','1','698128dafe747d7d7b88c5877178f3e3','1');
INSERT INTO `v9_attachment` VALUES('54','content','33','alone-icon1.png','2018/0414/20180414094520764.png','14227','png','1','0','0','1','1523713520','120.206.223.4','1','2a8eccd35e12c09e1af29072e19b539a','1');
INSERT INTO `v9_attachment` VALUES('55','content','28','20160623153701_63041.jpg','2018/0414/20180414094528210.jpg','14673','jpg','1','0','0','1','1523713528','61.129.122.78','1','2fabecb60f6f0a35aff0bb2e873150fc','1');
INSERT INTO `v9_attachment` VALUES('56','content','28','20160623154052_40645.jpg','2018/0414/20180414094600657.jpg','16159','jpg','1','0','0','1','1523713560','61.129.122.78','1','ff5439d9064eeac7ce7a7541fc3eb395','1');
INSERT INTO `v9_attachment` VALUES('57','content','33','alone-icon2.png','2018/0414/20180414094603876.png','19187','png','1','0','0','1','1523713563','120.206.223.4','1','a0eafc1993ef1ed3b57712babcbb7a72','1');
INSERT INTO `v9_attachment` VALUES('58','content','33','alone-icon2.gif','2018/0414/20180414094612837.gif','582214','gif','1','0','0','1','1523713572','120.206.223.4','1','6aefec7da91914babd50d0a1ca999af0','1');
INSERT INTO `v9_attachment` VALUES('59','content','28','20160704094212_13328.jpg','2018/0414/20180414094634302.jpg','15990','jpg','1','0','0','1','1523713594','61.129.122.78','1','a8003ad29b365e3ec13e325610b38050','1');
INSERT INTO `v9_attachment` VALUES('60','content','33','alone-icon3.png','2018/0414/20180414094641878.png','18434','png','1','0','0','1','1523713601','120.206.223.4','1','2faf9968b13421df7d779aa66942d93f','1');
INSERT INTO `v9_attachment` VALUES('61','content','33','alone-icon3.gif','2018/0414/20180414094651587.gif','607253','gif','1','0','0','1','1523713611','120.206.223.4','1','52fea7b21e675ce5de9283829fcaa4fe','1');
INSERT INTO `v9_attachment` VALUES('62','content','33','alone-icon4.png','2018/0414/20180414094719717.png','18281','png','1','0','0','1','1523713639','120.206.223.4','1','86acad84f0dea0b705f07e62f52139ab','1');
INSERT INTO `v9_attachment` VALUES('63','content','28','20160704103111_90825.jpg','2018/0414/20180414094725737.jpg','14527','jpg','1','0','0','1','1523713645','61.129.122.78','1','fd94f1b19bda2e68e8a66d633b40291a','1');
INSERT INTO `v9_attachment` VALUES('64','content','33','alone-icon4.gif','2018/0414/20180414094727294.gif','131446','gif','1','0','0','1','1523713647','120.206.223.4','1','d9f874c016ade5ede6d5077547bec63b','1');
INSERT INTO `v9_attachment` VALUES('65','content','28','20160704095411_12640.jpg','2018/0414/20180414094758288.jpg','44870','jpg','1','0','0','1','1523713678','61.129.122.78','1','eb250241d7996a9a9fad350d491a2eee','1');
INSERT INTO `v9_attachment` VALUES('66','content','28','20160704100355_21944.jpg','2018/0414/20180414094832245.jpg','12370','jpg','1','0','0','1','1523713712','61.129.122.78','1','efa834172b3cb2e98b57ace5455e02e1','1');
INSERT INTO `v9_attachment` VALUES('67','content','28','20160706105513_81210.jpg','2018/0414/20180414094905445.jpg','41813','jpg','1','0','0','1','1523713745','61.129.122.78','1','cc473ecbbec2540ce57f9927fa2ce9cb','1');
INSERT INTO `v9_attachment` VALUES('68','content','28','20160706105702_18034.jpg','2018/0414/20180414094945237.jpg','12523','jpg','1','0','0','1','1523713785','61.129.122.78','1','a062bc31413e872c4339e2617cb3fd1d','1');
INSERT INTO `v9_attachment` VALUES('69','content','28','20160712103434_39099.jpg','2018/0414/20180414095148388.jpg','16441','jpg','1','0','0','1','1523713908','61.129.122.78','1','79a25b6d7f5ea9fe2b9f853fd0560e92','1');
INSERT INTO `v9_attachment` VALUES('70','content','28','20160712103749_98139.jpg','2018/0414/20180414095218327.jpg','14194','jpg','1','0','0','1','1523713938','61.129.122.78','1','6a072c0aa2602a1640fc2d764d0846f7','1');
INSERT INTO `v9_attachment` VALUES('71','content','28','20160718113722_96071.jpg','2018/0414/20180414095255257.jpg','12925','jpg','1','0','0','1','1523713975','61.129.122.78','1','b212303895171231886648dc25182d55','1');
INSERT INTO `v9_attachment` VALUES('72','content','28','20160718114842_11818.jpg','2018/0414/20180414095338375.jpg','20299','jpg','1','0','0','1','1523714018','61.129.122.78','1','8f2f28bb9bf8c0b13ae49e6624008c5c','1');
INSERT INTO `v9_attachment` VALUES('73','content','28','20160722094814_27415.jpg','2018/0414/20180414095418954.jpg','20852','jpg','1','0','0','1','1523714058','61.129.122.78','1','f05f49bf8993985a475f99d862731e2b','1');
INSERT INTO `v9_attachment` VALUES('74','content','28','20160726101546_87430.jpg','2018/0414/20180414095459871.jpg','23763','jpg','1','0','0','1','1523714099','61.129.122.78','1','95e4618f6086769c6b464faf8b325871','1');
INSERT INTO `v9_attachment` VALUES('75','content','28','20160726101814_91838.jpg','2018/0414/20180414095532127.jpg','16275','jpg','1','0','0','1','1523714132','61.129.122.78','1','5961b1e674529b78627db00a40fc79eb','1');
INSERT INTO `v9_attachment` VALUES('76','content','28','20160726101956_10039.jpg','2018/0414/20180414095608485.jpg','10779','jpg','1','0','0','1','1523714168','61.129.122.78','0','904450713b50deb23a333e5a2f04a41a','1');
INSERT INTO `v9_attachment` VALUES('77','content','28','20160726101956_10039.jpg','2018/0414/20180414095609324.jpg','10779','jpg','1','0','0','1','1523714169','61.129.122.78','1','c32c4f97759a312ae95d1f2a076d674d','1');
INSERT INTO `v9_attachment` VALUES('78','content','28','20160803161527_82658.jpg','2018/0414/20180414095642995.jpg','17065','jpg','1','0','0','1','1523714202','61.129.122.78','1','544819d3ac2fb021e8fbb98367b9cc0f','1');
INSERT INTO `v9_attachment` VALUES('79','content','28','20160803162049_95183.jpg','2018/0414/20180414095729317.jpg','11188','jpg','1','0','0','1','1523714249','61.129.122.78','1','f9c4cc7465ba47f3230b6f9d8b8d2257','1');
INSERT INTO `v9_attachment` VALUES('80','content','28','20160817115316_82309.jpg','2018/0414/20180414095809284.jpg','42741','jpg','1','0','0','1','1523714289','61.129.122.78','1','221e34822663235ea1550deaf623be23','1');

DROP TABLE IF EXISTS `v9_attachment_index`;
CREATE TABLE `v9_attachment_index` (
  `keyid` char(30) NOT NULL,
  `aid` char(10) NOT NULL,
  KEY `keyid` (`keyid`),
  KEY `aid` (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO `v9_attachment_index` VALUES('c-11-1','1');
INSERT INTO `v9_attachment_index` VALUES('c-11-2','2');
INSERT INTO `v9_attachment_index` VALUES('c-11-3','3');
INSERT INTO `v9_attachment_index` VALUES('c-11-4','4');
INSERT INTO `v9_attachment_index` VALUES('c-11-5','5');
INSERT INTO `v9_attachment_index` VALUES('c-11-6','6');
INSERT INTO `v9_attachment_index` VALUES('c-11-7','7');
INSERT INTO `v9_attachment_index` VALUES('c-11-8','8');
INSERT INTO `v9_attachment_index` VALUES('c-11-9','9');
INSERT INTO `v9_attachment_index` VALUES('c-11-10','10');
INSERT INTO `v9_attachment_index` VALUES('c-12-11','11');
INSERT INTO `v9_attachment_index` VALUES('c-12-12','12');
INSERT INTO `v9_attachment_index` VALUES('c-12-13','13');
INSERT INTO `v9_attachment_index` VALUES('c-12-14','14');
INSERT INTO `v9_attachment_index` VALUES('c-12-15','15');
INSERT INTO `v9_attachment_index` VALUES('c-12-16','16');
INSERT INTO `v9_attachment_index` VALUES('c-12-17','17');
INSERT INTO `v9_attachment_index` VALUES('c-12-18','18');
INSERT INTO `v9_attachment_index` VALUES('c-28-22','19');
INSERT INTO `v9_attachment_index` VALUES('c-28-22','20');
INSERT INTO `v9_attachment_index` VALUES('c-28-22','21');
INSERT INTO `v9_attachment_index` VALUES('c-28-23','22');
INSERT INTO `v9_attachment_index` VALUES('c-28-24','23');
INSERT INTO `v9_attachment_index` VALUES('c-28-25','24');
INSERT INTO `v9_attachment_index` VALUES('c-28-25','25');
INSERT INTO `v9_attachment_index` VALUES('c-28-25','26');
INSERT INTO `v9_attachment_index` VALUES('c-28-26','27');
INSERT INTO `v9_attachment_index` VALUES('c-28-27','28');
INSERT INTO `v9_attachment_index` VALUES('c-28-28','29');
INSERT INTO `v9_attachment_index` VALUES('c-28-29','30');
INSERT INTO `v9_attachment_index` VALUES('c-28-30','31');
INSERT INTO `v9_attachment_index` VALUES('c-28-31','32');
INSERT INTO `v9_attachment_index` VALUES('c-28-32','33');
INSERT INTO `v9_attachment_index` VALUES('c-28-33','34');
INSERT INTO `v9_attachment_index` VALUES('c-28-34','35');
INSERT INTO `v9_attachment_index` VALUES('c-28-35','36');
INSERT INTO `v9_attachment_index` VALUES('c-28-36','37');
INSERT INTO `v9_attachment_index` VALUES('c-26-37','38');
INSERT INTO `v9_attachment_index` VALUES('c-26-38','39');
INSERT INTO `v9_attachment_index` VALUES('c-29-40','40');
INSERT INTO `v9_attachment_index` VALUES('c-29-40','41');
INSERT INTO `v9_attachment_index` VALUES('c-29-40','42');
INSERT INTO `v9_attachment_index` VALUES('c-29-45','43');
INSERT INTO `v9_attachment_index` VALUES('c-29-45','44');
INSERT INTO `v9_attachment_index` VALUES('c-29-45','45');
INSERT INTO `v9_attachment_index` VALUES('c-29-44','46');
INSERT INTO `v9_attachment_index` VALUES('c-28-46','47');
INSERT INTO `v9_attachment_index` VALUES('c-28-47','48');
INSERT INTO `v9_attachment_index` VALUES('c-28-48','49');
INSERT INTO `v9_attachment_index` VALUES('c-28-49','50');
INSERT INTO `v9_attachment_index` VALUES('c-28-50','51');
INSERT INTO `v9_attachment_index` VALUES('c-28-51','52');
INSERT INTO `v9_attachment_index` VALUES('c-28-52','55');
INSERT INTO `v9_attachment_index` VALUES('c-33-1','53');
INSERT INTO `v9_attachment_index` VALUES('c-33-1','54');
INSERT INTO `v9_attachment_index` VALUES('c-28-53','56');
INSERT INTO `v9_attachment_index` VALUES('c-33-2','57');
INSERT INTO `v9_attachment_index` VALUES('c-33-2','58');
INSERT INTO `v9_attachment_index` VALUES('c-28-54','59');
INSERT INTO `v9_attachment_index` VALUES('c-33-3','60');
INSERT INTO `v9_attachment_index` VALUES('c-33-3','61');
INSERT INTO `v9_attachment_index` VALUES('c-28-55','63');
INSERT INTO `v9_attachment_index` VALUES('c-33-4','62');
INSERT INTO `v9_attachment_index` VALUES('c-33-4','64');
INSERT INTO `v9_attachment_index` VALUES('c-28-56','65');
INSERT INTO `v9_attachment_index` VALUES('c-28-57','66');
INSERT INTO `v9_attachment_index` VALUES('c-28-58','67');
INSERT INTO `v9_attachment_index` VALUES('c-28-59','68');
INSERT INTO `v9_attachment_index` VALUES('c-28-60','69');
INSERT INTO `v9_attachment_index` VALUES('c-28-61','70');
INSERT INTO `v9_attachment_index` VALUES('c-28-62','71');
INSERT INTO `v9_attachment_index` VALUES('c-28-63','72');
INSERT INTO `v9_attachment_index` VALUES('c-28-64','73');
INSERT INTO `v9_attachment_index` VALUES('c-28-65','74');
INSERT INTO `v9_attachment_index` VALUES('c-28-66','75');
INSERT INTO `v9_attachment_index` VALUES('c-28-67','77');
INSERT INTO `v9_attachment_index` VALUES('c-28-68','78');
INSERT INTO `v9_attachment_index` VALUES('c-28-69','79');
INSERT INTO `v9_attachment_index` VALUES('c-28-70','80');

DROP TABLE IF EXISTS `v9_badword`;
CREATE TABLE `v9_badword` (
  `badid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `badword` char(20) NOT NULL,
  `level` tinyint(5) NOT NULL DEFAULT '1',
  `replaceword` char(20) NOT NULL DEFAULT '0',
  `lastusetime` int(10) unsigned NOT NULL DEFAULT '0',
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`badid`),
  UNIQUE KEY `badword` (`badword`),
  KEY `usetimes` (`replaceword`,`listorder`),
  KEY `hits` (`listorder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_block`;
CREATE TABLE `v9_block` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned DEFAULT '0',
  `name` char(50) DEFAULT NULL,
  `pos` char(30) DEFAULT NULL,
  `type` tinyint(1) DEFAULT '0',
  `data` text,
  `template` text,
  PRIMARY KEY (`id`),
  KEY `pos` (`pos`),
  KEY `type` (`type`),
  KEY `siteid` (`siteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_block_history`;
CREATE TABLE `v9_block_history` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `blockid` int(10) unsigned DEFAULT '0',
  `data` text,
  `creat_at` int(10) unsigned DEFAULT '0',
  `userid` mediumint(8) unsigned DEFAULT '0',
  `username` char(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_block_priv`;
CREATE TABLE `v9_block_priv` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `roleid` tinyint(3) unsigned DEFAULT '0',
  `siteid` smallint(5) unsigned DEFAULT '0',
  `blockid` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `blockid` (`blockid`),
  KEY `roleid` (`roleid`,`siteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_cache`;
CREATE TABLE `v9_cache` (
  `filename` char(50) NOT NULL,
  `path` char(50) NOT NULL,
  `data` mediumtext NOT NULL,
  PRIMARY KEY (`filename`,`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO `v9_cache` VALUES('badword.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n);\n?>');
INSERT INTO `v9_cache` VALUES('bakup_tables.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  0 => \'v9_admin\',\n  1 => \'v9_admin_panel\',\n  2 => \'v9_admin_role\',\n  3 => \'v9_admin_role_priv\',\n  4 => \'v9_anli\',\n  5 => \'v9_anli_data\',\n  6 => \'v9_announce\',\n  7 => \'v9_attachment\',\n  8 => \'v9_attachment_index\',\n  9 => \'v9_badword\',\n  10 => \'v9_block\',\n  11 => \'v9_block_history\',\n  12 => \'v9_block_priv\',\n  13 => \'v9_cache\',\n  14 => \'v9_case\',\n  15 => \'v9_case_data\',\n  16 => \'v9_category\',\n  17 => \'v9_category_priv\',\n  18 => \'v9_collection_content\',\n  19 => \'v9_collection_history\',\n  20 => \'v9_collection_node\',\n  21 => \'v9_collection_program\',\n  22 => \'v9_comment\',\n  23 => \'v9_comment_check\',\n  24 => \'v9_comment_data_1\',\n  25 => \'v9_comment_setting\',\n  26 => \'v9_comment_table\',\n  27 => \'v9_content_check\',\n  28 => \'v9_copyfrom\',\n  29 => \'v9_dashiji\',\n  30 => \'v9_dashiji_data\',\n  31 => \'v9_datacall\',\n  32 => \'v9_dbsource\',\n  33 => \'v9_download\',\n  34 => \'v9_download_data\',\n  35 => \'v9_downservers\',\n  36 => \'v9_dsj\',\n  37 => \'v9_dsj_data\',\n  38 => \'v9_extend_setting\',\n  39 => \'v9_favorite\',\n  40 => \'v9_hits\',\n  41 => \'v9_indexymym\',\n  42 => \'v9_indexymym_data\',\n  43 => \'v9_ipbanned\',\n  44 => \'v9_joinus\',\n  45 => \'v9_joinus_data\',\n  46 => \'v9_jrwm\',\n  47 => \'v9_jrwm_data\',\n  48 => \'v9_keylink\',\n  49 => \'v9_keyword\',\n  50 => \'v9_keyword_data\',\n  51 => \'v9_link\',\n  52 => \'v9_linkage\',\n  53 => \'v9_log\',\n  54 => \'v9_member\',\n  55 => \'v9_member_detail\',\n  56 => \'v9_member_group\',\n  57 => \'v9_member_menu\',\n  58 => \'v9_member_verify\',\n  59 => \'v9_member_vip\',\n  60 => \'v9_menu\',\n  61 => \'v9_message\',\n  62 => \'v9_message_data\',\n  63 => \'v9_message_group\',\n  64 => \'v9_model\',\n  65 => \'v9_model_field\',\n  66 => \'v9_module\',\n  67 => \'v9_mood\',\n  68 => \'v9_news\',\n  69 => \'v9_news_data\',\n  70 => \'v9_page\',\n  71 => \'v9_pay_account\',\n  72 => \'v9_pay_payment\',\n  73 => \'v9_pay_spend\',\n  74 => \'v9_picture\',\n  75 => \'v9_picture_data\',\n  76 => \'v9_position\',\n  77 => \'v9_position_data\',\n  78 => \'v9_poster\',\n  79 => \'v9_poster_201803\',\n  80 => \'v9_poster_201804\',\n  81 => \'v9_poster_space\',\n  82 => \'v9_queue\',\n  83 => \'v9_release_point\',\n  84 => \'v9_search\',\n  85 => \'v9_search_keyword\',\n  86 => \'v9_session\',\n  87 => \'v9_site\',\n  88 => \'v9_sms_report\',\n  89 => \'v9_special\',\n  90 => \'v9_special_c_data\',\n  91 => \'v9_special_content\',\n  92 => \'v9_sphinx_counter\',\n  93 => \'v9_sso_admin\',\n  94 => \'v9_sso_applications\',\n  95 => \'v9_sso_members\',\n  96 => \'v9_sso_messagequeue\',\n  97 => \'v9_sso_session\',\n  98 => \'v9_sso_settings\',\n  99 => \'v9_syywym\',\n  100 => \'v9_syywym_data\',\n  101 => \'v9_tag\',\n  102 => \'v9_template_bak\',\n  103 => \'v9_times\',\n  104 => \'v9_type\',\n  105 => \'v9_urlrule\',\n  106 => \'v9_video\',\n  107 => \'v9_video_content\',\n  108 => \'v9_video_data\',\n  109 => \'v9_video_store\',\n  110 => \'v9_vote_data\',\n  111 => \'v9_vote_option\',\n  112 => \'v9_vote_subject\',\n  113 => \'v9_wap\',\n  114 => \'v9_wap_type\',\n  115 => \'v9_workflow\',\n  116 => \'v9_ywym\',\n  117 => \'v9_ywym_data\',\n  118 => \'v9_zdb\',\n  119 => \'v9_zdb_data\',\n  120 => \'v9_zongdianbao\',\n  121 => \'v9_zongdianbao_data\',\n);\n?>');
INSERT INTO `v9_cache` VALUES('category_content.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  6 => \'1\',\n  34 => \'1\',\n  7 => \'1\',\n  8 => \'1\',\n  9 => \'1\',\n  10 => \'1\',\n  11 => \'1\',\n  12 => \'1\',\n  13 => \'1\',\n  14 => \'1\',\n  15 => \'1\',\n  16 => \'1\',\n  17 => \'1\',\n  18 => \'1\',\n  19 => \'1\',\n  20 => \'1\',\n  21 => \'1\',\n  22 => \'1\',\n  23 => \'1\',\n  24 => \'1\',\n  26 => \'1\',\n  27 => \'1\',\n  28 => \'1\',\n  29 => \'1\',\n  30 => \'1\',\n  31 => \'1\',\n  33 => \'1\',\n);\n?>');
INSERT INTO `v9_cache` VALUES('category_content_1.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  6 => \n  array (\n    \'catid\' => \'6\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'1\',\n    \'arrchildid\' => \'6,34,7,8,9,10,11,12,13,14\',\n    \'catname\' => \'关于透云\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'aboutty\',\n    \'url\' => \'http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=lists&catid=6\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category_anli\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'6\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'guanyutouyun\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  34 => \n  array (\n    \'catid\' => \'34\',\n    \'siteid\' => \'1\',\n    \'type\' => \'1\',\n    \'modelid\' => \'0\',\n    \'parentid\' => \'6\',\n    \'arrparentid\' => \'0,6\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'34\',\n    \'catname\' => \'公司简介\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'/\',\n    \'catdir\' => \'gsjj\',\n    \'url\' => \'http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=lists&catid=34\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"ishtml\":\"0\",\"template_list\":\"default\",\"page_template\":\"\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"category_ruleid\":\"6\",\"show_ruleid\":\"\",\"repeatchargedays\":\"1\"}\',\n    \'listorder\' => \'6\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'gongsijianjie\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => NULL,\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => NULL,\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'\',\n    \'workflowid\' => NULL,\n    \'isdomain\' => \'0\',\n  ),\n  7 => \n  array (\n    \'catid\' => \'7\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'6\',\n    \'arrparentid\' => \'0,6\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'7\',\n    \'catname\' => \'新闻动态\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'aboutty/\',\n    \'catdir\' => \'news\',\n    \'url\' => \'http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=lists&catid=7\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category_anli\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'7\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'xinwendongtai\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  8 => \n  array (\n    \'catid\' => \'8\',\n    \'siteid\' => \'1\',\n    \'type\' => \'1\',\n    \'modelid\' => \'0\',\n    \'parentid\' => \'6\',\n    \'arrparentid\' => \'0,6\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'8\',\n    \'catname\' => \'愿景及使命\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'aboutty/\',\n    \'catdir\' => \'vision\',\n    \'url\' => \'http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=lists&catid=8\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"ishtml\":\"0\",\"template_list\":\"\",\"page_template\":\"page_shiming\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"category_ruleid\":\"6\",\"show_ruleid\":\"\",\"repeatchargedays\":\"1\"}\',\n    \'listorder\' => \'8\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'yuanjingjishiming\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => NULL,\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => NULL,\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'\',\n    \'workflowid\' => NULL,\n    \'isdomain\' => \'0\',\n  ),\n  9 => \n  array (\n    \'catid\' => \'9\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'12\',\n    \'parentid\' => \'6\',\n    \'arrparentid\' => \'0,6\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'9\',\n    \'catname\' => \'大事记\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'aboutty/\',\n    \'catdir\' => \'memorabilia\',\n    \'url\' => \'http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=lists&catid=9\',\n    \'items\' => \'13\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category_anli\",\"list_template\":\"list_dashiji\",\"show_template\":\"show_dashiji\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'9\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'dashiji\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  10 => \n  array (\n    \'catid\' => \'10\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'6\',\n    \'arrparentid\' => \'0,6\',\n    \'child\' => \'1\',\n    \'arrchildid\' => \'10,11,12\',\n    \'catname\' => \'专利及荣誉\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'aboutty/\',\n    \'catdir\' => \'honor\',\n    \'url\' => \'http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=lists&catid=10\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category_zhuanli\",\"list_template\":\"list_zhuanli\",\"show_template\":\"show_zhuanli\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'10\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'zhuanlijirongyu\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  11 => \n  array (\n    \'catid\' => \'11\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'10\',\n    \'arrparentid\' => \'0,6,10\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'11\',\n    \'catname\' => \'专利\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'aboutty/honor/\',\n    \'catdir\' => \'patent\',\n    \'url\' => \'http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=lists&catid=11\',\n    \'items\' => \'10\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category_zhuanli\",\"list_template\":\"list_zhuanli\",\"show_template\":\"show_zhuanli\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'11\',\n    \'ismenu\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'zhuanli\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  12 => \n  array (\n    \'catid\' => \'12\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'10\',\n    \'arrparentid\' => \'0,6,10\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'12\',\n    \'catname\' => \'奖项\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'aboutty/honor/\',\n    \'catdir\' => \'honor\',\n    \'url\' => \'http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=lists&catid=12\',\n    \'items\' => \'8\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list_zhuanli\",\"show_template\":\"show_zhuanli\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'12\',\n    \'ismenu\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'jiangxiang\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  13 => \n  array (\n    \'catid\' => \'13\',\n    \'siteid\' => \'1\',\n    \'type\' => \'1\',\n    \'modelid\' => \'0\',\n    \'parentid\' => \'6\',\n    \'arrparentid\' => \'0,6\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'13\',\n    \'catname\' => \'联系我们\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'aboutty/\',\n    \'catdir\' => \'contact\',\n    \'url\' => \'http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=lists&catid=13\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"ishtml\":\"0\",\"template_list\":\"default\",\"page_template\":\"page_lxwm\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"category_ruleid\":\"6\",\"show_ruleid\":\"\",\"repeatchargedays\":\"1\"}\',\n    \'listorder\' => \'13\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'lianxiwomen\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => NULL,\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => NULL,\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'\',\n    \'workflowid\' => NULL,\n    \'isdomain\' => \'0\',\n  ),\n  14 => \n  array (\n    \'catid\' => \'14\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'14\',\n    \'parentid\' => \'6\',\n    \'arrparentid\' => \'0,6\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'14\',\n    \'catname\' => \'加入我们\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'aboutty/\',\n    \'catdir\' => \'joinus\',\n    \'url\' => \'http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=lists&catid=14\',\n    \'items\' => \'1\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list_jrwm\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'14\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'jiaruwomen\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  15 => \n  array (\n    \'catid\' => \'15\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'1\',\n    \'arrchildid\' => \'15,16,17,18,19\',\n    \'catname\' => \'一物一码\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'onecode\',\n    \'url\' => \'http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=lists&catid=15\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category_onecode\",\"list_template\":\"list_onecode\",\"show_template\":\"show_onecode\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'15\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'yiwuyima\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  16 => \n  array (\n    \'catid\' => \'16\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'15\',\n    \'arrparentid\' => \'0,15\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'16\',\n    \'catname\' => \'扫码营销\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'onecode/\',\n    \'catdir\' => \'scavenging\',\n    \'url\' => \'http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=lists&catid=16\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category_onecode\",\"list_template\":\"list_onecode\",\"show_template\":\"show_onecode\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'16\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'saomayingxiao\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  17 => \n  array (\n    \'catid\' => \'17\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'15\',\n    \'arrparentid\' => \'0,15\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'17\',\n    \'catname\' => \'分销管理\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'onecode/\',\n    \'catdir\' => \'fenxiao\',\n    \'url\' => \'http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=lists&catid=17\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category_anli\",\"list_template\":\"list_fxgl\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'17\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'fenxiaoguanli\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  18 => \n  array (\n    \'catid\' => \'18\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'15\',\n    \'arrparentid\' => \'0,15\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'18\',\n    \'catname\' => \'防窜稽查\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'onecode/\',\n    \'catdir\' => \'fcjc\',\n    \'url\' => \'http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=lists&catid=18\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category_anli\",\"list_template\":\"list_fcjc\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'18\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'fangcuanjicha\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  19 => \n  array (\n    \'catid\' => \'19\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'15\',\n    \'arrparentid\' => \'0,15\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'19\',\n    \'catname\' => \'产品溯源\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'onecode/\',\n    \'catdir\' => \'cpsy\',\n    \'url\' => \'http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=lists&catid=19\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category_anli\",\"list_template\":\"list_cpsy\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'19\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'chanpinsuyuan\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  20 => \n  array (\n    \'catid\' => \'20\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'1\',\n    \'arrchildid\' => \'20,21,22\',\n    \'catname\' => \'众店宝\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'zhongdianbao\',\n    \'url\' => \'http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=lists&catid=20\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category_zhongdianbao\",\"list_template\":\"list_zhongdianbao\",\"show_template\":\"show_zhongdianbao\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'20\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'zhongdianbao\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  21 => \n  array (\n    \'catid\' => \'21\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'20\',\n    \'arrparentid\' => \'0,20\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'21\',\n    \'catname\' => \'产品简介\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'zhongdianbao/\',\n    \'catdir\' => \'cpjj\',\n    \'url\' => \'http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=lists&catid=21\',\n    \'items\' => \'3\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category_zhongdianbao\",\"list_template\":\"list_zhongdianbao\",\"show_template\":\"show_zhongdianbao\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'21\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'chanpinjianjie\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  22 => \n  array (\n    \'catid\' => \'22\',\n    \'siteid\' => \'1\',\n    \'type\' => \'1\',\n    \'modelid\' => \'0\',\n    \'parentid\' => \'20\',\n    \'arrparentid\' => \'0,20\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'22\',\n    \'catname\' => \'招商加盟\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'zhongdianbao/\',\n    \'catdir\' => \'zsjm\',\n    \'url\' => \'http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=lists&catid=22\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"ishtml\":\"0\",\"template_list\":\"default\",\"page_template\":\"page_zsjm\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"category_ruleid\":\"6\",\"show_ruleid\":\"\",\"repeatchargedays\":\"1\"}\',\n    \'listorder\' => \'22\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'zhaoshangjiameng\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => NULL,\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => NULL,\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'\',\n    \'workflowid\' => NULL,\n    \'isdomain\' => \'0\',\n  ),\n  23 => \n  array (\n    \'catid\' => \'23\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'1\',\n    \'arrchildid\' => \'23,24,26\',\n    \'catname\' => \'案例中心\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'case\',\n    \'url\' => \'http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=lists&catid=23\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category_anli\",\"list_template\":\"list_anli\",\"show_template\":\"show_anli\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'23\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'anlizhongxin\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  24 => \n  array (\n    \'catid\' => \'24\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'15\',\n    \'parentid\' => \'23\',\n    \'arrparentid\' => \'0,23\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'24\',\n    \'catname\' => \'成功案例\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'case/\',\n    \'catdir\' => \'success\',\n    \'url\' => \'http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=lists&catid=24\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category_anli\",\"list_template\":\"list_anli\",\"show_template\":\"show_anli\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'24\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'chenggonganli\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  26 => \n  array (\n    \'catid\' => \'26\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'23\',\n    \'arrparentid\' => \'0,23\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'26\',\n    \'catname\' => \'客户赞誉\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'case/\',\n    \'catdir\' => \'zanyu\',\n    \'url\' => \'http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=lists&catid=26\',\n    \'items\' => \'2\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category_anli\",\"list_template\":\"list_khzy\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'26\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'kehuzanyu\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  27 => \n  array (\n    \'catid\' => \'27\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'1\',\n    \'arrchildid\' => \'27,28,29\',\n    \'catname\' => \'行业视界\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'hysj\',\n    \'url\' => \'http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=lists&catid=27\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'27\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'xingyeshijie\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  28 => \n  array (\n    \'catid\' => \'28\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'27\',\n    \'arrparentid\' => \'0,27\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'28\',\n    \'catname\' => \'市场动态\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'hysj/\',\n    \'catdir\' => \'market\',\n    \'url\' => \'http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=lists&catid=28\',\n    \'items\' => \'30\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'28\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'shichangdongtai\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  29 => \n  array (\n    \'catid\' => \'29\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'27\',\n    \'arrparentid\' => \'0,27\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'29\',\n    \'catname\' => \'白皮书\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'hysj/\',\n    \'catdir\' => \'bps\',\n    \'url\' => \'http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=lists&catid=29\',\n    \'items\' => \'3\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category_anli\",\"list_template\":\"list_baipishu\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'29\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'baipishu\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  30 => \n  array (\n    \'catid\' => \'30\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'1\',\n    \'arrchildid\' => \'30,31,33\',\n    \'catname\' => \'首页\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'shouye\',\n    \'url\' => \'http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=lists&catid=30\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category_anli\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'30\',\n    \'ismenu\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'shouye\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  31 => \n  array (\n    \'catid\' => \'31\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'30\',\n    \'arrparentid\' => \'0,30\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'31\',\n    \'catname\' => \'首页焦点图\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'shouye/\',\n    \'catdir\' => \'jdt\',\n    \'url\' => \'http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=lists&catid=31\',\n    \'items\' => \'4\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category_anli\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'31\',\n    \'ismenu\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'shouyejiaodiantu\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  33 => \n  array (\n    \'catid\' => \'33\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'16\',\n    \'parentid\' => \'30\',\n    \'arrparentid\' => \'0,30\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'33\',\n    \'catname\' => \'首页一物一码\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'shouye/\',\n    \'catdir\' => \'syywym\',\n    \'url\' => \'http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=lists&catid=33\',\n    \'items\' => \'4\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'33\',\n    \'ismenu\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'shouyeyiwuyima\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n);\n?>');
INSERT INTO `v9_cache` VALUES('category_items_1.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  6 => \'0\',\n  7 => \'0\',\n  10 => \'0\',\n  11 => \'10\',\n  12 => \'8\',\n  15 => \'0\',\n  16 => \'0\',\n  17 => \'0\',\n  18 => \'0\',\n  19 => \'0\',\n  20 => \'0\',\n  21 => \'3\',\n  23 => \'0\',\n  26 => \'2\',\n  27 => \'0\',\n  28 => \'40\',\n  29 => \'3\',\n  30 => \'0\',\n  31 => \'4\',\n);\n?>');
INSERT INTO `v9_cache` VALUES('category_items_11.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n);\n?>');
INSERT INTO `v9_cache` VALUES('category_items_12.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  9 => \'13\',\n);\n?>');
INSERT INTO `v9_cache` VALUES('category_items_13.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n);\n?>');
INSERT INTO `v9_cache` VALUES('category_items_14.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  14 => \'1\',\n);\n?>');
INSERT INTO `v9_cache` VALUES('category_items_15.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  24 => \'0\',\n);\n?>');
INSERT INTO `v9_cache` VALUES('category_items_16.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  33 => \'4\',\n);\n?>');
INSERT INTO `v9_cache` VALUES('category_items_17.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n);\n?>');
INSERT INTO `v9_cache` VALUES('category_items_18.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n);\n?>');
INSERT INTO `v9_cache` VALUES('category_items_19.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n);\n?>');
INSERT INTO `v9_cache` VALUES('category_items_2.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n);\n?>');
INSERT INTO `v9_cache` VALUES('category_items_3.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n);\n?>');
INSERT INTO `v9_cache` VALUES('common.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  \'admin_email\' => \'phpcms@phpcms.cn\',\n  \'adminaccessip\' => \'0\',\n  \'maxloginfailedtimes\' => \'8\',\n  \'maxiplockedtime\' => \'15\',\n  \'minrefreshtime\' => \'2\',\n  \'mail_type\' => \'1\',\n  \'mail_server\' => \'smtp.qq.com\',\n  \'mail_port\' => \'25\',\n  \'mail_user\' => \'phpcms.cn@foxmail.com\',\n  \'mail_auth\' => \'1\',\n  \'mail_from\' => \'phpcms.cn@foxmail.com\',\n  \'mail_password\' => \'\',\n  \'errorlog_size\' => \'20\',\n);\n?>');
INSERT INTO `v9_cache` VALUES('downservers.cache.php','caches_commons/caches_data/','<?php\nreturn NULL;\n?>');
INSERT INTO `v9_cache` VALUES('ipbanned.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n);\n?>');
INSERT INTO `v9_cache` VALUES('keylink.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n);\n?>');
INSERT INTO `v9_cache` VALUES('link.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  1 => \n  array (\n    \'is_post\' => \'1\',\n    \'enablecheckcode\' => \'0\',\n  ),\n);\n?>');
INSERT INTO `v9_cache` VALUES('member_model.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  10 => \n  array (\n    \'modelid\' => \'10\',\n    \'siteid\' => \'1\',\n    \'name\' => \'普通会员\',\n    \'description\' => \'普通会员\',\n    \'tablename\' => \'member_detail\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'\',\n    \'category_template\' => \'\',\n    \'list_template\' => \'\',\n    \'show_template\' => \'\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'2\',\n  ),\n);\n?>');
INSERT INTO `v9_cache` VALUES('model.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  1 => \n  array (\n    \'modelid\' => \'1\',\n    \'siteid\' => \'1\',\n    \'name\' => \'文章模型\',\n    \'description\' => \'\',\n    \'tablename\' => \'news\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'default\',\n    \'category_template\' => \'category\',\n    \'list_template\' => \'list\',\n    \'show_template\' => \'show\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'0\',\n  ),\n  2 => \n  array (\n    \'modelid\' => \'2\',\n    \'siteid\' => \'1\',\n    \'name\' => \'下载模型\',\n    \'description\' => \'\',\n    \'tablename\' => \'download\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'default\',\n    \'category_template\' => \'category_download\',\n    \'list_template\' => \'list_download\',\n    \'show_template\' => \'show_download\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'0\',\n  ),\n  3 => \n  array (\n    \'modelid\' => \'3\',\n    \'siteid\' => \'1\',\n    \'name\' => \'图片模型\',\n    \'description\' => \'\',\n    \'tablename\' => \'picture\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'default\',\n    \'category_template\' => \'category_picture\',\n    \'list_template\' => \'list_picture\',\n    \'show_template\' => \'show_picture\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'0\',\n  ),\n  11 => \n  array (\n    \'modelid\' => \'11\',\n    \'siteid\' => \'1\',\n    \'name\' => \'视频模型\',\n    \'description\' => \'\',\n    \'tablename\' => \'video\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'default\',\n    \'category_template\' => \'category_video\',\n    \'list_template\' => \'list_video\',\n    \'show_template\' => \'show_video\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'0\',\n  ),\n  12 => \n  array (\n    \'modelid\' => \'12\',\n    \'siteid\' => \'1\',\n    \'name\' => \'大事记\',\n    \'description\' => \'\',\n    \'tablename\' => \'dashiji\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'default\',\n    \'category_template\' => \'category\',\n    \'list_template\' => \'list_dashiji\',\n    \'show_template\' => \'show_dashiji\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'0\',\n  ),\n  13 => \n  array (\n    \'modelid\' => \'13\',\n    \'siteid\' => \'1\',\n    \'name\' => \'众店宝\',\n    \'description\' => \'\',\n    \'tablename\' => \'zongdianbao\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'default\',\n    \'category_template\' => \'category_anli\',\n    \'list_template\' => \'list_zhongdianbao\',\n    \'show_template\' => \'show_zhongdianbao\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'0\',\n  ),\n  14 => \n  array (\n    \'modelid\' => \'14\',\n    \'siteid\' => \'1\',\n    \'name\' => \'加入我们\',\n    \'description\' => \'\',\n    \'tablename\' => \'joinus\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'default\',\n    \'category_template\' => \'category_anli\',\n    \'list_template\' => \'list_jrwm\',\n    \'show_template\' => \'show_anli\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'0\',\n  ),\n  15 => \n  array (\n    \'modelid\' => \'15\',\n    \'siteid\' => \'1\',\n    \'name\' => \'成功案例\',\n    \'description\' => \'\',\n    \'tablename\' => \'case\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'default\',\n    \'category_template\' => \'category_anli\',\n    \'list_template\' => \'list_anli\',\n    \'show_template\' => \'show_anli\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'0\',\n  ),\n  16 => \n  array (\n    \'modelid\' => \'16\',\n    \'siteid\' => \'1\',\n    \'name\' => \'首页一物一码\',\n    \'description\' => \'\',\n    \'tablename\' => \'syywym\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'default\',\n    \'category_template\' => \'category\',\n    \'list_template\' => \'list\',\n    \'show_template\' => \'show\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'0\',\n  ),\n);\n?>');
INSERT INTO `v9_cache` VALUES('modules.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  \'admin\' => \n  array (\n    \'module\' => \'admin\',\n    \'name\' => \'admin\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'array (\n  \\\'admin_email\\\' => \\\'phpcms@phpcms.cn\\\',\n  \\\'adminaccessip\\\' => \\\'0\\\',\n  \\\'maxloginfailedtimes\\\' => \\\'8\\\',\n  \\\'maxiplockedtime\\\' => \\\'15\\\',\n  \\\'minrefreshtime\\\' => \\\'2\\\',\n  \\\'mail_type\\\' => \\\'1\\\',\n  \\\'mail_server\\\' => \\\'smtp.qq.com\\\',\n  \\\'mail_port\\\' => \\\'25\\\',\n  \\\'mail_user\\\' => \\\'phpcms.cn@foxmail.com\\\',\n  \\\'mail_auth\\\' => \\\'1\\\',\n  \\\'mail_from\\\' => \\\'phpcms.cn@foxmail.com\\\',\n  \\\'mail_password\\\' => \\\'\\\',\n  \\\'errorlog_size\\\' => \\\'20\\\',\n)\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-10-18\',\n    \'updatedate\' => \'2010-10-18\',\n  ),\n  \'announce\' => \n  array (\n    \'module\' => \'announce\',\n    \'name\' => \'公告\',\n    \'url\' => \'announce/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'公告\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2018-04-14\',\n    \'updatedate\' => \'2018-04-14\',\n  ),\n  \'attachment\' => \n  array (\n    \'module\' => \'attachment\',\n    \'name\' => \'附件\',\n    \'url\' => \'attachment\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'block\' => \n  array (\n    \'module\' => \'block\',\n    \'name\' => \'碎片\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'collection\' => \n  array (\n    \'module\' => \'collection\',\n    \'name\' => \'采集模块\',\n    \'url\' => \'collection\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'comment\' => \n  array (\n    \'module\' => \'comment\',\n    \'name\' => \'评论\',\n    \'url\' => \'comment/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'评论\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2018-04-14\',\n    \'updatedate\' => \'2018-04-14\',\n  ),\n  \'content\' => \n  array (\n    \'module\' => \'content\',\n    \'name\' => \'内容模块\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'dbsource\' => \n  array (\n    \'module\' => \'dbsource\',\n    \'name\' => \'数据源\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'digg\' => \n  array (\n    \'module\' => \'digg\',\n    \'name\' => \'顶一下\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'formguide\' => \n  array (\n    \'module\' => \'formguide\',\n    \'name\' => \'表单向导\',\n    \'url\' => \'formguide/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'formguide\',\n    \'setting\' => \'array (\n  \\\'allowmultisubmit\\\' => \\\'1\\\',\n  \\\'interval\\\' => \\\'30\\\',\n  \\\'allowunreg\\\' => \\\'0\\\',\n  \\\'mailmessage\\\' => \\\'用户向我们提交了表单数据，赶快去看看吧。\\\',\n)\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-10-20\',\n    \'updatedate\' => \'2010-10-20\',\n  ),\n  \'link\' => \n  array (\n    \'module\' => \'link\',\n    \'name\' => \'友情链接\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'array (\n  1 => \n  array (\n    \\\'is_post\\\' => \\\'1\\\',\n    \\\'enablecheckcode\\\' => \\\'0\\\',\n  ),\n)\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'member\' => \n  array (\n    \'module\' => \'member\',\n    \'name\' => \'会员\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'array (\n  \\\'allowregister\\\' => \\\'1\\\',\n  \\\'choosemodel\\\' => \\\'1\\\',\n  \\\'enablemailcheck\\\' => \\\'0\\\',\n  \\\'registerverify\\\' => \\\'0\\\',\n  \\\'showapppoint\\\' => \\\'0\\\',\n  \\\'rmb_point_rate\\\' => \\\'10\\\',\n  \\\'defualtpoint\\\' => \\\'0\\\',\n  \\\'defualtamount\\\' => \\\'0\\\',\n  \\\'showregprotocol\\\' => \\\'0\\\',\n  \\\'regprotocol\\\' => \\\'		 欢迎您注册成为phpcms用户\r\n请仔细阅读下面的协议，只有接受协议才能继续进行注册。 \r\n1．服务条款的确认和接纳\r\n　　phpcms用户服务的所有权和运作权归phpcms拥有。phpcms所提供的服务将按照有关章程、服务条款和操作规则严格执行。用户通过注册程序点击“我同意” 按钮，即表示用户与phpcms达成协议并接受所有的服务条款。\r\n2． phpcms服务简介\r\n　　phpcms通过国际互联网为用户提供新闻及文章浏览、图片浏览、软件下载、网上留言和BBS论坛等服务。\r\n　　用户必须： \r\n　　1)购置设备，包括个人电脑一台、调制解调器一个及配备上网装置。 \r\n　　2)个人上网和支付与此服务有关的电话费用、网络费用。\r\n　　用户同意： \r\n　　1)提供及时、详尽及准确的个人资料。 \r\n　　2)不断更新注册资料，符合及时、详尽、准确的要求。所有原始键入的资料将引用为注册资料。 \r\n　　3)用户同意遵守《中华人民共和国保守国家秘密法》、《中华人民共和国计算机信息系统安全保护条例》、《计算机软件保护条例》等有关计算机及互联网规定的法律和法规、实施办法。在任何情况下，phpcms合理地认为用户的行为可能违反上述法律、法规，phpcms可以在任何时候，不经事先通知终止向该用户提供服务。用户应了解国际互联网的无国界性，应特别注意遵守当地所有有关的法律和法规。\r\n3． 服务条款的修改\r\n　　phpcms会不定时地修改服务条款，服务条款一旦发生变动，将会在相关页面上提示修改内容。如果您同意改动，则再一次点击“我同意”按钮。 如果您不接受，则及时取消您的用户使用服务资格。\r\n4． 服务修订\r\n　　phpcms保留随时修改或中断服务而不需知照用户的权利。phpcms行使修改或中断服务的权利，不需对用户或第三方负责。\r\n5． 用户隐私制度\r\n　　尊重用户个人隐私是phpcms的 基本政策。phpcms不会公开、编辑或透露用户的注册信息，除非有法律许可要求，或phpcms在诚信的基础上认为透露这些信息在以下三种情况是必要的： \r\n　　1)遵守有关法律规定，遵从合法服务程序。 \r\n　　2)保持维护phpcms的商标所有权。 \r\n　　3)在紧急情况下竭力维护用户个人和社会大众的隐私安全。 \r\n　　4)符合其他相关的要求。 \r\n6．用户的帐号，密码和安全性\r\n　　一旦注册成功成为phpcms用户，您将得到一个密码和帐号。如果您不保管好自己的帐号和密码安全，将对因此产生的后果负全部责任。另外，每个用户都要对其帐户中的所有活动和事件负全责。您可随时根据指示改变您的密码，也可以结束旧的帐户重开一个新帐户。用户同意若发现任何非法使用用户帐号或安全漏洞的情况，立即通知phpcms。\r\n7． 免责条款\r\n　　用户明确同意网站服务的使用由用户个人承担风险。 　　 \r\n　　phpcms不作任何类型的担保，不担保服务一定能满足用户的要求，也不担保服务不会受中断，对服务的及时性，安全性，出错发生都不作担保。用户理解并接受：任何通过phpcms服务取得的信息资料的可靠性取决于用户自己，用户自己承担所有风险和责任。 \r\n8．有限责任\r\n　　phpcms对任何直接、间接、偶然、特殊及继起的损害不负责任。\r\n9． 不提供零售和商业性服务 \r\n　　用户使用网站服务的权利是个人的。用户只能是一个单独的个体而不能是一个公司或实体商业性组织。用户承诺不经phpcms同意，不能利用网站服务进行销售或其他商业用途。\r\n10．用户责任 \r\n　　用户单独承担传输内容的责任。用户必须遵循： \r\n　　1)从中国境内向外传输技术性资料时必须符合中国有关法规。 \r\n　　2)使用网站服务不作非法用途。 \r\n　　3)不干扰或混乱网络服务。 \r\n　　4)不在论坛BBS或留言簿发表任何与政治相关的信息。 \r\n　　5)遵守所有使用网站服务的网络协议、规定、程序和惯例。\r\n　　6)不得利用本站危害国家安全、泄露国家秘密，不得侵犯国家社会集体的和公民的合法权益。\r\n　　7)不得利用本站制作、复制和传播下列信息： \r\n　　　1、煽动抗拒、破坏宪法和法律、行政法规实施的；\r\n　　　2、煽动颠覆国家政权，推翻社会主义制度的；\r\n　　　3、煽动分裂国家、破坏国家统一的；\r\n　　　4、煽动民族仇恨、民族歧视，破坏民族团结的；\r\n　　　5、捏造或者歪曲事实，散布谣言，扰乱社会秩序的；\r\n　　　6、宣扬封建迷信、淫秽、色情、赌博、暴力、凶杀、恐怖、教唆犯罪的；\r\n　　　7、公然侮辱他人或者捏造事实诽谤他人的，或者进行其他恶意攻击的；\r\n　　　8、损害国家机关信誉的；\r\n　　　9、其他违反宪法和法律行政法规的；\r\n　　　10、进行商业广告行为的。\r\n　　用户不能传输任何教唆他人构成犯罪行为的资料；不能传输长国内不利条件和涉及国家安全的资料；不能传输任何不符合当地法规、国家法律和国际法 律的资料。未经许可而非法进入其它电脑系统是禁止的。若用户的行为不符合以上的条款，phpcms将取消用户服务帐号。\r\n11．网站内容的所有权\r\n　　phpcms定义的内容包括：文字、软件、声音、相片、录象、图表；在广告中全部内容；电子邮件的全部内容；phpcms为用户提供的商业信息。所有这些内容受版权、商标、标签和其它财产所有权法律的保护。所以，用户只能在phpcms和广告商授权下才能使用这些内容，而不能擅自复制、篡改这些内容、或创造与内容有关的派生产品。\r\n12．附加信息服务\r\n　　用户在享用phpcms提供的免费服务的同时，同意接受phpcms提供的各类附加信息服务。\r\n13．解释权\r\n　　本注册协议的解释权归phpcms所有。如果其中有任何条款与国家的有关法律相抵触，则以国家法律的明文规定为准。 \\\',\n  \\\'registerverifymessage\\\' => \\\' 欢迎您注册成为phpcms用户，您的账号需要邮箱认证，点击下面链接进行认证：{click}\r\n或者将网址复制到浏览器：{url}\\\',\n  \\\'forgetpassword\\\' => \\\' phpcms密码找回，请在一小时内点击下面链接进行操作：{click}\r\n或者将网址复制到浏览器：{url}\\\',\n)\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'message\' => \n  array (\n    \'module\' => \'message\',\n    \'name\' => \'短消息\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'mood\' => \n  array (\n    \'module\' => \'mood\',\n    \'name\' => \'新闻心情\',\n    \'url\' => \'mood/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'新闻心情\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2018-04-14\',\n    \'updatedate\' => \'2018-04-14\',\n  ),\n  \'pay\' => \n  array (\n    \'module\' => \'pay\',\n    \'name\' => \'支付\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'poster\' => \n  array (\n    \'module\' => \'poster\',\n    \'name\' => \'广告模块\',\n    \'url\' => \'poster/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'广告模块\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2018-04-14\',\n    \'updatedate\' => \'2018-04-14\',\n  ),\n  \'release\' => \n  array (\n    \'module\' => \'release\',\n    \'name\' => \'发布点\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'scan\' => \n  array (\n    \'module\' => \'scan\',\n    \'name\' => \'木马扫描\',\n    \'url\' => \'scan\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'search\' => \n  array (\n    \'module\' => \'search\',\n    \'name\' => \'全站搜索\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'array (\n  \\\'fulltextenble\\\' => \\\'1\\\',\n  \\\'relationenble\\\' => \\\'1\\\',\n  \\\'suggestenable\\\' => \\\'1\\\',\n  \\\'sphinxenable\\\' => \\\'0\\\',\n  \\\'sphinxhost\\\' => \\\'10.228.134.102\\\',\n  \\\'sphinxport\\\' => \\\'9312\\\',\n)\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'sms\' => \n  array (\n    \'module\' => \'sms\',\n    \'name\' => \'短信平台\',\n    \'url\' => \'sms/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'短信平台\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2011-09-02\',\n    \'updatedate\' => \'2011-09-02\',\n  ),\n  \'special\' => \n  array (\n    \'module\' => \'special\',\n    \'name\' => \'专题\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'tag\' => \n  array (\n    \'module\' => \'tag\',\n    \'name\' => \'标签向导\',\n    \'url\' => \'tag/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'标签向导\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2018-04-14\',\n    \'updatedate\' => \'2018-04-14\',\n  ),\n  \'template\' => \n  array (\n    \'module\' => \'template\',\n    \'name\' => \'模板风格\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'upgrade\' => \n  array (\n    \'module\' => \'upgrade\',\n    \'name\' => \'在线升级\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2011-05-18\',\n    \'updatedate\' => \'2011-05-18\',\n  ),\n  \'video\' => \n  array (\n    \'module\' => \'video\',\n    \'name\' => \'视频库\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2012-09-28\',\n    \'updatedate\' => \'2012-09-28\',\n  ),\n  \'vote\' => \n  array (\n    \'module\' => \'vote\',\n    \'name\' => \'投票\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'array (\r\n  1 => \r\n  array (\r\n    \\\'default_style\\\' => \\\'default\\\',\r\n    \\\'vote_tp_template\\\' => \\\'vote_tp\\\',\r\n    \\\'allowguest\\\' => \\\'1\\\',\r\n    \\\'enabled\\\' => \\\'1\\\',\r\n    \\\'interval\\\' => \\\'1\\\',\r\n    \\\'credit\\\' => \\\'1\\\',\r\n  ),\r\n)\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'wap\' => \n  array (\n    \'module\' => \'wap\',\n    \'name\' => \'手机门户\',\n    \'url\' => \'wap/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'手机门户\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2018-04-14\',\n    \'updatedate\' => \'2018-04-14\',\n  ),\n);\n?>');
INSERT INTO `v9_cache` VALUES('mood_program.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  1 => \n  array (\n    1 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'震惊\',\n      \'pic\' => \'mood/a1.gif\',\n    ),\n    2 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'不解\',\n      \'pic\' => \'mood/a2.gif\',\n    ),\n    3 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'愤怒\',\n      \'pic\' => \'mood/a3.gif\',\n    ),\n    4 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'杯具\',\n      \'pic\' => \'mood/a4.gif\',\n    ),\n    5 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'无聊\',\n      \'pic\' => \'mood/a5.gif\',\n    ),\n    6 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'高兴\',\n      \'pic\' => \'mood/a6.gif\',\n    ),\n    7 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'支持\',\n      \'pic\' => \'mood/a7.gif\',\n    ),\n    8 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'超赞\',\n      \'pic\' => \'mood/a8.gif\',\n    ),\n    9 => \n    array (\n      \'use\' => NULL,\n      \'name\' => \'\',\n      \'pic\' => \'\',\n    ),\n    10 => \n    array (\n      \'use\' => NULL,\n      \'name\' => \'\',\n      \'pic\' => \'\',\n    ),\n  ),\n);\n?>');
INSERT INTO `v9_cache` VALUES('position.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  2 => \n  array (\n    \'posid\' => \'2\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'首页头条推荐\',\n    \'maxnum\' => \'20\',\n    \'extention\' => NULL,\n    \'listorder\' => \'4\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  1 => \n  array (\n    \'posid\' => \'1\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'首页焦点图推荐\',\n    \'maxnum\' => \'20\',\n    \'extention\' => NULL,\n    \'listorder\' => \'1\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  16 => \n  array (\n    \'posid\' => \'16\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'视频首页每日热点\',\n    \'maxnum\' => \'20\',\n    \'extention\' => \'\',\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  15 => \n  array (\n    \'posid\' => \'15\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'视频首页头条推荐\',\n    \'maxnum\' => \'20\',\n    \'extention\' => \'\',\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  14 => \n  array (\n    \'posid\' => \'14\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'视频首页焦点图\',\n    \'maxnum\' => \'20\',\n    \'extention\' => \'\',\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  13 => \n  array (\n    \'posid\' => \'13\',\n    \'modelid\' => \'82\',\n    \'catid\' => \'0\',\n    \'name\' => \'栏目页焦点图\',\n    \'maxnum\' => \'20\',\n    \'extention\' => NULL,\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  12 => \n  array (\n    \'posid\' => \'12\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'首页图片推荐\',\n    \'maxnum\' => \'20\',\n    \'extention\' => NULL,\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  10 => \n  array (\n    \'posid\' => \'10\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'栏目首页推荐\',\n    \'maxnum\' => \'20\',\n    \'extention\' => NULL,\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  9 => \n  array (\n    \'posid\' => \'9\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'网站顶部推荐\',\n    \'maxnum\' => \'20\',\n    \'extention\' => NULL,\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  8 => \n  array (\n    \'posid\' => \'8\',\n    \'modelid\' => \'30\',\n    \'catid\' => \'54\',\n    \'name\' => \'图片频道首页焦点图\',\n    \'maxnum\' => \'20\',\n    \'extention\' => NULL,\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  5 => \n  array (\n    \'posid\' => \'5\',\n    \'modelid\' => \'69\',\n    \'catid\' => \'0\',\n    \'name\' => \'推荐下载\',\n    \'maxnum\' => \'20\',\n    \'extention\' => NULL,\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  17 => \n  array (\n    \'posid\' => \'17\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'视频栏目精彩推荐\',\n    \'maxnum\' => \'20\',\n    \'extention\' => \'\',\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n);\n?>');
INSERT INTO `v9_cache` VALUES('role.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  1 => \'超级管理员\',\n  2 => \'站点管理员\',\n  3 => \'运营总监\',\n  4 => \'总编\',\n  5 => \'编辑\',\n  7 => \'发布人员\',\n);\n?>');
INSERT INTO `v9_cache` VALUES('role_siteid.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n);\n?>');
INSERT INTO `v9_cache` VALUES('sitelist.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  1 => \n  array (\n    \'siteid\' => \'1\',\n    \'name\' => \'默认站点\',\n    \'dirname\' => \'\',\n    \'domain\' => \'http://www.wfyuan.com/touyun/\',\n    \'site_title\' => \'透云科技|一物一码_一物一码营销_一物一码营销公司\',\n    \'keywords\' => \'一物一码\',\n    \'description\' => \'透云科技通过“一物一码”技术致力于为每一件商品赋予独一无二的二维码，打通品牌与每一位既有消费者之间的进一步沟通交流。\',\n    \'release_point\' => \'\',\n    \'default_style\' => \'default\',\n    \'template\' => \'default\',\n    \'setting\' => \'{\"upload_maxsize\":\"20480\",\"upload_allowext\":\"jpg|jpeg|gif|bmp|png|doc|docx|xls|xlsx|ppt|pptx|pdf|txt|rar|zip|swf\",\"watermark_enable\":\"0\",\"watermark_minwidth\":\"300\",\"watermark_minheight\":\"300\",\"watermark_img\":\"statics\\\\/images\\\\/water\\\\/\\\\/mark.png\",\"watermark_pct\":\"85\",\"watermark_quality\":\"80\",\"watermark_pos\":\"9\"}\',\n    \'uuid\' => \'412de47a-3fbf-11e8-a101-c81fbecfcb4c\',\n    \'url\' => \'http://www.wfyuan.com/touyun/\',\n  ),\n);\n?>');
INSERT INTO `v9_cache` VALUES('special.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n);\n?>');
INSERT INTO `v9_cache` VALUES('type_.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n);\n?>');
INSERT INTO `v9_cache` VALUES('type_content.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n);\n?>');
INSERT INTO `v9_cache` VALUES('type_content_1.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n);\n?>');
INSERT INTO `v9_cache` VALUES('urlrules.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  1 => \'{$categorydir}{$catdir}/index.html|{$categorydir}{$catdir}/{$page}.html\',\n  6 => \'index.php?m=content&c=index&a=lists&catid={$catid}|index.php?m=content&c=index&a=lists&catid={$catid}&page={$page}\',\n  11 => \'{$year}/{$catdir}_{$month}{$day}/{$id}.html|{$year}/{$catdir}_{$month}{$day}/{$id}_{$page}.html\',\n  12 => \'{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}.html|{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}_{$page}.html\',\n  16 => \'index.php?m=content&c=index&a=show&catid={$catid}&id={$id}|index.php?m=content&c=index&a=show&catid={$catid}&id={$id}&page={$page}\',\n  17 => \'show-{$catid}-{$id}-{$page}.html\',\n  18 => \'content-{$catid}-{$id}-{$page}.html\',\n  30 => \'list-{$catid}-{$page}.html\',\n);\n?>');
INSERT INTO `v9_cache` VALUES('urlrules_detail.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  1 => \n  array (\n    \'urlruleid\' => \'1\',\n    \'module\' => \'content\',\n    \'file\' => \'category\',\n    \'ishtml\' => \'1\',\n    \'urlrule\' => \'{$categorydir}{$catdir}/index.html|{$categorydir}{$catdir}/{$page}.html\',\n    \'example\' => \'news/china/1000.html\',\n  ),\n  6 => \n  array (\n    \'urlruleid\' => \'6\',\n    \'module\' => \'content\',\n    \'file\' => \'category\',\n    \'ishtml\' => \'0\',\n    \'urlrule\' => \'index.php?m=content&c=index&a=lists&catid={$catid}|index.php?m=content&c=index&a=lists&catid={$catid}&page={$page}\',\n    \'example\' => \'index.php?m=content&c=index&a=lists&catid=1&page=1\',\n  ),\n  11 => \n  array (\n    \'urlruleid\' => \'11\',\n    \'module\' => \'content\',\n    \'file\' => \'show\',\n    \'ishtml\' => \'1\',\n    \'urlrule\' => \'{$year}/{$catdir}_{$month}{$day}/{$id}.html|{$year}/{$catdir}_{$month}{$day}/{$id}_{$page}.html\',\n    \'example\' => \'2010/catdir_0720/1_2.html\',\n  ),\n  12 => \n  array (\n    \'urlruleid\' => \'12\',\n    \'module\' => \'content\',\n    \'file\' => \'show\',\n    \'ishtml\' => \'1\',\n    \'urlrule\' => \'{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}.html|{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}_{$page}.html\',\n    \'example\' => \'it/product/2010/0720/1_2.html\',\n  ),\n  16 => \n  array (\n    \'urlruleid\' => \'16\',\n    \'module\' => \'content\',\n    \'file\' => \'show\',\n    \'ishtml\' => \'0\',\n    \'urlrule\' => \'index.php?m=content&c=index&a=show&catid={$catid}&id={$id}|index.php?m=content&c=index&a=show&catid={$catid}&id={$id}&page={$page}\',\n    \'example\' => \'index.php?m=content&c=index&a=show&catid=1&id=1\',\n  ),\n  17 => \n  array (\n    \'urlruleid\' => \'17\',\n    \'module\' => \'content\',\n    \'file\' => \'show\',\n    \'ishtml\' => \'0\',\n    \'urlrule\' => \'show-{$catid}-{$id}-{$page}.html\',\n    \'example\' => \'show-1-2-1.html\',\n  ),\n  18 => \n  array (\n    \'urlruleid\' => \'18\',\n    \'module\' => \'content\',\n    \'file\' => \'show\',\n    \'ishtml\' => \'0\',\n    \'urlrule\' => \'content-{$catid}-{$id}-{$page}.html\',\n    \'example\' => \'content-1-2-1.html\',\n  ),\n  30 => \n  array (\n    \'urlruleid\' => \'30\',\n    \'module\' => \'content\',\n    \'file\' => \'category\',\n    \'ishtml\' => \'0\',\n    \'urlrule\' => \'list-{$catid}-{$page}.html\',\n    \'example\' => \'list-1-1.html\',\n  ),\n);\n?>');
INSERT INTO `v9_cache` VALUES('vote.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  1 => \n  array (\n    \'default_style\' => \'default\',\n    \'vote_tp_template\' => \'vote_tp\',\n    \'allowguest\' => \'1\',\n    \'enabled\' => \'1\',\n    \'interval\' => \'1\',\n    \'credit\' => \'1\',\n  ),\n);\n?>');
INSERT INTO `v9_cache` VALUES('workflow_1.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  1 => \n  array (\n    \'workflowid\' => \'1\',\n    \'siteid\' => \'1\',\n    \'steps\' => \'1\',\n    \'workname\' => \'一级审核\',\n    \'description\' => \'审核一次\',\n    \'setting\' => \'\',\n    \'flag\' => \'0\',\n  ),\n  2 => \n  array (\n    \'workflowid\' => \'2\',\n    \'siteid\' => \'1\',\n    \'steps\' => \'2\',\n    \'workname\' => \'二级审核\',\n    \'description\' => \'审核两次\',\n    \'setting\' => \'\',\n    \'flag\' => \'0\',\n  ),\n  3 => \n  array (\n    \'workflowid\' => \'3\',\n    \'siteid\' => \'1\',\n    \'steps\' => \'3\',\n    \'workname\' => \'三级审核\',\n    \'description\' => \'审核三次\',\n    \'setting\' => \'\',\n    \'flag\' => \'0\',\n  ),\n  4 => \n  array (\n    \'workflowid\' => \'4\',\n    \'siteid\' => \'1\',\n    \'steps\' => \'4\',\n    \'workname\' => \'四级审核\',\n    \'description\' => \'四级审核\',\n    \'setting\' => \'\',\n    \'flag\' => \'0\',\n  ),\n);\n?>');

DROP TABLE IF EXISTS `v9_case`;
CREATE TABLE `v9_case` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` char(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_case_data`;
CREATE TABLE `v9_case_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content1` mediumtext NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `content2` mediumtext NOT NULL,
  `content3` mediumtext NOT NULL,
  `fmsl` varchar(255) NOT NULL DEFAULT '',
  `sxtime` varchar(255) NOT NULL DEFAULT '',
  `xmneed` varchar(255) NOT NULL DEFAULT '',
  `sxgn` varchar(255) NOT NULL DEFAULT '',
  `toppic` varchar(255) NOT NULL DEFAULT '',
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_category`;
CREATE TABLE `v9_category` (
  `catid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `module` varchar(15) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `arrparentid` varchar(255) NOT NULL,
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `arrchildid` mediumtext NOT NULL,
  `catname` varchar(30) NOT NULL,
  `style` varchar(5) NOT NULL,
  `image` varchar(100) NOT NULL,
  `description` mediumtext NOT NULL,
  `parentdir` varchar(100) NOT NULL,
  `catdir` varchar(30) NOT NULL,
  `url` varchar(100) NOT NULL,
  `items` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `setting` mediumtext NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `sethtml` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `letter` varchar(30) NOT NULL,
  `usable_type` varchar(255) NOT NULL,
  PRIMARY KEY (`catid`),
  KEY `module` (`module`,`parentid`,`listorder`,`catid`),
  KEY `siteid` (`siteid`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO `v9_category` VALUES('6','1','content','0','1','0','0','1','6,34,7,8,9,10,11,12,13,14','关于透云','','','','','aboutty','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=lists&catid=6','0','0','{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category_anli\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}','6','1','0','guanyutouyun','');
INSERT INTO `v9_category` VALUES('7','1','content','0','1','6','0,6','0','7','新闻动态','','','','aboutty/','news','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=lists&catid=7','0','0','{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category_anli\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}','7','1','0','xinwendongtai','');
INSERT INTO `v9_category` VALUES('8','1','content','1','0','6','0,6','0','8','愿景及使命','','','','aboutty/','vision','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=lists&catid=8','0','0','{\"ishtml\":\"0\",\"template_list\":\"\",\"page_template\":\"page_shiming\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"category_ruleid\":\"6\",\"show_ruleid\":\"\",\"repeatchargedays\":\"1\"}','8','1','0','yuanjingjishiming','');
INSERT INTO `v9_category` VALUES('9','1','content','0','12','6','0,6','0','9','大事记','','','','aboutty/','memorabilia','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=lists&catid=9','13','0','{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category_anli\",\"list_template\":\"list_dashiji\",\"show_template\":\"show_dashiji\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}','9','1','0','dashiji','');
INSERT INTO `v9_category` VALUES('10','1','content','0','1','6','0,6','1','10,11,12','专利及荣誉','','','','aboutty/','honor','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=lists&catid=10','0','0','{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category_zhuanli\",\"list_template\":\"list_zhuanli\",\"show_template\":\"show_zhuanli\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}','10','1','0','zhuanlijirongyu','');
INSERT INTO `v9_category` VALUES('11','1','content','0','1','10','0,6,10','0','11','专利','','','','aboutty/honor/','patent','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=lists&catid=11','10','0','{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category_zhuanli\",\"list_template\":\"list_zhuanli\",\"show_template\":\"show_zhuanli\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}','11','0','0','zhuanli','');
INSERT INTO `v9_category` VALUES('12','1','content','0','1','10','0,6,10','0','12','奖项','','','','aboutty/honor/','honor','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=lists&catid=12','8','0','{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list_zhuanli\",\"show_template\":\"show_zhuanli\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}','12','0','0','jiangxiang','');
INSERT INTO `v9_category` VALUES('13','1','content','1','0','6','0,6','0','13','联系我们','','','','aboutty/','contact','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=lists&catid=13','0','0','{\"ishtml\":\"0\",\"template_list\":\"default\",\"page_template\":\"page_lxwm\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"category_ruleid\":\"6\",\"show_ruleid\":\"\",\"repeatchargedays\":\"1\"}','13','1','0','lianxiwomen','');
INSERT INTO `v9_category` VALUES('14','1','content','0','14','6','0,6','0','14','加入我们','','','','aboutty/','joinus','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=lists&catid=14','1','0','{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list_jrwm\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}','14','1','0','jiaruwomen','');
INSERT INTO `v9_category` VALUES('15','1','content','0','1','0','0','1','15,16,17,18,19','一物一码','','','','','onecode','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=lists&catid=15','0','0','{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category_onecode\",\"list_template\":\"list_onecode\",\"show_template\":\"show_onecode\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}','15','1','0','yiwuyima','');
INSERT INTO `v9_category` VALUES('16','1','content','0','1','15','0,15','0','16','扫码营销','','','','onecode/','scavenging','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=lists&catid=16','0','0','{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category_onecode\",\"list_template\":\"list_onecode\",\"show_template\":\"show_onecode\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}','16','1','0','saomayingxiao','');
INSERT INTO `v9_category` VALUES('17','1','content','0','1','15','0,15','0','17','分销管理','','','','onecode/','fenxiao','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=lists&catid=17','0','0','{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category_anli\",\"list_template\":\"list_fxgl\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}','17','1','0','fenxiaoguanli','');
INSERT INTO `v9_category` VALUES('18','1','content','0','1','15','0,15','0','18','防窜稽查','','','','onecode/','fcjc','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=lists&catid=18','0','0','{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category_anli\",\"list_template\":\"list_fcjc\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}','18','1','0','fangcuanjicha','');
INSERT INTO `v9_category` VALUES('19','1','content','0','1','15','0,15','0','19','产品溯源','','','','onecode/','cpsy','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=lists&catid=19','0','0','{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category_anli\",\"list_template\":\"list_cpsy\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}','19','1','0','chanpinsuyuan','');
INSERT INTO `v9_category` VALUES('20','1','content','0','1','0','0','1','20,21,22','众店宝','','','','','zhongdianbao','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=lists&catid=20','0','0','{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category_zhongdianbao\",\"list_template\":\"list_zhongdianbao\",\"show_template\":\"show_zhongdianbao\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}','20','1','0','zhongdianbao','');
INSERT INTO `v9_category` VALUES('21','1','content','0','1','20','0,20','0','21','产品简介','','','','zhongdianbao/','cpjj','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=lists&catid=21','3','0','{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category_zhongdianbao\",\"list_template\":\"list_zhongdianbao\",\"show_template\":\"show_zhongdianbao\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}','21','1','0','chanpinjianjie','');
INSERT INTO `v9_category` VALUES('22','1','content','1','0','20','0,20','0','22','招商加盟','','','','zhongdianbao/','zsjm','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=lists&catid=22','0','0','{\"ishtml\":\"0\",\"template_list\":\"default\",\"page_template\":\"page_zsjm\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"category_ruleid\":\"6\",\"show_ruleid\":\"\",\"repeatchargedays\":\"1\"}','22','1','0','zhaoshangjiameng','');
INSERT INTO `v9_category` VALUES('23','1','content','0','1','0','0','1','23,24,26','案例中心','','','','','case','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=lists&catid=23','0','0','{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category_anli\",\"list_template\":\"list_anli\",\"show_template\":\"show_anli\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}','23','1','0','anlizhongxin','');
INSERT INTO `v9_category` VALUES('24','1','content','0','15','23','0,23','0','24','成功案例','','','','case/','success','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=lists&catid=24','0','0','{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category_anli\",\"list_template\":\"list_anli\",\"show_template\":\"show_anli\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}','24','1','0','chenggonganli','');
INSERT INTO `v9_category` VALUES('26','1','content','0','1','23','0,23','0','26','客户赞誉','','','','case/','zanyu','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=lists&catid=26','2','0','{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category_anli\",\"list_template\":\"list_khzy\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}','26','1','0','kehuzanyu','');
INSERT INTO `v9_category` VALUES('27','1','content','0','1','0','0','1','27,28,29','行业视界','','','','','hysj','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=lists&catid=27','0','0','{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}','27','1','0','xingyeshijie','');
INSERT INTO `v9_category` VALUES('28','1','content','0','1','27','0,27','0','28','市场动态','','','','hysj/','market','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=lists&catid=28','40','0','{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}','28','1','0','shichangdongtai','');
INSERT INTO `v9_category` VALUES('29','1','content','0','1','27','0,27','0','29','白皮书','','','','hysj/','bps','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=lists&catid=29','3','0','{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category_anli\",\"list_template\":\"list_baipishu\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}','29','1','0','baipishu','');
INSERT INTO `v9_category` VALUES('30','1','content','0','1','0','0','1','30,31,33','首页','','','','','shouye','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=lists&catid=30','0','0','{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category_anli\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}','30','0','0','shouye','');
INSERT INTO `v9_category` VALUES('31','1','content','0','1','30','0,30','0','31','首页焦点图','','','','shouye/','jdt','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=lists&catid=31','4','0','{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category_anli\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}','31','0','0','shouyejiaodiantu','');
INSERT INTO `v9_category` VALUES('33','1','content','0','16','30','0,30','0','33','首页一物一码','','','','shouye/','syywym','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=lists&catid=33','4','0','{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}','33','0','0','shouyeyiwuyima','');
INSERT INTO `v9_category` VALUES('34','1','content','1','0','6','0,6','0','34','公司简介','','','','/','gsjj','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=lists&catid=34','0','0','{\"ishtml\":\"0\",\"template_list\":\"default\",\"page_template\":\"\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"category_ruleid\":\"6\",\"show_ruleid\":\"\",\"repeatchargedays\":\"1\"}','6','1','0','gongsijianjie','');

DROP TABLE IF EXISTS `v9_category_priv`;
CREATE TABLE `v9_category_priv` (
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `roleid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `is_admin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `action` char(30) NOT NULL,
  KEY `catid` (`catid`,`roleid`,`is_admin`,`action`),
  KEY `siteid` (`siteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_collection_content`;
CREATE TABLE `v9_collection_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nodeid` int(10) unsigned NOT NULL DEFAULT '0',
  `siteid` mediumint(5) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(255) NOT NULL,
  `title` char(100) NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nodeid` (`nodeid`,`siteid`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_collection_history`;
CREATE TABLE `v9_collection_history` (
  `md5` char(32) NOT NULL,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`md5`,`siteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_collection_node`;
CREATE TABLE `v9_collection_node` (
  `nodeid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `lastdate` int(10) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sourcecharset` varchar(8) NOT NULL,
  `sourcetype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `urlpage` text NOT NULL,
  `pagesize_start` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `pagesize_end` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `page_base` char(255) NOT NULL,
  `par_num` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `url_contain` char(100) NOT NULL,
  `url_except` char(100) NOT NULL,
  `url_start` char(100) NOT NULL DEFAULT '',
  `url_end` char(100) NOT NULL DEFAULT '',
  `title_rule` char(100) NOT NULL,
  `title_html_rule` text NOT NULL,
  `author_rule` char(100) NOT NULL,
  `author_html_rule` text NOT NULL,
  `comeform_rule` char(100) NOT NULL,
  `comeform_html_rule` text NOT NULL,
  `time_rule` char(100) NOT NULL,
  `time_html_rule` text NOT NULL,
  `content_rule` char(100) NOT NULL,
  `content_html_rule` text NOT NULL,
  `content_page_start` char(100) NOT NULL,
  `content_page_end` char(100) NOT NULL,
  `content_page_rule` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `content_page` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `content_nextpage` char(100) NOT NULL,
  `down_attachment` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `watermark` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `coll_order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `customize_config` text NOT NULL,
  PRIMARY KEY (`nodeid`),
  KEY `siteid` (`siteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_collection_program`;
CREATE TABLE `v9_collection_program` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `nodeid` int(10) unsigned NOT NULL DEFAULT '0',
  `modelid` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `config` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`),
  KEY `nodeid` (`nodeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_comment`;
CREATE TABLE `v9_comment` (
  `commentid` char(30) NOT NULL,
  `siteid` smallint(5) NOT NULL DEFAULT '0',
  `title` char(255) NOT NULL,
  `url` char(255) NOT NULL,
  `total` int(8) unsigned DEFAULT '0',
  `square` mediumint(8) unsigned DEFAULT '0',
  `anti` mediumint(8) unsigned DEFAULT '0',
  `neutral` mediumint(8) unsigned DEFAULT '0',
  `display_type` tinyint(1) DEFAULT '0',
  `tableid` mediumint(8) unsigned DEFAULT '0',
  `lastupdate` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`commentid`),
  KEY `lastupdate` (`lastupdate`),
  KEY `siteid` (`siteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_comment_check`;
CREATE TABLE `v9_comment_check` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `comment_data_id` int(10) DEFAULT '0' COMMENT '论评ID号',
  `siteid` smallint(5) NOT NULL DEFAULT '0' COMMENT '站点ID',
  `tableid` mediumint(8) DEFAULT '0' COMMENT '数据存储表ID',
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`),
  KEY `comment_data_id` (`comment_data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_comment_data_1`;
CREATE TABLE `v9_comment_data_1` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `commentid` char(30) NOT NULL DEFAULT '' COMMENT '评论ID号',
  `siteid` smallint(5) NOT NULL DEFAULT '0' COMMENT '站点ID',
  `userid` int(10) unsigned DEFAULT '0' COMMENT '用户ID',
  `username` varchar(20) DEFAULT NULL COMMENT '用户名',
  `creat_at` int(10) DEFAULT NULL COMMENT '发布时间',
  `ip` varchar(15) DEFAULT NULL COMMENT '用户IP地址',
  `status` tinyint(1) DEFAULT '0' COMMENT '评论状态{0:未审核,-1:未通过审核,1:通过审核}',
  `content` text COMMENT '评论内容',
  `direction` tinyint(1) DEFAULT '0' COMMENT '评论方向{0:无方向,1:正文,2:反方,3:中立}',
  `support` mediumint(8) unsigned DEFAULT '0' COMMENT '支持数',
  `reply` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为回复',
  PRIMARY KEY (`id`),
  KEY `commentid` (`commentid`),
  KEY `direction` (`direction`),
  KEY `siteid` (`siteid`),
  KEY `support` (`support`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_comment_setting`;
CREATE TABLE `v9_comment_setting` (
  `siteid` smallint(5) NOT NULL DEFAULT '0' COMMENT '站点ID',
  `guest` tinyint(1) DEFAULT '0' COMMENT '是否允许游客评论',
  `check` tinyint(1) DEFAULT '0' COMMENT '是否需要审核',
  `code` tinyint(1) DEFAULT '0' COMMENT '是否开启验证码',
  `add_point` tinyint(3) unsigned DEFAULT '0' COMMENT '添加的积分数',
  `del_point` tinyint(3) unsigned DEFAULT '0' COMMENT '扣除的积分数',
  PRIMARY KEY (`siteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO `v9_comment_setting` VALUES('1','0','0','0','0','0');

DROP TABLE IF EXISTS `v9_comment_table`;
CREATE TABLE `v9_comment_table` (
  `tableid` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '表ID号',
  `total` int(10) unsigned DEFAULT '0' COMMENT '数据总量',
  `creat_at` int(10) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`tableid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO `v9_comment_table` VALUES('1','0','0');

DROP TABLE IF EXISTS `v9_content_check`;
CREATE TABLE `v9_content_check` (
  `checkid` char(15) NOT NULL,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` char(80) NOT NULL,
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  KEY `username` (`username`),
  KEY `checkid` (`checkid`),
  KEY `status` (`status`,`inputtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_copyfrom`;
CREATE TABLE `v9_copyfrom` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sitename` varchar(30) NOT NULL,
  `siteurl` varchar(100) NOT NULL,
  `thumb` varchar(100) NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_dashiji`;
CREATE TABLE `v9_dashiji` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` char(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO `v9_dashiji` VALUES('1','9','0','上海透云物联网科技有限公司正式成立','','','','上海透云物联网科技有限公司正式成立','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=9&id=1','0','99','1','0','phpcms','1523707734','1523707787');
INSERT INTO `v9_dashiji` VALUES('2','9','0','通过《多码防伪认证系统》高新技术成果转化项目','','','','通过《多码防伪认证系统》高新技术成果转化项目荣膺国家金卡工程金蚂蚁奖之优秀应用成果奖、市场开拓奖','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=9&id=2','0','99','1','0','phpcms','1523707870','1523708136');
INSERT INTO `v9_dashiji` VALUES('3','9','0','获得上海市“高新技术企业”称号','','','','获得上海市高新技术企业称号','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=9&id=3','0','99','1','0','phpcms','1523707952','1523708141');
INSERT INTO `v9_dashiji` VALUES('4','9','0','通过BSI认证的ISO9001:2008和ISO/IEC 27001:2013管理体系认证','','','','通过BSI认证的ISO9001:2008和ISO IEC 27001:2013管理体系认证','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=9&id=4','0','99','1','0','phpcms','1523707984','1523708147');
INSERT INTO `v9_dashiji` VALUES('5','9','0','荣膺新华网、人民网“创新中国•企业创新奖”','','','','荣膺新华网、人民网创新中国&bull;企业创新奖','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=9&id=5','0','99','1','0','phpcms','1523708012','1523708155');
INSERT INTO `v9_dashiji` VALUES('6','9','0','荣膺2015-2016年度“中国互联网+行业创新企业奖”','','','','荣膺2015-2016年度中国互联网+行业创新企业奖','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=9&id=6','0','99','1','0','phpcms','1523708030','1523708160');
INSERT INTO `v9_dashiji` VALUES('7','9','0','与新华网就“溯源中国”项目达成战略合作','','','','与新华网就溯源中国项目达成战略合作','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=9&id=7','0','99','1','0','phpcms','1523708180','1523708186');
INSERT INTO `v9_dashiji` VALUES('8','9','0','荣获微软中国“微软银牌能力合作伙伴”授权','','','','荣获微软中国微软银牌能力合作伙伴授权','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=9&id=8','0','99','1','0','phpcms','1523708196','1523708202');
INSERT INTO `v9_dashiji` VALUES('9','9','0','与新华网就“溯源中国”项目达成战略合作。','','','','与新华网就溯源中国项目达成战略合作。','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=9&id=9','0','99','1','0','phpcms','1523708209','1523708216');
INSERT INTO `v9_dashiji` VALUES('10','9','0','在香港主板上市，香港联交所交易代码：01332','','','','在香港主板上市，香港联交所交易代码：01332荣获CMMI3证书','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=9&id=10','0','99','1','0','phpcms','1523708224','1523708235');
INSERT INTO `v9_dashiji` VALUES('11','9','0','透云科技母公司正式更名为中国透云科技集团有限公司','','','','透云科技母公司正式更名为中国透云科技集团有限公司全资收购信码互通（北京）科技有限公司','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=9&id=11','0','99','1','0','phpcms','1523708252','1523708268');
INSERT INTO `v9_dashiji` VALUES('12','9','0','推出新零售产品—众店宝','','','','推出新零售产品&mdash;众店宝','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=9&id=12','0','99','1','0','phpcms','1523708280','1523708334');
INSERT INTO `v9_dashiji` VALUES('13','9','0','荣膺中国财经峰会“2017年度影响力企业”','','','','荣膺中国财经峰会2017年度影响力企业','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=9&id=13','0','99','1','0','phpcms','1523708305','1523708318');

DROP TABLE IF EXISTS `v9_dashiji_data`;
CREATE TABLE `v9_dashiji_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` text NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `year` varchar(255) NOT NULL DEFAULT '2018',
  `month` varchar(255) NOT NULL DEFAULT '01',
  `isbiaoliang` varchar(255) NOT NULL DEFAULT '0',
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO `v9_dashiji_data` VALUES('1','上海透云物联网科技有限公司正式成立','0','','0','0','','0','1','','2011','8','1');
INSERT INTO `v9_dashiji_data` VALUES('2','通过《多码防伪认证系统》高新技术成果转化项目<br />\r\n荣膺国家金卡工程金蚂蚁奖之&ldquo;优秀应用成果奖&rdquo;、&ldquo;市场开拓奖&rdquo;','0','','0','0','','0','1','','2014','6','0');
INSERT INTO `v9_dashiji_data` VALUES('3','获得上海市&ldquo;高新技术企业&rdquo;称号','0','','0','0','','0','1','','2014','9','0');
INSERT INTO `v9_dashiji_data` VALUES('4','通过BSI认证的ISO9001:2008和ISO/IEC 27001:2013管理体系认证','0','','0','0','','0','1','','2014','12','0');
INSERT INTO `v9_dashiji_data` VALUES('5','荣膺新华网、人民网&ldquo;创新中国&bull;企业创新奖&rdquo;','0','','0','0','','0','1','','2016','1','0');
INSERT INTO `v9_dashiji_data` VALUES('6','荣膺2015-2016年度&ldquo;中国互联网+行业创新企业奖&rdquo;','0','','0','0','','0','1','','2016','3','0');
INSERT INTO `v9_dashiji_data` VALUES('7','与新华网就&ldquo;溯源中国&rdquo;项目达成战略合作','0','','0','0','','0','1','','2016','4','1');
INSERT INTO `v9_dashiji_data` VALUES('8','荣获微软中国&ldquo;微软银牌能力合作伙伴&rdquo;授权','0','','0','0','','0','1','','2016','5','0');
INSERT INTO `v9_dashiji_data` VALUES('9','与新华网就&ldquo;溯源中国&rdquo;项目达成战略合作。','0','','0','0','','0','1','','2016','9','0');
INSERT INTO `v9_dashiji_data` VALUES('10','在香港主板上市，香港联交所交易代码：01332<br />\r\n荣获CMMI3证书','0','','0','0','','0','1','','2016','12','1');
INSERT INTO `v9_dashiji_data` VALUES('11','透云科技母公司正式更名为中国透云科技集团有限公司<br />\r\n全资收购信码互通（北京）科技有限公司','0','','0','0','','0','1','','2017','2','1');
INSERT INTO `v9_dashiji_data` VALUES('12','推出新零售产品&mdash;众店宝','0','','0','0','','0','1','','2017','3','1');
INSERT INTO `v9_dashiji_data` VALUES('13','荣膺中国财经峰会&ldquo;2017年度影响力企业&rdquo;','0','','0','0','','0','1','','2017','11','0');

DROP TABLE IF EXISTS `v9_datacall`;
CREATE TABLE `v9_datacall` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` char(40) DEFAULT NULL,
  `dis_type` tinyint(1) unsigned DEFAULT '0',
  `type` tinyint(1) DEFAULT '0',
  `module` char(20) DEFAULT NULL,
  `action` char(20) DEFAULT NULL,
  `data` text,
  `template` text,
  `cache` mediumint(8) DEFAULT NULL,
  `num` smallint(6) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_dbsource`;
CREATE TABLE `v9_dbsource` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `host` varchar(20) NOT NULL,
  `port` int(5) NOT NULL DEFAULT '3306',
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `dbname` varchar(50) NOT NULL,
  `dbtablepre` varchar(30) NOT NULL,
  `charset` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_download`;
CREATE TABLE `v9_download` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` varchar(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `systems` varchar(100) NOT NULL DEFAULT 'Win2000/WinXP/Win2003',
  `copytype` varchar(15) NOT NULL DEFAULT '',
  `language` varchar(10) NOT NULL DEFAULT '',
  `classtype` varchar(20) NOT NULL DEFAULT '',
  `version` varchar(20) NOT NULL DEFAULT '',
  `filesize` varchar(10) NOT NULL DEFAULT 'Unkown',
  `stars` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_download_data`;
CREATE TABLE `v9_download_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` text NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `downfiles` mediumtext NOT NULL,
  `downfile` varchar(255) NOT NULL DEFAULT '',
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_downservers`;
CREATE TABLE `v9_downservers` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `sitename` varchar(100) DEFAULT NULL,
  `siteurl` varchar(255) DEFAULT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_dsj`;
CREATE TABLE `v9_dsj` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` char(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO `v9_dsj` VALUES('3','40','0','上海透云物联网科技有限公司正式成立','','','上海 科技 有限公司','上海透云物联网科技有限公司正式成立','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=40&id=3','0','99','1','0','phpcms','1522030045','1522030072');
INSERT INTO `v9_dsj` VALUES('4','40','0','通过《多码防伪认证系统》高新技术成果转化项目','','','成果转化 高新技术 项目','通过《多码防伪认证系统》高新技术成果转化项目荣膺国家金卡工程金蚂蚁奖之优秀应用成果奖、市场开拓奖','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=40&id=4','0','99','1','0','phpcms','1522030074','1522030108');
INSERT INTO `v9_dsj` VALUES('5','40','0','获得上海市“高新技术企业”称号','','','上海市 称号 高新技术','获得上海市高新技术企业称号','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=40&id=5','0','99','1','0','phpcms','1522030110','1522030128');
INSERT INTO `v9_dsj` VALUES('6','40','0','通过BSI认证的ISO9001:2008和ISO/IEC 27001:2013管理体系认证','','','','通过BSI认证的ISO9001:2008和ISO IEC 27001:2013管理体系认证','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=40&id=6','0','99','1','0','phpcms','1522030130','1522030144');
INSERT INTO `v9_dsj` VALUES('7','40','0','荣膺新华网、人民网“创新中国•企业创新奖”','','','','荣膺新华网、人民网创新中国&bull;企业创新奖','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=40&id=7','0','99','1','0','phpcms','1522030146','1522030168');
INSERT INTO `v9_dsj` VALUES('8','40','0','荣膺2015-2016年度“中国互联网+行业创新企业奖”','','','中国 互联网 年度','荣膺2015-2016年度中国互联网+行业创新企业奖','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=40&id=8','0','99','1','0','phpcms','1522030170','1522030184');
INSERT INTO `v9_dsj` VALUES('9','40','0','与新华网就“溯源中国”项目达成战略合作','','','新华网 中国 战略','与新华网就溯源中国项目达成战略合作','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=40&id=9','0','99','1','0','phpcms','1522030186','1522030199');
INSERT INTO `v9_dsj` VALUES('10','40','0','荣获微软中国“微软银牌能力合作伙伴”授权','','','微软 银牌 中国','荣获微软中国微软银牌能力合作伙伴授权','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=40&id=10','0','99','1','0','phpcms','1522030201','1522030214');
INSERT INTO `v9_dsj` VALUES('11','40','0','与新华网就“溯源中国”项目达成战略合作。','','','新华网 中国 战略','与新华网就溯源中国项目达成战略合作。','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=40&id=11','0','99','1','0','phpcms','1522030216','1522030228');
INSERT INTO `v9_dsj` VALUES('12','40','0','在香港主板上市','','','香港 主板','在香港主板上市，香港联交所交易代码：01332 荣获CMMI3证书','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=40&id=12','0','99','1','0','phpcms','1522030230','1522030265');
INSERT INTO `v9_dsj` VALUES('13','40','0','透云科技母公司正式更名为中国透云科技集团有限公司','','','科技 母公司 中国','透云科技母公司正式更名为中国透云科技集团有限公司全资收购信码互通（北京）科技有限公司','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=40&id=13','0','99','1','0','phpcms','1522030267','1522030290');
INSERT INTO `v9_dsj` VALUES('14','40','0','推出新零售产品—众店宝','','','产品','推出新零售产品&mdash;众店宝','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=40&id=14','0','99','1','0','phpcms','1522030292','1522030308');
INSERT INTO `v9_dsj` VALUES('15','40','0','荣膺中国财经峰会“2017年度影响力企业”','','','峰会 中国 影响力','荣膺中国财经峰会2017年度影响力企业','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=40&id=15','0','99','1','0','phpcms','1522030310','1522030323');

DROP TABLE IF EXISTS `v9_dsj_data`;
CREATE TABLE `v9_dsj_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` text NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `isbiaoliang` varchar(255) NOT NULL DEFAULT '0',
  `year` varchar(255) NOT NULL DEFAULT '',
  `month` varchar(255) NOT NULL DEFAULT '',
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO `v9_dsj_data` VALUES('3','上海透云物联网科技有限公司正式成立','0','','0','10000','','0','1','','1','2011','8');
INSERT INTO `v9_dsj_data` VALUES('4','通过《多码防伪认证系统》高新技术成果转化项目\r\n<div>荣膺国家金卡工程金蚂蚁奖之&ldquo;优秀应用成果奖&rdquo;、&ldquo;市场开拓奖&rdquo;</div>\r\n','0','','0','10000','','0','1','','0','2014','6');
INSERT INTO `v9_dsj_data` VALUES('5','获得上海市&ldquo;高新技术企业&rdquo;称号','0','','0','10000','','0','1','','0','2014','9');
INSERT INTO `v9_dsj_data` VALUES('6','通过BSI认证的ISO9001:2008和ISO/IEC 27001:2013管理体系认证','0','','0','10000','','0','1','','0','2014','10');
INSERT INTO `v9_dsj_data` VALUES('7','荣膺新华网、人民网&ldquo;创新中国&bull;企业创新奖&rdquo;','0','','0','10000','','0','1','','0','2016','1');
INSERT INTO `v9_dsj_data` VALUES('8','荣膺2015-2016年度&ldquo;中国互联网+行业创新企业奖&rdquo;','0','','0','10000','','0','1','','0','2016','3');
INSERT INTO `v9_dsj_data` VALUES('9','与新华网就&ldquo;溯源中国&rdquo;项目达成战略合作','0','','0','10000','','0','1','','1','2016','4');
INSERT INTO `v9_dsj_data` VALUES('10','荣获微软中国&ldquo;微软银牌能力合作伙伴&rdquo;授权','0','','0','10000','','0','1','','0','2016','5');
INSERT INTO `v9_dsj_data` VALUES('11','与新华网就&ldquo;溯源中国&rdquo;项目达成战略合作。','0','','0','10000','','0','1','','0','2016','9');
INSERT INTO `v9_dsj_data` VALUES('12','<div>在香港主板上市，香港联交所交易代码：01332</div>\r\n<div>&nbsp; 荣获CMMI3证书</div>\r\n','0','','0','10000','','0','1','','1','2016','12');
INSERT INTO `v9_dsj_data` VALUES('13','透云科技母公司正式更名为中国透云科技集团有限公司<br />\r\n全资收购信码互通（北京）科技有限公司','0','','0','10000','','0','1','','1','2017','2');
INSERT INTO `v9_dsj_data` VALUES('14','推出新零售产品&mdash;众店宝','0','','0','10000','','0','1','','1','2017','3');
INSERT INTO `v9_dsj_data` VALUES('15','荣膺中国财经峰会&ldquo;2017年度影响力企业&rdquo;','0','','0','10000','','0','1','','0','2017','11');

DROP TABLE IF EXISTS `v9_extend_setting`;
CREATE TABLE `v9_extend_setting` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `key` char(30) NOT NULL,
  `data` mediumtext,
  PRIMARY KEY (`id`),
  KEY `key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_favorite`;
CREATE TABLE `v9_favorite` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `title` char(100) NOT NULL,
  `url` char(100) NOT NULL,
  `adddate` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_hits`;
CREATE TABLE `v9_hits` (
  `hitsid` char(30) NOT NULL,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `views` int(10) unsigned NOT NULL DEFAULT '0',
  `yesterdayviews` int(10) unsigned NOT NULL DEFAULT '0',
  `dayviews` int(10) unsigned NOT NULL DEFAULT '0',
  `weekviews` int(10) unsigned NOT NULL DEFAULT '0',
  `monthviews` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`hitsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO `v9_hits` VALUES('c-1-1','11','0','0','0','0','0','1523704057');
INSERT INTO `v9_hits` VALUES('c-1-10','11','0','0','0','0','0','1523706898');
INSERT INTO `v9_hits` VALUES('c-1-11','12','0','0','0','0','0','1523706943');
INSERT INTO `v9_hits` VALUES('c-1-12','12','0','0','0','0','0','1523706962');
INSERT INTO `v9_hits` VALUES('c-1-13','12','0','0','0','0','0','1523706985');
INSERT INTO `v9_hits` VALUES('c-1-14','12','0','0','0','0','0','1523707004');
INSERT INTO `v9_hits` VALUES('c-1-15','12','0','0','0','0','0','1523707019');
INSERT INTO `v9_hits` VALUES('c-1-16','12','0','0','0','0','0','1523707035');
INSERT INTO `v9_hits` VALUES('c-1-17','12','0','0','0','0','0','1523707055');
INSERT INTO `v9_hits` VALUES('c-1-18','12','0','0','0','0','0','1523707072');
INSERT INTO `v9_hits` VALUES('c-1-19','21','0','0','0','0','0','1523709647');
INSERT INTO `v9_hits` VALUES('c-1-2','11','0','0','0','0','0','1523706679');
INSERT INTO `v9_hits` VALUES('c-1-20','21','0','0','0','0','0','1523709683');
INSERT INTO `v9_hits` VALUES('c-1-21','21','0','0','0','0','0','1523709727');
INSERT INTO `v9_hits` VALUES('c-1-22','28','0','0','0','0','0','1523710837');
INSERT INTO `v9_hits` VALUES('c-1-23','28','0','0','0','0','0','1523711216');
INSERT INTO `v9_hits` VALUES('c-1-24','28','0','0','0','0','0','1523711267');
INSERT INTO `v9_hits` VALUES('c-1-25','28','0','0','0','0','0','1523711336');
INSERT INTO `v9_hits` VALUES('c-1-26','28','0','0','0','0','0','1523711371');
INSERT INTO `v9_hits` VALUES('c-1-27','28','0','0','0','0','0','1523711408');
INSERT INTO `v9_hits` VALUES('c-1-28','28','0','0','0','0','0','1523711452');
INSERT INTO `v9_hits` VALUES('c-1-29','28','0','0','0','0','0','1523711497');
INSERT INTO `v9_hits` VALUES('c-1-3','11','0','0','0','0','0','1523706714');
INSERT INTO `v9_hits` VALUES('c-1-30','28','0','0','0','0','0','1523711553');
INSERT INTO `v9_hits` VALUES('c-1-31','28','0','0','0','0','0','1523711594');
INSERT INTO `v9_hits` VALUES('c-1-32','28','0','0','0','0','0','1523711622');
INSERT INTO `v9_hits` VALUES('c-1-33','28','0','0','0','0','0','1523711678');
INSERT INTO `v9_hits` VALUES('c-1-34','28','0','0','0','0','0','1523711716');
INSERT INTO `v9_hits` VALUES('c-1-35','28','0','0','0','0','0','1523711748');
INSERT INTO `v9_hits` VALUES('c-1-36','28','0','0','0','0','0','1523711788');
INSERT INTO `v9_hits` VALUES('c-1-37','26','0','0','0','0','0','1523711843');
INSERT INTO `v9_hits` VALUES('c-1-38','26','0','0','0','0','0','1523712196');
INSERT INTO `v9_hits` VALUES('c-1-39','31','0','0','0','0','0','1523712555');
INSERT INTO `v9_hits` VALUES('c-1-4','11','0','0','0','0','0','1523706741');
INSERT INTO `v9_hits` VALUES('c-1-40','29','0','0','0','0','0','1523712641');
INSERT INTO `v9_hits` VALUES('c-1-41','31','0','0','0','0','0','1523712653');
INSERT INTO `v9_hits` VALUES('c-1-42','31','0','0','0','0','0','1523712672');
INSERT INTO `v9_hits` VALUES('c-1-43','31','0','0','0','0','0','1523712692');
INSERT INTO `v9_hits` VALUES('c-1-44','29','0','0','0','0','0','1523712788');
INSERT INTO `v9_hits` VALUES('c-1-45','29','0','0','0','0','0','1523713038');
INSERT INTO `v9_hits` VALUES('c-1-46','28','0','0','0','0','0','1523713263');
INSERT INTO `v9_hits` VALUES('c-1-47','28','0','0','0','0','0','1523713299');
INSERT INTO `v9_hits` VALUES('c-1-48','28','0','0','0','0','0','1523713370');
INSERT INTO `v9_hits` VALUES('c-1-49','28','0','0','0','0','0','1523713418');
INSERT INTO `v9_hits` VALUES('c-1-5','11','0','0','0','0','0','1523706787');
INSERT INTO `v9_hits` VALUES('c-1-50','28','0','0','0','0','0','1523713453');
INSERT INTO `v9_hits` VALUES('c-1-51','28','0','0','0','0','0','1523713490');
INSERT INTO `v9_hits` VALUES('c-1-52','28','0','0','0','0','0','1523713534');
INSERT INTO `v9_hits` VALUES('c-1-53','28','0','0','0','0','0','1523713564');
INSERT INTO `v9_hits` VALUES('c-1-54','28','0','0','0','0','0','1523713598');
INSERT INTO `v9_hits` VALUES('c-1-55','28','0','0','0','0','0','1523713651');
INSERT INTO `v9_hits` VALUES('c-1-56','28','0','0','0','0','0','1523713683');
INSERT INTO `v9_hits` VALUES('c-1-57','28','0','0','0','0','0','1523713717');
INSERT INTO `v9_hits` VALUES('c-1-58','28','0','0','0','0','0','1523713749');
INSERT INTO `v9_hits` VALUES('c-1-59','28','0','0','0','0','0','1523713790');
INSERT INTO `v9_hits` VALUES('c-1-6','11','0','0','0','0','0','1523706809');
INSERT INTO `v9_hits` VALUES('c-1-60','28','0','0','0','0','0','1523713912');
INSERT INTO `v9_hits` VALUES('c-1-61','28','0','0','0','0','0','1523713942');
INSERT INTO `v9_hits` VALUES('c-1-62','28','0','0','0','0','0','1523713980');
INSERT INTO `v9_hits` VALUES('c-1-63','28','0','0','0','0','0','1523714022');
INSERT INTO `v9_hits` VALUES('c-1-64','28','0','0','0','0','0','1523714062');
INSERT INTO `v9_hits` VALUES('c-1-65','28','0','0','0','0','0','1523714103');
INSERT INTO `v9_hits` VALUES('c-1-66','28','0','0','0','0','0','1523714137');
INSERT INTO `v9_hits` VALUES('c-1-67','28','0','0','0','0','0','1523714171');
INSERT INTO `v9_hits` VALUES('c-1-68','28','0','0','0','0','0','1523714206');
INSERT INTO `v9_hits` VALUES('c-1-69','28','0','0','0','0','0','1523714253');
INSERT INTO `v9_hits` VALUES('c-1-7','11','0','0','0','0','0','1523706832');
INSERT INTO `v9_hits` VALUES('c-1-70','28','0','0','0','0','0','1523714293');
INSERT INTO `v9_hits` VALUES('c-1-8','11','0','0','0','0','0','1523706859');
INSERT INTO `v9_hits` VALUES('c-1-9','11','0','0','0','0','0','1523706878');
INSERT INTO `v9_hits` VALUES('c-12-1','9','0','0','0','0','0','1523707751');
INSERT INTO `v9_hits` VALUES('c-12-10','9','0','0','0','0','0','1523708235');
INSERT INTO `v9_hits` VALUES('c-12-11','9','0','0','0','0','0','1523708268');
INSERT INTO `v9_hits` VALUES('c-12-12','9','0','0','0','0','0','1523708291');
INSERT INTO `v9_hits` VALUES('c-12-13','9','0','0','0','0','0','1523708318');
INSERT INTO `v9_hits` VALUES('c-12-2','9','0','0','0','0','0','1523707892');
INSERT INTO `v9_hits` VALUES('c-12-3','9','0','0','0','0','0','1523707976');
INSERT INTO `v9_hits` VALUES('c-12-4','9','0','0','0','0','0','1523708003');
INSERT INTO `v9_hits` VALUES('c-12-5','9','0','0','0','0','0','1523708025');
INSERT INTO `v9_hits` VALUES('c-12-6','9','0','0','0','0','0','1523708046');
INSERT INTO `v9_hits` VALUES('c-12-7','9','0','0','0','0','0','1523708186');
INSERT INTO `v9_hits` VALUES('c-12-8','9','0','0','0','0','0','1523708202');
INSERT INTO `v9_hits` VALUES('c-12-9','9','0','0','0','0','0','1523708216');
INSERT INTO `v9_hits` VALUES('c-14-1','14','0','0','0','0','0','1523709007');
INSERT INTO `v9_hits` VALUES('c-16-1','33','0','0','0','0','0','1523713541');
INSERT INTO `v9_hits` VALUES('c-16-2','33','0','0','0','0','0','1523713583');
INSERT INTO `v9_hits` VALUES('c-16-3','33','0','0','0','0','0','1523713621');
INSERT INTO `v9_hits` VALUES('c-16-4','33','0','0','0','0','0','1523713656');

DROP TABLE IF EXISTS `v9_indexymym`;
CREATE TABLE `v9_indexymym` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` char(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO `v9_indexymym` VALUES('1','42','0','扫码营销','','','','提供营销管理工具和数据洞察系统，帮助品牌轻松部署营销活动。','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=42&id=1','0','99','1','0','phpcms','1523456084','1523547285');
INSERT INTO `v9_indexymym` VALUES('2','42','0','分销管理','','','','帮助品牌进行分销商管理，通过促销、返利等完善供应链中的缺失部分。','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=42&id=2','0','99','1','0','phpcms','1523456172','1523547364');
INSERT INTO `v9_indexymym` VALUES('3','42','0','防窜稽查','','','','帮助企业实现货物跟踪和窜货分析、预警。','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=42&id=3','0','99','1','0','phpcms','1523456231','1523547434');
INSERT INTO `v9_indexymym` VALUES('4','42','0','产品溯源','','','','基于物联网技术打造的开放、共享的溯源信息平台。','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=42&id=4','0','99','1','0','phpcms','1523456279','1523547500');

DROP TABLE IF EXISTS `v9_indexymym_data`;
CREATE TABLE `v9_indexymym_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` text NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `dtimage` varchar(255) NOT NULL DEFAULT '',
  `jttp` varchar(255) NOT NULL DEFAULT '',
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO `v9_indexymym_data` VALUES('1','提供营销管理工具和数据洞察系统，帮助品牌轻松部署营销活动。<br />\r\n','0','','0','0','','0','1','','/touyun/uploadfile/2018/0411/20180411101525691.gif','/touyun/uploadfile/2018/0411/20180411101508921.png');
INSERT INTO `v9_indexymym_data` VALUES('2','帮助品牌进行分销商管理，通过促销、返利等完善供应链中的缺失部分。<br />\r\n','0','','0','0','','0','1','','/touyun/uploadfile/2018/0411/20180411101649905.gif','/touyun/uploadfile/2018/0411/20180411101640848.png');
INSERT INTO `v9_indexymym_data` VALUES('3','帮助企业实现货物跟踪和窜货分析、预警。<br />\r\n','0','','0','0','','0','1','','/touyun/uploadfile/2018/0411/20180411101741485.gif','/touyun/uploadfile/2018/0411/20180411101731736.png');
INSERT INTO `v9_indexymym_data` VALUES('4','基于物联网技术打造的开放、共享的溯源信息平台。<br />\r\n','0','','0','0','','0','1','','/touyun/uploadfile/2018/0411/20180411101836406.gif','/touyun/uploadfile/2018/0411/20180411101821300.png');

DROP TABLE IF EXISTS `v9_ipbanned`;
CREATE TABLE `v9_ipbanned` (
  `ipbannedid` smallint(5) NOT NULL AUTO_INCREMENT,
  `ip` char(15) NOT NULL,
  `expires` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ipbannedid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_joinus`;
CREATE TABLE `v9_joinus` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` char(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO `v9_joinus` VALUES('1','14','0','培训主管','','','','','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=14&id=1','0','99','1','0','phpcms','1523708956','1523709007');

DROP TABLE IF EXISTS `v9_joinus_data`;
CREATE TABLE `v9_joinus_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` text NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `zwlb` varchar(255) NOT NULL DEFAULT '',
  `address` mediumtext NOT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO `v9_joinus_data` VALUES('1','','0','','0','10000','','0','1','','讲师','上海');

DROP TABLE IF EXISTS `v9_jrwm`;
CREATE TABLE `v9_jrwm` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` varchar(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` char(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO `v9_jrwm` VALUES('1','34','0','项目经理','','','经理 项目','','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=34&id=1','0','99','1','0','phpcms','1521429637','1521429680');
INSERT INTO `v9_jrwm` VALUES('2','34','0','Java高级软件工程师','','','工程师 软件','','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=34&id=2','0','99','1','0','phpcms','1521429681','1521429702');
INSERT INTO `v9_jrwm` VALUES('3','34','0','测试主管','','','测试主管','','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=34&id=3','0','99','1','0','phpcms','1521429703','1521429724');
INSERT INTO `v9_jrwm` VALUES('4','34','0','法务经理','','','法务 经理','','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=34&id=4','0','99','1','0','phpcms','1521429725','1521429746');
INSERT INTO `v9_jrwm` VALUES('5','34','0','信息技术经理','','','','','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=34&id=5','0','99','1','0','phpcms','1523546291','1523546380');
INSERT INTO `v9_jrwm` VALUES('6','34','0','Java软件工程师','','','工程师 软件','','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=34&id=6','0','99','1','0','phpcms','1523546381','1523546424');
INSERT INTO `v9_jrwm` VALUES('7','34','0','软件测试工程师','','','软件测试 工程师','','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=34&id=7','0','99','1','0','phpcms','1523546425','1523546452');
INSERT INTO `v9_jrwm` VALUES('8','34','0','B2B销售经理','','','经理','','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=34&id=8','0','99','1','0','phpcms','1523546454','1523546478');
INSERT INTO `v9_jrwm` VALUES('9','34','0','销售经理','','','经理','','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=34&id=9','0','99','1','0','phpcms','1523546480','1523546513');
INSERT INTO `v9_jrwm` VALUES('10','34','0','大数据开发工程师','','','工程师 数据','','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=34&id=10','0','99','1','0','phpcms','1523546501','1523546540');
INSERT INTO `v9_jrwm` VALUES('11','34','0','销售总监','','','总监','','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=34&id=11','0','99','1','0','phpcms','1523546542','1523546565');
INSERT INTO `v9_jrwm` VALUES('12','34','0','高级web前端工程师','','','前端 工程师','','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=34&id=12','0','99','1','0','phpcms','1523546567','1523546593');
INSERT INTO `v9_jrwm` VALUES('13','34','0','HRBP','','','HRBP','','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=34&id=13','0','99','1','0','phpcms','1523546594','1523546651');
INSERT INTO `v9_jrwm` VALUES('14','34','0','UI总监','','','总监','','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=34&id=14','0','99','1','0','phpcms','1523546652','1523546672');
INSERT INTO `v9_jrwm` VALUES('15','34','0','测试经理','','','经理','','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=34&id=15','0','99','1','0','phpcms','1523546673','1523546696');
INSERT INTO `v9_jrwm` VALUES('16','34','0','Web前端开发工程师','','','前端 工程师','','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=34&id=16','0','99','1','0','phpcms','1523546697','1523546715');
INSERT INTO `v9_jrwm` VALUES('17','34','0','培训主管','','','培训主管','','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=34&id=17','0','99','1','0','phpcms','1523546716','1523546752');

DROP TABLE IF EXISTS `v9_jrwm_data`;
CREATE TABLE `v9_jrwm_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` text NOT NULL,
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `zwlb` varchar(255) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '',
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO `v9_jrwm_data` VALUES('1','','','0','10000','','0','1','','技术类','上海');
INSERT INTO `v9_jrwm_data` VALUES('2','','','0','10000','','0','1','','技术类','上海');
INSERT INTO `v9_jrwm_data` VALUES('3','','','0','10000','','0','1','','技术类','上海');
INSERT INTO `v9_jrwm_data` VALUES('4','','','0','10000','','0','1','','法律类','上海');
INSERT INTO `v9_jrwm_data` VALUES('5','','','0','10000','','0','1','','技术类','上海');
INSERT INTO `v9_jrwm_data` VALUES('6','','','0','10000','','0','1','','技术类','上海');
INSERT INTO `v9_jrwm_data` VALUES('7','','','0','10000','','0','1','','技术类','上海');
INSERT INTO `v9_jrwm_data` VALUES('8','','','0','10000','','0','1','','技术类','');
INSERT INTO `v9_jrwm_data` VALUES('9','','','0','10000','','0','1','','技术类','上海');
INSERT INTO `v9_jrwm_data` VALUES('10','','','0','10000','','0','1','','技术类','上海');
INSERT INTO `v9_jrwm_data` VALUES('11','','','0','10000','','0','1','','销售类','上海');
INSERT INTO `v9_jrwm_data` VALUES('12','','','0','10000','','0','1','','技术类','上海');
INSERT INTO `v9_jrwm_data` VALUES('13','','','0','10000','','0','1','','','上海');
INSERT INTO `v9_jrwm_data` VALUES('14','','','0','10000','','0','1','','技术类','上海');
INSERT INTO `v9_jrwm_data` VALUES('15','','','0','10000','','0','1','','技术类','上海');
INSERT INTO `v9_jrwm_data` VALUES('16','','','0','10000','','0','1','','技术类','上海');
INSERT INTO `v9_jrwm_data` VALUES('17','','','0','10000','','0','1','','讲师','上海');

DROP TABLE IF EXISTS `v9_keylink`;
CREATE TABLE `v9_keylink` (
  `keylinkid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `word` char(40) NOT NULL,
  `url` char(100) NOT NULL,
  PRIMARY KEY (`keylinkid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_keyword`;
CREATE TABLE `v9_keyword` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `keyword` char(100) NOT NULL,
  `pinyin` char(100) NOT NULL,
  `videonum` int(11) NOT NULL DEFAULT '0',
  `searchnums` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `keyword` (`keyword`,`siteid`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO `v9_keyword` VALUES('1','1','结构','jiegou','7','0');
INSERT INTO `v9_keyword` VALUES('2','1','口香糖','kouxiangtang','1','0');
INSERT INTO `v9_keyword` VALUES('3','1','','','1','0');
INSERT INTO `v9_keyword` VALUES('4','1','二维码','erweima','8','0');
INSERT INTO `v9_keyword` VALUES('5','1','瓶盖','pinggai','1','0');
INSERT INTO `v9_keyword` VALUES('6','1','装置','zhuangzhi','1','0');
INSERT INTO `v9_keyword` VALUES('7','1','射频','shepin','1','0');
INSERT INTO `v9_keyword` VALUES('8','1','移动通信','yidongtongxin','1','0');
INSERT INTO `v9_keyword` VALUES('9','1','物品','wupin','1','0');
INSERT INTO `v9_keyword` VALUES('10','1','吸管','xiguan','2','0');
INSERT INTO `v9_keyword` VALUES('11','1','饮料','yinliao','2','0');
INSERT INTO `v9_keyword` VALUES('12','1','易拉罐','yilaguan','3','0');
INSERT INTO `v9_keyword` VALUES('13','1','拉环','lahuan','3','0');
INSERT INTO `v9_keyword` VALUES('14','1','金卡工程','jinkagongcheng','2','0');
INSERT INTO `v9_keyword` VALUES('15','1','市场开拓','shichangkaituo','1','0');
INSERT INTO `v9_keyword` VALUES('16','1','蚂蚁','mayi','2','0');
INSERT INTO `v9_keyword` VALUES('17','1','成果奖','chengguojiang','1','0');
INSERT INTO `v9_keyword` VALUES('18','1','中国','zhongguo','5','0');
INSERT INTO `v9_keyword` VALUES('19','1','骑士','qishi','1','0');
INSERT INTO `v9_keyword` VALUES('20','1','云鼎奖','yundingjiang','1','0');
INSERT INTO `v9_keyword` VALUES('21','1','创新奖','chuangxinjiang','1','0');
INSERT INTO `v9_keyword` VALUES('22','1','能量','nengliang','1','0');
INSERT INTO `v9_keyword` VALUES('23','1','互联网','hulianwang','1','0');
INSERT INTO `v9_keyword` VALUES('24','1','行业','xingye','1','0');
INSERT INTO `v9_keyword` VALUES('25','1','高新','gaoxin','1','0');
INSERT INTO `v9_keyword` VALUES('26','1','证书','zhengshu','2','0');
INSERT INTO `v9_keyword` VALUES('27','1','项目','xiangmu','1','0');
INSERT INTO `v9_keyword` VALUES('28','1','理事长','lishichang','1','0');
INSERT INTO `v9_keyword` VALUES('29','1','会员','huiyuan','1','0');
INSERT INTO `v9_keyword` VALUES('30','1','影响力','yingxiangli','1','0');
INSERT INTO `v9_keyword` VALUES('31','1','年度','niandu','1','0');
INSERT INTO `v9_keyword` VALUES('32','1','时代','shidai','1','0');
INSERT INTO `v9_keyword` VALUES('33','1','简介','jianjie','1','0');
INSERT INTO `v9_keyword` VALUES('34','1','产品','chanpin','3','0');
INSERT INTO `v9_keyword` VALUES('35','1','功能','gongneng','1','0');
INSERT INTO `v9_keyword` VALUES('36','1','配件','peijian','1','0');
INSERT INTO `v9_keyword` VALUES('37','1','设备','shebei','1','0');
INSERT INTO `v9_keyword` VALUES('38','1','防伪技术','fangweijishu','2','0');
INSERT INTO `v9_keyword` VALUES('39','1','山寨','shanzhai','2','0');
INSERT INTO `v9_keyword` VALUES('40','1','阳光','yangguang','2','0');
INSERT INTO `v9_keyword` VALUES('41','1','可追溯','kezhuisu','7','0');
INSERT INTO `v9_keyword` VALUES('42','1','合肥','hefei','1','0');
INSERT INTO `v9_keyword` VALUES('43','1','农产品','nongchanpin','7','0');
INSERT INTO `v9_keyword` VALUES('44','1','西甜瓜','xitiangua','1','0');
INSERT INTO `v9_keyword` VALUES('45','1','金山','jinshan','1','0');
INSERT INTO `v9_keyword` VALUES('46','1','乳粉','rufen','1','0');
INSERT INTO `v9_keyword` VALUES('47','1','济南','jinan','1','0');
INSERT INTO `v9_keyword` VALUES('48','1','经销商','jingxiaoshang','1','0');
INSERT INTO `v9_keyword` VALUES('49','1','郑州','zhengzhou','1','0');
INSERT INTO `v9_keyword` VALUES('50','1','全程','quancheng','3','0');
INSERT INTO `v9_keyword` VALUES('51','1','内江','neijiang','1','0');
INSERT INTO `v9_keyword` VALUES('52','1','白酒','baijiu','1','0');
INSERT INTO `v9_keyword` VALUES('53','1','系统','xitong','3','0');
INSERT INTO `v9_keyword` VALUES('54','1','南京','nanjing','2','0');
INSERT INTO `v9_keyword` VALUES('55','1','食品','shipin','1','0');
INSERT INTO `v9_keyword` VALUES('56','1','肉制品','rouzhipin','1','0');
INSERT INTO `v9_keyword` VALUES('57','1','四川','sichuan','2','0');
INSERT INTO `v9_keyword` VALUES('58','1','余种','yuzhong','1','0');
INSERT INTO `v9_keyword` VALUES('59','1','大类','dalei','1','0');
INSERT INTO `v9_keyword` VALUES('60','1','双标','shuangbiao','1','0');
INSERT INTO `v9_keyword` VALUES('61','1','武夷山','wuyishan','1','0');
INSERT INTO `v9_keyword` VALUES('62','1','大红袍','dahongpao','1','0');
INSERT INTO `v9_keyword` VALUES('63','1','电商','dianshang','2','0');
INSERT INTO `v9_keyword` VALUES('64','1','长寿','changshou','2','0');
INSERT INTO `v9_keyword` VALUES('65','1','销售额','xiaoshoue','2','0');
INSERT INTO `v9_keyword` VALUES('66','1','质量安全','zhilianganquan','3','0');
INSERT INTO `v9_keyword` VALUES('67','1','浙江','zhejiang','2','0');
INSERT INTO `v9_keyword` VALUES('68','1','舌尖','shejian','1','0');
INSERT INTO `v9_keyword` VALUES('69','1','食品安全','shipinanquan','4','0');
INSERT INTO `v9_keyword` VALUES('70','1','南宁','nanning','1','0');
INSERT INTO `v9_keyword` VALUES('71','1','湖南','hunan','1','0');
INSERT INTO `v9_keyword` VALUES('72','1','真伪','zhenwei','1','0');
INSERT INTO `v9_keyword` VALUES('73','1','源码','yuanma','1','0');
INSERT INTO `v9_keyword` VALUES('74','1','上海','shanghai','6','0');
INSERT INTO `v9_keyword` VALUES('75','1','科技','keji','7','0');
INSERT INTO `v9_keyword` VALUES('76','1','有限公司','youxiangongsi','3','0');
INSERT INTO `v9_keyword` VALUES('77','1','感谢信','ganxiexin','1','0');
INSERT INTO `v9_keyword` VALUES('78','1','焦点','jiaodian','4','0');
INSERT INTO `v9_keyword` VALUES('79','1','白皮书','baipishu','4','0');
INSERT INTO `v9_keyword` VALUES('80','1','消费者','xiaofeizhe','3','0');
INSERT INTO `v9_keyword` VALUES('81','1','王亮','wangliang','2','0');
INSERT INTO `v9_keyword` VALUES('82','1','董事长','dongshichang','2','0');
INSERT INTO `v9_keyword` VALUES('83','1','财经','caijing','2','0');
INSERT INTO `v9_keyword` VALUES('84','1','一码','yima','1','0');
INSERT INTO `v9_keyword` VALUES('85','1','现状','xianzhuang','1','0');
INSERT INTO `v9_keyword` VALUES('86','1','福建省','fujiansheng','1','0');
INSERT INTO `v9_keyword` VALUES('87','1','水产品','shuichanpin','1','0');
INSERT INTO `v9_keyword` VALUES('88','1','安徽','anhui','2','0');
INSERT INTO `v9_keyword` VALUES('89','1','体系','tixi','6','0');
INSERT INTO `v9_keyword` VALUES('90','1','甘肃','gansu','1','0');
INSERT INTO `v9_keyword` VALUES('91','1','春园','chunyuan','1','0');
INSERT INTO `v9_keyword` VALUES('92','1','申城','shencheng','1','0');
INSERT INTO `v9_keyword` VALUES('93','1','更多','gengduo','1','0');
INSERT INTO `v9_keyword` VALUES('94','1','公共服务','gonggongfuwu','1','0');
INSERT INTO `v9_keyword` VALUES('95','1','标识','biaoshi','1','0');
INSERT INTO `v9_keyword` VALUES('96','1','标准','biaozhun','2','0');
INSERT INTO `v9_keyword` VALUES('97','1','检疫局','jianyiju','1','0');
INSERT INTO `v9_keyword` VALUES('98','1','广东','guangdong','1','0');
INSERT INTO `v9_keyword` VALUES('99','1','流沙河','liushahe','1','0');
INSERT INTO `v9_keyword` VALUES('100','1','身世','shenshi','1','0');
INSERT INTO `v9_keyword` VALUES('101','1','京东','jingdong','1','0');
INSERT INTO `v9_keyword` VALUES('102','1','物品编码','wupinbianma','1','0');
INSERT INTO `v9_keyword` VALUES('103','1','襄阳','xiangyang','1','0');
INSERT INTO `v9_keyword` VALUES('104','1','中小企业','zhongxiaoqiye','1','0');
INSERT INTO `v9_keyword` VALUES('105','1','质量认证','zhiliangrenzheng','1','0');
INSERT INTO `v9_keyword` VALUES('106','1','格子','gezi','1','0');
INSERT INTO `v9_keyword` VALUES('107','1','佛山','foshan','1','0');
INSERT INTO `v9_keyword` VALUES('108','1','重庆','zhongqing','1','0');
INSERT INTO `v9_keyword` VALUES('109','1','平台','pingtai','1','0');
INSERT INTO `v9_keyword` VALUES('110','1','伊利','yili','1','0');
INSERT INTO `v9_keyword` VALUES('111','1','豆制品','douzhipin','1','0');
INSERT INTO `v9_keyword` VALUES('112','1','身家','shenjia','1','0');
INSERT INTO `v9_keyword` VALUES('113','1','财政','caizheng','1','0');
INSERT INTO `v9_keyword` VALUES('114','1','火锅底料','huoguodiliao','1','0');
INSERT INTO `v9_keyword` VALUES('115','1','河北','hebei','1','0');
INSERT INTO `v9_keyword` VALUES('116','1','茂名市','maomingshi','1','0');
INSERT INTO `v9_keyword` VALUES('117','1','广东省','guangdongsheng','1','0');
INSERT INTO `v9_keyword` VALUES('118','1','月饼','yuebing','1','0');
INSERT INTO `v9_keyword` VALUES('119','1','炎陵','yanling','1','0');
INSERT INTO `v9_keyword` VALUES('120','1','黄桃','huangtao','1','0');
INSERT INTO `v9_keyword` VALUES('121','1','身份证','shenfenzheng','1','0');
INSERT INTO `v9_keyword` VALUES('122','1','商务部','shangwubu','1','0');
INSERT INTO `v9_keyword` VALUES('123','1','多家','duojia','1','0');
INSERT INTO `v9_keyword` VALUES('124','1','肉鸡','rouji','1','0');
INSERT INTO `v9_keyword` VALUES('125','1','陕西','shanxi','1','0');

DROP TABLE IF EXISTS `v9_keyword_data`;
CREATE TABLE `v9_keyword_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tagid` int(10) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `contentid` char(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tagid` (`tagid`,`siteid`)
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO `v9_keyword_data` VALUES('1','1','1','1-1');
INSERT INTO `v9_keyword_data` VALUES('2','2','1','2-1');
INSERT INTO `v9_keyword_data` VALUES('3','1','1','2-1');
INSERT INTO `v9_keyword_data` VALUES('4','3','1','3-1');
INSERT INTO `v9_keyword_data` VALUES('5','4','1','4-1');
INSERT INTO `v9_keyword_data` VALUES('6','5','1','4-1');
INSERT INTO `v9_keyword_data` VALUES('7','6','1','4-1');
INSERT INTO `v9_keyword_data` VALUES('8','7','1','5-1');
INSERT INTO `v9_keyword_data` VALUES('9','8','1','5-1');
INSERT INTO `v9_keyword_data` VALUES('10','9','1','5-1');
INSERT INTO `v9_keyword_data` VALUES('11','1','1','6-1');
INSERT INTO `v9_keyword_data` VALUES('12','10','1','6-1');
INSERT INTO `v9_keyword_data` VALUES('13','11','1','6-1');
INSERT INTO `v9_keyword_data` VALUES('14','1','1','7-1');
INSERT INTO `v9_keyword_data` VALUES('15','10','1','7-1');
INSERT INTO `v9_keyword_data` VALUES('16','11','1','7-1');
INSERT INTO `v9_keyword_data` VALUES('17','12','1','8-1');
INSERT INTO `v9_keyword_data` VALUES('18','1','1','8-1');
INSERT INTO `v9_keyword_data` VALUES('19','13','1','8-1');
INSERT INTO `v9_keyword_data` VALUES('20','12','1','9-1');
INSERT INTO `v9_keyword_data` VALUES('21','1','1','9-1');
INSERT INTO `v9_keyword_data` VALUES('22','13','1','9-1');
INSERT INTO `v9_keyword_data` VALUES('23','12','1','10-1');
INSERT INTO `v9_keyword_data` VALUES('24','1','1','10-1');
INSERT INTO `v9_keyword_data` VALUES('25','13','1','10-1');
INSERT INTO `v9_keyword_data` VALUES('26','14','1','11-1');
INSERT INTO `v9_keyword_data` VALUES('27','15','1','11-1');
INSERT INTO `v9_keyword_data` VALUES('28','16','1','11-1');
INSERT INTO `v9_keyword_data` VALUES('29','14','1','12-1');
INSERT INTO `v9_keyword_data` VALUES('30','17','1','12-1');
INSERT INTO `v9_keyword_data` VALUES('31','16','1','12-1');
INSERT INTO `v9_keyword_data` VALUES('32','18','1','13-1');
INSERT INTO `v9_keyword_data` VALUES('33','19','1','13-1');
INSERT INTO `v9_keyword_data` VALUES('34','20','1','13-1');
INSERT INTO `v9_keyword_data` VALUES('35','18','1','14-1');
INSERT INTO `v9_keyword_data` VALUES('36','21','1','14-1');
INSERT INTO `v9_keyword_data` VALUES('37','22','1','14-1');
INSERT INTO `v9_keyword_data` VALUES('38','18','1','15-1');
INSERT INTO `v9_keyword_data` VALUES('39','23','1','15-1');
INSERT INTO `v9_keyword_data` VALUES('40','24','1','15-1');
INSERT INTO `v9_keyword_data` VALUES('41','25','1','16-1');
INSERT INTO `v9_keyword_data` VALUES('42','26','1','16-1');
INSERT INTO `v9_keyword_data` VALUES('43','27','1','16-1');
INSERT INTO `v9_keyword_data` VALUES('44','28','1','17-1');
INSERT INTO `v9_keyword_data` VALUES('45','26','1','17-1');
INSERT INTO `v9_keyword_data` VALUES('46','29','1','17-1');
INSERT INTO `v9_keyword_data` VALUES('47','30','1','18-1');
INSERT INTO `v9_keyword_data` VALUES('48','31','1','18-1');
INSERT INTO `v9_keyword_data` VALUES('49','32','1','18-1');
INSERT INTO `v9_keyword_data` VALUES('50','33','1','19-1');
INSERT INTO `v9_keyword_data` VALUES('51','34','1','19-1');
INSERT INTO `v9_keyword_data` VALUES('52','35','1','20-1');
INSERT INTO `v9_keyword_data` VALUES('53','36','1','21-1');
INSERT INTO `v9_keyword_data` VALUES('54','37','1','21-1');
INSERT INTO `v9_keyword_data` VALUES('55','38','1','22-1');
INSERT INTO `v9_keyword_data` VALUES('56','39','1','22-1');
INSERT INTO `v9_keyword_data` VALUES('57','40','1','22-1');
INSERT INTO `v9_keyword_data` VALUES('58','41','1','23-1');
INSERT INTO `v9_keyword_data` VALUES('59','42','1','23-1');
INSERT INTO `v9_keyword_data` VALUES('60','43','1','23-1');
INSERT INTO `v9_keyword_data` VALUES('61','4','1','24-1');
INSERT INTO `v9_keyword_data` VALUES('62','44','1','24-1');
INSERT INTO `v9_keyword_data` VALUES('63','45','1','24-1');
INSERT INTO `v9_keyword_data` VALUES('64','46','1','25-1');
INSERT INTO `v9_keyword_data` VALUES('65','47','1','25-1');
INSERT INTO `v9_keyword_data` VALUES('66','48','1','25-1');
INSERT INTO `v9_keyword_data` VALUES('67','49','1','26-1');
INSERT INTO `v9_keyword_data` VALUES('68','43','1','26-1');
INSERT INTO `v9_keyword_data` VALUES('69','50','1','26-1');
INSERT INTO `v9_keyword_data` VALUES('70','51','1','27-1');
INSERT INTO `v9_keyword_data` VALUES('71','52','1','27-1');
INSERT INTO `v9_keyword_data` VALUES('72','53','1','27-1');
INSERT INTO `v9_keyword_data` VALUES('73','54','1','28-1');
INSERT INTO `v9_keyword_data` VALUES('74','55','1','28-1');
INSERT INTO `v9_keyword_data` VALUES('75','53','1','28-1');
INSERT INTO `v9_keyword_data` VALUES('76','56','1','29-1');
INSERT INTO `v9_keyword_data` VALUES('77','54','1','29-1');
INSERT INTO `v9_keyword_data` VALUES('78','53','1','29-1');
INSERT INTO `v9_keyword_data` VALUES('79','57','1','30-1');
INSERT INTO `v9_keyword_data` VALUES('80','58','1','30-1');
INSERT INTO `v9_keyword_data` VALUES('81','59','1','30-1');
INSERT INTO `v9_keyword_data` VALUES('82','60','1','31-1');
INSERT INTO `v9_keyword_data` VALUES('83','61','1','31-1');
INSERT INTO `v9_keyword_data` VALUES('84','62','1','31-1');
INSERT INTO `v9_keyword_data` VALUES('85','63','1','32-1');
INSERT INTO `v9_keyword_data` VALUES('86','64','1','32-1');
INSERT INTO `v9_keyword_data` VALUES('87','65','1','32-1');
INSERT INTO `v9_keyword_data` VALUES('88','66','1','33-1');
INSERT INTO `v9_keyword_data` VALUES('89','67','1','33-1');
INSERT INTO `v9_keyword_data` VALUES('90','43','1','33-1');
INSERT INTO `v9_keyword_data` VALUES('91','68','1','34-1');
INSERT INTO `v9_keyword_data` VALUES('92','67','1','34-1');
INSERT INTO `v9_keyword_data` VALUES('93','69','1','34-1');
INSERT INTO `v9_keyword_data` VALUES('94','4','1','35-1');
INSERT INTO `v9_keyword_data` VALUES('95','70','1','35-1');
INSERT INTO `v9_keyword_data` VALUES('96','41','1','35-1');
INSERT INTO `v9_keyword_data` VALUES('97','71','1','36-1');
INSERT INTO `v9_keyword_data` VALUES('98','72','1','36-1');
INSERT INTO `v9_keyword_data` VALUES('99','73','1','36-1');
INSERT INTO `v9_keyword_data` VALUES('100','74','1','37-1');
INSERT INTO `v9_keyword_data` VALUES('101','75','1','37-1');
INSERT INTO `v9_keyword_data` VALUES('102','76','1','37-1');
INSERT INTO `v9_keyword_data` VALUES('103','77','1','38-1');
INSERT INTO `v9_keyword_data` VALUES('104','74','1','38-1');
INSERT INTO `v9_keyword_data` VALUES('105','75','1','38-1');
INSERT INTO `v9_keyword_data` VALUES('106','78','1','39-1');
INSERT INTO `v9_keyword_data` VALUES('107','79','1','40-1');
INSERT INTO `v9_keyword_data` VALUES('108','80','1','40-1');
INSERT INTO `v9_keyword_data` VALUES('109','75','1','40-1');
INSERT INTO `v9_keyword_data` VALUES('110','78','1','41-1');
INSERT INTO `v9_keyword_data` VALUES('111','78','1','42-1');
INSERT INTO `v9_keyword_data` VALUES('112','78','1','43-1');
INSERT INTO `v9_keyword_data` VALUES('113','81','1','44-1');
INSERT INTO `v9_keyword_data` VALUES('114','82','1','44-1');
INSERT INTO `v9_keyword_data` VALUES('115','83','1','44-1');
INSERT INTO `v9_keyword_data` VALUES('116','84','1','45-1');
INSERT INTO `v9_keyword_data` VALUES('117','79','1','45-1');
INSERT INTO `v9_keyword_data` VALUES('118','85','1','45-1');
INSERT INTO `v9_keyword_data` VALUES('119','86','1','46-1');
INSERT INTO `v9_keyword_data` VALUES('120','41','1','46-1');
INSERT INTO `v9_keyword_data` VALUES('121','87','1','46-1');
INSERT INTO `v9_keyword_data` VALUES('122','88','1','47-1');
INSERT INTO `v9_keyword_data` VALUES('123','89','1','47-1');
INSERT INTO `v9_keyword_data` VALUES('124','34','1','47-1');
INSERT INTO `v9_keyword_data` VALUES('125','90','1','48-1');
INSERT INTO `v9_keyword_data` VALUES('126','66','1','48-1');
INSERT INTO `v9_keyword_data` VALUES('127','43','1','48-1');
INSERT INTO `v9_keyword_data` VALUES('128','91','1','49-1');
INSERT INTO `v9_keyword_data` VALUES('129','41','1','49-1');
INSERT INTO `v9_keyword_data` VALUES('130','69','1','49-1');
INSERT INTO `v9_keyword_data` VALUES('131','4','1','50-1');
INSERT INTO `v9_keyword_data` VALUES('132','74','1','50-1');
INSERT INTO `v9_keyword_data` VALUES('133','89','1','50-1');
INSERT INTO `v9_keyword_data` VALUES('134','4','1','51-1');
INSERT INTO `v9_keyword_data` VALUES('135','92','1','51-1');
INSERT INTO `v9_keyword_data` VALUES('136','93','1','51-1');
INSERT INTO `v9_keyword_data` VALUES('137','94','1','52-1');
INSERT INTO `v9_keyword_data` VALUES('138','95','1','52-1');
INSERT INTO `v9_keyword_data` VALUES('139','96','1','52-1');
INSERT INTO `v9_keyword_data` VALUES('140','4','1','53-1');
INSERT INTO `v9_keyword_data` VALUES('141','97','1','53-1');
INSERT INTO `v9_keyword_data` VALUES('142','98','1','53-1');
INSERT INTO `v9_keyword_data` VALUES('143','99','1','54-1');
INSERT INTO `v9_keyword_data` VALUES('144','4','1','54-1');
INSERT INTO `v9_keyword_data` VALUES('145','100','1','54-1');
INSERT INTO `v9_keyword_data` VALUES('146','101','1','55-1');
INSERT INTO `v9_keyword_data` VALUES('147','102','1','55-1');
INSERT INTO `v9_keyword_data` VALUES('148','18','1','55-1');
INSERT INTO `v9_keyword_data` VALUES('149','103','1','56-1');
INSERT INTO `v9_keyword_data` VALUES('150','69','1','56-1');
INSERT INTO `v9_keyword_data` VALUES('151','104','1','56-1');
INSERT INTO `v9_keyword_data` VALUES('152','105','1','57-1');
INSERT INTO `v9_keyword_data` VALUES('153','106','1','57-1');
INSERT INTO `v9_keyword_data` VALUES('154','18','1','57-1');
INSERT INTO `v9_keyword_data` VALUES('155','107','1','58-1');
INSERT INTO `v9_keyword_data` VALUES('156','66','1','58-1');
INSERT INTO `v9_keyword_data` VALUES('157','43','1','58-1');
INSERT INTO `v9_keyword_data` VALUES('158','108','1','59-1');
INSERT INTO `v9_keyword_data` VALUES('159','50','1','59-1');
INSERT INTO `v9_keyword_data` VALUES('160','89','1','59-1');
INSERT INTO `v9_keyword_data` VALUES('161','69','1','60-1');
INSERT INTO `v9_keyword_data` VALUES('162','43','1','60-1');
INSERT INTO `v9_keyword_data` VALUES('163','109','1','60-1');
INSERT INTO `v9_keyword_data` VALUES('164','110','1','61-1');
INSERT INTO `v9_keyword_data` VALUES('165','41','1','61-1');
INSERT INTO `v9_keyword_data` VALUES('166','50','1','61-1');
INSERT INTO `v9_keyword_data` VALUES('167','111','1','62-1');
INSERT INTO `v9_keyword_data` VALUES('168','88','1','62-1');
INSERT INTO `v9_keyword_data` VALUES('169','112','1','62-1');
INSERT INTO `v9_keyword_data` VALUES('170','74','1','63-1');
INSERT INTO `v9_keyword_data` VALUES('171','113','1','63-1');
INSERT INTO `v9_keyword_data` VALUES('172','89','1','63-1');
INSERT INTO `v9_keyword_data` VALUES('173','114','1','64-1');
INSERT INTO `v9_keyword_data` VALUES('174','57','1','64-1');
INSERT INTO `v9_keyword_data` VALUES('175','96','1','64-1');
INSERT INTO `v9_keyword_data` VALUES('176','41','1','65-1');
INSERT INTO `v9_keyword_data` VALUES('177','115','1','65-1');
INSERT INTO `v9_keyword_data` VALUES('178','43','1','65-1');
INSERT INTO `v9_keyword_data` VALUES('179','116','1','66-1');
INSERT INTO `v9_keyword_data` VALUES('180','117','1','66-1');
INSERT INTO `v9_keyword_data` VALUES('181','118','1','66-1');
INSERT INTO `v9_keyword_data` VALUES('182','119','1','67-1');
INSERT INTO `v9_keyword_data` VALUES('183','120','1','67-1');
INSERT INTO `v9_keyword_data` VALUES('184','121','1','67-1');
INSERT INTO `v9_keyword_data` VALUES('185','122','1','68-1');
INSERT INTO `v9_keyword_data` VALUES('186','123','1','68-1');
INSERT INTO `v9_keyword_data` VALUES('187','89','1','68-1');
INSERT INTO `v9_keyword_data` VALUES('188','4','1','69-1');
INSERT INTO `v9_keyword_data` VALUES('189','41','1','69-1');
INSERT INTO `v9_keyword_data` VALUES('190','124','1','69-1');
INSERT INTO `v9_keyword_data` VALUES('191','125','1','70-1');
INSERT INTO `v9_keyword_data` VALUES('192','89','1','70-1');
INSERT INTO `v9_keyword_data` VALUES('193','34','1','70-1');

DROP TABLE IF EXISTS `v9_link`;
CREATE TABLE `v9_link` (
  `linkid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `linktype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `logo` varchar(255) NOT NULL DEFAULT '',
  `introduce` text NOT NULL,
  `username` varchar(30) NOT NULL DEFAULT '',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `elite` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `passed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`linkid`),
  KEY `typeid` (`typeid`,`passed`,`listorder`,`linkid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO `v9_link` VALUES('1','1','0','1','PHPCMS','http://www.phpcms.cn','http://www.phpcms.cn/images/logo_88_31.gif','','','0','0','1','1523695220');
INSERT INTO `v9_link` VALUES('2','1','0','1','盛大在线','http://www.sdo.com','http://www.snda.com/cn/logo/comp_logo_sdo.gif','','','0','0','1','1523695220');

DROP TABLE IF EXISTS `v9_linkage`;
CREATE TABLE `v9_linkage` (
  `linkageid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `style` varchar(35) NOT NULL,
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `child` tinyint(1) NOT NULL,
  `arrchildid` mediumtext NOT NULL,
  `keyid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  `setting` varchar(255) DEFAULT NULL,
  `siteid` smallint(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`linkageid`,`keyid`),
  KEY `parentid` (`parentid`,`listorder`)
) ENGINE=InnoDB AUTO_INCREMENT=3360 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO `v9_linkage` VALUES('1','中国','1','0','0','','0','0','','','0');
INSERT INTO `v9_linkage` VALUES('2','北京市','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3','上海市','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('4','天津市','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('5','重庆市','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('6','河北省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('7','山西省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('8','内蒙古','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('9','辽宁省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('10','吉林省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('11','黑龙江省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('12','江苏省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('13','浙江省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('14','安徽省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('15','福建省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('16','江西省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('17','山东省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('18','河南省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('19','湖北省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('20','湖南省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('21','广东省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('22','广西','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('23','海南省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('24','四川省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('25','贵州省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('26','云南省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('27','西藏','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('28','陕西省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('29','甘肃省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('30','青海省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('31','宁夏','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('32','新疆','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('33','台湾省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('34','香港','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('35','澳门','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('36','东城区','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('37','西城区','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('38','崇文区','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('39','宣武区','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('40','朝阳区','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('41','石景山区','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('42','海淀区','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('43','门头沟区','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('44','房山区','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('45','通州区','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('46','顺义区','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('47','昌平区','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('48','大兴区','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('49','怀柔区','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('50','平谷区','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('51','密云县','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('52','延庆县','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('53','黄浦区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('54','卢湾区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('55','徐汇区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('56','长宁区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('57','静安区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('58','普陀区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('59','闸北区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('60','虹口区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('61','杨浦区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('62','闵行区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('63','宝山区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('64','嘉定区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('65','浦东新区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('66','金山区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('67','松江区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('68','青浦区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('69','南汇区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('70','奉贤区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('71','崇明县','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('72','和平区','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('73','河东区','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('74','河西区','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('75','南开区','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('76','河北区','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('77','红桥区','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('78','塘沽区','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('79','汉沽区','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('80','大港区','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('81','东丽区','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('82','西青区','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('83','津南区','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('84','北辰区','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('85','武清区','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('86','宝坻区','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('87','宁河县','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('88','静海县','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('89','蓟县','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('90','万州区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('91','涪陵区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('92','渝中区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('93','大渡口区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('94','江北区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('95','沙坪坝区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('96','九龙坡区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('97','南岸区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('98','北碚区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('99','万盛区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('100','双桥区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('101','渝北区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('102','巴南区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('103','黔江区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('104','长寿区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('105','綦江县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('106','潼南县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('107','铜梁县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('108','大足县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('109','荣昌县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('110','璧山县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('111','梁平县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('112','城口县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('113','丰都县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('114','垫江县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('115','武隆县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('116','忠县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('117','开县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('118','云阳县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('119','奉节县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('120','巫山县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('121','巫溪县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('122','石柱县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('123','秀山县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('124','酉阳县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('125','彭水县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('126','江津区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('127','合川区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('128','永川区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('129','南川区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('130','石家庄市','0','6','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('131','唐山市','0','6','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('132','秦皇岛市','0','6','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('133','邯郸市','0','6','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('134','邢台市','0','6','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('135','保定市','0','6','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('136','张家口市','0','6','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('137','承德市','0','6','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('138','沧州市','0','6','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('139','廊坊市','0','6','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('140','衡水市','0','6','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('141','太原市','0','7','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('142','大同市','0','7','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('143','阳泉市','0','7','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('144','长治市','0','7','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('145','晋城市','0','7','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('146','朔州市','0','7','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('147','晋中市','0','7','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('148','运城市','0','7','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('149','忻州市','0','7','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('150','临汾市','0','7','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('151','吕梁市','0','7','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('152','呼和浩特市','0','8','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('153','包头市','0','8','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('154','乌海市','0','8','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('155','赤峰市','0','8','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('156','通辽市','0','8','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('157','鄂尔多斯市','0','8','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('158','呼伦贝尔市','0','8','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('159','巴彦淖尔市','0','8','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('160','乌兰察布市','0','8','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('161','兴安盟','0','8','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('162','锡林郭勒盟','0','8','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('163','阿拉善盟','0','8','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('164','沈阳市','0','9','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('165','大连市','0','9','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('166','鞍山市','0','9','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('167','抚顺市','0','9','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('168','本溪市','0','9','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('169','丹东市','0','9','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('170','锦州市','0','9','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('171','营口市','0','9','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('172','阜新市','0','9','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('173','辽阳市','0','9','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('174','盘锦市','0','9','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('175','铁岭市','0','9','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('176','朝阳市','0','9','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('177','葫芦岛市','0','9','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('178','长春市','0','10','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('179','吉林市','0','10','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('180','四平市','0','10','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('181','辽源市','0','10','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('182','通化市','0','10','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('183','白山市','0','10','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('184','松原市','0','10','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('185','白城市','0','10','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('186','延边','0','10','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('187','哈尔滨市','0','11','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('188','齐齐哈尔市','0','11','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('189','鸡西市','0','11','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('190','鹤岗市','0','11','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('191','双鸭山市','0','11','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('192','大庆市','0','11','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('193','伊春市','0','11','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('194','佳木斯市','0','11','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('195','七台河市','0','11','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('196','牡丹江市','0','11','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('197','黑河市','0','11','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('198','绥化市','0','11','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('199','大兴安岭地区','0','11','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('200','南京市','0','12','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('201','无锡市','0','12','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('202','徐州市','0','12','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('203','常州市','0','12','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('204','苏州市','0','12','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('205','南通市','0','12','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('206','连云港市','0','12','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('207','淮安市','0','12','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('208','盐城市','0','12','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('209','扬州市','0','12','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('210','镇江市','0','12','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('211','泰州市','0','12','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('212','宿迁市','0','12','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('213','杭州市','0','13','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('214','宁波市','0','13','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('215','温州市','0','13','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('216','嘉兴市','0','13','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('217','湖州市','0','13','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('218','绍兴市','0','13','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('219','金华市','0','13','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('220','衢州市','0','13','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('221','舟山市','0','13','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('222','台州市','0','13','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('223','丽水市','0','13','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('224','合肥市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('225','芜湖市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('226','蚌埠市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('227','淮南市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('228','马鞍山市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('229','淮北市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('230','铜陵市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('231','安庆市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('232','黄山市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('233','滁州市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('234','阜阳市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('235','宿州市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('236','巢湖市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('237','六安市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('238','亳州市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('239','池州市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('240','宣城市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('241','福州市','0','15','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('242','厦门市','0','15','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('243','莆田市','0','15','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('244','三明市','0','15','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('245','泉州市','0','15','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('246','漳州市','0','15','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('247','南平市','0','15','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('248','龙岩市','0','15','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('249','宁德市','0','15','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('250','南昌市','0','16','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('251','景德镇市','0','16','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('252','萍乡市','0','16','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('253','九江市','0','16','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('254','新余市','0','16','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('255','鹰潭市','0','16','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('256','赣州市','0','16','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('257','吉安市','0','16','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('258','宜春市','0','16','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('259','抚州市','0','16','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('260','上饶市','0','16','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('261','济南市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('262','青岛市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('263','淄博市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('264','枣庄市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('265','东营市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('266','烟台市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('267','潍坊市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('268','济宁市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('269','泰安市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('270','威海市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('271','日照市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('272','莱芜市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('273','临沂市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('274','德州市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('275','聊城市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('276','滨州市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('277','荷泽市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('278','郑州市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('279','开封市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('280','洛阳市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('281','平顶山市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('282','安阳市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('283','鹤壁市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('284','新乡市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('285','焦作市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('286','濮阳市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('287','许昌市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('288','漯河市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('289','三门峡市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('290','南阳市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('291','商丘市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('292','信阳市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('293','周口市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('294','驻马店市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('295','武汉市','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('296','黄石市','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('297','十堰市','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('298','宜昌市','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('299','襄樊市','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('300','鄂州市','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('301','荆门市','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('302','孝感市','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('303','荆州市','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('304','黄冈市','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('305','咸宁市','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('306','随州市','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('307','恩施土家族苗族自治州','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('308','仙桃市','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('309','潜江市','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('310','天门市','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('311','神农架林区','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('312','长沙市','0','20','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('313','株洲市','0','20','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('314','湘潭市','0','20','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('315','衡阳市','0','20','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('316','邵阳市','0','20','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('317','岳阳市','0','20','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('318','常德市','0','20','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('319','张家界市','0','20','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('320','益阳市','0','20','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('321','郴州市','0','20','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('322','永州市','0','20','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('323','怀化市','0','20','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('324','娄底市','0','20','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('325','湘西土家族苗族自治州','0','20','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('326','广州市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('327','韶关市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('328','深圳市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('329','珠海市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('330','汕头市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('331','佛山市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('332','江门市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('333','湛江市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('334','茂名市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('335','肇庆市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('336','惠州市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('337','梅州市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('338','汕尾市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('339','河源市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('340','阳江市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('341','清远市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('342','东莞市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('343','中山市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('344','潮州市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('345','揭阳市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('346','云浮市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('347','南宁市','0','22','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('348','柳州市','0','22','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('349','桂林市','0','22','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('350','梧州市','0','22','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('351','北海市','0','22','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('352','防城港市','0','22','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('353','钦州市','0','22','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('354','贵港市','0','22','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('355','玉林市','0','22','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('356','百色市','0','22','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('357','贺州市','0','22','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('358','河池市','0','22','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('359','来宾市','0','22','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('360','崇左市','0','22','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('361','海口市','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('362','三亚市','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('363','五指山市','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('364','琼海市','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('365','儋州市','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('366','文昌市','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('367','万宁市','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('368','东方市','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('369','定安县','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('370','屯昌县','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('371','澄迈县','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('372','临高县','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('373','白沙黎族自治县','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('374','昌江黎族自治县','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('375','乐东黎族自治县','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('376','陵水黎族自治县','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('377','保亭黎族苗族自治县','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('378','琼中黎族苗族自治县','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('379','西沙群岛','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('380','南沙群岛','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('381','中沙群岛的岛礁及其海域','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('382','成都市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('383','自贡市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('384','攀枝花市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('385','泸州市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('386','德阳市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('387','绵阳市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('388','广元市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('389','遂宁市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('390','内江市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('391','乐山市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('392','南充市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('393','眉山市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('394','宜宾市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('395','广安市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('396','达州市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('397','雅安市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('398','巴中市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('399','资阳市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('400','阿坝州','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('401','甘孜州','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('402','凉山州','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('403','贵阳市','0','25','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('404','六盘水市','0','25','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('405','遵义市','0','25','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('406','安顺市','0','25','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('407','铜仁地区','0','25','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('408','黔西南州','0','25','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('409','毕节地区','0','25','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('410','黔东南州','0','25','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('411','黔南州','0','25','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('412','昆明市','0','26','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('413','曲靖市','0','26','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('414','玉溪市','0','26','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('415','保山市','0','26','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('416','昭通市','0','26','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('417','丽江市','0','26','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('418','思茅市','0','26','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('419','临沧市','0','26','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('420','楚雄州','0','26','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('421','红河州','0','26','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('422','文山州','0','26','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('423','西双版纳','0','26','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('424','大理','0','26','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('425','德宏','0','26','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('426','怒江','0','26','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('427','迪庆','0','26','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('428','拉萨市','0','27','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('429','昌都','0','27','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('430','山南','0','27','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('431','日喀则','0','27','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('432','那曲','0','27','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('433','阿里','0','27','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('434','林芝','0','27','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('435','西安市','0','28','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('436','铜川市','0','28','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('437','宝鸡市','0','28','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('438','咸阳市','0','28','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('439','渭南市','0','28','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('440','延安市','0','28','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('441','汉中市','0','28','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('442','榆林市','0','28','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('443','安康市','0','28','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('444','商洛市','0','28','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('445','兰州市','0','29','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('446','嘉峪关市','0','29','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('447','金昌市','0','29','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('448','白银市','0','29','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('449','天水市','0','29','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('450','武威市','0','29','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('451','张掖市','0','29','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('452','平凉市','0','29','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('453','酒泉市','0','29','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('454','庆阳市','0','29','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('455','定西市','0','29','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('456','陇南市','0','29','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('457','临夏州','0','29','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('458','甘州','0','29','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('459','西宁市','0','30','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('460','海东地区','0','30','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('461','海州','0','30','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('462','黄南州','0','30','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('463','海南州','0','30','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('464','果洛州','0','30','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('465','玉树州','0','30','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('466','海西州','0','30','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('467','银川市','0','31','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('468','石嘴山市','0','31','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('469','吴忠市','0','31','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('470','固原市','0','31','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('471','中卫市','0','31','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('472','乌鲁木齐市','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('473','克拉玛依市','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('474','吐鲁番地区','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('475','哈密地区','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('476','昌吉州','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('477','博尔州','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('478','巴音郭楞州','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('479','阿克苏地区','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('480','克孜勒苏柯尔克孜自治州','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('481','喀什地区','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('482','和田地区','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('483','伊犁州','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('484','塔城地区','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('485','阿勒泰地区','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('486','石河子市','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('487','阿拉尔市','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('488','图木舒克市','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('489','五家渠市','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('490','台北市','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('491','高雄市','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('492','基隆市','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('493','新竹市','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('494','台中市','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('495','嘉义市','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('496','台南市','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('497','台北县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('498','桃园县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('499','新竹县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('500','苗栗县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('501','台中县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('502','彰化县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('503','南投县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('504','云林县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('505','嘉义县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('506','台南县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('507','高雄县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('508','屏东县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('509','宜兰县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('510','花莲县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('511','台东县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('512','澎湖县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('513','金门县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('514','连江县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('515','中西区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('516','东区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('517','南区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('518','湾仔区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('519','九龙城区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('520','观塘区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('521','深水埗区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('522','黄大仙区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('523','油尖旺区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('524','离岛区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('525','葵青区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('526','北区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('527','西贡区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('528','沙田区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('529','大埔区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('530','荃湾区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('531','屯门区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('532','元朗区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('533','花地玛堂区','0','35','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('534','市圣安多尼堂区','0','35','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('535','大堂区','0','35','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('536','望德堂区','0','35','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('537','风顺堂区','0','35','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('538','嘉模堂区','0','35','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('539','圣方济各堂区','0','35','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('540','长安区','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('541','桥东区','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('542','桥西区','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('543','新华区','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('544','井陉矿区','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('545','裕华区','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('546','井陉县','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('547','正定县','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('548','栾城县','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('549','行唐县','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('550','灵寿县','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('551','高邑县','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('552','深泽县','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('553','赞皇县','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('554','无极县','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('555','平山县','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('556','元氏县','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('557','赵县','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('558','辛集市','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('559','藁城市','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('560','晋州市','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('561','新乐市','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('562','鹿泉市','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('563','路南区','0','131','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('564','路北区','0','131','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('565','古冶区','0','131','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('566','开平区','0','131','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('567','丰南区','0','131','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('568','丰润区','0','131','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('569','滦县','0','131','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('570','滦南县','0','131','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('571','乐亭县','0','131','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('572','迁西县','0','131','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('573','玉田县','0','131','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('574','唐海县','0','131','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('575','遵化市','0','131','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('576','迁安市','0','131','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('577','海港区','0','132','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('578','山海关区','0','132','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('579','北戴河区','0','132','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('580','青龙县','0','132','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('581','昌黎县','0','132','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('582','抚宁县','0','132','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('583','卢龙县','0','132','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('584','邯山区','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('585','丛台区','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('586','复兴区','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('587','峰峰矿区','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('588','邯郸县','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('589','临漳县','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('590','成安县','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('591','大名县','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('592','涉县','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('593','磁县','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('594','肥乡县','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('595','永年县','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('596','邱县','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('597','鸡泽县','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('598','广平县','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('599','馆陶县','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('600','魏县','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('601','曲周县','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('602','武安市','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('603','桥东区','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('604','桥西区','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('605','邢台县','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('606','临城县','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('607','内丘县','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('608','柏乡县','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('609','隆尧县','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('610','任县','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('611','南和县','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('612','宁晋县','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('613','巨鹿县','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('614','新河县','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('615','广宗县','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('616','平乡县','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('617','威县','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('618','清河县','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('619','临西县','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('620','南宫市','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('621','沙河市','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('622','新市区','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('623','北市区','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('624','南市区','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('625','满城县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('626','清苑县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('627','涞水县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('628','阜平县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('629','徐水县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('630','定兴县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('631','唐县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('632','高阳县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('633','容城县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('634','涞源县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('635','望都县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('636','安新县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('637','易县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('638','曲阳县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('639','蠡县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('640','顺平县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('641','博野县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('642','雄县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('643','涿州市','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('644','定州市','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('645','安国市','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('646','高碑店市','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('647','桥东区','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('648','桥西区','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('649','宣化区','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('650','下花园区','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('651','宣化县','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('652','张北县','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('653','康保县','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('654','沽源县','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('655','尚义县','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('656','蔚县','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('657','阳原县','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('658','怀安县','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('659','万全县','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('660','怀来县','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('661','涿鹿县','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('662','赤城县','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('663','崇礼县','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('664','双桥区','0','137','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('665','双滦区','0','137','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('666','鹰手营子矿区','0','137','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('667','承德县','0','137','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('668','兴隆县','0','137','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('669','平泉县','0','137','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('670','滦平县','0','137','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('671','隆化县','0','137','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('672','丰宁县','0','137','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('673','宽城县','0','137','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('674','围场县','0','137','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('675','新华区','0','138','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('676','运河区','0','138','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('677','沧县','0','138','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('678','青县','0','138','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('679','东光县','0','138','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('680','海兴县','0','138','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('681','盐山县','0','138','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('682','肃宁县','0','138','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('683','南皮县','0','138','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('684','吴桥县','0','138','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('685','献县','0','138','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('686','孟村县','0','138','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('687','泊头市','0','138','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('688','任丘市','0','138','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('689','黄骅市','0','138','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('690','河间市','0','138','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('691','安次区','0','139','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('692','广阳区','0','139','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('693','固安县','0','139','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('694','永清县','0','139','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('695','香河县','0','139','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('696','大城县','0','139','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('697','文安县','0','139','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('698','大厂县','0','139','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('699','霸州市','0','139','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('700','三河市','0','139','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('701','桃城区','0','140','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('702','枣强县','0','140','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('703','武邑县','0','140','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('704','武强县','0','140','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('705','饶阳县','0','140','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('706','安平县','0','140','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('707','故城县','0','140','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('708','景县','0','140','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('709','阜城县','0','140','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('710','冀州市','0','140','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('711','深州市','0','140','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('712','小店区','0','141','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('713','迎泽区','0','141','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('714','杏花岭区','0','141','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('715','尖草坪区','0','141','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('716','万柏林区','0','141','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('717','晋源区','0','141','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('718','清徐县','0','141','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('719','阳曲县','0','141','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('720','娄烦县','0','141','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('721','古交市','0','141','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('722','城区','0','142','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('723','矿区','0','142','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('724','南郊区','0','142','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('725','新荣区','0','142','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('726','阳高县','0','142','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('727','天镇县','0','142','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('728','广灵县','0','142','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('729','灵丘县','0','142','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('730','浑源县','0','142','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('731','左云县','0','142','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('732','大同县','0','142','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('733','城区','0','143','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('734','矿区','0','143','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('735','郊区','0','143','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('736','平定县','0','143','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('737','盂县','0','143','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('738','城区','0','144','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('739','郊区','0','144','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('740','长治县','0','144','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('741','襄垣县','0','144','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('742','屯留县','0','144','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('743','平顺县','0','144','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('744','黎城县','0','144','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('745','壶关县','0','144','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('746','长子县','0','144','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('747','武乡县','0','144','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('748','沁县','0','144','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('749','沁源县','0','144','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('750','潞城市','0','144','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('751','城区','0','145','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('752','沁水县','0','145','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('753','阳城县','0','145','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('754','陵川县','0','145','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('755','泽州县','0','145','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('756','高平市','0','145','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('757','朔城区','0','146','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('758','平鲁区','0','146','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('759','山阴县','0','146','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('760','应县','0','146','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('761','右玉县','0','146','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('762','怀仁县','0','146','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('763','榆次区','0','147','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('764','榆社县','0','147','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('765','左权县','0','147','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('766','和顺县','0','147','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('767','昔阳县','0','147','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('768','寿阳县','0','147','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('769','太谷县','0','147','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('770','祁县','0','147','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('771','平遥县','0','147','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('772','灵石县','0','147','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('773','介休市','0','147','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('774','盐湖区','0','148','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('775','临猗县','0','148','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('776','万荣县','0','148','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('777','闻喜县','0','148','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('778','稷山县','0','148','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('779','新绛县','0','148','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('780','绛县','0','148','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('781','垣曲县','0','148','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('782','夏县','0','148','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('783','平陆县','0','148','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('784','芮城县','0','148','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('785','永济市','0','148','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('786','河津市','0','148','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('787','忻府区','0','149','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('788','定襄县','0','149','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('789','五台县','0','149','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('790','代县','0','149','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('791','繁峙县','0','149','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('792','宁武县','0','149','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('793','静乐县','0','149','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('794','神池县','0','149','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('795','五寨县','0','149','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('796','岢岚县','0','149','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('797','河曲县','0','149','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('798','保德县','0','149','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('799','偏关县','0','149','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('800','原平市','0','149','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('801','尧都区','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('802','曲沃县','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('803','翼城县','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('804','襄汾县','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('805','洪洞县','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('806','古县','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('807','安泽县','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('808','浮山县','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('809','吉县','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('810','乡宁县','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('811','大宁县','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('812','隰县','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('813','永和县','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('814','蒲县','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('815','汾西县','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('816','侯马市','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('817','霍州市','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('818','离石区','0','151','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('819','文水县','0','151','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('820','交城县','0','151','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('821','兴县','0','151','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('822','临县','0','151','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('823','柳林县','0','151','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('824','石楼县','0','151','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('825','岚县','0','151','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('826','方山县','0','151','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('827','中阳县','0','151','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('828','交口县','0','151','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('829','孝义市','0','151','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('830','汾阳市','0','151','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('831','新城区','0','152','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('832','回民区','0','152','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('833','玉泉区','0','152','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('834','赛罕区','0','152','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('835','土默特左旗','0','152','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('836','托克托县','0','152','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('837','和林格尔县','0','152','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('838','清水河县','0','152','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('839','武川县','0','152','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('840','东河区','0','153','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('841','昆都仑区','0','153','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('842','青山区','0','153','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('843','石拐区','0','153','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('844','白云矿区','0','153','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('845','九原区','0','153','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('846','土默特右旗','0','153','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('847','固阳县','0','153','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('848','达尔罕茂明安联合旗','0','153','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('849','海勃湾区','0','154','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('850','海南区','0','154','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('851','乌达区','0','154','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('852','红山区','0','155','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('853','元宝山区','0','155','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('854','松山区','0','155','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('855','阿鲁科尔沁旗','0','155','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('856','巴林左旗','0','155','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('857','巴林右旗','0','155','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('858','林西县','0','155','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('859','克什克腾旗','0','155','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('860','翁牛特旗','0','155','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('861','喀喇沁旗','0','155','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('862','宁城县','0','155','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('863','敖汉旗','0','155','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('864','科尔沁区','0','156','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('865','科尔沁左翼中旗','0','156','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('866','科尔沁左翼后旗','0','156','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('867','开鲁县','0','156','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('868','库伦旗','0','156','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('869','奈曼旗','0','156','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('870','扎鲁特旗','0','156','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('871','霍林郭勒市','0','156','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('872','东胜区','0','157','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('873','达拉特旗','0','157','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('874','准格尔旗','0','157','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('875','鄂托克前旗','0','157','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('876','鄂托克旗','0','157','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('877','杭锦旗','0','157','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('878','乌审旗','0','157','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('879','伊金霍洛旗','0','157','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('880','海拉尔区','0','158','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('881','阿荣旗','0','158','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('882','莫力达瓦达斡尔族自治旗','0','158','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('883','鄂伦春自治旗','0','158','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('884','鄂温克族自治旗','0','158','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('885','陈巴尔虎旗','0','158','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('886','新巴尔虎左旗','0','158','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('887','新巴尔虎右旗','0','158','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('888','满洲里市','0','158','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('889','牙克石市','0','158','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('890','扎兰屯市','0','158','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('891','额尔古纳市','0','158','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('892','根河市','0','158','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('893','临河区','0','159','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('894','五原县','0','159','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('895','磴口县','0','159','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('896','乌拉特前旗','0','159','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('897','乌拉特中旗','0','159','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('898','乌拉特后旗','0','159','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('899','杭锦后旗','0','159','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('900','集宁区','0','160','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('901','卓资县','0','160','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('902','化德县','0','160','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('903','商都县','0','160','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('904','兴和县','0','160','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('905','凉城县','0','160','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('906','察哈尔右翼前旗','0','160','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('907','察哈尔右翼中旗','0','160','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('908','察哈尔右翼后旗','0','160','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('909','四子王旗','0','160','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('910','丰镇市','0','160','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('911','乌兰浩特市','0','161','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('912','阿尔山市','0','161','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('913','科尔沁右翼前旗','0','161','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('914','科尔沁右翼中旗','0','161','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('915','扎赉特旗','0','161','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('916','突泉县','0','161','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('917','二连浩特市','0','162','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('918','锡林浩特市','0','162','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('919','阿巴嘎旗','0','162','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('920','苏尼特左旗','0','162','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('921','苏尼特右旗','0','162','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('922','东乌珠穆沁旗','0','162','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('923','西乌珠穆沁旗','0','162','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('924','太仆寺旗','0','162','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('925','镶黄旗','0','162','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('926','正镶白旗','0','162','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('927','正蓝旗','0','162','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('928','多伦县','0','162','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('929','阿拉善左旗','0','163','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('930','阿拉善右旗','0','163','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('931','额济纳旗','0','163','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('932','和平区','0','164','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('933','沈河区','0','164','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('934','大东区','0','164','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('935','皇姑区','0','164','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('936','铁西区','0','164','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('937','苏家屯区','0','164','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('938','东陵区','0','164','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('939','新城子区','0','164','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('940','于洪区','0','164','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('941','辽中县','0','164','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('942','康平县','0','164','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('943','法库县','0','164','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('944','新民市','0','164','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('945','中山区','0','165','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('946','西岗区','0','165','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('947','沙河口区','0','165','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('948','甘井子区','0','165','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('949','旅顺口区','0','165','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('950','金州区','0','165','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('951','长海县','0','165','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('952','瓦房店市','0','165','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('953','普兰店市','0','165','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('954','庄河市','0','165','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('955','铁东区','0','166','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('956','铁西区','0','166','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('957','立山区','0','166','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('958','千山区','0','166','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('959','台安县','0','166','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('960','岫岩满族自治县','0','166','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('961','海城市','0','166','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('962','新抚区','0','167','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('963','东洲区','0','167','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('964','望花区','0','167','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('965','顺城区','0','167','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('966','抚顺县','0','167','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('967','新宾满族自治县','0','167','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('968','清原满族自治县','0','167','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('969','平山区','0','168','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('970','溪湖区','0','168','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('971','明山区','0','168','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('972','南芬区','0','168','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('973','本溪满族自治县','0','168','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('974','桓仁满族自治县','0','168','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('975','元宝区','0','169','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('976','振兴区','0','169','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('977','振安区','0','169','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('978','宽甸满族自治县','0','169','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('979','东港市','0','169','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('980','凤城市','0','169','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('981','古塔区','0','170','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('982','凌河区','0','170','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('983','太和区','0','170','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('984','黑山县','0','170','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('985','义县','0','170','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('986','凌海市','0','170','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('987','北镇市','0','170','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('988','站前区','0','171','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('989','西市区','0','171','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('990','鲅鱼圈区','0','171','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('991','老边区','0','171','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('992','盖州市','0','171','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('993','大石桥市','0','171','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('994','海州区','0','172','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('995','新邱区','0','172','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('996','太平区','0','172','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('997','清河门区','0','172','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('998','细河区','0','172','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('999','阜新蒙古族自治县','0','172','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1000','彰武县','0','172','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1001','白塔区','0','173','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1002','文圣区','0','173','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1003','宏伟区','0','173','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1004','弓长岭区','0','173','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1005','太子河区','0','173','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1006','辽阳县','0','173','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1007','灯塔市','0','173','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1008','双台子区','0','174','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1009','兴隆台区','0','174','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1010','大洼县','0','174','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1011','盘山县','0','174','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1012','银州区','0','175','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1013','清河区','0','175','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1014','铁岭县','0','175','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1015','西丰县','0','175','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1016','昌图县','0','175','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1017','调兵山市','0','175','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1018','开原市','0','175','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1019','双塔区','0','176','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1020','龙城区','0','176','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1021','朝阳县','0','176','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1022','建平县','0','176','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1023','喀喇沁左翼蒙古族自治县','0','176','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1024','北票市','0','176','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1025','凌源市','0','176','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1026','连山区','0','177','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1027','龙港区','0','177','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1028','南票区','0','177','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1029','绥中县','0','177','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1030','建昌县','0','177','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1031','兴城市','0','177','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1032','南关区','0','178','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1033','宽城区','0','178','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1034','朝阳区','0','178','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1035','二道区','0','178','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1036','绿园区','0','178','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1037','双阳区','0','178','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1038','农安县','0','178','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1039','九台市','0','178','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1040','榆树市','0','178','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1041','德惠市','0','178','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1042','昌邑区','0','179','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1043','龙潭区','0','179','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1044','船营区','0','179','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1045','丰满区','0','179','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1046','永吉县','0','179','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1047','蛟河市','0','179','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1048','桦甸市','0','179','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1049','舒兰市','0','179','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1050','磐石市','0','179','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1051','铁西区','0','180','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1052','铁东区','0','180','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1053','梨树县','0','180','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1054','伊通满族自治县','0','180','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1055','公主岭市','0','180','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1056','双辽市','0','180','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1057','龙山区','0','181','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1058','西安区','0','181','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1059','东丰县','0','181','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1060','东辽县','0','181','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1061','东昌区','0','182','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1062','二道江区','0','182','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1063','通化县','0','182','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1064','辉南县','0','182','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1065','柳河县','0','182','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1066','梅河口市','0','182','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1067','集安市','0','182','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1068','八道江区','0','183','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1069','抚松县','0','183','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1070','靖宇县','0','183','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1071','长白朝鲜族自治县','0','183','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1072','江源县','0','183','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1073','临江市','0','183','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1074','宁江区','0','184','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1075','前郭尔罗斯蒙古族自治县','0','184','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1076','长岭县','0','184','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1077','乾安县','0','184','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1078','扶余县','0','184','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1079','洮北区','0','185','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1080','镇赉县','0','185','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1081','通榆县','0','185','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1082','洮南市','0','185','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1083','大安市','0','185','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1084','延吉市','0','186','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1085','图们市','0','186','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1086','敦化市','0','186','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1087','珲春市','0','186','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1088','龙井市','0','186','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1089','和龙市','0','186','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1090','汪清县','0','186','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1091','安图县','0','186','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1092','道里区','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1093','南岗区','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1094','道外区','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1095','香坊区','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1096','动力区','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1097','平房区','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1098','松北区','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1099','呼兰区','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1100','依兰县','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1101','方正县','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1102','宾县','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1103','巴彦县','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1104','木兰县','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1105','通河县','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1106','延寿县','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1107','阿城市','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1108','双城市','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1109','尚志市','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1110','五常市','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1111','龙沙区','0','188','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1112','建华区','0','188','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1113','铁锋区','0','188','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1114','昂昂溪区','0','188','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1115','富拉尔基区','0','188','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1116','碾子山区','0','188','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1117','梅里斯达斡尔族区','0','188','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1118','龙江县','0','188','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1119','依安县','0','188','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1120','泰来县','0','188','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1121','甘南县','0','188','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1122','富裕县','0','188','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1123','克山县','0','188','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1124','克东县','0','188','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1125','拜泉县','0','188','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1126','讷河市','0','188','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1127','鸡冠区','0','189','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1128','恒山区','0','189','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1129','滴道区','0','189','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1130','梨树区','0','189','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1131','城子河区','0','189','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1132','麻山区','0','189','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1133','鸡东县','0','189','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1134','虎林市','0','189','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1135','密山市','0','189','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1136','向阳区','0','190','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1137','工农区','0','190','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1138','南山区','0','190','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1139','兴安区','0','190','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1140','东山区','0','190','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1141','兴山区','0','190','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1142','萝北县','0','190','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1143','绥滨县','0','190','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1144','尖山区','0','191','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1145','岭东区','0','191','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1146','四方台区','0','191','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1147','宝山区','0','191','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1148','集贤县','0','191','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1149','友谊县','0','191','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1150','宝清县','0','191','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1151','饶河县','0','191','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1152','萨尔图区','0','192','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1153','龙凤区','0','192','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1154','让胡路区','0','192','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1155','红岗区','0','192','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1156','大同区','0','192','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1157','肇州县','0','192','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1158','肇源县','0','192','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1159','林甸县','0','192','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1160','杜尔伯特蒙古族自治县','0','192','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1161','伊春区','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1162','南岔区','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1163','友好区','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1164','西林区','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1165','翠峦区','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1166','新青区','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1167','美溪区','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1168','金山屯区','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1169','五营区','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1170','乌马河区','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1171','汤旺河区','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1172','带岭区','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1173','乌伊岭区','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1174','红星区','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1175','上甘岭区','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1176','嘉荫县','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1177','铁力市','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1178','永红区','0','194','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1179','向阳区','0','194','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1180','前进区','0','194','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1181','东风区','0','194','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1182','郊区','0','194','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1183','桦南县','0','194','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1184','桦川县','0','194','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1185','汤原县','0','194','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1186','抚远县','0','194','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1187','同江市','0','194','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1188','富锦市','0','194','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1189','新兴区','0','195','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1190','桃山区','0','195','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1191','茄子河区','0','195','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1192','勃利县','0','195','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1193','东安区','0','196','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1194','阳明区','0','196','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1195','爱民区','0','196','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1196','西安区','0','196','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1197','东宁县','0','196','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1198','林口县','0','196','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1199','绥芬河市','0','196','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1200','海林市','0','196','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1201','宁安市','0','196','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1202','穆棱市','0','196','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1203','爱辉区','0','197','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1204','嫩江县','0','197','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1205','逊克县','0','197','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1206','孙吴县','0','197','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1207','北安市','0','197','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1208','五大连池市','0','197','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1209','北林区','0','198','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1210','望奎县','0','198','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1211','兰西县','0','198','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1212','青冈县','0','198','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1213','庆安县','0','198','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1214','明水县','0','198','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1215','绥棱县','0','198','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1216','安达市','0','198','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1217','肇东市','0','198','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1218','海伦市','0','198','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1219','呼玛县','0','199','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1220','塔河县','0','199','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1221','漠河县','0','199','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1222','玄武区','0','200','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1223','白下区','0','200','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1224','秦淮区','0','200','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1225','建邺区','0','200','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1226','鼓楼区','0','200','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1227','下关区','0','200','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1228','浦口区','0','200','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1229','栖霞区','0','200','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1230','雨花台区','0','200','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1231','江宁区','0','200','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1232','六合区','0','200','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1233','溧水县','0','200','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1234','高淳县','0','200','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1235','崇安区','0','201','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1236','南长区','0','201','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1237','北塘区','0','201','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1238','锡山区','0','201','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1239','惠山区','0','201','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1240','滨湖区','0','201','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1241','江阴市','0','201','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1242','宜兴市','0','201','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1243','鼓楼区','0','202','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1244','云龙区','0','202','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1245','九里区','0','202','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1246','贾汪区','0','202','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1247','泉山区','0','202','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1248','丰县','0','202','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1249','沛县','0','202','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1250','铜山县','0','202','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1251','睢宁县','0','202','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1252','新沂市','0','202','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1253','邳州市','0','202','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1254','天宁区','0','203','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1255','钟楼区','0','203','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1256','戚墅堰区','0','203','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1257','新北区','0','203','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1258','武进区','0','203','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1259','溧阳市','0','203','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1260','金坛市','0','203','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1261','沧浪区','0','204','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1262','平江区','0','204','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1263','金阊区','0','204','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1264','虎丘区','0','204','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1265','吴中区','0','204','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1266','相城区','0','204','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1267','常熟市','0','204','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1268','张家港市','0','204','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1269','昆山市','0','204','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1270','吴江市','0','204','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1271','太仓市','0','204','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1272','崇川区','0','205','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1273','港闸区','0','205','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1274','海安县','0','205','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1275','如东县','0','205','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1276','启东市','0','205','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1277','如皋市','0','205','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1278','通州市','0','205','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1279','海门市','0','205','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1280','连云区','0','206','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1281','新浦区','0','206','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1282','海州区','0','206','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1283','赣榆县','0','206','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1284','东海县','0','206','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1285','灌云县','0','206','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1286','灌南县','0','206','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1287','清河区','0','207','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1288','楚州区','0','207','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1289','淮阴区','0','207','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1290','清浦区','0','207','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1291','涟水县','0','207','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1292','洪泽县','0','207','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1293','盱眙县','0','207','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1294','金湖县','0','207','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1295','亭湖区','0','208','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1296','盐都区','0','208','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1297','响水县','0','208','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1298','滨海县','0','208','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1299','阜宁县','0','208','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1300','射阳县','0','208','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1301','建湖县','0','208','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1302','东台市','0','208','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1303','大丰市','0','208','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1304','广陵区','0','209','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1305','邗江区','0','209','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1306','维扬区','0','209','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1307','宝应县','0','209','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1308','仪征市','0','209','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1309','高邮市','0','209','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1310','江都市','0','209','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1311','京口区','0','210','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1312','润州区','0','210','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1313','丹徒区','0','210','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1314','丹阳市','0','210','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1315','扬中市','0','210','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1316','句容市','0','210','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1317','海陵区','0','211','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1318','高港区','0','211','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1319','兴化市','0','211','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1320','靖江市','0','211','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1321','泰兴市','0','211','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1322','姜堰市','0','211','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1323','宿城区','0','212','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1324','宿豫区','0','212','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1325','沭阳县','0','212','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1326','泗阳县','0','212','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1327','泗洪县','0','212','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1328','上城区','0','213','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1329','下城区','0','213','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1330','江干区','0','213','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1331','拱墅区','0','213','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1332','西湖区','0','213','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1333','滨江区','0','213','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1334','萧山区','0','213','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1335','余杭区','0','213','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1336','桐庐县','0','213','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1337','淳安县','0','213','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1338','建德市','0','213','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1339','富阳市','0','213','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1340','临安市','0','213','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1341','海曙区','0','214','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1342','江东区','0','214','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1343','江北区','0','214','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1344','北仑区','0','214','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1345','镇海区','0','214','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1346','鄞州区','0','214','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1347','象山县','0','214','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1348','宁海县','0','214','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1349','余姚市','0','214','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1350','慈溪市','0','214','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1351','奉化市','0','214','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1352','鹿城区','0','215','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1353','龙湾区','0','215','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1354','瓯海区','0','215','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1355','洞头县','0','215','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1356','永嘉县','0','215','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1357','平阳县','0','215','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1358','苍南县','0','215','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1359','文成县','0','215','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1360','泰顺县','0','215','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1361','瑞安市','0','215','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1362','乐清市','0','215','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1363','秀城区','0','216','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1364','秀洲区','0','216','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1365','嘉善县','0','216','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1366','海盐县','0','216','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1367','海宁市','0','216','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1368','平湖市','0','216','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1369','桐乡市','0','216','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1370','吴兴区','0','217','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1371','南浔区','0','217','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1372','德清县','0','217','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1373','长兴县','0','217','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1374','安吉县','0','217','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1375','越城区','0','218','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1376','绍兴县','0','218','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1377','新昌县','0','218','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1378','诸暨市','0','218','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1379','上虞市','0','218','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1380','嵊州市','0','218','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1381','婺城区','0','219','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1382','金东区','0','219','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1383','武义县','0','219','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1384','浦江县','0','219','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1385','磐安县','0','219','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1386','兰溪市','0','219','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1387','义乌市','0','219','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1388','东阳市','0','219','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1389','永康市','0','219','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1390','柯城区','0','220','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1391','衢江区','0','220','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1392','常山县','0','220','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1393','开化县','0','220','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1394','龙游县','0','220','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1395','江山市','0','220','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1396','定海区','0','221','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1397','普陀区','0','221','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1398','岱山县','0','221','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1399','嵊泗县','0','221','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1400','椒江区','0','222','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1401','黄岩区','0','222','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1402','路桥区','0','222','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1403','玉环县','0','222','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1404','三门县','0','222','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1405','天台县','0','222','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1406','仙居县','0','222','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1407','温岭市','0','222','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1408','临海市','0','222','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1409','莲都区','0','223','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1410','青田县','0','223','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1411','缙云县','0','223','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1412','遂昌县','0','223','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1413','松阳县','0','223','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1414','云和县','0','223','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1415','庆元县','0','223','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1416','景宁畲族自治县','0','223','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1417','龙泉市','0','223','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1418','瑶海区','0','224','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1419','庐阳区','0','224','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1420','蜀山区','0','224','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1421','包河区','0','224','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1422','长丰县','0','224','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1423','肥东县','0','224','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1424','肥西县','0','224','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1425','镜湖区','0','225','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1426','弋江区','0','225','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1427','鸠江区','0','225','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1428','三山区','0','225','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1429','芜湖县','0','225','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1430','繁昌县','0','225','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1431','南陵县','0','225','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1432','龙子湖区','0','226','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1433','蚌山区','0','226','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1434','禹会区','0','226','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1435','淮上区','0','226','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1436','怀远县','0','226','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1437','五河县','0','226','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1438','固镇县','0','226','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1439','大通区','0','227','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1440','田家庵区','0','227','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1441','谢家集区','0','227','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1442','八公山区','0','227','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1443','潘集区','0','227','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1444','凤台县','0','227','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1445','金家庄区','0','228','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1446','花山区','0','228','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1447','雨山区','0','228','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1448','当涂县','0','228','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1449','杜集区','0','229','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1450','相山区','0','229','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1451','烈山区','0','229','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1452','濉溪县','0','229','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1453','铜官山区','0','230','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1454','狮子山区','0','230','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1455','郊区','0','230','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1456','铜陵县','0','230','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1457','迎江区','0','231','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1458','大观区','0','231','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1459','宜秀区','0','231','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1460','怀宁县','0','231','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1461','枞阳县','0','231','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1462','潜山县','0','231','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1463','太湖县','0','231','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1464','宿松县','0','231','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1465','望江县','0','231','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1466','岳西县','0','231','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1467','桐城市','0','231','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1468','屯溪区','0','232','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1469','黄山区','0','232','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1470','徽州区','0','232','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1471','歙县','0','232','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1472','休宁县','0','232','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1473','黟县','0','232','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1474','祁门县','0','232','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1475','琅琊区','0','233','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1476','南谯区','0','233','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1477','来安县','0','233','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1478','全椒县','0','233','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1479','定远县','0','233','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1480','凤阳县','0','233','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1481','天长市','0','233','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1482','明光市','0','233','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1483','颍州区','0','234','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1484','颍东区','0','234','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1485','颍泉区','0','234','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1486','临泉县','0','234','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1487','太和县','0','234','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1488','阜南县','0','234','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1489','颍上县','0','234','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1490','界首市','0','234','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1491','埇桥区','0','235','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1492','砀山县','0','235','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1493','萧县','0','235','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1494','灵璧县','0','235','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1495','泗县','0','235','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1496','居巢区','0','236','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1497','庐江县','0','236','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1498','无为县','0','236','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1499','含山县','0','236','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1500','和县','0','236','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1501','金安区','0','237','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1502','裕安区','0','237','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1503','寿县','0','237','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1504','霍邱县','0','237','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1505','舒城县','0','237','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1506','金寨县','0','237','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1507','霍山县','0','237','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1508','谯城区','0','238','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1509','涡阳县','0','238','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1510','蒙城县','0','238','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1511','利辛县','0','238','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1512','贵池区','0','239','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1513','东至县','0','239','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1514','石台县','0','239','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1515','青阳县','0','239','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1516','宣州区','0','240','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1517','郎溪县','0','240','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1518','广德县','0','240','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1519','泾县','0','240','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1520','绩溪县','0','240','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1521','旌德县','0','240','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1522','宁国市','0','240','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1523','鼓楼区','0','241','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1524','台江区','0','241','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1525','仓山区','0','241','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1526','马尾区','0','241','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1527','晋安区','0','241','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1528','闽侯县','0','241','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1529','连江县','0','241','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1530','罗源县','0','241','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1531','闽清县','0','241','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1532','永泰县','0','241','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1533','平潭县','0','241','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1534','福清市','0','241','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1535','长乐市','0','241','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1536','思明区','0','242','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1537','海沧区','0','242','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1538','湖里区','0','242','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1539','集美区','0','242','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1540','同安区','0','242','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1541','翔安区','0','242','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1542','城厢区','0','243','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1543','涵江区','0','243','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1544','荔城区','0','243','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1545','秀屿区','0','243','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1546','仙游县','0','243','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1547','梅列区','0','244','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1548','三元区','0','244','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1549','明溪县','0','244','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1550','清流县','0','244','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1551','宁化县','0','244','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1552','大田县','0','244','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1553','尤溪县','0','244','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1554','沙县','0','244','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1555','将乐县','0','244','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1556','泰宁县','0','244','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1557','建宁县','0','244','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1558','永安市','0','244','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1559','鲤城区','0','245','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1560','丰泽区','0','245','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1561','洛江区','0','245','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1562','泉港区','0','245','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1563','惠安县','0','245','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1564','安溪县','0','245','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1565','永春县','0','245','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1566','德化县','0','245','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1567','金门县','0','245','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1568','石狮市','0','245','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1569','晋江市','0','245','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1570','南安市','0','245','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1571','芗城区','0','246','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1572','龙文区','0','246','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1573','云霄县','0','246','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1574','漳浦县','0','246','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1575','诏安县','0','246','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1576','长泰县','0','246','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1577','东山县','0','246','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1578','南靖县','0','246','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1579','平和县','0','246','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1580','华安县','0','246','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1581','龙海市','0','246','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1582','延平区','0','247','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1583','顺昌县','0','247','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1584','浦城县','0','247','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1585','光泽县','0','247','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1586','松溪县','0','247','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1587','政和县','0','247','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1588','邵武市','0','247','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1589','武夷山市','0','247','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1590','建瓯市','0','247','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1591','建阳市','0','247','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1592','新罗区','0','248','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1593','长汀县','0','248','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1594','永定县','0','248','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1595','上杭县','0','248','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1596','武平县','0','248','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1597','连城县','0','248','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1598','漳平市','0','248','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1599','蕉城区','0','249','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1600','霞浦县','0','249','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1601','古田县','0','249','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1602','屏南县','0','249','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1603','寿宁县','0','249','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1604','周宁县','0','249','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1605','柘荣县','0','249','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1606','福安市','0','249','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1607','福鼎市','0','249','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1608','东湖区','0','250','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1609','西湖区','0','250','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1610','青云谱区','0','250','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1611','湾里区','0','250','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1612','青山湖区','0','250','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1613','南昌县','0','250','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1614','新建县','0','250','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1615','安义县','0','250','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1616','进贤县','0','250','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1617','昌江区','0','251','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1618','珠山区','0','251','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1619','浮梁县','0','251','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1620','乐平市','0','251','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1621','安源区','0','252','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1622','湘东区','0','252','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1623','莲花县','0','252','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1624','上栗县','0','252','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1625','芦溪县','0','252','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1626','庐山区','0','253','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1627','浔阳区','0','253','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1628','九江县','0','253','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1629','武宁县','0','253','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1630','修水县','0','253','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1631','永修县','0','253','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1632','德安县','0','253','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1633','星子县','0','253','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1634','都昌县','0','253','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1635','湖口县','0','253','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1636','彭泽县','0','253','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1637','瑞昌市','0','253','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1638','渝水区','0','254','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1639','分宜县','0','254','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1640','月湖区','0','255','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1641','余江县','0','255','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1642','贵溪市','0','255','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1643','章贡区','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1644','赣县','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1645','信丰县','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1646','大余县','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1647','上犹县','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1648','崇义县','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1649','安远县','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1650','龙南县','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1651','定南县','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1652','全南县','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1653','宁都县','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1654','于都县','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1655','兴国县','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1656','会昌县','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1657','寻乌县','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1658','石城县','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1659','瑞金市','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1660','南康市','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1661','吉州区','0','257','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1662','青原区','0','257','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1663','吉安县','0','257','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1664','吉水县','0','257','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1665','峡江县','0','257','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1666','新干县','0','257','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1667','永丰县','0','257','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1668','泰和县','0','257','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1669','遂川县','0','257','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1670','万安县','0','257','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1671','安福县','0','257','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1672','永新县','0','257','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1673','井冈山市','0','257','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1674','袁州区','0','258','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1675','奉新县','0','258','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1676','万载县','0','258','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1677','上高县','0','258','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1678','宜丰县','0','258','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1679','靖安县','0','258','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1680','铜鼓县','0','258','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1681','丰城市','0','258','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1682','樟树市','0','258','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1683','高安市','0','258','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1684','临川区','0','259','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1685','南城县','0','259','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1686','黎川县','0','259','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1687','南丰县','0','259','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1688','崇仁县','0','259','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1689','乐安县','0','259','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1690','宜黄县','0','259','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1691','金溪县','0','259','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1692','资溪县','0','259','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1693','东乡县','0','259','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1694','广昌县','0','259','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1695','信州区','0','260','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1696','上饶县','0','260','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1697','广丰县','0','260','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1698','玉山县','0','260','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1699','铅山县','0','260','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1700','横峰县','0','260','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1701','弋阳县','0','260','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1702','余干县','0','260','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1703','鄱阳县','0','260','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1704','万年县','0','260','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1705','婺源县','0','260','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1706','德兴市','0','260','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1707','历下区','0','261','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1708','市中区','0','261','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1709','槐荫区','0','261','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1710','天桥区','0','261','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1711','历城区','0','261','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1712','长清区','0','261','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1713','平阴县','0','261','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1714','济阳县','0','261','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1715','商河县','0','261','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1716','章丘市','0','261','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1717','市南区','0','262','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1718','市北区','0','262','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1719','四方区','0','262','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1720','黄岛区','0','262','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1721','崂山区','0','262','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1722','李沧区','0','262','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1723','城阳区','0','262','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1724','胶州市','0','262','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1725','即墨市','0','262','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1726','平度市','0','262','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1727','胶南市','0','262','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1728','莱西市','0','262','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1729','淄川区','0','263','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1730','张店区','0','263','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1731','博山区','0','263','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1732','临淄区','0','263','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1733','周村区','0','263','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1734','桓台县','0','263','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1735','高青县','0','263','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1736','沂源县','0','263','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1737','市中区','0','264','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1738','薛城区','0','264','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1739','峄城区','0','264','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1740','台儿庄区','0','264','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1741','山亭区','0','264','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1742','滕州市','0','264','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1743','东营区','0','265','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1744','河口区','0','265','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1745','垦利县','0','265','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1746','利津县','0','265','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1747','广饶县','0','265','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1748','芝罘区','0','266','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1749','福山区','0','266','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1750','牟平区','0','266','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1751','莱山区','0','266','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1752','长岛县','0','266','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1753','龙口市','0','266','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1754','莱阳市','0','266','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1755','莱州市','0','266','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1756','蓬莱市','0','266','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1757','招远市','0','266','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1758','栖霞市','0','266','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1759','海阳市','0','266','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1760','潍城区','0','267','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1761','寒亭区','0','267','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1762','坊子区','0','267','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1763','奎文区','0','267','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1764','临朐县','0','267','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1765','昌乐县','0','267','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1766','青州市','0','267','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1767','诸城市','0','267','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1768','寿光市','0','267','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1769','安丘市','0','267','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1770','高密市','0','267','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1771','昌邑市','0','267','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1772','市中区','0','268','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1773','任城区','0','268','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1774','微山县','0','268','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1775','鱼台县','0','268','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1776','金乡县','0','268','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1777','嘉祥县','0','268','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1778','汶上县','0','268','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1779','泗水县','0','268','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1780','梁山县','0','268','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1781','曲阜市','0','268','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1782','兖州市','0','268','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1783','邹城市','0','268','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1784','泰山区','0','269','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1785','岱岳区','0','269','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1786','宁阳县','0','269','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1787','东平县','0','269','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1788','新泰市','0','269','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1789','肥城市','0','269','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1790','环翠区','0','270','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1791','文登市','0','270','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1792','荣成市','0','270','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1793','乳山市','0','270','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1794','东港区','0','271','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1795','岚山区','0','271','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1796','五莲县','0','271','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1797','莒县','0','271','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1798','莱城区','0','272','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1799','钢城区','0','272','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1800','兰山区','0','273','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1801','罗庄区','0','273','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1802','河东区','0','273','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1803','沂南县','0','273','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1804','郯城县','0','273','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1805','沂水县','0','273','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1806','苍山县','0','273','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1807','费县','0','273','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1808','平邑县','0','273','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1809','莒南县','0','273','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1810','蒙阴县','0','273','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1811','临沭县','0','273','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1812','德城区','0','274','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1813','陵县','0','274','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1814','宁津县','0','274','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1815','庆云县','0','274','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1816','临邑县','0','274','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1817','齐河县','0','274','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1818','平原县','0','274','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1819','夏津县','0','274','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1820','武城县','0','274','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1821','乐陵市','0','274','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1822','禹城市','0','274','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1823','东昌府区','0','275','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1824','阳谷县','0','275','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1825','莘县','0','275','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1826','茌平县','0','275','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1827','东阿县','0','275','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1828','冠县','0','275','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1829','高唐县','0','275','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1830','临清市','0','275','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1831','滨城区','0','276','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1832','惠民县','0','276','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1833','阳信县','0','276','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1834','无棣县','0','276','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1835','沾化县','0','276','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1836','博兴县','0','276','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1837','邹平县','0','276','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1838','牡丹区','0','277','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1839','曹县','0','277','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1840','单县','0','277','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1841','成武县','0','277','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1842','巨野县','0','277','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1843','郓城县','0','277','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1844','鄄城县','0','277','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1845','定陶县','0','277','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1846','东明县','0','277','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1847','中原区','0','278','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1848','二七区','0','278','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1849','管城回族区','0','278','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1850','金水区','0','278','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1851','上街区','0','278','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1852','惠济区','0','278','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1853','中牟县','0','278','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1854','巩义市','0','278','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1855','荥阳市','0','278','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1856','新密市','0','278','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1857','新郑市','0','278','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1858','登封市','0','278','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1859','龙亭区','0','279','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1860','顺河回族区','0','279','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1861','鼓楼区','0','279','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1862','禹王台区','0','279','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1863','金明区','0','279','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1864','杞县','0','279','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1865','通许县','0','279','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1866','尉氏县','0','279','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1867','开封县','0','279','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1868','兰考县','0','279','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1869','老城区','0','280','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1870','西工区','0','280','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1871','廛河回族区','0','280','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1872','涧西区','0','280','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1873','吉利区','0','280','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1874','洛龙区','0','280','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1875','孟津县','0','280','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1876','新安县','0','280','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1877','栾川县','0','280','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1878','嵩县','0','280','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1879','汝阳县','0','280','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1880','宜阳县','0','280','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1881','洛宁县','0','280','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1882','伊川县','0','280','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1883','偃师市','0','280','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1884','新华区','0','281','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1885','卫东区','0','281','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1886','石龙区','0','281','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1887','湛河区','0','281','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1888','宝丰县','0','281','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1889','叶县','0','281','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1890','鲁山县','0','281','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1891','郏县','0','281','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1892','舞钢市','0','281','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1893','汝州市','0','281','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1894','文峰区','0','282','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1895','北关区','0','282','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1896','殷都区','0','282','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1897','龙安区','0','282','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1898','安阳县','0','282','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1899','汤阴县','0','282','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1900','滑县','0','282','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1901','内黄县','0','282','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1902','林州市','0','282','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1903','鹤山区','0','283','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1904','山城区','0','283','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1905','淇滨区','0','283','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1906','浚县','0','283','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1907','淇县','0','283','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1908','红旗区','0','284','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1909','卫滨区','0','284','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1910','凤泉区','0','284','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1911','牧野区','0','284','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1912','新乡县','0','284','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1913','获嘉县','0','284','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1914','原阳县','0','284','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1915','延津县','0','284','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1916','封丘县','0','284','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1917','长垣县','0','284','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1918','卫辉市','0','284','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1919','辉县市','0','284','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1920','解放区','0','285','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1921','中站区','0','285','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1922','马村区','0','285','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1923','山阳区','0','285','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1924','修武县','0','285','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1925','博爱县','0','285','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1926','武陟县','0','285','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1927','温县','0','285','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1928','济源市','0','285','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1929','沁阳市','0','285','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1930','孟州市','0','285','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1931','华龙区','0','286','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1932','清丰县','0','286','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1933','南乐县','0','286','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1934','范县','0','286','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1935','台前县','0','286','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1936','濮阳县','0','286','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1937','魏都区','0','287','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1938','许昌县','0','287','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1939','鄢陵县','0','287','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1940','襄城县','0','287','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1941','禹州市','0','287','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1942','长葛市','0','287','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1943','源汇区','0','288','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1944','郾城区','0','288','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1945','召陵区','0','288','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1946','舞阳县','0','288','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1947','临颍县','0','288','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1948','湖滨区','0','289','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1949','渑池县','0','289','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1950','陕县','0','289','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1951','卢氏县','0','289','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1952','义马市','0','289','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1953','灵宝市','0','289','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1954','宛城区','0','290','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1955','卧龙区','0','290','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1956','南召县','0','290','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1957','方城县','0','290','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1958','西峡县','0','290','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1959','镇平县','0','290','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1960','内乡县','0','290','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1961','淅川县','0','290','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1962','社旗县','0','290','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1963','唐河县','0','290','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1964','新野县','0','290','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1965','桐柏县','0','290','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1966','邓州市','0','290','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1967','梁园区','0','291','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1968','睢阳区','0','291','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1969','民权县','0','291','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1970','睢县','0','291','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1971','宁陵县','0','291','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1972','柘城县','0','291','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1973','虞城县','0','291','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1974','夏邑县','0','291','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1975','永城市','0','291','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1976','浉河区','0','292','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1977','平桥区','0','292','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1978','罗山县','0','292','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1979','光山县','0','292','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1980','新县','0','292','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1981','商城县','0','292','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1982','固始县','0','292','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1983','潢川县','0','292','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1984','淮滨县','0','292','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1985','息县','0','292','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1986','川汇区','0','293','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1987','扶沟县','0','293','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1988','西华县','0','293','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1989','商水县','0','293','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1990','沈丘县','0','293','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1991','郸城县','0','293','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1992','淮阳县','0','293','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1993','太康县','0','293','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1994','鹿邑县','0','293','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1995','项城市','0','293','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1996','驿城区','0','294','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1997','西平县','0','294','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1998','上蔡县','0','294','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1999','平舆县','0','294','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2000','正阳县','0','294','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2001','确山县','0','294','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2002','泌阳县','0','294','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2003','汝南县','0','294','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2004','遂平县','0','294','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2005','新蔡县','0','294','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2006','江岸区','0','295','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2007','江汉区','0','295','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2008','硚口区','0','295','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2009','汉阳区','0','295','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2010','武昌区','0','295','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2011','青山区','0','295','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2012','洪山区','0','295','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2013','东西湖区','0','295','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2014','汉南区','0','295','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2015','蔡甸区','0','295','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2016','江夏区','0','295','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2017','黄陂区','0','295','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2018','新洲区','0','295','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2019','黄石港区','0','296','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2020','西塞山区','0','296','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2021','下陆区','0','296','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2022','铁山区','0','296','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2023','阳新县','0','296','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2024','大冶市','0','296','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2025','茅箭区','0','297','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2026','张湾区','0','297','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2027','郧县','0','297','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2028','郧西县','0','297','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2029','竹山县','0','297','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2030','竹溪县','0','297','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2031','房县','0','297','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2032','丹江口市','0','297','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2033','西陵区','0','298','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2034','伍家岗区','0','298','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2035','点军区','0','298','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2036','猇亭区','0','298','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2037','夷陵区','0','298','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2038','远安县','0','298','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2039','兴山县','0','298','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2040','秭归县','0','298','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2041','长阳土家族自治县','0','298','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2042','五峰土家族自治县','0','298','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2043','宜都市','0','298','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2044','当阳市','0','298','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2045','枝江市','0','298','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2046','襄城区','0','299','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2047','樊城区','0','299','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2048','襄阳区','0','299','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2049','南漳县','0','299','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2050','谷城县','0','299','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2051','保康县','0','299','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2052','老河口市','0','299','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2053','枣阳市','0','299','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2054','宜城市','0','299','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2055','梁子湖区','0','300','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2056','华容区','0','300','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2057','鄂城区','0','300','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2058','东宝区','0','301','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2059','掇刀区','0','301','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2060','京山县','0','301','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2061','沙洋县','0','301','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2062','钟祥市','0','301','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2063','孝南区','0','302','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2064','孝昌县','0','302','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2065','大悟县','0','302','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2066','云梦县','0','302','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2067','应城市','0','302','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2068','安陆市','0','302','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2069','汉川市','0','302','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2070','沙市区','0','303','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2071','荆州区','0','303','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2072','公安县','0','303','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2073','监利县','0','303','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2074','江陵县','0','303','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2075','石首市','0','303','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2076','洪湖市','0','303','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2077','松滋市','0','303','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2078','黄州区','0','304','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2079','团风县','0','304','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2080','红安县','0','304','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2081','罗田县','0','304','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2082','英山县','0','304','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2083','浠水县','0','304','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2084','蕲春县','0','304','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2085','黄梅县','0','304','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2086','麻城市','0','304','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2087','武穴市','0','304','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2088','咸安区','0','305','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2089','嘉鱼县','0','305','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2090','通城县','0','305','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2091','崇阳县','0','305','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2092','通山县','0','305','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2093','赤壁市','0','305','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2094','曾都区','0','306','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2095','广水市','0','306','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2096','恩施市','0','307','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2097','利川市','0','307','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2098','建始县','0','307','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2099','巴东县','0','307','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2100','宣恩县','0','307','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2101','咸丰县','0','307','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2102','来凤县','0','307','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2103','鹤峰县','0','307','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2104','芙蓉区','0','312','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2105','天心区','0','312','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2106','岳麓区','0','312','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2107','开福区','0','312','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2108','雨花区','0','312','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2109','长沙县','0','312','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2110','望城县','0','312','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2111','宁乡县','0','312','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2112','浏阳市','0','312','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2113','荷塘区','0','313','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2114','芦淞区','0','313','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2115','石峰区','0','313','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2116','天元区','0','313','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2117','株洲县','0','313','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2118','攸县','0','313','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2119','茶陵县','0','313','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2120','炎陵县','0','313','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2121','醴陵市','0','313','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2122','雨湖区','0','314','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2123','岳塘区','0','314','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2124','湘潭县','0','314','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2125','湘乡市','0','314','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2126','韶山市','0','314','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2127','珠晖区','0','315','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2128','雁峰区','0','315','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2129','石鼓区','0','315','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2130','蒸湘区','0','315','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2131','南岳区','0','315','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2132','衡阳县','0','315','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2133','衡南县','0','315','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2134','衡山县','0','315','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2135','衡东县','0','315','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2136','祁东县','0','315','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2137','耒阳市','0','315','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2138','常宁市','0','315','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2139','双清区','0','316','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2140','大祥区','0','316','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2141','北塔区','0','316','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2142','邵东县','0','316','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2143','新邵县','0','316','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2144','邵阳县','0','316','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2145','隆回县','0','316','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2146','洞口县','0','316','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2147','绥宁县','0','316','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2148','新宁县','0','316','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2149','城步苗族自治县','0','316','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2150','武冈市','0','316','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2151','岳阳楼区','0','317','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2152','云溪区','0','317','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2153','君山区','0','317','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2154','岳阳县','0','317','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2155','华容县','0','317','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2156','湘阴县','0','317','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2157','平江县','0','317','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2158','汨罗市','0','317','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2159','临湘市','0','317','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2160','武陵区','0','318','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2161','鼎城区','0','318','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2162','安乡县','0','318','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2163','汉寿县','0','318','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2164','澧县','0','318','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2165','临澧县','0','318','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2166','桃源县','0','318','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2167','石门县','0','318','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2168','津市市','0','318','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2169','永定区','0','319','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2170','武陵源区','0','319','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2171','慈利县','0','319','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2172','桑植县','0','319','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2173','资阳区','0','320','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2174','赫山区','0','320','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2175','南县','0','320','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2176','桃江县','0','320','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2177','安化县','0','320','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2178','沅江市','0','320','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2179','北湖区','0','321','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2180','苏仙区','0','321','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2181','桂阳县','0','321','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2182','宜章县','0','321','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2183','永兴县','0','321','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2184','嘉禾县','0','321','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2185','临武县','0','321','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2186','汝城县','0','321','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2187','桂东县','0','321','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2188','安仁县','0','321','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2189','资兴市','0','321','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2190','零陵区','0','322','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2191','冷水滩区','0','322','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2192','祁阳县','0','322','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2193','东安县','0','322','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2194','双牌县','0','322','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2195','道县','0','322','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2196','江永县','0','322','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2197','宁远县','0','322','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2198','蓝山县','0','322','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2199','新田县','0','322','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2200','江华瑶族自治县','0','322','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2201','鹤城区','0','323','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2202','中方县','0','323','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2203','沅陵县','0','323','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2204','辰溪县','0','323','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2205','溆浦县','0','323','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2206','会同县','0','323','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2207','麻阳苗族自治县','0','323','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2208','新晃侗族自治县','0','323','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2209','芷江侗族自治县','0','323','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2210','靖州苗族侗族自治县','0','323','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2211','通道侗族自治县','0','323','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2212','洪江市','0','323','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2213','娄星区','0','324','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2214','双峰县','0','324','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2215','新化县','0','324','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2216','冷水江市','0','324','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2217','涟源市','0','324','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2218','吉首市','0','325','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2219','泸溪县','0','325','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2220','凤凰县','0','325','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2221','花垣县','0','325','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2222','保靖县','0','325','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2223','古丈县','0','325','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2224','永顺县','0','325','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2225','龙山县','0','325','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2226','荔湾区','0','326','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2227','越秀区','0','326','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2228','海珠区','0','326','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2229','天河区','0','326','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2230','白云区','0','326','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2231','黄埔区','0','326','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2232','番禺区','0','326','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2233','花都区','0','326','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2234','南沙区','0','326','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2235','萝岗区','0','326','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2236','增城市','0','326','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2237','从化市','0','326','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2238','武江区','0','327','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2239','浈江区','0','327','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2240','曲江区','0','327','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2241','始兴县','0','327','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2242','仁化县','0','327','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2243','翁源县','0','327','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2244','乳源瑶族自治县','0','327','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2245','新丰县','0','327','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2246','乐昌市','0','327','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2247','南雄市','0','327','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2248','罗湖区','0','328','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2249','福田区','0','328','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2250','南山区','0','328','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2251','宝安区','0','328','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2252','龙岗区','0','328','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2253','盐田区','0','328','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2254','香洲区','0','329','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2255','斗门区','0','329','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2256','金湾区','0','329','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2257','龙湖区','0','330','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2258','金平区','0','330','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2259','濠江区','0','330','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2260','潮阳区','0','330','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2261','潮南区','0','330','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2262','澄海区','0','330','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2263','南澳县','0','330','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2264','禅城区','0','331','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2265','南海区','0','331','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2266','顺德区','0','331','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2267','三水区','0','331','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2268','高明区','0','331','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2269','蓬江区','0','332','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2270','江海区','0','332','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2271','新会区','0','332','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2272','台山市','0','332','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2273','开平市','0','332','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2274','鹤山市','0','332','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2275','恩平市','0','332','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2276','赤坎区','0','333','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2277','霞山区','0','333','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2278','坡头区','0','333','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2279','麻章区','0','333','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2280','遂溪县','0','333','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2281','徐闻县','0','333','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2282','廉江市','0','333','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2283','雷州市','0','333','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2284','吴川市','0','333','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2285','茂南区','0','334','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2286','茂港区','0','334','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2287','电白县','0','334','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2288','高州市','0','334','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2289','化州市','0','334','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2290','信宜市','0','334','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2291','端州区','0','335','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2292','鼎湖区','0','335','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2293','广宁县','0','335','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2294','怀集县','0','335','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2295','封开县','0','335','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2296','德庆县','0','335','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2297','高要市','0','335','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2298','四会市','0','335','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2299','惠城区','0','336','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2300','惠阳区','0','336','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2301','博罗县','0','336','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2302','惠东县','0','336','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2303','龙门县','0','336','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2304','梅江区','0','337','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2305','梅县','0','337','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2306','大埔县','0','337','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2307','丰顺县','0','337','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2308','五华县','0','337','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2309','平远县','0','337','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2310','蕉岭县','0','337','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2311','兴宁市','0','337','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2312','城区','0','338','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2313','海丰县','0','338','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2314','陆河县','0','338','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2315','陆丰市','0','338','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2316','源城区','0','339','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2317','紫金县','0','339','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2318','龙川县','0','339','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2319','连平县','0','339','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2320','和平县','0','339','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2321','东源县','0','339','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2322','江城区','0','340','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2323','阳西县','0','340','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2324','阳东县','0','340','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2325','阳春市','0','340','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2326','清城区','0','341','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2327','佛冈县','0','341','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2328','阳山县','0','341','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2329','连山壮族瑶族自治县','0','341','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2330','连南瑶族自治县','0','341','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2331','清新县','0','341','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2332','英德市','0','341','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2333','连州市','0','341','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2334','湘桥区','0','344','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2335','潮安县','0','344','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2336','饶平县','0','344','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2337','榕城区','0','345','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2338','揭东县','0','345','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2339','揭西县','0','345','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2340','惠来县','0','345','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2341','普宁市','0','345','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2342','云城区','0','346','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2343','新兴县','0','346','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2344','郁南县','0','346','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2345','云安县','0','346','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2346','罗定市','0','346','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2347','兴宁区','0','347','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2348','青秀区','0','347','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2349','江南区','0','347','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2350','西乡塘区','0','347','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2351','良庆区','0','347','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2352','邕宁区','0','347','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2353','武鸣县','0','347','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2354','隆安县','0','347','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2355','马山县','0','347','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2356','上林县','0','347','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2357','宾阳县','0','347','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2358','横县','0','347','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2359','城中区','0','348','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2360','鱼峰区','0','348','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2361','柳南区','0','348','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2362','柳北区','0','348','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2363','柳江县','0','348','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2364','柳城县','0','348','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2365','鹿寨县','0','348','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2366','融安县','0','348','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2367','融水苗族自治县','0','348','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2368','三江侗族自治县','0','348','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2369','秀峰区','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2370','叠彩区','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2371','象山区','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2372','七星区','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2373','雁山区','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2374','阳朔县','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2375','临桂县','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2376','灵川县','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2377','全州县','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2378','兴安县','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2379','永福县','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2380','灌阳县','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2381','龙胜各族自治县','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2382','资源县','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2383','平乐县','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2384','荔蒲县','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2385','恭城瑶族自治县','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2386','万秀区','0','350','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2387','蝶山区','0','350','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2388','长洲区','0','350','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2389','苍梧县','0','350','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2390','藤县','0','350','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2391','蒙山县','0','350','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2392','岑溪市','0','350','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2393','海城区','0','351','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2394','银海区','0','351','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2395','铁山港区','0','351','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2396','合浦县','0','351','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2397','港口区','0','352','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2398','防城区','0','352','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2399','上思县','0','352','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2400','东兴市','0','352','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2401','钦南区','0','353','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2402','钦北区','0','353','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2403','灵山县','0','353','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2404','浦北县','0','353','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2405','港北区','0','354','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2406','港南区','0','354','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2407','覃塘区','0','354','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2408','平南县','0','354','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2409','桂平市','0','354','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2410','玉州区','0','355','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2411','容县','0','355','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2412','陆川县','0','355','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2413','博白县','0','355','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2414','兴业县','0','355','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2415','北流市','0','355','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2416','右江区','0','356','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2417','田阳县','0','356','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2418','田东县','0','356','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2419','平果县','0','356','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2420','德保县','0','356','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2421','靖西县','0','356','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2422','那坡县','0','356','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2423','凌云县','0','356','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2424','乐业县','0','356','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2425','田林县','0','356','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2426','西林县','0','356','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2427','隆林各族自治县','0','356','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2428','八步区','0','357','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2429','昭平县','0','357','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2430','钟山县','0','357','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2431','富川瑶族自治县','0','357','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2432','金城江区','0','358','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2433','南丹县','0','358','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2434','天峨县','0','358','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2435','凤山县','0','358','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2436','东兰县','0','358','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2437','罗城仫佬族自治县','0','358','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2438','环江毛南族自治县','0','358','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2439','巴马瑶族自治县','0','358','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2440','都安瑶族自治县','0','358','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2441','大化瑶族自治县','0','358','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2442','宜州市','0','358','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2443','兴宾区','0','359','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2444','忻城县','0','359','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2445','象州县','0','359','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2446','武宣县','0','359','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2447','金秀瑶族自治县','0','359','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2448','合山市','0','359','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2449','江洲区','0','360','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2450','扶绥县','0','360','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2451','宁明县','0','360','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2452','龙州县','0','360','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2453','大新县','0','360','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2454','天等县','0','360','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2455','凭祥市','0','360','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2456','秀英区','0','361','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2457','龙华区','0','361','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2458','琼山区','0','361','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2459','美兰区','0','361','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2460','锦江区','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2461','青羊区','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2462','金牛区','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2463','武侯区','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2464','成华区','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2465','龙泉驿区','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2466','青白江区','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2467','新都区','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2468','温江区','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2469','金堂县','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2470','双流县','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2471','郫县','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2472','大邑县','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2473','蒲江县','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2474','新津县','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2475','都江堰市','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2476','彭州市','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2477','邛崃市','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2478','崇州市','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2479','自流井区','0','383','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2480','贡井区','0','383','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2481','大安区','0','383','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2482','沿滩区','0','383','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2483','荣县','0','383','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2484','富顺县','0','383','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2485','东区','0','384','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2486','西区','0','384','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2487','仁和区','0','384','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2488','米易县','0','384','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2489','盐边县','0','384','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2490','江阳区','0','385','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2491','纳溪区','0','385','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2492','龙马潭区','0','385','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2493','泸县','0','385','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2494','合江县','0','385','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2495','叙永县','0','385','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2496','古蔺县','0','385','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2497','旌阳区','0','386','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2498','中江县','0','386','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2499','罗江县','0','386','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2500','广汉市','0','386','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2501','什邡市','0','386','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2502','绵竹市','0','386','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2503','涪城区','0','387','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2504','游仙区','0','387','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2505','三台县','0','387','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2506','盐亭县','0','387','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2507','安县','0','387','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2508','梓潼县','0','387','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2509','北川羌族自治县','0','387','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2510','平武县','0','387','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2511','江油市','0','387','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2512','市中区','0','388','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2513','元坝区','0','388','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2514','朝天区','0','388','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2515','旺苍县','0','388','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2516','青川县','0','388','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2517','剑阁县','0','388','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2518','苍溪县','0','388','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2519','船山区','0','389','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2520','安居区','0','389','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2521','蓬溪县','0','389','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2522','射洪县','0','389','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2523','大英县','0','389','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2524','市中区','0','390','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2525','东兴区','0','390','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2526','威远县','0','390','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2527','资中县','0','390','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2528','隆昌县','0','390','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2529','市中区','0','391','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2530','沙湾区','0','391','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2531','五通桥区','0','391','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2532','金口河区','0','391','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2533','犍为县','0','391','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2534','井研县','0','391','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2535','夹江县','0','391','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2536','沐川县','0','391','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2537','峨边彝族自治县','0','391','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2538','马边彝族自治县','0','391','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2539','峨眉山市','0','391','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2540','顺庆区','0','392','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2541','高坪区','0','392','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2542','嘉陵区','0','392','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2543','南部县','0','392','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2544','营山县','0','392','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2545','蓬安县','0','392','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2546','仪陇县','0','392','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2547','西充县','0','392','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2548','阆中市','0','392','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2549','东坡区','0','393','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2550','仁寿县','0','393','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2551','彭山县','0','393','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2552','洪雅县','0','393','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2553','丹棱县','0','393','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2554','青神县','0','393','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2555','翠屏区','0','394','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2556','宜宾县','0','394','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2557','南溪县','0','394','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2558','江安县','0','394','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2559','长宁县','0','394','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2560','高县','0','394','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2561','珙县','0','394','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2562','筠连县','0','394','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2563','兴文县','0','394','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2564','屏山县','0','394','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2565','广安区','0','395','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2566','岳池县','0','395','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2567','武胜县','0','395','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2568','邻水县','0','395','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2569','华蓥市','0','395','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2570','通川区','0','396','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2571','达县','0','396','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2572','宣汉县','0','396','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2573','开江县','0','396','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2574','大竹县','0','396','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2575','渠县','0','396','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2576','万源市','0','396','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2577','雨城区','0','397','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2578','名山县','0','397','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2579','荥经县','0','397','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2580','汉源县','0','397','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2581','石棉县','0','397','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2582','天全县','0','397','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2583','芦山县','0','397','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2584','宝兴县','0','397','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2585','巴州区','0','398','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2586','通江县','0','398','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2587','南江县','0','398','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2588','平昌县','0','398','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2589','雁江区','0','399','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2590','安岳县','0','399','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2591','乐至县','0','399','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2592','简阳市','0','399','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2593','汶川县','0','400','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2594','理县','0','400','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2595','茂县','0','400','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2596','松潘县','0','400','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2597','九寨沟县','0','400','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2598','金川县','0','400','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2599','小金县','0','400','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2600','黑水县','0','400','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2601','马尔康县','0','400','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2602','壤塘县','0','400','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2603','阿坝县','0','400','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2604','若尔盖县','0','400','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2605','红原县','0','400','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2606','康定县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2607','泸定县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2608','丹巴县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2609','九龙县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2610','雅江县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2611','道孚县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2612','炉霍县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2613','甘孜县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2614','新龙县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2615','德格县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2616','白玉县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2617','石渠县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2618','色达县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2619','理塘县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2620','巴塘县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2621','乡城县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2622','稻城县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2623','得荣县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2624','西昌市','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2625','木里藏族自治县','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2626','盐源县','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2627','德昌县','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2628','会理县','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2629','会东县','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2630','宁南县','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2631','普格县','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2632','布拖县','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2633','金阳县','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2634','昭觉县','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2635','喜德县','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2636','冕宁县','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2637','越西县','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2638','甘洛县','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2639','美姑县','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2640','雷波县','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2641','南明区','0','403','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2642','云岩区','0','403','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2643','花溪区','0','403','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2644','乌当区','0','403','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2645','白云区','0','403','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2646','小河区','0','403','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2647','开阳县','0','403','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2648','息烽县','0','403','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2649','修文县','0','403','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2650','清镇市','0','403','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2651','钟山区','0','404','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2652','六枝特区','0','404','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2653','水城县','0','404','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2654','盘县','0','404','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2655','红花岗区','0','405','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2656','汇川区','0','405','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2657','遵义县','0','405','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2658','桐梓县','0','405','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2659','绥阳县','0','405','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2660','正安县','0','405','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2661','道真仡佬族苗族自治县','0','405','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2662','务川仡佬族苗族自治县','0','405','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2663','凤冈县','0','405','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2664','湄潭县','0','405','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2665','余庆县','0','405','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2666','习水县','0','405','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2667','赤水市','0','405','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2668','仁怀市','0','405','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2669','西秀区','0','406','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2670','平坝县','0','406','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2671','普定县','0','406','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2672','镇宁布依族苗族自治县','0','406','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2673','关岭布依族苗族自治县','0','406','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2674','紫云苗族布依族自治县','0','406','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2675','铜仁市','0','407','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2676','江口县','0','407','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2677','玉屏侗族自治县','0','407','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2678','石阡县','0','407','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2679','思南县','0','407','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2680','印江土家族苗族自治县','0','407','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2681','德江县','0','407','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2682','沿河土家族自治县','0','407','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2683','松桃苗族自治县','0','407','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2684','万山特区','0','407','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2685','兴义市','0','408','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2686','兴仁县','0','408','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2687','普安县','0','408','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2688','晴隆县','0','408','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2689','贞丰县','0','408','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2690','望谟县','0','408','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2691','册亨县','0','408','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2692','安龙县','0','408','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2693','毕节市','0','409','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2694','大方县','0','409','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2695','黔西县','0','409','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2696','金沙县','0','409','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2697','织金县','0','409','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2698','纳雍县','0','409','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2699','威宁彝族回族苗族自治县','0','409','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2700','赫章县','0','409','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2701','凯里市','0','410','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2702','黄平县','0','410','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2703','施秉县','0','410','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2704','三穗县','0','410','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2705','镇远县','0','410','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2706','岑巩县','0','410','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2707','天柱县','0','410','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2708','锦屏县','0','410','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2709','剑河县','0','410','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2710','台江县','0','410','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2711','黎平县','0','410','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2712','榕江县','0','410','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2713','从江县','0','410','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2714','雷山县','0','410','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2715','麻江县','0','410','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2716','丹寨县','0','410','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2717','都匀市','0','411','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2718','福泉市','0','411','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2719','荔波县','0','411','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2720','贵定县','0','411','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2721','瓮安县','0','411','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2722','独山县','0','411','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2723','平塘县','0','411','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2724','罗甸县','0','411','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2725','长顺县','0','411','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2726','龙里县','0','411','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2727','惠水县','0','411','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2728','三都水族自治县','0','411','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2729','五华区','0','412','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2730','盘龙区','0','412','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2731','官渡区','0','412','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2732','西山区','0','412','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2733','东川区','0','412','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2734','呈贡县','0','412','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2735','晋宁县','0','412','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2736','富民县','0','412','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2737','宜良县','0','412','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2738','石林彝族自治县','0','412','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2739','嵩明县','0','412','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2740','禄劝彝族苗族自治县','0','412','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2741','寻甸回族彝族自治县','0','412','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2742','安宁市','0','412','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2743','麒麟区','0','413','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2744','马龙县','0','413','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2745','陆良县','0','413','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2746','师宗县','0','413','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2747','罗平县','0','413','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2748','富源县','0','413','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2749','会泽县','0','413','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2750','沾益县','0','413','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2751','宣威市','0','413','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2752','红塔区','0','414','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2753','江川县','0','414','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2754','澄江县','0','414','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2755','通海县','0','414','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2756','华宁县','0','414','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2757','易门县','0','414','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2758','峨山彝族自治县','0','414','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2759','新平彝族傣族自治县','0','414','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2760','元江哈尼族彝族傣族自治县','0','414','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2761','隆阳区','0','415','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2762','施甸县','0','415','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2763','腾冲县','0','415','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2764','龙陵县','0','415','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2765','昌宁县','0','415','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2766','昭阳区','0','416','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2767','鲁甸县','0','416','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2768','巧家县','0','416','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2769','盐津县','0','416','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2770','大关县','0','416','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2771','永善县','0','416','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2772','绥江县','0','416','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2773','镇雄县','0','416','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2774','彝良县','0','416','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2775','威信县','0','416','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2776','水富县','0','416','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2777','古城区','0','417','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2778','玉龙纳西族自治县','0','417','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2779','永胜县','0','417','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2780','华坪县','0','417','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2781','宁蒗彝族自治县','0','417','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2782','翠云区','0','418','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2783','普洱哈尼族彝族自治县','0','418','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2784','墨江哈尼族自治县','0','418','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2785','景东彝族自治县','0','418','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2786','景谷傣族彝族自治县','0','418','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2787','镇沅彝族哈尼族拉祜族自治县','0','418','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2788','江城哈尼族彝族自治县','0','418','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2789','孟连傣族拉祜族佤族自治县','0','418','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2790','澜沧拉祜族自治县','0','418','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2791','西盟佤族自治县','0','418','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2792','临翔区','0','419','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2793','凤庆县','0','419','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2794','云县','0','419','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2795','永德县','0','419','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2796','镇康县','0','419','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2797','双江拉祜族佤族布朗族傣族自治县','0','419','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2798','耿马傣族佤族自治县','0','419','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2799','沧源佤族自治县','0','420','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2800','楚雄市','0','420','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2801','双柏县','0','420','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2802','牟定县','0','420','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2803','南华县','0','420','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2804','姚安县','0','420','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2805','大姚县','0','420','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2806','永仁县','0','420','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2807','元谋县','0','420','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2808','武定县','0','420','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2809','禄丰县','0','420','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2810','个旧市','0','421','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2811','开远市','0','421','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2812','蒙自县','0','421','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2813','屏边苗族自治县','0','421','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2814','建水县','0','421','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2815','石屏县','0','421','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2816','弥勒县','0','421','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2817','泸西县','0','421','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2818','元阳县','0','421','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2819','红河县','0','421','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2820','金平苗族瑶族傣族自治县','0','421','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2821','绿春县','0','421','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2822','河口瑶族自治县','0','421','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2823','文山县','0','422','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2824','砚山县','0','422','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2825','西畴县','0','422','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2826','麻栗坡县','0','422','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2827','马关县','0','422','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2828','丘北县','0','422','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2829','广南县','0','422','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2830','富宁县','0','422','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2831','景洪市','0','423','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2832','勐海县','0','423','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2833','勐腊县','0','423','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2834','大理市','0','424','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2835','漾濞彝族自治县','0','424','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2836','祥云县','0','424','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2837','宾川县','0','424','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2838','弥渡县','0','424','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2839','南涧彝族自治县','0','424','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2840','巍山彝族回族自治县','0','424','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2841','永平县','0','424','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2842','云龙县','0','424','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2843','洱源县','0','424','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2844','剑川县','0','424','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2845','鹤庆县','0','424','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2846','瑞丽市','0','425','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2847','潞西市','0','425','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2848','梁河县','0','425','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2849','盈江县','0','425','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2850','陇川县','0','425','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2851','泸水县','0','426','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2852','福贡县','0','426','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2853','贡山独龙族怒族自治县','0','426','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2854','兰坪白族普米族自治县','0','426','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2855','香格里拉县','0','427','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2856','德钦县','0','427','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2857','维西傈僳族自治县','0','427','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2858','城关区','0','428','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2859','林周县','0','428','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2860','当雄县','0','428','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2861','尼木县','0','428','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2862','曲水县','0','428','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2863','堆龙德庆县','0','428','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2864','达孜县','0','428','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2865','墨竹工卡县','0','428','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2866','昌都县','0','429','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2867','江达县','0','429','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2868','贡觉县','0','429','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2869','类乌齐县','0','429','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2870','丁青县','0','429','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2871','察雅县','0','429','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2872','八宿县','0','429','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2873','左贡县','0','429','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2874','芒康县','0','429','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2875','洛隆县','0','429','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2876','边坝县','0','429','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2877','乃东县','0','430','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2878','扎囊县','0','430','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2879','贡嘎县','0','430','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2880','桑日县','0','430','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2881','琼结县','0','430','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2882','曲松县','0','430','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2883','措美县','0','430','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2884','洛扎县','0','430','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2885','加查县','0','430','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2886','隆子县','0','430','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2887','错那县','0','430','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2888','浪卡子县','0','430','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2889','日喀则市','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2890','南木林县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2891','江孜县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2892','定日县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2893','萨迦县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2894','拉孜县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2895','昂仁县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2896','谢通门县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2897','白朗县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2898','仁布县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2899','康马县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2900','定结县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2901','仲巴县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2902','亚东县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2903','吉隆县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2904','聂拉木县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2905','萨嘎县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2906','岗巴县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2907','那曲县','0','432','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2908','嘉黎县','0','432','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2909','比如县','0','432','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2910','聂荣县','0','432','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2911','安多县','0','432','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2912','申扎县','0','432','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2913','索县','0','432','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2914','班戈县','0','432','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2915','巴青县','0','432','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2916','尼玛县','0','432','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2917','普兰县','0','433','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2918','札达县','0','433','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2919','噶尔县','0','433','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2920','日土县','0','433','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2921','革吉县','0','433','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2922','改则县','0','433','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2923','措勤县','0','433','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2924','林芝县','0','434','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2925','工布江达县','0','434','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2926','米林县','0','434','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2927','墨脱县','0','434','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2928','波密县','0','434','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2929','察隅县','0','434','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2930','朗县','0','434','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2931','新城区','0','435','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2932','碑林区','0','435','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2933','莲湖区','0','435','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2934','灞桥区','0','435','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2935','未央区','0','435','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2936','雁塔区','0','435','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2937','阎良区','0','435','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2938','临潼区','0','435','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2939','长安区','0','435','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2940','蓝田县','0','435','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2941','周至县','0','435','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2942','户县','0','435','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2943','高陵县','0','435','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2944','王益区','0','436','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2945','印台区','0','436','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2946','耀州区','0','436','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2947','宜君县','0','436','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2948','渭滨区','0','437','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2949','金台区','0','437','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2950','陈仓区','0','437','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2951','凤翔县','0','437','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2952','岐山县','0','437','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2953','扶风县','0','437','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2954','眉县','0','437','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2955','陇县','0','437','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2956','千阳县','0','437','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2957','麟游县','0','437','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2958','凤县','0','437','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2959','太白县','0','437','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2960','秦都区','0','438','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2961','杨凌区','0','438','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2962','渭城区','0','438','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2963','三原县','0','438','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2964','泾阳县','0','438','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2965','乾县','0','438','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2966','礼泉县','0','438','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2967','永寿县','0','438','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2968','彬县','0','438','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2969','长武县','0','438','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2970','旬邑县','0','438','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2971','淳化县','0','438','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2972','武功县','0','438','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2973','兴平市','0','438','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2974','临渭区','0','439','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2975','华县','0','439','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2976','潼关县','0','439','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2977','大荔县','0','439','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2978','合阳县','0','439','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2979','澄城县','0','439','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2980','蒲城县','0','439','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2981','白水县','0','439','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2982','富平县','0','439','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2983','韩城市','0','439','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2984','华阴市','0','439','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2985','宝塔区','0','440','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2986','延长县','0','440','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2987','延川县','0','440','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2988','子长县','0','440','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2989','安塞县','0','440','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2990','志丹县','0','440','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2991','吴起县','0','440','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2992','甘泉县','0','440','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2993','富县','0','440','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2994','洛川县','0','440','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2995','宜川县','0','440','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2996','黄龙县','0','440','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2997','黄陵县','0','440','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2998','汉台区','0','441','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2999','南郑县','0','441','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3000','城固县','0','441','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3001','洋县','0','441','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3002','西乡县','0','441','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3003','勉县','0','441','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3004','宁强县','0','441','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3005','略阳县','0','441','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3006','镇巴县','0','441','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3007','留坝县','0','441','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3008','佛坪县','0','441','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3009','榆阳区','0','442','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3010','神木县','0','442','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3011','府谷县','0','442','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3012','横山县','0','442','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3013','靖边县','0','442','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3014','定边县','0','442','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3015','绥德县','0','442','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3016','米脂县','0','442','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3017','佳县','0','442','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3018','吴堡县','0','442','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3019','清涧县','0','442','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3020','子洲县','0','442','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3021','汉滨区','0','443','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3022','汉阴县','0','443','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3023','石泉县','0','443','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3024','宁陕县','0','443','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3025','紫阳县','0','443','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3026','岚皋县','0','443','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3027','平利县','0','443','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3028','镇坪县','0','443','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3029','旬阳县','0','443','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3030','白河县','0','443','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3031','商州区','0','444','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3032','洛南县','0','444','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3033','丹凤县','0','444','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3034','商南县','0','444','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3035','山阳县','0','444','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3036','镇安县','0','444','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3037','柞水县','0','444','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3038','城关区','0','445','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3039','七里河区','0','445','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3040','西固区','0','445','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3041','安宁区','0','445','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3042','红古区','0','445','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3043','永登县','0','445','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3044','皋兰县','0','445','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3045','榆中县','0','445','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3046','金川区','0','447','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3047','永昌县','0','447','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3048','白银区','0','448','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3049','平川区','0','448','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3050','靖远县','0','448','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3051','会宁县','0','448','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3052','景泰县','0','448','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3053','秦城区','0','449','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3054','北道区','0','449','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3055','清水县','0','449','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3056','秦安县','0','449','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3057','甘谷县','0','449','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3058','武山县','0','449','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3059','张家川回族自治县','0','449','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3060','凉州区','0','450','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3061','民勤县','0','450','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3062','古浪县','0','450','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3063','天祝藏族自治县','0','450','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3064','甘州区','0','451','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3065','肃南裕固族自治县','0','451','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3066','民乐县','0','451','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3067','临泽县','0','451','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3068','高台县','0','451','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3069','山丹县','0','451','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3070','崆峒区','0','452','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3071','泾川县','0','452','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3072','灵台县','0','452','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3073','崇信县','0','452','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3074','华亭县','0','452','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3075','庄浪县','0','452','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3076','静宁县','0','452','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3077','肃州区','0','453','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3078','金塔县','0','453','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3079','瓜州县','0','453','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3080','肃北蒙古族自治县','0','453','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3081','阿克塞哈萨克族自治县','0','453','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3082','玉门市','0','453','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3083','敦煌市','0','453','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3084','西峰区','0','454','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3085','庆城县','0','454','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3086','环县','0','454','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3087','华池县','0','454','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3088','合水县','0','454','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3089','正宁县','0','454','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3090','宁县','0','454','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3091','镇原县','0','454','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3092','安定区','0','455','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3093','通渭县','0','455','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3094','陇西县','0','455','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3095','渭源县','0','455','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3096','临洮县','0','455','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3097','漳县','0','455','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3098','岷县','0','455','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3099','武都区','0','456','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3100','成县','0','456','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3101','文县','0','456','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3102','宕昌县','0','456','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3103','康县','0','456','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3104','西和县','0','456','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3105','礼县','0','456','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3106','徽县','0','456','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3107','两当县','0','456','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3108','临夏市','0','457','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3109','临夏县','0','457','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3110','康乐县','0','457','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3111','永靖县','0','457','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3112','广河县','0','457','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3113','和政县','0','457','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3114','东乡族自治县','0','457','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3115','积石山保安族东乡族撒拉族自治县','0','457','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3116','合作市','0','458','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3117','临潭县','0','458','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3118','卓尼县','0','458','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3119','舟曲县','0','458','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3120','迭部县','0','458','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3121','玛曲县','0','458','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3122','碌曲县','0','458','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3123','夏河县','0','458','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3124','城东区','0','459','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3125','城中区','0','459','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3126','城西区','0','459','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3127','城北区','0','459','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3128','大通回族土族自治县','0','459','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3129','湟中县','0','459','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3130','湟源县','0','459','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3131','平安县','0','460','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3132','民和回族土族自治县','0','460','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3133','乐都县','0','460','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3134','互助土族自治县','0','460','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3135','化隆回族自治县','0','460','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3136','循化撒拉族自治县','0','460','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3137','门源回族自治县','0','461','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3138','祁连县','0','461','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3139','海晏县','0','461','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3140','刚察县','0','461','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3141','同仁县','0','462','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3142','尖扎县','0','462','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3143','泽库县','0','462','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3144','河南蒙古族自治县','0','462','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3145','共和县','0','463','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3146','同德县','0','463','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3147','贵德县','0','463','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3148','兴海县','0','463','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3149','贵南县','0','463','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3150','玛沁县','0','464','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3151','班玛县','0','464','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3152','甘德县','0','464','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3153','达日县','0','464','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3154','久治县','0','464','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3155','玛多县','0','464','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3156','玉树县','0','465','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3157','杂多县','0','465','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3158','称多县','0','465','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3159','治多县','0','465','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3160','囊谦县','0','465','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3161','曲麻莱县','0','465','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3162','格尔木市','0','466','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3163','德令哈市','0','466','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3164','乌兰县','0','466','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3165','都兰县','0','466','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3166','天峻县','0','466','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3167','兴庆区','0','467','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3168','西夏区','0','467','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3169','金凤区','0','467','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3170','永宁县','0','467','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3171','贺兰县','0','467','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3172','灵武市','0','467','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3173','大武口区','0','468','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3174','惠农区','0','468','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3175','平罗县','0','468','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3176','利通区','0','469','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3177','盐池县','0','469','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3178','同心县','0','469','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3179','青铜峡市','0','469','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3180','原州区','0','470','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3181','西吉县','0','470','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3182','隆德县','0','470','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3183','泾源县','0','470','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3184','彭阳县','0','470','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3185','沙坡头区','0','471','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3186','中宁县','0','471','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3187','海原县','0','471','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3188','天山区','0','472','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3189','沙依巴克区','0','472','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3190','新市区','0','472','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3191','水磨沟区','0','472','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3192','头屯河区','0','472','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3193','达坂城区','0','472','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3194','东山区','0','472','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3195','乌鲁木齐县','0','472','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3196','独山子区','0','473','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3197','克拉玛依区','0','473','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3198','白碱滩区','0','473','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3199','乌尔禾区','0','473','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3200','吐鲁番市','0','474','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3201','鄯善县','0','474','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3202','托克逊县','0','474','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3203','哈密市','0','475','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3204','巴里坤哈萨克自治县','0','475','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3205','伊吾县','0','475','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3206','昌吉市','0','476','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3207','阜康市','0','476','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3208','米泉市','0','476','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3209','呼图壁县','0','476','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3210','玛纳斯县','0','476','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3211','奇台县','0','476','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3212','吉木萨尔县','0','476','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3213','木垒哈萨克自治县','0','476','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3214','博乐市','0','477','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3215','精河县','0','477','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3216','温泉县','0','477','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3217','库尔勒市','0','478','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3218','轮台县','0','478','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3219','尉犁县','0','478','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3220','若羌县','0','478','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3221','且末县','0','478','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3222','焉耆回族自治县','0','478','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3223','和静县','0','478','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3224','和硕县','0','478','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3225','博湖县','0','478','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3226','阿克苏市','0','479','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3227','温宿县','0','479','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3228','库车县','0','479','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3229','沙雅县','0','479','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3230','新和县','0','479','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3231','拜城县','0','479','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3232','乌什县','0','479','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3233','阿瓦提县','0','479','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3234','柯坪县','0','479','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3235','阿图什市','0','480','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3236','阿克陶县','0','480','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3237','阿合奇县','0','480','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3238','乌恰县','0','480','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3239','喀什市','0','481','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3240','疏附县','0','481','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3241','疏勒县','0','481','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3242','英吉沙县','0','481','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3243','泽普县','0','481','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3244','莎车县','0','481','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3245','叶城县','0','481','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3246','麦盖提县','0','481','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3247','岳普湖县','0','481','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3248','伽师县','0','481','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3249','巴楚县','0','481','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3250','塔什库尔干塔吉克自治县','0','481','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3251','和田市','0','482','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3252','和田县','0','482','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3253','墨玉县','0','482','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3254','皮山县','0','482','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3255','洛浦县','0','482','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3256','策勒县','0','482','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3257','于田县','0','482','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3258','民丰县','0','482','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3259','伊宁市','0','483','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3260','奎屯市','0','483','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3261','伊宁县','0','483','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3262','察布查尔锡伯自治县','0','483','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3263','霍城县','0','483','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3264','巩留县','0','483','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3265','新源县','0','483','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3266','昭苏县','0','483','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3267','特克斯县','0','483','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3268','尼勒克县','0','483','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3269','塔城市','0','484','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3270','乌苏市','0','484','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3271','额敏县','0','484','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3272','沙湾县','0','484','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3273','托里县','0','484','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3274','裕民县','0','484','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3275','和布克赛尔蒙古自治县','0','484','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3276','阿勒泰市','0','485','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3277','布尔津县','0','485','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3278','富蕴县','0','485','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3279','福海县','0','485','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3280','哈巴河县','0','485','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3281','青河县','0','485','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3282','吉木乃县','0','485','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3358','钓鱼岛','','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3359','钓鱼岛','','3358','0','','1','0','','','0');

DROP TABLE IF EXISTS `v9_log`;
CREATE TABLE `v9_log` (
  `logid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field` varchar(15) NOT NULL,
  `value` int(10) unsigned NOT NULL DEFAULT '0',
  `module` varchar(15) NOT NULL,
  `file` varchar(20) NOT NULL,
  `action` varchar(20) NOT NULL,
  `querystring` varchar(255) NOT NULL,
  `data` mediumtext NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(20) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`logid`),
  KEY `module` (`module`,`file`,`action`),
  KEY `username` (`username`,`action`)
) ENGINE=InnoDB AUTO_INCREMENT=615 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO `v9_log` VALUES('1','','0','admin','','index','?m=admin&c=index&a=login','','0','','127.0.0.1','2018-04-14 16:40:30');
INSERT INTO `v9_log` VALUES('2','','0','admin','','index','?m=admin&c=index&a=login','','0','','127.0.0.1','2018-04-14 16:40:30');
INSERT INTO `v9_log` VALUES('3','','0','admin','','index','?m=admin&c=index&a=login','','0','','127.0.0.1','2018-04-14 16:40:37');
INSERT INTO `v9_log` VALUES('4','','0','admin','','index','?m=admin&c=index&a=login','','0','','115.172.250.21','2018-04-14 16:41:31');
INSERT INTO `v9_log` VALUES('5','','0','admin','','index','?m=admin&c=index&a=login','','0','','115.172.250.21','2018-04-14 16:41:46');
INSERT INTO `v9_log` VALUES('6','','0','admin','','index','?m=admin&c=index&a=login','','0','','123.125.143.155','2018-04-14 16:48:24');
INSERT INTO `v9_log` VALUES('7','','0','admin','','index','?m=admin&c=index&a=login','','0','','127.0.0.1','2018-04-14 17:50:23');
INSERT INTO `v9_log` VALUES('8','','0','admin','','index','?m=admin&c=index&a=login','','0','','127.0.0.1','2018-04-14 17:50:47');
INSERT INTO `v9_log` VALUES('9','','0','admin','','index','?m=admin&c=index&a=login','','0','phpcms','120.206.223.4','2018-04-14 17:55:12');
INSERT INTO `v9_log` VALUES('10','','0','admin','','index','?m=admin&c=index&a=login','','0','phpcms','120.206.223.4','2018-04-14 17:56:07');
INSERT INTO `v9_log` VALUES('11','','0','admin','','index','?m=admin&c=index&a=login','','0','phpcms','120.206.223.4','2018-04-14 17:56:10');
INSERT INTO `v9_log` VALUES('12','','0','admin','','index','?m=admin&c=index&a=login','','0','phpcms','120.206.223.4','2018-04-14 17:58:59');
INSERT INTO `v9_log` VALUES('13','','0','admin','','index','?m=admin&c=index&a=login','','0','','61.129.122.78','2018-04-14 18:14:08');
INSERT INTO `v9_log` VALUES('14','','0','admin','','index','?m=admin&c=index&a=login','','0','','61.129.122.78','2018-04-14 18:14:27');
INSERT INTO `v9_log` VALUES('15','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','115.172.250.21','2018-04-14 18:15:10');
INSERT INTO `v9_log` VALUES('16','','0','admin','','index','?m=admin&c=index&a=login','','0','','127.0.0.1','2018-04-14 18:18:18');
INSERT INTO `v9_log` VALUES('17','','0','admin','','index','?m=admin&c=index&a=login','','0','','127.0.0.1','2018-04-14 18:18:18');
INSERT INTO `v9_log` VALUES('18','','0','admin','','index','?m=admin&c=index&a=login','','0','','127.0.0.1','2018-04-14 18:18:38');
INSERT INTO `v9_log` VALUES('19','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 18:23:50');
INSERT INTO `v9_log` VALUES('20','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 18:23:53');
INSERT INTO `v9_log` VALUES('21','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 18:23:54');
INSERT INTO `v9_log` VALUES('22','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 18:23:54');
INSERT INTO `v9_log` VALUES('23','','0','admin','','database','?m=admin&c=database&a=export','','1','phpcms','61.129.122.78','2018-04-14 18:27:39');
INSERT INTO `v9_log` VALUES('24','','0','content','','sitemodel','?m=content&c=sitemodel&a=add','','1','phpcms','61.129.122.78','2018-04-14 18:28:58');
INSERT INTO `v9_log` VALUES('25','','0','content','','sitemodel','?m=content&c=sitemodel&a=add','','1','phpcms','61.129.122.78','2018-04-14 18:31:32');
INSERT INTO `v9_log` VALUES('26','','0','content','','sitemodel','?m=content&c=sitemodel&a=edit','','1','phpcms','61.129.122.78','2018-04-14 18:31:37');
INSERT INTO `v9_log` VALUES('27','','0','content','','sitemodel','?m=content&c=sitemodel&a=add','','1','phpcms','120.206.223.4','2018-04-14 18:31:57');
INSERT INTO `v9_log` VALUES('28','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','61.129.122.78','2018-04-14 18:32:26');
INSERT INTO `v9_log` VALUES('29','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','120.206.223.4','2018-04-14 18:33:22');
INSERT INTO `v9_log` VALUES('30','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','120.206.223.4','2018-04-14 18:34:34');
INSERT INTO `v9_log` VALUES('31','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','61.129.122.78','2018-04-14 18:34:41');
INSERT INTO `v9_log` VALUES('32','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','61.129.122.78','2018-04-14 18:34:45');
INSERT INTO `v9_log` VALUES('33','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','61.129.122.78','2018-04-14 18:35:51');
INSERT INTO `v9_log` VALUES('34','','0','admin','','site','?m=admin&c=site&a=edit','','1','phpcms','61.129.122.78','2018-04-14 18:37:00');
INSERT INTO `v9_log` VALUES('35','','0','admin','','site','?m=admin&c=site&a=edit','','1','phpcms','61.129.122.78','2018-04-14 18:37:08');
INSERT INTO `v9_log` VALUES('36','','0','content','','create_html','?m=content&c=create_html&a=category','','1','phpcms','61.129.122.78','2018-04-14 18:37:46');
INSERT INTO `v9_log` VALUES('37','','0','content','','create_html','?m=content&c=create_html&a=category','','1','phpcms','61.129.122.78','2018-04-14 18:37:48');
INSERT INTO `v9_log` VALUES('38','','0','content','','create_html','?m=content&c=create_html&a=category','','1','phpcms','61.129.122.78','2018-04-14 18:37:49');
INSERT INTO `v9_log` VALUES('39','','0','content','','create_html','?m=content&c=create_html&a=category','','1','phpcms','61.129.122.78','2018-04-14 18:37:49');
INSERT INTO `v9_log` VALUES('40','','0','content','','create_html','?m=content&c=create_html&a=category','','1','phpcms','61.129.122.78','2018-04-14 18:37:50');
INSERT INTO `v9_log` VALUES('41','','0','content','','create_html','?m=content&c=create_html&a=category','','1','phpcms','61.129.122.78','2018-04-14 18:37:50');
INSERT INTO `v9_log` VALUES('42','','0','content','','create_html','?m=content&c=create_html&a=category','','1','phpcms','61.129.122.78','2018-04-14 18:37:50');
INSERT INTO `v9_log` VALUES('43','','0','content','','create_html','?m=content&c=create_html&a=category','','1','phpcms','61.129.122.78','2018-04-14 18:37:51');
INSERT INTO `v9_log` VALUES('44','','0','admin','','site','?m=admin&c=site&a=edit','','1','phpcms','61.129.122.78','2018-04-14 18:37:57');
INSERT INTO `v9_log` VALUES('45','','0','admin','','site','?m=admin&c=site&a=edit','','1','phpcms','61.129.122.78','2018-04-14 18:38:43');
INSERT INTO `v9_log` VALUES('46','','0','content','','create_html','?m=content&c=create_html&a=category','','1','phpcms','61.129.122.78','2018-04-14 18:38:48');
INSERT INTO `v9_log` VALUES('47','','0','content','','create_html','?m=content&c=create_html&a=category','','1','phpcms','61.129.122.78','2018-04-14 18:38:49');
INSERT INTO `v9_log` VALUES('48','','0','content','','create_html','?m=content&c=create_html&a=category','','1','phpcms','61.129.122.78','2018-04-14 18:38:50');
INSERT INTO `v9_log` VALUES('49','','0','content','','create_html','?m=content&c=create_html&a=category','','1','phpcms','61.129.122.78','2018-04-14 18:38:51');
INSERT INTO `v9_log` VALUES('50','','0','content','','create_html','?m=content&c=create_html&a=category','','1','phpcms','61.129.122.78','2018-04-14 18:38:51');
INSERT INTO `v9_log` VALUES('51','','0','content','','create_html','?m=content&c=create_html&a=category','','1','phpcms','61.129.122.78','2018-04-14 18:38:51');
INSERT INTO `v9_log` VALUES('52','','0','content','','create_html','?m=content&c=create_html&a=category','','1','phpcms','61.129.122.78','2018-04-14 18:38:52');
INSERT INTO `v9_log` VALUES('53','','0','content','','create_html','?m=content&c=create_html&a=category','','1','phpcms','61.129.122.78','2018-04-14 18:38:52');
INSERT INTO `v9_log` VALUES('54','','0','content','','create_html','?m=content&c=create_html&a=category','','1','phpcms','61.129.122.78','2018-04-14 18:38:54');
INSERT INTO `v9_log` VALUES('55','','0','content','','create_html','?m=content&c=create_html&a=category','','1','phpcms','61.129.122.78','2018-04-14 18:38:55');
INSERT INTO `v9_log` VALUES('56','','0','content','','create_html','?m=content&c=create_html&a=category','','1','phpcms','61.129.122.78','2018-04-14 18:38:56');
INSERT INTO `v9_log` VALUES('57','','0','content','','create_html','?m=content&c=create_html&a=category','','1','phpcms','61.129.122.78','2018-04-14 18:38:56');
INSERT INTO `v9_log` VALUES('58','','0','content','','create_html','?m=content&c=create_html&a=category','','1','phpcms','61.129.122.78','2018-04-14 18:38:56');
INSERT INTO `v9_log` VALUES('59','','0','content','','create_html','?m=content&c=create_html&a=category','','1','phpcms','61.129.122.78','2018-04-14 18:38:57');
INSERT INTO `v9_log` VALUES('60','','0','content','','create_html','?m=content&c=create_html&a=category','','1','phpcms','61.129.122.78','2018-04-14 18:38:57');
INSERT INTO `v9_log` VALUES('61','','0','admin','','category','?m=admin&c=category&a=edit','','1','phpcms','61.129.122.78','2018-04-14 18:39:18');
INSERT INTO `v9_log` VALUES('62','','0','admin','','category','?m=admin&c=category&a=edit','','1','phpcms','61.129.122.78','2018-04-14 18:39:29');
INSERT INTO `v9_log` VALUES('63','','0','content','','create_html','?m=content&c=create_html&a=category','','1','phpcms','61.129.122.78','2018-04-14 18:39:41');
INSERT INTO `v9_log` VALUES('64','','0','content','','create_html','?m=content&c=create_html&a=category','','1','phpcms','61.129.122.78','2018-04-14 18:39:42');
INSERT INTO `v9_log` VALUES('65','','0','content','','create_html','?m=content&c=create_html&a=category','','1','phpcms','61.129.122.78','2018-04-14 18:39:44');
INSERT INTO `v9_log` VALUES('66','','0','content','','create_html','?m=content&c=create_html&a=category','','1','phpcms','61.129.122.78','2018-04-14 18:39:44');
INSERT INTO `v9_log` VALUES('67','','0','content','','create_html','?m=content&c=create_html&a=category','','1','phpcms','61.129.122.78','2018-04-14 18:39:44');
INSERT INTO `v9_log` VALUES('68','','0','content','','create_html','?m=content&c=create_html&a=category','','1','phpcms','61.129.122.78','2018-04-14 18:39:45');
INSERT INTO `v9_log` VALUES('69','','0','content','','create_html','?m=content&c=create_html&a=category','','1','phpcms','61.129.122.78','2018-04-14 18:39:45');
INSERT INTO `v9_log` VALUES('70','','0','content','','create_html','?m=content&c=create_html&a=category','','1','phpcms','61.129.122.78','2018-04-14 18:39:45');
INSERT INTO `v9_log` VALUES('71','','0','admin','','category','?m=admin&c=category&a=edit','','1','phpcms','61.129.122.78','2018-04-14 18:40:12');
INSERT INTO `v9_log` VALUES('72','','0','content','','create_html','?m=content&c=create_html&a=category','','1','phpcms','120.206.223.4','2018-04-14 18:41:25');
INSERT INTO `v9_log` VALUES('73','','0','admin','','category','?m=admin&c=category&a=edit','','1','phpcms','120.206.223.4','2018-04-14 18:41:58');
INSERT INTO `v9_log` VALUES('74','','0','admin','','category','?m=admin&c=category&a=edit','','1','phpcms','120.206.223.4','2018-04-14 18:42:18');
INSERT INTO `v9_log` VALUES('75','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','61.129.122.78','2018-04-14 18:44:08');
INSERT INTO `v9_log` VALUES('76','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','120.206.223.4','2018-04-14 18:44:15');
INSERT INTO `v9_log` VALUES('77','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','61.129.122.78','2018-04-14 18:44:19');
INSERT INTO `v9_log` VALUES('78','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','61.129.122.78','2018-04-14 18:45:45');
INSERT INTO `v9_log` VALUES('79','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','120.206.223.4','2018-04-14 18:46:41');
INSERT INTO `v9_log` VALUES('80','','0','admin','','category','?m=admin&c=category&a=edit','','1','phpcms','61.129.122.78','2018-04-14 18:46:41');
INSERT INTO `v9_log` VALUES('81','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 18:46:52');
INSERT INTO `v9_log` VALUES('82','','0','admin','','index','?m=admin&c=index&a=login','','0','phpcms','115.172.250.21','2018-04-14 18:51:06');
INSERT INTO `v9_log` VALUES('83','','0','admin','','index','?m=admin&c=index&a=login','','0','phpcms','115.172.250.21','2018-04-14 18:51:24');
INSERT INTO `v9_log` VALUES('84','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 18:51:24');
INSERT INTO `v9_log` VALUES('85','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 18:51:25');
INSERT INTO `v9_log` VALUES('86','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','61.129.122.78','2018-04-14 18:52:11');
INSERT INTO `v9_log` VALUES('87','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','61.129.122.78','2018-04-14 18:52:15');
INSERT INTO `v9_log` VALUES('88','','0','admin','','index','?m=admin&c=index&a=login','','0','','106.120.161.66','2018-04-14 18:52:34');
INSERT INTO `v9_log` VALUES('89','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','61.129.122.78','2018-04-14 18:52:46');
INSERT INTO `v9_log` VALUES('90','','0','admin','','index','?m=admin&c=index&a=login','','0','','101.199.108.50','2018-04-14 18:52:48');
INSERT INTO `v9_log` VALUES('91','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','61.129.122.78','2018-04-14 18:53:41');
INSERT INTO `v9_log` VALUES('92','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 18:54:06');
INSERT INTO `v9_log` VALUES('93','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','115.172.250.21','2018-04-14 18:55:49');
INSERT INTO `v9_log` VALUES('94','','0','content','','sitemodel','?m=content&c=sitemodel&a=add','','1','phpcms','61.129.122.78','2018-04-14 18:55:54');
INSERT INTO `v9_log` VALUES('95','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','115.172.250.21','2018-04-14 18:55:57');
INSERT INTO `v9_log` VALUES('96','','0','content','','sitemodel','?m=content&c=sitemodel&a=add','','1','phpcms','120.206.223.4','2018-04-14 18:56:03');
INSERT INTO `v9_log` VALUES('97','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','127.0.0.1','2018-04-14 18:59:59');
INSERT INTO `v9_log` VALUES('98','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','61.129.122.78','2018-04-14 19:03:07');
INSERT INTO `v9_log` VALUES('99','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','61.129.122.78','2018-04-14 19:03:45');
INSERT INTO `v9_log` VALUES('100','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','61.129.122.78','2018-04-14 19:04:50');
INSERT INTO `v9_log` VALUES('101','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','61.129.122.78','2018-04-14 19:05:20');
INSERT INTO `v9_log` VALUES('102','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','61.129.122.78','2018-04-14 19:05:26');
INSERT INTO `v9_log` VALUES('103','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','61.129.122.78','2018-04-14 19:05:31');
INSERT INTO `v9_log` VALUES('104','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','61.129.122.78','2018-04-14 19:05:50');
INSERT INTO `v9_log` VALUES('105','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 19:07:03');
INSERT INTO `v9_log` VALUES('106','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 19:07:37');
INSERT INTO `v9_log` VALUES('107','','0','admin','','category','?m=admin&c=category&a=edit','','1','phpcms','61.129.122.78','2018-04-14 19:07:54');
INSERT INTO `v9_log` VALUES('108','','0','admin','','category','?m=admin&c=category&a=edit','','1','phpcms','61.129.122.78','2018-04-14 19:08:08');
INSERT INTO `v9_log` VALUES('109','','0','admin','','category','?m=admin&c=category&a=edit','','1','phpcms','61.129.122.78','2018-04-14 19:08:21');
INSERT INTO `v9_log` VALUES('110','','0','admin','','category','?m=admin&c=category&a=edit','','1','phpcms','61.129.122.78','2018-04-14 19:08:49');
INSERT INTO `v9_log` VALUES('111','','0','admin','','category','?m=admin&c=category&a=edit','','1','phpcms','61.129.122.78','2018-04-14 19:09:21');
INSERT INTO `v9_log` VALUES('112','','0','admin','','category','?m=admin&c=category&a=edit','','1','phpcms','61.129.122.78','2018-04-14 19:09:25');
INSERT INTO `v9_log` VALUES('113','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 19:11:00');
INSERT INTO `v9_log` VALUES('114','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','61.129.122.78','2018-04-14 19:11:57');
INSERT INTO `v9_log` VALUES('115','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','61.129.122.78','2018-04-14 19:13:05');
INSERT INTO `v9_log` VALUES('116','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 19:13:20');
INSERT INTO `v9_log` VALUES('117','','0','content','','content','?m=content&c=content&a=edit','','1','phpcms','120.206.223.4','2018-04-14 19:13:27');
INSERT INTO `v9_log` VALUES('118','','0','admin','','category','?m=admin&c=category&a=edit','','1','phpcms','120.206.223.4','2018-04-14 19:13:57');
INSERT INTO `v9_log` VALUES('119','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 19:14:08');
INSERT INTO `v9_log` VALUES('120','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 19:14:10');
INSERT INTO `v9_log` VALUES('121','','0','content','','create_html','?m=content&c=create_html&a=category','','1','phpcms','120.206.223.4','2018-04-14 19:14:10');
INSERT INTO `v9_log` VALUES('122','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 19:14:15');
INSERT INTO `v9_log` VALUES('123','','0','admin','','category','?m=admin&c=category&a=edit','','1','phpcms','120.206.223.4','2018-04-14 19:15:54');
INSERT INTO `v9_log` VALUES('124','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','61.129.122.78','2018-04-14 19:16:04');
INSERT INTO `v9_log` VALUES('125','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','120.206.223.4','2018-04-14 19:16:13');
INSERT INTO `v9_log` VALUES('126','','0','admin','','category','?m=admin&c=category&a=edit','','1','phpcms','120.206.223.4','2018-04-14 19:17:03');
INSERT INTO `v9_log` VALUES('127','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','61.129.122.78','2018-04-14 19:17:09');
INSERT INTO `v9_log` VALUES('128','','0','admin','','category','?m=admin&c=category&a=delete','','1','phpcms','120.206.223.4','2018-04-14 19:17:35');
INSERT INTO `v9_log` VALUES('129','','0','admin','','category','?m=admin&c=category&a=edit','','1','phpcms','120.206.223.4','2018-04-14 19:17:44');
INSERT INTO `v9_log` VALUES('130','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','61.129.122.78','2018-04-14 19:17:49');
INSERT INTO `v9_log` VALUES('131','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','120.206.223.4','2018-04-14 19:17:57');
INSERT INTO `v9_log` VALUES('132','','0','admin','','category','?m=admin&c=category&a=edit','','1','phpcms','120.206.223.4','2018-04-14 19:18:08');
INSERT INTO `v9_log` VALUES('133','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','61.129.122.78','2018-04-14 19:18:27');
INSERT INTO `v9_log` VALUES('134','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','61.129.122.78','2018-04-14 19:18:37');
INSERT INTO `v9_log` VALUES('135','','0','admin','','category','?m=admin&c=category&a=edit','','1','phpcms','120.206.223.4','2018-04-14 19:18:58');
INSERT INTO `v9_log` VALUES('136','','0','admin','','category','?m=admin&c=category&a=edit','','1','phpcms','120.206.223.4','2018-04-14 19:19:08');
INSERT INTO `v9_log` VALUES('137','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','61.129.122.78','2018-04-14 19:19:37');
INSERT INTO `v9_log` VALUES('138','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','61.129.122.78','2018-04-14 19:19:40');
INSERT INTO `v9_log` VALUES('139','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','61.129.122.78','2018-04-14 19:21:29');
INSERT INTO `v9_log` VALUES('140','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','61.129.122.78','2018-04-14 19:21:52');
INSERT INTO `v9_log` VALUES('141','','0','admin','','index','?m=admin&c=index&a=login','','0','phpcms','127.0.0.1','2018-04-14 19:34:52');
INSERT INTO `v9_log` VALUES('142','','0','admin','','index','?m=admin&c=index&a=login','','0','phpcms','127.0.0.1','2018-04-14 19:35:00');
INSERT INTO `v9_log` VALUES('143','','0','admin','','index','?m=admin&c=index&a=login','','0','','61.129.122.78','2018-04-14 19:34:55');
INSERT INTO `v9_log` VALUES('144','','0','admin','','index','?m=admin&c=index&a=login','','0','','61.129.122.78','2018-04-14 19:35:15');
INSERT INTO `v9_log` VALUES('145','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','120.206.223.4','2018-04-14 19:40:41');
INSERT INTO `v9_log` VALUES('146','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','120.206.223.4','2018-04-14 19:40:45');
INSERT INTO `v9_log` VALUES('147','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','120.206.223.4','2018-04-14 19:40:48');
INSERT INTO `v9_log` VALUES('148','','0','admin','','category','?m=admin&c=category&a=edit','','1','phpcms','120.206.223.4','2018-04-14 19:41:08');
INSERT INTO `v9_log` VALUES('149','','0','admin','','category','?m=admin&c=category&a=edit','','1','phpcms','120.206.223.4','2018-04-14 19:41:36');
INSERT INTO `v9_log` VALUES('150','','0','admin','','category','?m=admin&c=category&a=edit','','1','phpcms','120.206.223.4','2018-04-14 19:41:43');
INSERT INTO `v9_log` VALUES('151','','0','admin','','category','?m=admin&c=category&a=edit','','1','phpcms','120.206.223.4','2018-04-14 19:41:47');
INSERT INTO `v9_log` VALUES('152','','0','admin','','category','?m=admin&c=category&a=edit','','1','phpcms','120.206.223.4','2018-04-14 19:43:20');
INSERT INTO `v9_log` VALUES('153','','0','admin','','category','?m=admin&c=category&a=edit','','1','phpcms','120.206.223.4','2018-04-14 19:43:41');
INSERT INTO `v9_log` VALUES('154','','0','admin','','category','?m=admin&c=category&a=edit','','1','phpcms','120.206.223.4','2018-04-14 19:43:55');
INSERT INTO `v9_log` VALUES('155','','0','admin','','category','?m=admin&c=category&a=edit','','1','phpcms','120.206.223.4','2018-04-14 19:44:03');
INSERT INTO `v9_log` VALUES('156','','0','admin','','index','?m=admin&c=index&a=login','','0','','101.199.108.54','2018-04-14 19:44:20');
INSERT INTO `v9_log` VALUES('157','','0','admin','','category','?m=admin&c=category&a=edit','','1','phpcms','120.206.223.4','2018-04-14 19:46:52');
INSERT INTO `v9_log` VALUES('158','','0','admin','','category','?m=admin&c=category&a=edit','','1','phpcms','120.206.223.4','2018-04-14 19:46:57');
INSERT INTO `v9_log` VALUES('159','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 19:49:38');
INSERT INTO `v9_log` VALUES('160','','0','admin','','category','?m=admin&c=category&a=edit','','1','phpcms','120.206.223.4','2018-04-14 19:49:44');
INSERT INTO `v9_log` VALUES('161','','0','admin','','category','?m=admin&c=category&a=edit','','1','phpcms','120.206.223.4','2018-04-14 19:49:50');
INSERT INTO `v9_log` VALUES('162','','0','admin','','category','?m=admin&c=category&a=edit','','1','phpcms','120.206.223.4','2018-04-14 19:50:25');
INSERT INTO `v9_log` VALUES('163','','0','admin','','category','?m=admin&c=category&a=edit','','1','phpcms','120.206.223.4','2018-04-14 19:50:30');
INSERT INTO `v9_log` VALUES('164','','0','content','','sitemodel','?m=content&c=sitemodel&a=add','','1','phpcms','120.206.223.4','2018-04-14 19:50:51');
INSERT INTO `v9_log` VALUES('165','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 19:51:19');
INSERT INTO `v9_log` VALUES('166','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 19:51:21');
INSERT INTO `v9_log` VALUES('167','','0','content','','sitemodel','?m=content&c=sitemodel&a=add','','1','phpcms','120.206.223.4','2018-04-14 19:51:36');
INSERT INTO `v9_log` VALUES('168','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=disabled','','1','phpcms','120.206.223.4','2018-04-14 19:51:47');
INSERT INTO `v9_log` VALUES('169','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 19:51:54');
INSERT INTO `v9_log` VALUES('170','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=disabled','','1','phpcms','120.206.223.4','2018-04-14 19:52:04');
INSERT INTO `v9_log` VALUES('171','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=disabled','','1','phpcms','120.206.223.4','2018-04-14 19:52:09');
INSERT INTO `v9_log` VALUES('172','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 19:52:11');
INSERT INTO `v9_log` VALUES('173','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=disabled','','1','phpcms','120.206.223.4','2018-04-14 19:52:13');
INSERT INTO `v9_log` VALUES('174','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=disabled','','1','phpcms','120.206.223.4','2018-04-14 19:52:19');
INSERT INTO `v9_log` VALUES('175','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 19:52:21');
INSERT INTO `v9_log` VALUES('176','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=disabled','','1','phpcms','120.206.223.4','2018-04-14 19:52:24');
INSERT INTO `v9_log` VALUES('177','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=disabled','','1','phpcms','120.206.223.4','2018-04-14 19:52:29');
INSERT INTO `v9_log` VALUES('178','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 19:52:58');
INSERT INTO `v9_log` VALUES('179','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=disabled','','1','phpcms','120.206.223.4','2018-04-14 19:53:02');
INSERT INTO `v9_log` VALUES('180','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 19:53:07');
INSERT INTO `v9_log` VALUES('181','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=disabled','','1','phpcms','120.206.223.4','2018-04-14 19:53:08');
INSERT INTO `v9_log` VALUES('182','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=disabled','','1','phpcms','120.206.223.4','2018-04-14 19:53:14');
INSERT INTO `v9_log` VALUES('183','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=disabled','','1','phpcms','120.206.223.4','2018-04-14 19:53:19');
INSERT INTO `v9_log` VALUES('184','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 19:53:22');
INSERT INTO `v9_log` VALUES('185','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=disabled','','1','phpcms','120.206.223.4','2018-04-14 19:53:27');
INSERT INTO `v9_log` VALUES('186','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 19:53:29');
INSERT INTO `v9_log` VALUES('187','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=add','','1','phpcms','120.206.223.4','2018-04-14 19:53:34');
INSERT INTO `v9_log` VALUES('188','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 19:53:35');
INSERT INTO `v9_log` VALUES('189','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 19:53:52');
INSERT INTO `v9_log` VALUES('190','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 19:54:03');
INSERT INTO `v9_log` VALUES('191','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 19:54:19');
INSERT INTO `v9_log` VALUES('192','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 19:54:31');
INSERT INTO `v9_log` VALUES('193','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 19:54:38');
INSERT INTO `v9_log` VALUES('194','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 19:54:49');
INSERT INTO `v9_log` VALUES('195','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 19:54:58');
INSERT INTO `v9_log` VALUES('196','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 19:55:20');
INSERT INTO `v9_log` VALUES('197','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 19:55:43');
INSERT INTO `v9_log` VALUES('198','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 19:55:54');
INSERT INTO `v9_log` VALUES('199','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 19:56:02');
INSERT INTO `v9_log` VALUES('200','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 19:56:10');
INSERT INTO `v9_log` VALUES('201','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 19:56:25');
INSERT INTO `v9_log` VALUES('202','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 19:56:37');
INSERT INTO `v9_log` VALUES('203','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 19:56:44');
INSERT INTO `v9_log` VALUES('204','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 19:56:52');
INSERT INTO `v9_log` VALUES('205','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 19:56:59');
INSERT INTO `v9_log` VALUES('206','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 19:57:08');
INSERT INTO `v9_log` VALUES('207','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 19:57:15');
INSERT INTO `v9_log` VALUES('208','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 19:57:24');
INSERT INTO `v9_log` VALUES('209','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 19:57:35');
INSERT INTO `v9_log` VALUES('210','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 19:57:44');
INSERT INTO `v9_log` VALUES('211','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 19:57:52');
INSERT INTO `v9_log` VALUES('212','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=add','','1','phpcms','120.206.223.4','2018-04-14 19:58:53');
INSERT INTO `v9_log` VALUES('213','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=add','','1','phpcms','120.206.223.4','2018-04-14 19:58:58');
INSERT INTO `v9_log` VALUES('214','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=add','','1','phpcms','120.206.223.4','2018-04-14 20:02:48');
INSERT INTO `v9_log` VALUES('215','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=add','','1','phpcms','120.206.223.4','2018-04-14 20:02:52');
INSERT INTO `v9_log` VALUES('216','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=add','','1','phpcms','120.206.223.4','2018-04-14 20:04:19');
INSERT INTO `v9_log` VALUES('217','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=listorder','','1','phpcms','120.206.223.4','2018-04-14 20:04:42');
INSERT INTO `v9_log` VALUES('218','','0','admin','','category','?m=admin&c=category&a=edit','','1','phpcms','120.206.223.4','2018-04-14 20:04:54');
INSERT INTO `v9_log` VALUES('219','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:05:02');
INSERT INTO `v9_log` VALUES('220','','0','admin','','category','?m=admin&c=category&a=edit','','1','phpcms','120.206.223.4','2018-04-14 20:05:05');
INSERT INTO `v9_log` VALUES('221','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','120.206.223.4','2018-04-14 20:05:22');
INSERT INTO `v9_log` VALUES('222','','0','content','','sitemodel','?m=content&c=sitemodel&a=edit','','1','phpcms','61.129.122.78','2018-04-14 20:05:27');
INSERT INTO `v9_log` VALUES('223','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:05:55');
INSERT INTO `v9_log` VALUES('224','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=disabled','','1','phpcms','120.206.223.4','2018-04-14 20:06:14');
INSERT INTO `v9_log` VALUES('225','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=listorder','','1','phpcms','120.206.223.4','2018-04-14 20:06:19');
INSERT INTO `v9_log` VALUES('226','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','120.206.223.4','2018-04-14 20:06:33');
INSERT INTO `v9_log` VALUES('227','','0','content','','sitemodel','?m=content&c=sitemodel&a=edit','','1','phpcms','61.129.122.78','2018-04-14 20:06:53');
INSERT INTO `v9_log` VALUES('228','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=edit','','1','phpcms','120.206.223.4','2018-04-14 20:07:23');
INSERT INTO `v9_log` VALUES('229','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=edit','','1','phpcms','120.206.223.4','2018-04-14 20:08:00');
INSERT INTO `v9_log` VALUES('230','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:08:04');
INSERT INTO `v9_log` VALUES('231','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:08:54');
INSERT INTO `v9_log` VALUES('232','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:09:11');
INSERT INTO `v9_log` VALUES('233','','0','content','','content','?m=content&c=content&a=edit','','1','phpcms','61.129.122.78','2018-04-14 20:09:37');
INSERT INTO `v9_log` VALUES('234','','0','content','','content','?m=content&c=content&a=edit','','1','phpcms','61.129.122.78','2018-04-14 20:09:47');
INSERT INTO `v9_log` VALUES('235','','0','admin','','category','?m=admin&c=category&a=edit','','1','phpcms','61.129.122.78','2018-04-14 20:10:11');
INSERT INTO `v9_log` VALUES('236','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:11:10');
INSERT INTO `v9_log` VALUES('237','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','120.206.223.4','2018-04-14 20:11:19');
INSERT INTO `v9_log` VALUES('238','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:11:32');
INSERT INTO `v9_log` VALUES('239','','0','content','','content','?m=content&c=content&a=edit','','1','phpcms','61.129.122.78','2018-04-14 20:11:42');
INSERT INTO `v9_log` VALUES('240','','0','content','','content','?m=content&c=content&a=edit','','1','phpcms','61.129.122.78','2018-04-14 20:11:44');
INSERT INTO `v9_log` VALUES('241','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','120.206.223.4','2018-04-14 20:12:05');
INSERT INTO `v9_log` VALUES('242','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:12:15');
INSERT INTO `v9_log` VALUES('243','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:12:32');
INSERT INTO `v9_log` VALUES('244','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:12:56');
INSERT INTO `v9_log` VALUES('245','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:13:04');
INSERT INTO `v9_log` VALUES('246','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:13:23');
INSERT INTO `v9_log` VALUES('247','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:13:32');
INSERT INTO `v9_log` VALUES('248','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:13:45');
INSERT INTO `v9_log` VALUES('249','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:13:50');
INSERT INTO `v9_log` VALUES('250','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:14:06');
INSERT INTO `v9_log` VALUES('251','','0','content','','content','?m=content&c=content&a=edit','','1','phpcms','61.129.122.78','2018-04-14 20:15:33');
INSERT INTO `v9_log` VALUES('252','','0','content','','content','?m=content&c=content&a=edit','','1','phpcms','61.129.122.78','2018-04-14 20:15:36');
INSERT INTO `v9_log` VALUES('253','','0','content','','content','?m=content&c=content&a=edit','','1','phpcms','61.129.122.78','2018-04-14 20:15:39');
INSERT INTO `v9_log` VALUES('254','','0','content','','content','?m=content&c=content&a=edit','','1','phpcms','61.129.122.78','2018-04-14 20:15:41');
INSERT INTO `v9_log` VALUES('255','','0','content','','content','?m=content&c=content&a=edit','','1','phpcms','61.129.122.78','2018-04-14 20:15:45');
INSERT INTO `v9_log` VALUES('256','','0','content','','content','?m=content&c=content&a=edit','','1','phpcms','61.129.122.78','2018-04-14 20:15:47');
INSERT INTO `v9_log` VALUES('257','','0','content','','content','?m=content&c=content&a=edit','','1','phpcms','61.129.122.78','2018-04-14 20:15:52');
INSERT INTO `v9_log` VALUES('258','','0','content','','content','?m=content&c=content&a=edit','','1','phpcms','61.129.122.78','2018-04-14 20:15:55');
INSERT INTO `v9_log` VALUES('259','','0','content','','content','?m=content&c=content&a=edit','','1','phpcms','61.129.122.78','2018-04-14 20:15:57');
INSERT INTO `v9_log` VALUES('260','','0','content','','content','?m=content&c=content&a=edit','','1','phpcms','61.129.122.78','2018-04-14 20:16:00');
INSERT INTO `v9_log` VALUES('261','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:16:20');
INSERT INTO `v9_log` VALUES('262','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:16:26');
INSERT INTO `v9_log` VALUES('263','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:16:36');
INSERT INTO `v9_log` VALUES('264','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:16:42');
INSERT INTO `v9_log` VALUES('265','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:16:49');
INSERT INTO `v9_log` VALUES('266','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','120.206.223.4','2018-04-14 20:16:56');
INSERT INTO `v9_log` VALUES('267','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:16:56');
INSERT INTO `v9_log` VALUES('268','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','120.206.223.4','2018-04-14 20:16:58');
INSERT INTO `v9_log` VALUES('269','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:17:04');
INSERT INTO `v9_log` VALUES('270','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:17:15');
INSERT INTO `v9_log` VALUES('271','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:17:32');
INSERT INTO `v9_log` VALUES('272','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','120.206.223.4','2018-04-14 20:17:37');
INSERT INTO `v9_log` VALUES('273','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','120.206.223.4','2018-04-14 20:17:40');
INSERT INTO `v9_log` VALUES('274','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:17:48');
INSERT INTO `v9_log` VALUES('275','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:18:00');
INSERT INTO `v9_log` VALUES('276','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:18:11');
INSERT INTO `v9_log` VALUES('277','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:18:25');
INSERT INTO `v9_log` VALUES('278','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','120.206.223.4','2018-04-14 20:18:28');
INSERT INTO `v9_log` VALUES('279','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:18:38');
INSERT INTO `v9_log` VALUES('280','','0','admin','','category','?m=admin&c=category&a=edit','','1','phpcms','120.206.223.4','2018-04-14 20:18:40');
INSERT INTO `v9_log` VALUES('281','','0','admin','','category','?m=admin&c=category&a=edit','','1','phpcms','120.206.223.4','2018-04-14 20:18:46');
INSERT INTO `v9_log` VALUES('282','','0','content','','content','?m=content&c=content&a=edit','','1','phpcms','61.129.122.78','2018-04-14 20:18:51');
INSERT INTO `v9_log` VALUES('283','','0','content','','content','?m=content&c=content&a=edit','','1','phpcms','61.129.122.78','2018-04-14 20:18:54');
INSERT INTO `v9_log` VALUES('284','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','120.206.223.4','2018-04-14 20:18:55');
INSERT INTO `v9_log` VALUES('285','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','120.206.223.4','2018-04-14 20:19:45');
INSERT INTO `v9_log` VALUES('286','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','120.206.223.4','2018-04-14 20:19:51');
INSERT INTO `v9_log` VALUES('287','','0','content','','sitemodel','?m=content&c=sitemodel&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:20:23');
INSERT INTO `v9_log` VALUES('288','','0','content','','sitemodel','?m=content&c=sitemodel&a=add','','1','phpcms','120.206.223.4','2018-04-14 20:20:53');
INSERT INTO `v9_log` VALUES('289','','0','content','','sitemodel','?m=content&c=sitemodel&a=add','','1','phpcms','120.206.223.4','2018-04-14 20:21:39');
INSERT INTO `v9_log` VALUES('290','','0','content','','sitemodel','?m=content&c=sitemodel&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:22:10');
INSERT INTO `v9_log` VALUES('291','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=disabled','','1','phpcms','61.129.122.78','2018-04-14 20:22:37');
INSERT INTO `v9_log` VALUES('292','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=disabled','','1','phpcms','61.129.122.78','2018-04-14 20:22:41');
INSERT INTO `v9_log` VALUES('293','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=disabled','','1','phpcms','61.129.122.78','2018-04-14 20:22:46');
INSERT INTO `v9_log` VALUES('294','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=disabled','','1','phpcms','61.129.122.78','2018-04-14 20:22:49');
INSERT INTO `v9_log` VALUES('295','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=disabled','','1','phpcms','61.129.122.78','2018-04-14 20:22:51');
INSERT INTO `v9_log` VALUES('296','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=disabled','','1','phpcms','61.129.122.78','2018-04-14 20:22:56');
INSERT INTO `v9_log` VALUES('297','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=disabled','','1','phpcms','61.129.122.78','2018-04-14 20:23:13');
INSERT INTO `v9_log` VALUES('298','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=disabled','','1','phpcms','61.129.122.78','2018-04-14 20:23:16');
INSERT INTO `v9_log` VALUES('299','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=disabled','','1','phpcms','61.129.122.78','2018-04-14 20:23:19');
INSERT INTO `v9_log` VALUES('300','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=disabled','','1','phpcms','61.129.122.78','2018-04-14 20:23:23');
INSERT INTO `v9_log` VALUES('301','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=disabled','','1','phpcms','61.129.122.78','2018-04-14 20:23:26');
INSERT INTO `v9_log` VALUES('302','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:23:29');
INSERT INTO `v9_log` VALUES('303','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=add','','1','phpcms','120.206.223.4','2018-04-14 20:23:53');
INSERT INTO `v9_log` VALUES('304','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:25:59');
INSERT INTO `v9_log` VALUES('305','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=disabled','','1','phpcms','120.206.223.4','2018-04-14 20:26:34');
INSERT INTO `v9_log` VALUES('306','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=disabled','','1','phpcms','120.206.223.4','2018-04-14 20:26:39');
INSERT INTO `v9_log` VALUES('307','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=disabled','','1','phpcms','120.206.223.4','2018-04-14 20:26:43');
INSERT INTO `v9_log` VALUES('308','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=disabled','','1','phpcms','120.206.223.4','2018-04-14 20:26:49');
INSERT INTO `v9_log` VALUES('309','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=disabled','','1','phpcms','120.206.223.4','2018-04-14 20:26:59');
INSERT INTO `v9_log` VALUES('310','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:27:17');
INSERT INTO `v9_log` VALUES('311','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=disabled','','1','phpcms','120.206.223.4','2018-04-14 20:27:23');
INSERT INTO `v9_log` VALUES('312','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:27:25');
INSERT INTO `v9_log` VALUES('313','','0','admin','','category','?m=admin&c=category&a=edit','','1','phpcms','61.129.122.78','2018-04-14 20:27:44');
INSERT INTO `v9_log` VALUES('314','','0','admin','','category','?m=admin&c=category&a=edit','','1','phpcms','61.129.122.78','2018-04-14 20:27:58');
INSERT INTO `v9_log` VALUES('315','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:28:06');
INSERT INTO `v9_log` VALUES('316','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:28:27');
INSERT INTO `v9_log` VALUES('317','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:28:59');
INSERT INTO `v9_log` VALUES('318','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:29:16');
INSERT INTO `v9_log` VALUES('319','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','120.206.223.4','2018-04-14 20:30:02');
INSERT INTO `v9_log` VALUES('320','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:30:07');
INSERT INTO `v9_log` VALUES('321','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','120.206.223.4','2018-04-14 20:30:12');
INSERT INTO `v9_log` VALUES('322','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','120.206.223.4','2018-04-14 20:31:03');
INSERT INTO `v9_log` VALUES('323','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','120.206.223.4','2018-04-14 20:31:04');
INSERT INTO `v9_log` VALUES('324','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','120.206.223.4','2018-04-14 20:31:38');
INSERT INTO `v9_log` VALUES('325','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','120.206.223.4','2018-04-14 20:31:46');
INSERT INTO `v9_log` VALUES('326','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','120.206.223.4','2018-04-14 20:32:38');
INSERT INTO `v9_log` VALUES('327','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:33:11');
INSERT INTO `v9_log` VALUES('328','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:33:19');
INSERT INTO `v9_log` VALUES('329','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','120.206.223.4','2018-04-14 20:33:19');
INSERT INTO `v9_log` VALUES('330','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:33:48');
INSERT INTO `v9_log` VALUES('331','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','120.206.223.4','2018-04-14 20:34:14');
INSERT INTO `v9_log` VALUES('332','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:34:31');
INSERT INTO `v9_log` VALUES('333','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','120.206.223.4','2018-04-14 20:34:45');
INSERT INTO `v9_log` VALUES('334','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','120.206.223.4','2018-04-14 20:34:47');
INSERT INTO `v9_log` VALUES('335','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:34:56');
INSERT INTO `v9_log` VALUES('336','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','120.206.223.4','2018-04-14 20:36:00');
INSERT INTO `v9_log` VALUES('337','','0','content','','sitemodel','?m=content&c=sitemodel&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:39:05');
INSERT INTO `v9_log` VALUES('338','','0','content','','sitemodel','?m=content&c=sitemodel&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:39:25');
INSERT INTO `v9_log` VALUES('339','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=disabled','','1','phpcms','61.129.122.78','2018-04-14 20:39:32');
INSERT INTO `v9_log` VALUES('340','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=disabled','','1','phpcms','61.129.122.78','2018-04-14 20:39:35');
INSERT INTO `v9_log` VALUES('341','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=disabled','','1','phpcms','61.129.122.78','2018-04-14 20:39:45');
INSERT INTO `v9_log` VALUES('342','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=disabled','','1','phpcms','61.129.122.78','2018-04-14 20:39:48');
INSERT INTO `v9_log` VALUES('343','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=disabled','','1','phpcms','61.129.122.78','2018-04-14 20:39:51');
INSERT INTO `v9_log` VALUES('344','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=disabled','','1','phpcms','61.129.122.78','2018-04-14 20:39:54');
INSERT INTO `v9_log` VALUES('345','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=disabled','','1','phpcms','61.129.122.78','2018-04-14 20:39:58');
INSERT INTO `v9_log` VALUES('346','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=disabled','','1','phpcms','61.129.122.78','2018-04-14 20:40:01');
INSERT INTO `v9_log` VALUES('347','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=disabled','','1','phpcms','61.129.122.78','2018-04-14 20:40:06');
INSERT INTO `v9_log` VALUES('348','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:40:17');
INSERT INTO `v9_log` VALUES('349','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:40:35');
INSERT INTO `v9_log` VALUES('350','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:40:40');
INSERT INTO `v9_log` VALUES('351','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','120.206.223.4','2018-04-14 20:40:47');
INSERT INTO `v9_log` VALUES('352','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:40:52');
INSERT INTO `v9_log` VALUES('353','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','120.206.223.4','2018-04-14 20:41:00');
INSERT INTO `v9_log` VALUES('354','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:41:14');
INSERT INTO `v9_log` VALUES('355','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:41:20');
INSERT INTO `v9_log` VALUES('356','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','120.206.223.4','2018-04-14 20:41:23');
INSERT INTO `v9_log` VALUES('357','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','120.206.223.4','2018-04-14 20:41:26');
INSERT INTO `v9_log` VALUES('358','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','120.206.223.4','2018-04-14 20:42:07');
INSERT INTO `v9_log` VALUES('359','','0','admin','','category','?m=admin&c=category&a=edit','','1','phpcms','61.129.122.78','2018-04-14 20:43:12');
INSERT INTO `v9_log` VALUES('360','','0','admin','','category','?m=admin&c=category&a=edit','','1','phpcms','61.129.122.78','2018-04-14 20:43:15');
INSERT INTO `v9_log` VALUES('361','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:43:21');
INSERT INTO `v9_log` VALUES('362','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','120.206.223.4','2018-04-14 20:44:05');
INSERT INTO `v9_log` VALUES('363','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=edit','','1','phpcms','61.129.122.78','2018-04-14 20:44:24');
INSERT INTO `v9_log` VALUES('364','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=edit','','1','phpcms','61.129.122.78','2018-04-14 20:44:31');
INSERT INTO `v9_log` VALUES('365','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:44:43');
INSERT INTO `v9_log` VALUES('366','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','120.206.223.4','2018-04-14 20:44:50');
INSERT INTO `v9_log` VALUES('367','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=edit','','1','phpcms','120.206.223.4','2018-04-14 20:45:21');
INSERT INTO `v9_log` VALUES('368','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=edit','','1','phpcms','120.206.223.4','2018-04-14 20:45:32');
INSERT INTO `v9_log` VALUES('369','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','120.206.223.4','2018-04-14 20:45:40');
INSERT INTO `v9_log` VALUES('370','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=edit','','1','phpcms','120.206.223.4','2018-04-14 20:45:59');
INSERT INTO `v9_log` VALUES('371','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=edit','','1','phpcms','120.206.223.4','2018-04-14 20:46:05');
INSERT INTO `v9_log` VALUES('372','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=listorder','','1','phpcms','120.206.223.4','2018-04-14 20:46:23');
INSERT INTO `v9_log` VALUES('373','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','120.206.223.4','2018-04-14 20:46:30');
INSERT INTO `v9_log` VALUES('374','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:46:37');
INSERT INTO `v9_log` VALUES('375','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=edit','','1','phpcms','120.206.223.4','2018-04-14 20:47:18');
INSERT INTO `v9_log` VALUES('376','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=edit','','1','phpcms','61.129.122.78','2018-04-14 20:47:31');
INSERT INTO `v9_log` VALUES('377','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:47:36');
INSERT INTO `v9_log` VALUES('378','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=add','','1','phpcms','120.206.223.4','2018-04-14 20:47:54');
INSERT INTO `v9_log` VALUES('379','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:48:10');
INSERT INTO `v9_log` VALUES('380','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=add','','1','phpcms','120.206.223.4','2018-04-14 20:48:35');
INSERT INTO `v9_log` VALUES('381','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=add','','1','phpcms','120.206.223.4','2018-04-14 20:48:38');
INSERT INTO `v9_log` VALUES('382','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=add','','1','phpcms','120.206.223.4','2018-04-14 20:49:32');
INSERT INTO `v9_log` VALUES('383','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=add','','1','phpcms','120.206.223.4','2018-04-14 20:49:35');
INSERT INTO `v9_log` VALUES('384','','0','admin','','category','?m=admin&c=category&a=edit','','1','phpcms','61.129.122.78','2018-04-14 20:50:11');
INSERT INTO `v9_log` VALUES('385','','0','admin','','category','?m=admin&c=category&a=delete','','1','phpcms','61.129.122.78','2018-04-14 20:50:20');
INSERT INTO `v9_log` VALUES('386','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:50:23');
INSERT INTO `v9_log` VALUES('387','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:51:05');
INSERT INTO `v9_log` VALUES('388','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=edit','','1','phpcms','120.206.223.4','2018-04-14 20:52:35');
INSERT INTO `v9_log` VALUES('389','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=delete','','1','phpcms','120.206.223.4','2018-04-14 20:52:44');
INSERT INTO `v9_log` VALUES('390','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=add','','1','phpcms','120.206.223.4','2018-04-14 20:52:48');
INSERT INTO `v9_log` VALUES('391','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:52:57');
INSERT INTO `v9_log` VALUES('392','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:53:20');
INSERT INTO `v9_log` VALUES('393','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=add','','1','phpcms','120.206.223.4','2018-04-14 20:54:45');
INSERT INTO `v9_log` VALUES('394','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=add','','1','phpcms','120.206.223.4','2018-04-14 20:55:11');
INSERT INTO `v9_log` VALUES('395','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:55:15');
INSERT INTO `v9_log` VALUES('396','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:56:15');
INSERT INTO `v9_log` VALUES('397','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:57:21');
INSERT INTO `v9_log` VALUES('398','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=add','','1','phpcms','120.206.223.4','2018-04-14 20:57:33');
INSERT INTO `v9_log` VALUES('399','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=add','','1','phpcms','120.206.223.4','2018-04-14 20:57:42');
INSERT INTO `v9_log` VALUES('400','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=add','','1','phpcms','120.206.223.4','2018-04-14 20:57:57');
INSERT INTO `v9_log` VALUES('401','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:57:59');
INSERT INTO `v9_log` VALUES('402','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=add','','1','phpcms','120.206.223.4','2018-04-14 20:58:01');
INSERT INTO `v9_log` VALUES('403','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 20:58:26');
INSERT INTO `v9_log` VALUES('404','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=add','','1','phpcms','120.206.223.4','2018-04-14 20:58:29');
INSERT INTO `v9_log` VALUES('405','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','120.206.223.4','2018-04-14 20:58:36');
INSERT INTO `v9_log` VALUES('406','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=edit','','1','phpcms','120.206.223.4','2018-04-14 20:59:02');
INSERT INTO `v9_log` VALUES('407','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=listorder','','1','phpcms','120.206.223.4','2018-04-14 21:00:07');
INSERT INTO `v9_log` VALUES('408','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','120.206.223.4','2018-04-14 21:00:13');
INSERT INTO `v9_log` VALUES('409','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=edit','','1','phpcms','120.206.223.4','2018-04-14 21:00:35');
INSERT INTO `v9_log` VALUES('410','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:00:37');
INSERT INTO `v9_log` VALUES('411','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=edit','','1','phpcms','120.206.223.4','2018-04-14 21:00:40');
INSERT INTO `v9_log` VALUES('412','','0','content','','content','?m=content&c=content&a=edit','','1','phpcms','61.129.122.78','2018-04-14 21:00:51');
INSERT INTO `v9_log` VALUES('413','','0','content','','content','?m=content&c=content&a=edit','','1','phpcms','61.129.122.78','2018-04-14 21:00:59');
INSERT INTO `v9_log` VALUES('414','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:06:09');
INSERT INTO `v9_log` VALUES('415','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:06:56');
INSERT INTO `v9_log` VALUES('416','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:07:11');
INSERT INTO `v9_log` VALUES('417','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:07:47');
INSERT INTO `v9_log` VALUES('418','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:07:57');
INSERT INTO `v9_log` VALUES('419','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:08:56');
INSERT INTO `v9_log` VALUES('420','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:09:06');
INSERT INTO `v9_log` VALUES('421','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:09:31');
INSERT INTO `v9_log` VALUES('422','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:09:38');
INSERT INTO `v9_log` VALUES('423','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:10:08');
INSERT INTO `v9_log` VALUES('424','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:10:17');
INSERT INTO `v9_log` VALUES('425','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:10:52');
INSERT INTO `v9_log` VALUES('426','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:11:02');
INSERT INTO `v9_log` VALUES('427','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:11:37');
INSERT INTO `v9_log` VALUES('428','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:12:12');
INSERT INTO `v9_log` VALUES('429','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:12:33');
INSERT INTO `v9_log` VALUES('430','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:12:40');
INSERT INTO `v9_log` VALUES('431','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:13:14');
INSERT INTO `v9_log` VALUES('432','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:13:21');
INSERT INTO `v9_log` VALUES('433','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:13:42');
INSERT INTO `v9_log` VALUES('434','','0','content','','content','?m=content&c=content&a=edit','','1','phpcms','61.129.122.78','2018-04-14 21:13:52');
INSERT INTO `v9_log` VALUES('435','','0','content','','content','?m=content&c=content&a=edit','','1','phpcms','61.129.122.78','2018-04-14 21:13:56');
INSERT INTO `v9_log` VALUES('436','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:14:09');
INSERT INTO `v9_log` VALUES('437','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:14:38');
INSERT INTO `v9_log` VALUES('438','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:14:46');
INSERT INTO `v9_log` VALUES('439','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:15:16');
INSERT INTO `v9_log` VALUES('440','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:15:27');
INSERT INTO `v9_log` VALUES('441','','0','admin','','category','?m=admin&c=category&a=edit','','1','phpcms','120.206.223.4','2018-04-14 21:15:37');
INSERT INTO `v9_log` VALUES('442','','0','admin','','category','?m=admin&c=category&a=edit','','1','phpcms','120.206.223.4','2018-04-14 21:15:46');
INSERT INTO `v9_log` VALUES('443','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:15:48');
INSERT INTO `v9_log` VALUES('444','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:15:56');
INSERT INTO `v9_log` VALUES('445','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:16:28');
INSERT INTO `v9_log` VALUES('446','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:16:41');
INSERT INTO `v9_log` VALUES('447','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:17:23');
INSERT INTO `v9_log` VALUES('448','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:18:30');
INSERT INTO `v9_log` VALUES('449','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:18:44');
INSERT INTO `v9_log` VALUES('450','','0','admin','','category','?m=admin&c=category&a=edit','','1','phpcms','61.129.122.78','2018-04-14 21:19:02');
INSERT INTO `v9_log` VALUES('451','','0','content','','content','?m=content&c=content&a=edit','','1','phpcms','120.206.223.4','2018-04-14 21:19:04');
INSERT INTO `v9_log` VALUES('452','','0','admin','','category','?m=admin&c=category&a=edit','','1','phpcms','61.129.122.78','2018-04-14 21:19:23');
INSERT INTO `v9_log` VALUES('453','','0','content','','content','?m=content&c=content&a=edit','','1','phpcms','61.129.122.78','2018-04-14 21:19:43');
INSERT INTO `v9_log` VALUES('454','','0','content','','content','?m=content&c=content&a=edit','','1','phpcms','61.129.122.78','2018-04-14 21:20:08');
INSERT INTO `v9_log` VALUES('455','','0','content','','content','?m=content&c=content&a=edit','','1','phpcms','61.129.122.78','2018-04-14 21:21:49');
INSERT INTO `v9_log` VALUES('456','','0','content','','content','?m=content&c=content&a=edit','','1','phpcms','61.129.122.78','2018-04-14 21:21:57');
INSERT INTO `v9_log` VALUES('457','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:22:39');
INSERT INTO `v9_log` VALUES('458','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','120.206.223.4','2018-04-14 21:22:51');
INSERT INTO `v9_log` VALUES('459','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','120.206.223.4','2018-04-14 21:23:15');
INSERT INTO `v9_log` VALUES('460','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:23:16');
INSERT INTO `v9_log` VALUES('461','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:23:43');
INSERT INTO `v9_log` VALUES('462','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:24:02');
INSERT INTO `v9_log` VALUES('463','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','120.206.223.4','2018-04-14 21:24:05');
INSERT INTO `v9_log` VALUES('464','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','120.206.223.4','2018-04-14 21:24:39');
INSERT INTO `v9_log` VALUES('465','','0','admin','','category','?m=admin&c=category&a=edit','','1','phpcms','120.206.223.4','2018-04-14 21:24:52');
INSERT INTO `v9_log` VALUES('466','','0','admin','','category','?m=admin&c=category&a=edit','','1','phpcms','120.206.223.4','2018-04-14 21:24:55');
INSERT INTO `v9_log` VALUES('467','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','120.206.223.4','2018-04-14 21:25:47');
INSERT INTO `v9_log` VALUES('468','','0','admin','','site','?m=admin&c=site&a=edit','','1','phpcms','120.206.223.4','2018-04-14 21:27:51');
INSERT INTO `v9_log` VALUES('469','','0','admin','','site','?m=admin&c=site&a=edit','','1','phpcms','61.129.122.78','2018-04-14 21:27:53');
INSERT INTO `v9_log` VALUES('470','','0','admin','','site','?m=admin&c=site&a=edit','','1','phpcms','61.129.122.78','2018-04-14 21:28:01');
INSERT INTO `v9_log` VALUES('471','','0','admin','','site','?m=admin&c=site&a=edit','','1','phpcms','61.129.122.78','2018-04-14 21:28:17');
INSERT INTO `v9_log` VALUES('472','','0','admin','','site','?m=admin&c=site&a=edit','','1','phpcms','61.129.122.78','2018-04-14 21:28:21');
INSERT INTO `v9_log` VALUES('473','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','120.206.223.4','2018-04-14 21:29:15');
INSERT INTO `v9_log` VALUES('474','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','120.206.223.4','2018-04-14 21:29:17');
INSERT INTO `v9_log` VALUES('475','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:30:41');
INSERT INTO `v9_log` VALUES('476','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','120.206.223.4','2018-04-14 21:30:53');
INSERT INTO `v9_log` VALUES('477','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','120.206.223.4','2018-04-14 21:30:55');
INSERT INTO `v9_log` VALUES('478','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','120.206.223.4','2018-04-14 21:31:12');
INSERT INTO `v9_log` VALUES('479','','0','content','','content','?m=content&c=content&a=edit','','1','phpcms','61.129.122.78','2018-04-14 21:31:13');
INSERT INTO `v9_log` VALUES('480','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','120.206.223.4','2018-04-14 21:31:13');
INSERT INTO `v9_log` VALUES('481','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','120.206.223.4','2018-04-14 21:31:32');
INSERT INTO `v9_log` VALUES('482','','0','content','','content','?m=content&c=content&a=edit','','1','phpcms','61.129.122.78','2018-04-14 21:31:46');
INSERT INTO `v9_log` VALUES('483','','0','content','','content','?m=content&c=content&a=edit','','1','phpcms','61.129.122.78','2018-04-14 21:32:07');
INSERT INTO `v9_log` VALUES('484','','0','content','','content','?m=content&c=content&a=edit','','1','phpcms','61.129.122.78','2018-04-14 21:32:15');
INSERT INTO `v9_log` VALUES('485','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','120.206.223.4','2018-04-14 21:32:40');
INSERT INTO `v9_log` VALUES('486','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:32:43');
INSERT INTO `v9_log` VALUES('487','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','120.206.223.4','2018-04-14 21:33:07');
INSERT INTO `v9_log` VALUES('488','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:33:08');
INSERT INTO `v9_log` VALUES('489','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','120.206.223.4','2018-04-14 21:33:09');
INSERT INTO `v9_log` VALUES('490','','0','content','','sitemodel','?m=content&c=sitemodel&a=add','','1','phpcms','120.206.223.4','2018-04-14 21:33:15');
INSERT INTO `v9_log` VALUES('491','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:33:29');
INSERT INTO `v9_log` VALUES('492','','0','content','','sitemodel','?m=content&c=sitemodel&a=add','','1','phpcms','120.206.223.4','2018-04-14 21:33:40');
INSERT INTO `v9_log` VALUES('493','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=disabled','','1','phpcms','120.206.223.4','2018-04-14 21:34:47');
INSERT INTO `v9_log` VALUES('494','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=disabled','','1','phpcms','120.206.223.4','2018-04-14 21:34:52');
INSERT INTO `v9_log` VALUES('495','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=disabled','','1','phpcms','120.206.223.4','2018-04-14 21:34:56');
INSERT INTO `v9_log` VALUES('496','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=disabled','','1','phpcms','120.206.223.4','2018-04-14 21:35:01');
INSERT INTO `v9_log` VALUES('497','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=disabled','','1','phpcms','120.206.223.4','2018-04-14 21:35:05');
INSERT INTO `v9_log` VALUES('498','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=disabled','','1','phpcms','120.206.223.4','2018-04-14 21:35:11');
INSERT INTO `v9_log` VALUES('499','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=disabled','','1','phpcms','120.206.223.4','2018-04-14 21:35:15');
INSERT INTO `v9_log` VALUES('500','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=disabled','','1','phpcms','120.206.223.4','2018-04-14 21:35:27');
INSERT INTO `v9_log` VALUES('501','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=disabled','','1','phpcms','120.206.223.4','2018-04-14 21:35:34');
INSERT INTO `v9_log` VALUES('502','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=disabled','','1','phpcms','120.206.223.4','2018-04-14 21:35:37');
INSERT INTO `v9_log` VALUES('503','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=disabled','','1','phpcms','120.206.223.4','2018-04-14 21:35:46');
INSERT INTO `v9_log` VALUES('504','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=add','','1','phpcms','120.206.223.4','2018-04-14 21:35:58');
INSERT INTO `v9_log` VALUES('505','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:37:18');
INSERT INTO `v9_log` VALUES('506','','0','content','','content','?m=content&c=content&a=edit','','1','phpcms','61.129.122.78','2018-04-14 21:37:29');
INSERT INTO `v9_log` VALUES('507','','0','content','','content','?m=content&c=content&a=edit','','1','phpcms','61.129.122.78','2018-04-14 21:38:17');
INSERT INTO `v9_log` VALUES('508','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:40:05');
INSERT INTO `v9_log` VALUES('509','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=add','','1','phpcms','120.206.223.4','2018-04-14 21:40:09');
INSERT INTO `v9_log` VALUES('510','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=add','','1','phpcms','120.206.223.4','2018-04-14 21:40:12');
INSERT INTO `v9_log` VALUES('511','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=add','','1','phpcms','120.206.223.4','2018-04-14 21:40:57');
INSERT INTO `v9_log` VALUES('512','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:41:03');
INSERT INTO `v9_log` VALUES('513','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:41:11');
INSERT INTO `v9_log` VALUES('514','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=listorder','','1','phpcms','120.206.223.4','2018-04-14 21:41:20');
INSERT INTO `v9_log` VALUES('515','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:41:39');
INSERT INTO `v9_log` VALUES('516','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','120.206.223.4','2018-04-14 21:41:51');
INSERT INTO `v9_log` VALUES('517','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:42:30');
INSERT INTO `v9_log` VALUES('518','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','120.206.223.4','2018-04-14 21:42:45');
INSERT INTO `v9_log` VALUES('519','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:42:50');
INSERT INTO `v9_log` VALUES('520','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','120.206.223.4','2018-04-14 21:42:51');
INSERT INTO `v9_log` VALUES('521','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:43:03');
INSERT INTO `v9_log` VALUES('522','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','120.206.223.4','2018-04-14 21:43:07');
INSERT INTO `v9_log` VALUES('523','','0','admin','','category','?m=admin&c=category&a=delete','','1','phpcms','120.206.223.4','2018-04-14 21:43:19');
INSERT INTO `v9_log` VALUES('524','','0','admin','','category','?m=admin&c=category&a=edit','','1','phpcms','120.206.223.4','2018-04-14 21:43:24');
INSERT INTO `v9_log` VALUES('525','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','120.206.223.4','2018-04-14 21:43:35');
INSERT INTO `v9_log` VALUES('526','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:43:38');
INSERT INTO `v9_log` VALUES('527','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:43:48');
INSERT INTO `v9_log` VALUES('528','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:44:13');
INSERT INTO `v9_log` VALUES('529','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:44:18');
INSERT INTO `v9_log` VALUES('530','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:44:50');
INSERT INTO `v9_log` VALUES('531','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:45:05');
INSERT INTO `v9_log` VALUES('532','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:45:34');
INSERT INTO `v9_log` VALUES('533','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','120.206.223.4','2018-04-14 21:45:41');
INSERT INTO `v9_log` VALUES('534','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:45:42');
INSERT INTO `v9_log` VALUES('535','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','120.206.223.4','2018-04-14 21:45:43');
INSERT INTO `v9_log` VALUES('536','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:46:04');
INSERT INTO `v9_log` VALUES('537','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:46:13');
INSERT INTO `v9_log` VALUES('538','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','120.206.223.4','2018-04-14 21:46:23');
INSERT INTO `v9_log` VALUES('539','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','120.206.223.4','2018-04-14 21:46:25');
INSERT INTO `v9_log` VALUES('540','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:46:38');
INSERT INTO `v9_log` VALUES('541','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','120.206.223.4','2018-04-14 21:47:01');
INSERT INTO `v9_log` VALUES('542','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','120.206.223.4','2018-04-14 21:47:03');
INSERT INTO `v9_log` VALUES('543','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:47:04');
INSERT INTO `v9_log` VALUES('544','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:47:31');
INSERT INTO `v9_log` VALUES('545','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','120.206.223.4','2018-04-14 21:47:36');
INSERT INTO `v9_log` VALUES('546','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:47:38');
INSERT INTO `v9_log` VALUES('547','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:48:03');
INSERT INTO `v9_log` VALUES('548','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:48:11');
INSERT INTO `v9_log` VALUES('549','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:48:37');
INSERT INTO `v9_log` VALUES('550','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:48:44');
INSERT INTO `v9_log` VALUES('551','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:49:09');
INSERT INTO `v9_log` VALUES('552','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:49:20');
INSERT INTO `v9_log` VALUES('553','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:49:50');
INSERT INTO `v9_log` VALUES('554','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','120.206.223.4','2018-04-14 21:51:26');
INSERT INTO `v9_log` VALUES('555','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:51:28');
INSERT INTO `v9_log` VALUES('556','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','120.206.223.4','2018-04-14 21:51:34');
INSERT INTO `v9_log` VALUES('557','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:51:52');
INSERT INTO `v9_log` VALUES('558','','0','admin','','category','?m=admin&c=category&a=add','','1','phpcms','120.206.223.4','2018-04-14 21:51:56');
INSERT INTO `v9_log` VALUES('559','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:52:00');
INSERT INTO `v9_log` VALUES('560','','0','admin','','category','?m=admin&c=category&a=listorder','','1','phpcms','120.206.223.4','2018-04-14 21:52:10');
INSERT INTO `v9_log` VALUES('561','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:52:22');
INSERT INTO `v9_log` VALUES('562','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:52:33');
INSERT INTO `v9_log` VALUES('563','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:53:00');
INSERT INTO `v9_log` VALUES('564','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:53:10');
INSERT INTO `v9_log` VALUES('565','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:53:42');
INSERT INTO `v9_log` VALUES('566','','0','admin','','database','?m=admin&c=database&a=export','','1','phpcms','120.206.223.4','2018-04-14 21:53:44');
INSERT INTO `v9_log` VALUES('567','','0','admin','','database','?m=admin&c=database&a=export','','1','phpcms','120.206.223.4','2018-04-14 21:53:51');
INSERT INTO `v9_log` VALUES('568','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:53:58');
INSERT INTO `v9_log` VALUES('569','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:54:22');
INSERT INTO `v9_log` VALUES('570','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:54:32');
INSERT INTO `v9_log` VALUES('571','','0','admin','','database','?m=admin&c=database&a=export','','1','phpcms','120.206.223.4','2018-04-14 21:54:46');
INSERT INTO `v9_log` VALUES('572','','0','admin','','database','?m=admin&c=database&a=export','','1','phpcms','120.206.223.4','2018-04-14 21:54:51');
INSERT INTO `v9_log` VALUES('573','','0','admin','','database','?m=admin&c=database&a=export','','1','phpcms','120.206.223.4','2018-04-14 21:55:00');
INSERT INTO `v9_log` VALUES('574','','0','admin','','database','?m=admin&c=database&a=import','','1','phpcms','120.206.223.4','2018-04-14 21:55:02');
INSERT INTO `v9_log` VALUES('575','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:55:03');
INSERT INTO `v9_log` VALUES('576','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:55:11');
INSERT INTO `v9_log` VALUES('577','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:55:37');
INSERT INTO `v9_log` VALUES('578','','0','admin','','database','?m=admin&c=database&a=export','','1','phpcms','120.206.223.4','2018-04-14 21:55:43');
INSERT INTO `v9_log` VALUES('579','','0','admin','','database','?m=admin&c=database&a=export','','1','phpcms','120.206.223.4','2018-04-14 21:55:47');
INSERT INTO `v9_log` VALUES('580','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:55:47');
INSERT INTO `v9_log` VALUES('581','','0','admin','','database','?m=admin&c=database&a=export','','1','phpcms','120.206.223.4','2018-04-14 21:55:58');
INSERT INTO `v9_log` VALUES('582','','0','admin','','database','?m=admin&c=database&a=export','','1','phpcms','120.206.223.4','2018-04-14 21:56:01');
INSERT INTO `v9_log` VALUES('583','','0','admin','','database','?m=admin&c=database&a=import','','1','phpcms','120.206.223.4','2018-04-14 21:56:03');
INSERT INTO `v9_log` VALUES('584','','0','admin','','database','?m=admin&c=database&a=delete','','1','phpcms','120.206.223.4','2018-04-14 21:56:08');
INSERT INTO `v9_log` VALUES('585','','0','admin','','database','?m=admin&c=database&a=import','','1','phpcms','120.206.223.4','2018-04-14 21:56:10');
INSERT INTO `v9_log` VALUES('586','','0','admin','','database','?m=admin&c=database&a=export','','1','phpcms','120.206.223.4','2018-04-14 21:56:11');
INSERT INTO `v9_log` VALUES('587','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:56:11');
INSERT INTO `v9_log` VALUES('588','','0','admin','','database','?m=admin&c=database&a=export','','1','phpcms','120.206.223.4','2018-04-14 21:56:17');
INSERT INTO `v9_log` VALUES('589','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:56:24');
INSERT INTO `v9_log` VALUES('590','','0','admin','','database','?m=admin&c=database&a=export','','1','phpcms','120.206.223.4','2018-04-14 21:56:26');
INSERT INTO `v9_log` VALUES('591','','0','admin','','database','?m=admin&c=database&a=export','','1','phpcms','120.206.223.4','2018-04-14 21:56:35');
INSERT INTO `v9_log` VALUES('592','','0','admin','','database','?m=admin&c=database&a=import','','1','phpcms','120.206.223.4','2018-04-14 21:56:37');
INSERT INTO `v9_log` VALUES('593','','0','admin','','database','?m=admin&c=database&a=export','','1','phpcms','120.206.223.4','2018-04-14 21:56:40');
INSERT INTO `v9_log` VALUES('594','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:56:46');
INSERT INTO `v9_log` VALUES('595','','0','admin','','database','?m=admin&c=database&a=export','','1','phpcms','120.206.223.4','2018-04-14 21:56:54');
INSERT INTO `v9_log` VALUES('596','','0','admin','','database','?m=admin&c=database&a=import','','1','phpcms','120.206.223.4','2018-04-14 21:57:09');
INSERT INTO `v9_log` VALUES('597','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:57:10');
INSERT INTO `v9_log` VALUES('598','','0','admin','','database','?m=admin&c=database&a=delete','','1','phpcms','120.206.223.4','2018-04-14 21:57:30');
INSERT INTO `v9_log` VALUES('599','','0','admin','','database','?m=admin&c=database&a=import','','1','phpcms','120.206.223.4','2018-04-14 21:57:31');
INSERT INTO `v9_log` VALUES('600','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:57:33');
INSERT INTO `v9_log` VALUES('601','','0','admin','','database','?m=admin&c=database&a=export','','1','phpcms','120.206.223.4','2018-04-14 21:57:33');
INSERT INTO `v9_log` VALUES('602','','0','admin','','database','?m=admin&c=database&a=export','','1','phpcms','120.206.223.4','2018-04-14 21:57:38');
INSERT INTO `v9_log` VALUES('603','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:57:44');
INSERT INTO `v9_log` VALUES('604','','0','admin','','database','?m=admin&c=database&a=export','','1','phpcms','120.206.223.4','2018-04-14 21:57:47');
INSERT INTO `v9_log` VALUES('605','','0','admin','','database','?m=admin&c=database&a=export','','1','phpcms','120.206.223.4','2018-04-14 21:57:55');
INSERT INTO `v9_log` VALUES('606','','0','admin','','database','?m=admin&c=database&a=import','','1','phpcms','120.206.223.4','2018-04-14 21:57:57');
INSERT INTO `v9_log` VALUES('607','','0','admin','','database','?m=admin&c=database&a=export','','1','phpcms','120.206.223.4','2018-04-14 21:58:02');
INSERT INTO `v9_log` VALUES('608','','0','content','','content','?m=content&c=content&a=add','','1','phpcms','61.129.122.78','2018-04-14 21:58:13');
INSERT INTO `v9_log` VALUES('609','','0','admin','','database','?m=admin&c=database&a=import','','1','phpcms','120.206.223.4','2018-04-14 21:58:16');
INSERT INTO `v9_log` VALUES('610','','0','admin','','database','?m=admin&c=database&a=export','','1','phpcms','61.129.122.78','2018-04-14 21:58:20');
INSERT INTO `v9_log` VALUES('611','','0','admin','','database','?m=admin&c=database&a=export','','1','phpcms','61.129.122.78','2018-04-14 21:58:28');
INSERT INTO `v9_log` VALUES('612','','0','admin','','database','?m=admin&c=database&a=export','','1','phpcms','61.129.122.78','2018-04-14 21:58:36');
INSERT INTO `v9_log` VALUES('613','','0','admin','','database','?m=admin&c=database&a=export','','1','phpcms','61.129.122.78','2018-04-14 21:58:38');
INSERT INTO `v9_log` VALUES('614','','0','admin','','database','?m=admin&c=database&a=export','','1','phpcms','61.129.122.78','2018-04-14 21:58:46');

DROP TABLE IF EXISTS `v9_member`;
CREATE TABLE `v9_member` (
  `userid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `phpssouid` mediumint(8) unsigned NOT NULL,
  `username` char(20) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `encrypt` char(6) NOT NULL,
  `nickname` char(20) NOT NULL,
  `regdate` int(10) unsigned NOT NULL DEFAULT '0',
  `lastdate` int(10) unsigned NOT NULL DEFAULT '0',
  `regip` char(15) NOT NULL DEFAULT '',
  `lastip` char(15) NOT NULL DEFAULT '',
  `loginnum` smallint(5) unsigned NOT NULL DEFAULT '0',
  `email` char(32) NOT NULL DEFAULT '',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `areaid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `amount` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `point` smallint(5) unsigned NOT NULL DEFAULT '0',
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `message` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islock` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `vip` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `overduedate` int(10) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1',
  `connectid` char(40) NOT NULL DEFAULT '',
  `from` char(10) NOT NULL DEFAULT '',
  `mobile` char(11) NOT NULL DEFAULT '',
  PRIMARY KEY (`userid`),
  UNIQUE KEY `username` (`username`),
  KEY `email` (`email`(20)),
  KEY `phpssouid` (`phpssouid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_member_detail`;
CREATE TABLE `v9_member_detail` (
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `birthday` date DEFAULT NULL,
  UNIQUE KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_member_group`;
CREATE TABLE `v9_member_group` (
  `groupid` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(15) NOT NULL,
  `issystem` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `starnum` tinyint(2) unsigned NOT NULL,
  `point` smallint(6) unsigned NOT NULL,
  `allowmessage` smallint(5) unsigned NOT NULL DEFAULT '0',
  `allowvisit` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowpost` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowpostverify` tinyint(1) unsigned NOT NULL,
  `allowsearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowupgrade` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `allowsendmessage` tinyint(1) unsigned NOT NULL,
  `allowpostnum` smallint(5) unsigned NOT NULL DEFAULT '0',
  `allowattachment` tinyint(1) NOT NULL,
  `price_y` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `price_m` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `price_d` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `icon` char(30) NOT NULL,
  `usernamecolor` char(7) NOT NULL,
  `description` char(100) NOT NULL,
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`groupid`),
  KEY `disabled` (`disabled`),
  KEY `listorder` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO `v9_member_group` VALUES('1','禁止访问','1','0','0','0','1','1','0','1','0','0','0','0','0.00','0.00','0.00','','','0','0','0');
INSERT INTO `v9_member_group` VALUES('2','新手上路','1','1','50','100','1','1','0','0','0','1','0','0','50.00','10.00','1.00','','','','2','0');
INSERT INTO `v9_member_group` VALUES('4','中级会员','1','3','150','500','1','1','0','1','1','1','0','0','500.00','60.00','1.00','','','','4','0');
INSERT INTO `v9_member_group` VALUES('5','高级会员','1','5','300','999','1','1','0','1','1','1','0','0','360.00','90.00','5.00','','','','5','0');
INSERT INTO `v9_member_group` VALUES('6','注册会员','1','2','100','150','0','1','0','0','1','1','0','0','300.00','30.00','1.00','','','','6','0');
INSERT INTO `v9_member_group` VALUES('7','邮件认证','1','0','0','0','0','0','0','0','0','0','0','0','0.00','0.00','0.00','images/group/vip.jpg','#000000','','7','0');
INSERT INTO `v9_member_group` VALUES('8','游客','1','0','0','0','0','0','0','1','0','0','0','0','0.00','0.00','0.00','','','','0','0');

DROP TABLE IF EXISTS `v9_member_menu`;
CREATE TABLE `v9_member_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(40) NOT NULL DEFAULT '',
  `parentid` smallint(6) NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL DEFAULT '',
  `c` char(20) NOT NULL DEFAULT '',
  `a` char(20) NOT NULL DEFAULT '',
  `data` char(100) NOT NULL DEFAULT '',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0',
  `display` enum('1','0') NOT NULL DEFAULT '1',
  `isurl` enum('1','0') NOT NULL DEFAULT '0',
  `url` char(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `listorder` (`listorder`),
  KEY `parentid` (`parentid`),
  KEY `module` (`m`,`c`,`a`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO `v9_member_menu` VALUES('1','member_init','0','member','index','init','t=0','0','1','','');
INSERT INTO `v9_member_menu` VALUES('2','account_manage','0','member','index','account_manage','t=1','0','1','','');
INSERT INTO `v9_member_menu` VALUES('3','favorite','0','member','index','favorite','t=2','0','1','','');

DROP TABLE IF EXISTS `v9_member_verify`;
CREATE TABLE `v9_member_verify` (
  `userid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(20) NOT NULL,
  `password` char(32) NOT NULL,
  `encrypt` char(6) NOT NULL,
  `nickname` char(20) NOT NULL,
  `regdate` int(10) unsigned NOT NULL,
  `regip` char(15) NOT NULL,
  `email` char(32) NOT NULL,
  `modelid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `point` smallint(5) unsigned NOT NULL DEFAULT '0',
  `amount` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `modelinfo` char(255) NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `siteid` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `message` char(100) DEFAULT NULL,
  `mobile` char(11) NOT NULL DEFAULT '',
  PRIMARY KEY (`userid`),
  UNIQUE KEY `username` (`username`),
  KEY `email` (`email`(20))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_member_vip`;
CREATE TABLE `v9_member_vip` (
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_menu`;
CREATE TABLE `v9_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(40) NOT NULL DEFAULT '',
  `parentid` smallint(6) NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL DEFAULT '',
  `c` char(20) NOT NULL DEFAULT '',
  `a` char(20) NOT NULL DEFAULT '',
  `data` char(100) NOT NULL DEFAULT '',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0',
  `display` enum('1','0') NOT NULL DEFAULT '1',
  `project1` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `project2` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `project3` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `project4` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `project5` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `listorder` (`listorder`),
  KEY `parentid` (`parentid`),
  KEY `module` (`m`,`c`,`a`)
) ENGINE=InnoDB AUTO_INCREMENT=1669 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO `v9_menu` VALUES('1','sys_setting','0','admin','setting','init','','1','1','0','1','1','1','1');
INSERT INTO `v9_menu` VALUES('2','module','0','admin','module','init','','2','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('4','content','0','content','content','init','','4','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('5','members','0','member','member','init','','5','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('6','userinterface','0','template','style','init','','6','1','0','1','1','1','1');
INSERT INTO `v9_menu` VALUES('7','extend','0','admin','extend','init_extend','','7','1','0','1','1','1','1');
INSERT INTO `v9_menu` VALUES('8','phpsso','0','admin','phpsso','menu','','7','1','0','1','1','1','1');
INSERT INTO `v9_menu` VALUES('9','video','0','video','video','init','','11','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('10','panel','0','admin','index','public_main','','0','1','0','1','1','1','1');
INSERT INTO `v9_menu` VALUES('29','module_list','2','admin','module','','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('30','correlative_setting','1','admin','admin','admin','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('31','menu_manage','977','admin','menu','init','','8','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('32','posid_manage','975','admin','position','init','','7','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('35','menu_add','31','admin','menu','add','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('42','add_category','43','admin','category','add','s=0','1','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('43','category_manage','975','admin','category','init','module=admin','4','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('44','edit_category','43','admin','category','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('45','badword_manage','977','admin','badword','init','','10','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('46','posid_add','32','admin','position','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('49','admin_setting','1','admin','','','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('50','role_manage','49','admin','role','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('51','role_add','50','admin','role','add','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('52','category_cache','43','admin','category','public_cache','module=admin','4','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('54','admin_manage','49','admin','admin_manage','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('55','manage_member','5','member','member','manage','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('58','admin_add','54','admin','admin_manage','add','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('59','model_manage','975','content','sitemodel','init','','5','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('62','add_model','59','content','sitemodel','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('64','site_management','30','admin','site','init','','2','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('65','release_point_management','30','admin','release_point','init','','3','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('66','badword_export','45','admin','badword','export','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('67','add_site','64','admin','site','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('68','badword_import','45','admin','badword','import','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('72','member_manage','55','member','member','manage','','1','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('74','member_verify','55','member','member_verify','manage','s=0','3','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('76','manage_member_group','5','member','member_group','manage','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('77','manage_member_model','5','member','member_model','manage','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('78','member_group_add','812','member','member_group','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('79','member_model_add','813','member','member_model','add','','1','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('80','member_model_import','77','member','member_model','import','','2','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('81','member_add','72','member','member','add','','2','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('82','module_manage','2','admin','module','','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('812','member_group_manage','76','member','member_group','manage','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('813','member_model_manage','77','member','member_model','manage','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('814','site_edit','64','admin','site','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('815','site_del','64','admin','site','del','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('816','release_point_add','65','admin','release_point','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('817','release_point_del','65','admin','release_point','del','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('818','release_point_edit','65','admin','release_point','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('821','content_publish','4','content','content','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('822','content_manage','821','content','content','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('826','template_manager','6','','','','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('827','template_style','826','template','style','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('828','import_style','827','template','style','import','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('830','template_file','827','template','file','init','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('831','template_export','827','template','style','export','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('832','template_onoff','827','template','style','disable','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('833','template_updatename','827','template','style','updatename','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('834','member_lock','72','member','member','lock','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('835','member_unlock','72','member','member','unlock','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('836','member_move','72','member','member','move','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('837','member_delete','72','member','member','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('839','member_setting','55','member','member_setting','manage','','4','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('841','verify_pass','74','member','member_verify','manage','s=1','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('842','verify_ignore','74','member','member_verify','manage','s=2','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('843','verify_delete','74','member','member_verify','manage','s=3','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('844','verify_deny','74','member','member_verify','manage','s=4','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('845','never_pass','74','member','member_verify','manage','s=5','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('846','template_file_list','827','template','file','init','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('847','template_file_edit','827','template','file','edit_file','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('848','file_add_file','827','template','file','add_file','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('850','listorder','76','member','member_group','sort','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('852','priv_setting','50','admin','role','priv_setting','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('853','role_priv','50','admin','role','role_priv','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('857','attachment_manage','821','attachment','manage','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('867','linkage','977','admin','linkage','init','','13','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('868','special','821','special','special','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('869','template_editor','827','template','file','edit_file','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('870','template_visualization','827','template','file','visualization','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('871','pc_tag_edit','827','template','file','edit_pc_tag','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('872','sync_release_point','873','release','index','init','','3','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('873','release_manage','4','release','html','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('874','type_manage','975','content','type_manage','init','','6','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('875','add_type','874','content','type_manage','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('876','linkageadd','867','admin','linkage','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('877','failure_list','872','release','index','failed','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('879','member_search','72','member','member','search','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('880','queue_del','872','release','index','del','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('881','member_model_delete','813','member','member_model','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('882','member_model_edit','813','member','member_model','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('885','workflow','977','content','workflow','init','','15','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('888','add_workflow','885','content','workflow','add','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('889','member_modelfield_add','813','member','member_modelfield','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('890','member_modelfield_edit','813','member','member_modelfield','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('891','member_modelfield_delete','813','member','member_modelfield','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('892','member_modelfield_manage','813','member','member_modelfield','manage','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('895','sitemodel_import','59','content','sitemodel','import','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('896','pay','29','pay','payment','pay_list','s=3','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('897','payments','896','pay','payment','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('898','paylist','896','pay','payment','pay_list','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('899','add_content','822','content','content','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('900','modify_deposit','896','pay','payment','modify_deposit','s=1','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('901','check_content','822','content','content','pass','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('902','dbsource','29','dbsource','data','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('904','external_data_sources','902','dbsource','dbsource_admin','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('905','create_content_html','873','content','create_html','show','','2','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('906','update_urls','873','content','create_html','update_urls','','1','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('909','fulltext_search','29','search','search_type','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('910','manage_type','909','search','search_type','init','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('911','search_setting','909','search','search_admin','setting','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('912','createindex','909','search','search_admin','createindex','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('913','add_search_type','909','search','search_type','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('914','database_toos','977','admin','database','export','','6','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('915','database_export','914','admin','database','export','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('916','database_import','914','admin','database','import','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('917','dbsource_add','902','dbsource','dbsource_admin','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('918','dbsource_edit','902','dbsource','dbsource_admin','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('919','dbsource_del','902','dbsource','dbsource_admin','del','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('920','dbsource_data_add','902','dbsource','data','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('921','dbsource_data_edit','902','dbsource','data','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('922','dbsource_data_del','902','dbsource','data','del','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('926','add_special','868','special','special','add','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('927','edit_special','868','special','special','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('928','special_list','868','special','special','init','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('929','special_elite','868','special','special','elite','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('930','delete_special','868','special','special','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('931','badword_add','45','admin','badword','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('932','badword_edit','45','admin','badword','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('933','badword_delete','45','admin','badword','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('934','special_listorder','868','special','special','listorder','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('935','special_content_list','868','special','content','init','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('936','special_content_add','935','special','content','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('937','special_content_list','935','special','content','init','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('938','special_content_edit','935','special','content','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('939','special_content_delete','935','special','content','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('940','special_content_listorder','935','special','content','listorder','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('941','special_content_import','935','special','special','import','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('942','history_version','827','template','template_bak','init','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('943','restore_version','827','template','template_bak','restore','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('944','del_history_version','827','template','template_bak','del','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('945','block','821','block','block_admin','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('946','block_add','945','block','block_admin','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('950','block_edit','945','block','block_admin','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('951','block_del','945','block','block_admin','del','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('952','block_update','945','block','block_admin','block_update','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('953','block_restore','945','block','block_admin','history_restore','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('954','history_del','945','block','block_admin','history_del','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('957','collection_node','821','collection','node','manage','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('959','basic_config','30','admin','setting','init','','10','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('960','node_add','957','collection','node','add','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('961','position_edit','32','admin','position','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('962','collection_node_edit','957','collection','node','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('963','collection_node_delete','957','collection','node','del','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('965','collection_node_publish','957','collection','node','publist','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('966','collection_node_import','957','collection','node','node_import','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('967','collection_node_export','957','collection','node','export','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('968','collection_node_collection_content','957','collection','node','col_content','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('969','googlesitemap','977','admin','googlesitemap','set','','11','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('970','admininfo','10','admin','admin_manage','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('971','editpwd','970','admin','admin_manage','public_edit_pwd','','1','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('972','editinfo','970','admin','admin_manage','public_edit_info','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('973','keylink','977','admin','keylink','init','','12','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('974','add_keylink','973','admin','keylink','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('975','content_settings','4','content','content_settings','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('977','extend_all','7','admin','extend_all','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('978','urlrule_manage','977','admin','urlrule','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('979','safe_config','30','admin','setting','init','&tab=2','11','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('980','sso_config','30','admin','setting','init','&tab=3','12','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('981','email_config','30','admin','setting','init','&tab=4','13','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('982','module_manage','82','admin','module','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('983','ipbanned','977','admin','ipbanned','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('984','add_ipbanned','983','admin','ipbanned','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('989','downsites','977','admin','downservers','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('990','col_url_list','957','collection','node','col_url_list','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('991','copy_node','957','collection','node','copy','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('992','content_del','957','collection','node','content_del','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('993','collection_content_import','957','collection','node','import','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('994','import_program_add','957','collection','node','import_program_add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('995','import_program_del','957','collection','node','import_program_del','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('996','import_content','957','collection','node','import_content','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('997','log','977','admin','log','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('998','add_page','43','admin','category','add','s=1','2','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('999','add_cat_link','43','admin','category','add','s=2','2','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1000','count_items','43','admin','category','count_items','','5','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1001','cache_all','977','admin','cache_all','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1002','create_list_html','873','content','create_html','category','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1003','create_html_quick','10','content','create_html_opt','index','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1004','create_index','1003','content','create_html','public_index','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1005','scan','977','scan','index','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1006','scan_report','1005','scan','index','scan_report','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1007','md5_creat','1005','scan','index','md5_creat','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1008','album_import','868','special','album','import','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1011','edit_content','822','content','content','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1012','push_to_special','822','content','push','init','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1023','delete_log','997','admin','log','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1024','delete_ip','983','admin','ipbanned','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1026','delete_keylink','973','admin','keylink','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1027','edit_keylink','973','admin','keylink','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1034','operation_pass','74','member','member_verify','pass','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1035','operation_delete','74','member','member_verify','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1038','settingsave','30','admin','setting','save','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1039','operation_ignore','74','member','member_verify','ignore','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1040','admin_edit','54','admin','admin_manage','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1041','operation_reject','74','member','member_verify','reject','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1042','admin_delete','54','admin','admin_manage','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1043','card','54','admin','admin_manage','card','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1044','creat_card','54','admin','admin_manage','creat_card','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1045','remove_card','54','admin','admin_manage','remove_card','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1048','member_edit','72','member','member','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1049','member_group_edit','812','member','member_group','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1050','role_edit','50','admin','role','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1051','member_group_delete','812','member','member_group','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1052','member_manage','50','admin','role','member_manage','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1053','role_delete','50','admin','role','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1054','member_model_export','77','member','member_model','export','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1055','member_model_sort','77','member','member_model','sort','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1056','member_model_move','77','member','member_model','move','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1057','payment_add','897','pay','payment','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1058','payment_delete','897','pay','payment','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1059','payment_edit','897','pay','payment','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1060','spend_record','896','pay','spend','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1061','pay_stat','896','pay','payment','pay_stat','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1062','fields_manage','59','content','sitemodel_field','init','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1063','edit_model_content','59','content','sitemodel','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1064','disabled_model','59','content','sitemodel','disabled','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1065','delete_model','59','content','sitemodel','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1066','export_model','59','content','sitemodel','export','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1067','delete','874','content','type_manage','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1068','edit','874','content','type_manage','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1069','add_urlrule','978','admin','urlrule','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1070','edit_urlrule','978','admin','urlrule','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1071','delete_urlrule','978','admin','urlrule','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1072','edit_menu','31','admin','menu','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1073','delete_menu','31','admin','menu','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1074','edit_workflow','885','content','workflow','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1075','delete_workflow','885','content','workflow','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1076','creat_html','868','special','special','html','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1093','connect_config','30','admin','setting','init','&tab=5','14','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1102','view_modelinfo','74','member','member_verify','modelinfo','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1202','create_special_list','868','special','special','create_special_list','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1239','copyfrom_manage','977','admin','copyfrom','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1240','view_memberlinfo','72','member','member','memberinfo','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1241','move_content','822','content','content','remove','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1242','poster_template','56','poster','space','poster_template','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1243','create_index','873','content','create_html','public_index','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1244','add_othors','822','content','content','add_othors','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1295','attachment_manager_dir','857','attachment','manage','dir','','2','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1296','attachment_manager_db','857','attachment','manage','init','','1','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1346','attachment_address_replace','857','attachment','address','init','','3','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1347','attachment_address_update','857','attachment','address','update','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1348','delete_content','822','content','content','delete','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1349','member_menu_manage','977','member','member_menu','manage','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1350','member_menu_add','1349','member','member_menu','add','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1351','member_menu_edit','1349','member','member_menu','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1352','member_menu_delete','1349','member','member_menu','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1353','batch_show','822','content','create_html','batch_show','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1354','pay_delete','898','pay','payment','pay_del','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1355','pay_cancel','898','pay','payment','pay_cancel','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1356','discount','898','pay','payment','discount','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1360','category_batch_edit','43','admin','category','batch_edit','','6','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1500','listorder','822','content','content','listorder','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1501','a_clean_data','873','content','content','clear_data','','0','1','0','0','0','0','0');
INSERT INTO `v9_menu` VALUES('1577','video_manage','1589','video','video','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1578','video_upload','1589','video','video','add','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1579','video_edit','1589','video','video','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1580','video_delete','1589','video','video','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1581','video_open','1589','video','video','open','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1582','subscribe_manage','1589','video','video','subscribe_list','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1583','sub_delete','1589','video','video','sub_del','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1585','import_ku6_video','1589','video','video','import_ku6video','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1586','video_store','1589','video','video','video2content','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1589','video','9','video','video','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1590','player_manage','1589','video','player','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1591','video_inputinfo','1581','video','video','open','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1592','complete_info','1581','video','video','complete_info','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1593','video_stat','1589','video','stat','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1594','announce','29','announce','admin_announce','init','s=1','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1595','announce_add','1594','announce','admin_announce','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1596','edit_announce','1594','announce','admin_announce','edit','s=1','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1597','check_announce','1594','announce','admin_announce','init','s=2','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1598','overdue','1594','announce','admin_announce','init','s=3','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1599','del_announce','1594','announce','admin_announce','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1600','comment','29','comment','comment_admin','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1601','comment_manage','821','comment','comment_admin','listinfo','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1602','comment_check','1601','comment','check','checks','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1603','comment_list','1600','comment','comment_admin','lists','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1604','link','29','link','link','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1605','add_link','1604','link','link','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1606','edit_link','1604','link','link','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1607','delete_link','1604','link','link','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1608','link_setting','1604','link','link','setting','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1609','add_type','1604','link','link','add_type','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1610','list_type','1604','link','link','list_type','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1611','check_register','1604','link','link','check_register','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1612','vote','29','vote','vote','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1613','add_vote','1612','vote','vote','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1614','edit_vote','1612','vote','vote','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1615','delete_vote','1612','vote','vote','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1616','vote_setting','1612','vote','vote','setting','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1617','statistics_vote','1612','vote','vote','statistics','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1618','statistics_userlist','1612','vote','vote','statistics_userlist','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1619','create_js','1612','vote','vote','create_js','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1620','message','29','message','message','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1621','send_one','1620','message','message','send_one','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1622','delete_message','1620','message','message','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1623','message_send','1620','message','message','message_send','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1624','message_group_manage','1620','message','message','message_group_manage','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1625','mood','29','mood','mood_admin','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1626','mood_setting','1625','mood','mood_admin','setting','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1627','poster','29','poster','space','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1628','add_space','1627','poster','space','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1629','edit_space','1627','poster','space','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1630','del_space','1627','poster','space','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1631','poster_list','1627','poster','poster','init','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1632','add_poster','1627','poster','poster','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1633','edit_poster','1627','poster','poster','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1634','del_poster','1627','poster','poster','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1635','poster_stat','1627','poster','poster','stat','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1636','poster_setting','1627','poster','space','setting','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1637','create_poster_js','1627','poster','space','create_js','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1638','poster_template','1627','poster','space','poster_template','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1639','formguide','29','formguide','formguide','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1640','formguide_add','1639','formguide','formguide','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1641','formguide_edit','1639','formguide','formguide','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1642','form_info_list','1639','formguide','formguide_info','init','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1643','formguide_disabled','1639','formguide','formguide','disabled','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1644','formguide_delete','1639','formguide','formguide','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1645','formguide_stat','1639','formguide','formguide','stat','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1646','add_public_field','1639','formguide','formguide_field','add','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1647','list_public_field','1639','formguide','formguide_field','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1648','module_setting','1639','formguide','formguide','setting','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1649','wap','29','wap','wap_admin','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1650','wap_add','1649','wap','wap_admin','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1651','wap_edit','1649','wap','wap_admin','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1652','wap_delete','1649','wap','wap_admin','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1653','wap_type_manage','1649','wap','wap_admin','type_manage','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1654','wap_type_edit','1649','wap','wap_admin','type_edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1655','wap_type_delete','1649','wap','wap_admin','type_delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1656','upgrade','977','upgrade','index','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1657','checkfile','1656','upgrade','index','checkfile','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1658','tag','826','tag','tag','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1659','add_tag','1658','tag','tag','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1660','edit_tag','1658','tag','tag','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1661','delete_tag','1658','tag','tag','del','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1662','tag_lists','1658','tag','tag','lists','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1663','sms','29','sms','sms','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1664','sms_setting','1663','sms','sms','sms_setting','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1665','sms_pay_history','1663','sms','sms','sms_pay_history','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1666','sms_buy_history','1663','sms','sms','sms_buy_history','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1667','sms_api','1663','sms','sms','sms_api','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1668','sms_sent','1663','sms','sms','sms_sent','','0','1','1','1','1','1','1');

DROP TABLE IF EXISTS `v9_message`;
CREATE TABLE `v9_message` (
  `messageid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `send_from_id` char(30) NOT NULL DEFAULT '0',
  `send_to_id` char(30) NOT NULL DEFAULT '0',
  `folder` enum('all','inbox','outbox') NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `message_time` int(10) unsigned NOT NULL DEFAULT '0',
  `subject` char(80) DEFAULT NULL,
  `content` text NOT NULL,
  `replyid` int(10) unsigned NOT NULL DEFAULT '0',
  `del_type` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`messageid`),
  KEY `msgtoid` (`send_to_id`,`folder`),
  KEY `replyid` (`replyid`),
  KEY `folder` (`send_from_id`,`folder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_message_data`;
CREATE TABLE `v9_message_data` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `userid` mediumint(8) NOT NULL,
  `group_message_id` int(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `message` (`userid`,`group_message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_message_group`;
CREATE TABLE `v9_message_group` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupid` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '用户组id',
  `subject` char(80) DEFAULT NULL,
  `content` text NOT NULL COMMENT '内容',
  `inputtime` int(10) unsigned DEFAULT '0',
  `status` tinyint(2) unsigned DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_model`;
CREATE TABLE `v9_model` (
  `modelid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` char(30) NOT NULL,
  `description` char(100) NOT NULL,
  `tablename` char(20) NOT NULL,
  `setting` text NOT NULL,
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `items` smallint(5) unsigned NOT NULL DEFAULT '0',
  `enablesearch` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `default_style` char(30) NOT NULL,
  `category_template` char(30) NOT NULL,
  `list_template` char(30) NOT NULL,
  `show_template` char(30) NOT NULL,
  `js_template` varchar(30) NOT NULL,
  `admin_list_template` char(30) NOT NULL,
  `member_add_template` varchar(30) NOT NULL,
  `member_list_template` varchar(30) NOT NULL,
  `sort` tinyint(3) NOT NULL,
  `type` tinyint(1) NOT NULL,
  PRIMARY KEY (`modelid`),
  KEY `type` (`type`,`siteid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO `v9_model` VALUES('1','1','文章模型','','news','','0','0','1','0','default','category','list','show','','','','','0','0');
INSERT INTO `v9_model` VALUES('2','1','下载模型','','download','','0','0','1','0','default','category_download','list_download','show_download','','','','','0','0');
INSERT INTO `v9_model` VALUES('3','1','图片模型','','picture','','0','0','1','0','default','category_picture','list_picture','show_picture','','','','','0','0');
INSERT INTO `v9_model` VALUES('10','1','普通会员','普通会员','member_detail','','0','0','1','0','','','','','','','','','0','2');
INSERT INTO `v9_model` VALUES('11','1','视频模型','','video','','0','0','1','0','default','category_video','list_video','show_video','','','','','0','0');
INSERT INTO `v9_model` VALUES('12','1','大事记','','dashiji','','0','0','1','0','default','category','list_dashiji','show_dashiji','','','','','0','0');
INSERT INTO `v9_model` VALUES('13','1','众店宝','','zongdianbao','','0','0','1','0','default','category_anli','list_zhongdianbao','show_zhongdianbao','','','','','0','0');
INSERT INTO `v9_model` VALUES('14','1','加入我们','','joinus','','0','0','1','0','default','category_anli','list_jrwm','show_anli','','','','','0','0');
INSERT INTO `v9_model` VALUES('15','1','成功案例','','case','','0','0','1','0','default','category_anli','list_anli','show_anli','','','','','0','0');
INSERT INTO `v9_model` VALUES('16','1','首页一物一码','','syywym','','0','0','1','0','default','category','list','show','','','','','0','0');

DROP TABLE IF EXISTS `v9_model_field`;
CREATE TABLE `v9_model_field` (
  `fieldid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `field` varchar(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `tips` text NOT NULL,
  `css` varchar(30) NOT NULL,
  `minlength` int(10) unsigned NOT NULL DEFAULT '0',
  `maxlength` int(10) unsigned NOT NULL DEFAULT '0',
  `pattern` varchar(255) NOT NULL,
  `errortips` varchar(255) NOT NULL,
  `formtype` varchar(20) NOT NULL,
  `setting` mediumtext NOT NULL,
  `formattribute` varchar(255) NOT NULL,
  `unsetgroupids` varchar(255) NOT NULL,
  `unsetroleids` varchar(255) NOT NULL,
  `iscore` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `issystem` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isunique` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isbase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `issearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isfulltext` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isposition` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `listorder` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isomnipotent` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fieldid`),
  KEY `modelid` (`modelid`,`disabled`),
  KEY `field` (`field`,`modelid`)
) ENGINE=InnoDB AUTO_INCREMENT=228 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO `v9_model_field` VALUES('1','1','1','catid','栏目','','','1','6','/^[0-9]{1,6}$/','请选择栏目','catid','array (\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','1','0','1','1','1','0','0','1','0','0');
INSERT INTO `v9_model_field` VALUES('2','1','1','typeid','类别','','','0','0','','','typeid','array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)','','','','0','1','0','1','1','1','0','0','2','0','0');
INSERT INTO `v9_model_field` VALUES('3','1','1','title','标题','','inputtitle','1','80','','请输入标题','title','','','','','0','1','0','1','1','1','1','1','4','0','0');
INSERT INTO `v9_model_field` VALUES('4','1','1','thumb','缩略图','','','0','100','','','image','array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)','','','','0','1','0','0','0','1','0','1','14','0','0');
INSERT INTO `v9_model_field` VALUES('5','1','1','keywords','关键词','多关键词之间用空格或者“,”隔开','','0','40','','','keyword','array (\r\n  \'size\' => \'100\',\r\n  \'defaultvalue\' => \'\',\r\n)','','-99','-99','0','1','0','1','1','1','1','0','7','0','0');
INSERT INTO `v9_model_field` VALUES('6','1','1','description','摘要','','','0','255','','','textarea','array (\r\n  \'width\' => \'98\',\r\n  \'height\' => \'46\',\r\n  \'defaultvalue\' => \'\',\r\n  \'enablehtml\' => \'0\',\r\n)','','','','0','1','0','1','0','1','1','1','10','0','0');
INSERT INTO `v9_model_field` VALUES('7','1','1','updatetime','更新时间','','','0','0','','','datetime','array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)','','','','1','1','0','1','0','0','0','0','12','0','0');
INSERT INTO `v9_model_field` VALUES('8','1','1','content','内容','<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">字符至内容摘要\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片\r\n</div>','','1','999999','','内容不能为空','editor','array (\n  \'toolbar\' => \'full\',\n  \'defaultvalue\' => \'\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'2\',\n  \'link_mode\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n)','','','','0','0','0','1','0','1','1','0','13','0','0');
INSERT INTO `v9_model_field` VALUES('9','1','1','voteid','添加投票','','','0','0','','','omnipotent','array (\n  \'formtext\' => \'<input type=\\\'text\\\' name=\\\'info[voteid]\\\' id=\\\'voteid\\\' value=\\\'{FIELD_VALUE}\\\' size=\\\'3\\\'> \r\n<input type=\\\'button\\\' value=\"选择已有投票\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=vote&c=vote&a=public_get_votelist&from_api=1\\\',\\\'选择已有投票\\\')\" class=\"button\">\r\n<input type=\\\'button\\\' value=\"新增投票\" onclick=\"omnipotent(\\\'addvote\\\',\\\'?m=vote&c=vote&a=add&from_api=1\\\',\\\'添加投票\\\',0)\" class=\"button\">\',\n  \'fieldtype\' => \'mediumint\',\n  \'minnumber\' => \'1\',\n)','','','','0','0','0','1','0','0','1','0','21','0','0');
INSERT INTO `v9_model_field` VALUES('10','1','1','pages','分页方式','','','0','0','','','pages','','','-99','-99','0','0','0','1','0','0','0','0','16','0','0');
INSERT INTO `v9_model_field` VALUES('11','1','1','inputtime','发布时间','','','0','0','','','datetime','array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)','','','','0','1','0','0','0','0','0','1','17','0','0');
INSERT INTO `v9_model_field` VALUES('12','1','1','posids','推荐位','','','0','0','','','posid','array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)','','','','0','1','0','1','0','0','0','0','18','0','0');
INSERT INTO `v9_model_field` VALUES('13','1','1','url','URL','','','0','100','','','text','','','','','1','1','0','1','0','0','0','0','50','0','0');
INSERT INTO `v9_model_field` VALUES('14','1','1','listorder','排序','','','0','6','','','number','','','','','1','1','0','1','0','0','0','0','51','0','0');
INSERT INTO `v9_model_field` VALUES('15','1','1','status','状态','','','0','2','','','box','','','','','1','1','0','1','0','0','0','0','55','0','0');
INSERT INTO `v9_model_field` VALUES('16','1','1','template','内容页模板','','','0','30','','','template','array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','0','0','0','0','0','0','0','53','0','0');
INSERT INTO `v9_model_field` VALUES('17','1','1','groupids_view','阅读权限','','','0','0','','','groupid','array (\n  \'groupids\' => \'\',\n)','','','','0','0','0','1','0','0','0','0','19','0','0');
INSERT INTO `v9_model_field` VALUES('18','1','1','readpoint','阅读收费','','','0','5','','','readpoint','array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'99999\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','0','0','0','0','0','0','0','55','0','0');
INSERT INTO `v9_model_field` VALUES('19','1','1','relation','相关文章','','','0','0','','','omnipotent','array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"添加相关\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=content&c=content&a=public_relationlist&modelid={MODELID}\\\',\\\'添加相关文章\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"显示已有\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n)','','2,6,4,5,1,17,18,7','','0','0','0','0','0','0','1','0','15','0','0');
INSERT INTO `v9_model_field` VALUES('20','1','1','allow_comment','允许评论','','','0','0','','','box','array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'tinyint\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'1\',\n  \'filtertype\' => \'0\',\n)','','','','0','0','0','0','0','0','0','0','54','0','0');
INSERT INTO `v9_model_field` VALUES('21','1','1','copyfrom','来源','','','0','100','','','copyfrom','array (\n  \'defaultvalue\' => \'\',\n)','','','','0','0','0','1','0','1','0','0','8','0','0');
INSERT INTO `v9_model_field` VALUES('22','2','1','catid','栏目','','','1','6','/^[0-9]{1,6}$/','请选择栏目','catid','array (\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','1','0','1','1','1','0','0','1','0','0');
INSERT INTO `v9_model_field` VALUES('23','2','1','typeid','类别','','','0','0','','','typeid','array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)','','','','0','1','0','1','1','1','0','0','2','1','0');
INSERT INTO `v9_model_field` VALUES('24','2','1','title','标题','','inputtitle','1','80','','请输入标题','title','','','','','0','1','0','1','1','1','1','1','4','0','0');
INSERT INTO `v9_model_field` VALUES('25','2','1','keywords','关键词','多关键词之间用空格或者“,”隔开','','0','40','','','keyword','array (\r\n  \'size\' => \'100\',\r\n  \'defaultvalue\' => \'\',\r\n)','','-99','-99','0','1','0','1','1','1','1','0','7','0','0');
INSERT INTO `v9_model_field` VALUES('26','2','1','description','摘要','','','0','255','','','textarea','array (\r\n  \'width\' => \'98\',\r\n  \'height\' => \'46\',\r\n  \'defaultvalue\' => \'\',\r\n  \'enablehtml\' => \'0\',\r\n)','','','','0','1','0','1','0','1','1','1','10','0','0');
INSERT INTO `v9_model_field` VALUES('27','2','1','updatetime','更新时间','','','0','0','','','datetime','array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)','','','','1','1','0','1','0','0','0','0','12','0','0');
INSERT INTO `v9_model_field` VALUES('28','2','1','content','内容','<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">字符至内容摘要\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片\r\n</div>','','1','999999','','内容不能为空','editor','array (\n  \'toolbar\' => \'full\',\n  \'defaultvalue\' => \'\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'2\',\n  \'link_mode\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n  \'height\' => \'\',\n  \'disabled_page\' => \'1\',\n)','','','','0','0','0','1','0','1','1','0','13','0','0');
INSERT INTO `v9_model_field` VALUES('29','2','1','thumb','缩略图','','','0','100','','','image','array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)','','','','0','1','0','0','0','1','0','1','14','0','0');
INSERT INTO `v9_model_field` VALUES('30','2','1','relation','相关文章','','','0','0','','','omnipotent','array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"添加相关\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=content&c=content&a=public_relationlist&modelid={MODELID}\\\',\\\'添加相关文章\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"显示已有\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n)','','2,6,4,5,1,17,18,7','','0','0','0','0','0','0','1','0','15','0','0');
INSERT INTO `v9_model_field` VALUES('31','2','1','pages','分页方式','','','0','0','','','pages','','','-99','-99','0','0','0','1','0','0','0','0','16','1','0');
INSERT INTO `v9_model_field` VALUES('32','2','1','inputtime','发布时间','','','0','0','','','datetime','array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)','','','','0','1','0','0','0','0','0','1','17','0','0');
INSERT INTO `v9_model_field` VALUES('33','2','1','posids','推荐位','','','0','0','','','posid','array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)','','','','0','1','0','1','0','0','0','0','18','0','0');
INSERT INTO `v9_model_field` VALUES('34','2','1','groupids_view','阅读权限','','','0','0','','','groupid','array (\n  \'groupids\' => \'\',\n)','','','','0','0','0','1','0','0','0','0','19','0','0');
INSERT INTO `v9_model_field` VALUES('35','2','1','url','URL','','','0','100','','','text','','','','','1','1','0','1','0','0','0','0','50','0','0');
INSERT INTO `v9_model_field` VALUES('36','2','1','listorder','排序','','','0','6','','','number','','','','','1','1','0','1','0','0','0','0','51','0','0');
INSERT INTO `v9_model_field` VALUES('37','2','1','template','内容页模板','','','0','30','','','template','array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','0','0','0','0','0','0','0','53','0','0');
INSERT INTO `v9_model_field` VALUES('38','2','1','allow_comment','允许评论','','','0','0','','','box','array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'tinyint\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'1\',\n  \'filtertype\' => \'0\',\n)','','','','0','0','0','0','0','0','0','0','54','0','0');
INSERT INTO `v9_model_field` VALUES('39','2','1','status','状态','','','0','2','','','box','','','','','1','1','0','1','0','0','0','0','55','0','0');
INSERT INTO `v9_model_field` VALUES('40','2','1','readpoint','阅读收费','','','0','5','','','readpoint','array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'99999\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','0','0','0','0','0','0','0','55','0','0');
INSERT INTO `v9_model_field` VALUES('41','2','1','username','用户名','','','0','20','','','text','','','','','1','1','0','1','0','0','0','0','98','0','0');
INSERT INTO `v9_model_field` VALUES('42','2','1','downfiles','本地下载','','','0','0','','','downfiles','array (\n  \'upload_allowext\' => \'rar|zip\',\n  \'isselectimage\' => \'0\',\n  \'upload_number\' => \'10\',\n  \'downloadlink\' => \'1\',\n  \'downloadtype\' => \'1\',\n)','','','','0','0','0','1','0','1','0','0','8','0','0');
INSERT INTO `v9_model_field` VALUES('43','2','1','downfile','镜像下载','','','0','0','','','downfile','array (\n  \'downloadlink\' => \'1\',\n  \'downloadtype\' => \'1\',\n  \'upload_allowext\' => \'rar|zip\',\n  \'isselectimage\' => \'0\',\n  \'upload_number\' => \'1\',\n)','','','','0','0','0','1','0','1','0','0','9','0','0');
INSERT INTO `v9_model_field` VALUES('44','2','1','systems','软件平台','<select name=\'selectSystem\' onchange=\"ChangeInput(this,document.myform.systems,\'/\')\">\r\n	<option value=\'WinXP\'>WinXP</option>\r\n	<option value=\'Vista\'>Windows 7</option>\r\n	<option value=\'Win2000\'>Win2000</option>\r\n	<option value=\'Win2003\'>Win2003</option>\r\n	<option value=\'Unix\'>Unix</option>\r\n	<option value=\'Linux\'>Linux</option>\r\n	<option value=\'MacOS\'>MacOS</option>\r\n</select>','','0','100','','','text','array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'Win2000/WinXP/Win2003\',\n  \'ispassword\' => \'0\',\n)','','','','0','1','0','1','0','1','1','0','14','0','0');
INSERT INTO `v9_model_field` VALUES('45','2','1','copytype','软件授权形式','','','0','15','','','box','array (\n  \'options\' => \'免费版|免费版\r\n共享版|共享版\r\n试用版|试用版\r\n演示版|演示版\r\n注册版|注册版\r\n破解版|破解版\r\n零售版|零售版\r\nOEM版|OEM版\',\n  \'boxtype\' => \'select\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'cols\' => \'5\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'default_select_value\' => \'免费版\',\n)','','','','0','1','0','1','0','1','0','0','12','0','0');
INSERT INTO `v9_model_field` VALUES('46','2','1','language','软件语言','','','0','16','','','box','array (\n  \'options\' => \'英文|英文\r\n简体中文|简体中文\r\n繁体中文|繁体中文\r\n简繁中文|简繁中文\r\n多国语言|多国语言\r\n其他语言|其他语言\',\n  \'boxtype\' => \'select\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'cols\' => \'5\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'default_select_value\' => \'简体中文\',\n)','','','','0','1','0','1','0','1','0','0','13','0','0');
INSERT INTO `v9_model_field` VALUES('47','2','1','classtype','软件类型','','','0','20','','','box','array (\n  \'options\' => \'国产软件|国产软件\r\n国外软件|国外软件\r\n汉化补丁|汉化补丁\r\n程序源码|程序源码\r\n其他|其他\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'cols\' => \'5\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'default_select_value\' => \'国产软件\',\n)','','','','0','1','0','1','0','1','0','0','17','0','0');
INSERT INTO `v9_model_field` VALUES('48','2','1','version','版本号','','','0','20','','','text','array (\n  \'size\' => \'10\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)','','','','0','1','0','0','0','1','1','0','13','0','0');
INSERT INTO `v9_model_field` VALUES('49','2','1','filesize','文件大小','','','0','10','','','text','array (\n  \'size\' => \'10\',\n  \'defaultvalue\' => \'未知\',\n  \'ispassword\' => \'0\',\n)','','','','0','1','0','0','0','1','1','0','14','0','0');
INSERT INTO `v9_model_field` VALUES('50','2','1','stars','评分等级','','','0','20','','','box','array (\n  \'options\' => \'★☆☆☆☆|★☆☆☆☆\r\n★★☆☆☆|★★☆☆☆\r\n★★★☆☆|★★★☆☆\r\n★★★★☆|★★★★☆\r\n★★★★★|★★★★★\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'cols\' => \'5\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'default_select_value\' => \'★★★☆☆\',\n)','','','','0','1','0','1','0','1','0','0','17','0','0');
INSERT INTO `v9_model_field` VALUES('51','3','1','allow_comment','允许评论','','','0','0','','','box','array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'tinyint\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'1\',\n  \'filtertype\' => \'0\',\n)','','','','0','0','0','0','0','0','0','0','54','0','0');
INSERT INTO `v9_model_field` VALUES('52','3','1','template','内容页模板','','','0','30','','','template','array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','0','0','0','0','0','0','0','53','0','0');
INSERT INTO `v9_model_field` VALUES('53','3','1','url','URL','','','0','100','','','text','','','','','1','1','0','1','0','0','0','0','50','0','0');
INSERT INTO `v9_model_field` VALUES('54','3','1','listorder','排序','','','0','6','','','number','','','','','1','1','0','1','0','0','0','0','51','0','0');
INSERT INTO `v9_model_field` VALUES('55','3','1','posids','推荐位','','','0','0','','','posid','array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)','','','','0','1','0','1','0','0','0','0','18','0','0');
INSERT INTO `v9_model_field` VALUES('56','3','1','groupids_view','阅读权限','','','0','0','','','groupid','array (\n  \'groupids\' => \'\',\n)','','','','0','0','0','1','0','0','0','0','19','0','0');
INSERT INTO `v9_model_field` VALUES('57','3','1','inputtime','发布时间','','','0','0','','','datetime','array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)','','','','0','1','0','0','0','0','0','1','17','0','0');
INSERT INTO `v9_model_field` VALUES('58','3','1','pages','分页方式','','','0','0','','','pages','','','-99','-99','0','0','0','1','0','0','0','0','16','0','0');
INSERT INTO `v9_model_field` VALUES('59','3','1','relation','相关组图','','','0','0','','','omnipotent','array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"添加相关\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=content&c=content&a=public_relationlist&modelid={MODELID}\\\',\\\'添加相关文章\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"显示已有\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n)','','2,6,4,5,1,17,18,7','','0','0','0','0','0','0','1','0','15','0','0');
INSERT INTO `v9_model_field` VALUES('60','3','1','thumb','缩略图','','','0','100','','','image','array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)','','','','0','1','0','0','0','1','0','1','14','0','0');
INSERT INTO `v9_model_field` VALUES('61','3','1','content','内容','<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">字符至内容摘要\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片\r\n</div>','','0','999999','','','editor','array (\n  \'toolbar\' => \'full\',\n  \'defaultvalue\' => \'\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'2\',\n  \'link_mode\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n  \'height\' => \'\',\n  \'disabled_page\' => \'1\',\n)','','','','0','0','0','1','0','1','1','0','13','0','0');
INSERT INTO `v9_model_field` VALUES('62','3','1','updatetime','更新时间','','','0','0','','','datetime','array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)','','','','1','1','0','1','0','0','0','0','12','0','0');
INSERT INTO `v9_model_field` VALUES('63','3','1','description','摘要','','','0','255','','','textarea','array (\r\n  \'width\' => \'98\',\r\n  \'height\' => \'46\',\r\n  \'defaultvalue\' => \'\',\r\n  \'enablehtml\' => \'0\',\r\n)','','','','0','1','0','1','0','1','1','1','10','0','0');
INSERT INTO `v9_model_field` VALUES('64','3','1','title','标题','','inputtitle','1','80','','请输入标题','title','','','','','0','1','0','1','1','1','1','1','4','0','0');
INSERT INTO `v9_model_field` VALUES('65','3','1','keywords','关键词','多关键词之间用空格或者“,”隔开','','0','40','','','keyword','array (\r\n  \'size\' => \'100\',\r\n  \'defaultvalue\' => \'\',\r\n)','','-99','-99','0','1','0','1','1','1','1','0','7','0','0');
INSERT INTO `v9_model_field` VALUES('66','3','1','typeid','类别','','','0','0','','','typeid','array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)','','','','0','1','0','1','1','1','0','0','2','0','0');
INSERT INTO `v9_model_field` VALUES('67','3','1','catid','栏目','','','1','6','/^[0-9]{1,6}$/','请选择栏目','catid','array (\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','1','0','1','1','1','0','0','1','0','0');
INSERT INTO `v9_model_field` VALUES('68','3','1','status','状态','','','0','2','','','box','','','','','1','1','0','1','0','0','0','0','55','0','0');
INSERT INTO `v9_model_field` VALUES('69','3','1','readpoint','阅读收费','','','0','5','','','readpoint','array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'99999\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','0','0','0','0','0','0','0','55','0','0');
INSERT INTO `v9_model_field` VALUES('70','3','1','username','用户名','','','0','20','','','text','','','','','1','1','0','1','0','0','0','0','98','0','0');
INSERT INTO `v9_model_field` VALUES('71','3','1','pictureurls','组图','','','0','0','','','images','array (\n  \'upload_allowext\' => \'gif|jpg|jpeg|png|bmp\',\n  \'isselectimage\' => \'1\',\n  \'upload_number\' => \'50\',\n)','','','','0','0','0','1','0','1','0','0','15','0','0');
INSERT INTO `v9_model_field` VALUES('72','3','1','copyfrom','来源','','','0','0','','','copyfrom','array (\n  \'defaultvalue\' => \'\',\n)','','','','0','0','0','1','0','1','0','0','8','0','0');
INSERT INTO `v9_model_field` VALUES('73','1','1','islink','转向链接','','','0','0','','','islink','','','','','0','1','0','0','0','1','0','0','30','0','0');
INSERT INTO `v9_model_field` VALUES('74','2','1','islink','转向链接','','','0','0','','','islink','','','','','0','1','0','0','0','1','0','0','30','0','0');
INSERT INTO `v9_model_field` VALUES('75','3','1','islink','转向链接','','','0','0','','','islink','','','','','0','1','0','0','0','1','0','0','30','0','0');
INSERT INTO `v9_model_field` VALUES('80','1','1','username','用户名','','','0','20','','','text','','','','','1','1','0','1','0','0','0','0','98','0','0');
INSERT INTO `v9_model_field` VALUES('83','10','1','birthday','生日','','','0','0','','生日格式错误','datetime','array (\n  \'fieldtype\' => \'date\',\n  \'format\' => \'Y-m-d\',\n  \'defaulttype\' => \'0\',\n)','','','','0','0','0','0','0','1','1','0','0','0','0');
INSERT INTO `v9_model_field` VALUES('84','11','1','catid','栏目','','','1','6','/^[0-9]{1,6}$/','请选择栏目','catid','array (\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','1','0','1','1','1','0','0','1','0','0');
INSERT INTO `v9_model_field` VALUES('85','11','1','typeid','类别','','','0','0','','','typeid','array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)','','','','0','1','0','1','1','1','0','0','2','0','0');
INSERT INTO `v9_model_field` VALUES('86','11','1','title','标题','','inputtitle','1','80','','请输入标题','title','array (\n)','','','','0','1','0','1','1','1','1','1','4','0','0');
INSERT INTO `v9_model_field` VALUES('87','11','1','keywords','关键词','多关键词之间用空格或者“,”隔开','','0','40','','','keyword','array (\n  \'size\' => \'100\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','1','0','1','1','1','1','0','7','0','0');
INSERT INTO `v9_model_field` VALUES('88','11','1','description','摘要','','','0','255','','','textarea','array (\n  \'width\' => \'98\',\n  \'height\' => \'46\',\n  \'defaultvalue\' => \'\',\n  \'enablehtml\' => \'0\',\n)','','','','0','1','0','1','0','1','1','1','10','0','0');
INSERT INTO `v9_model_field` VALUES('89','11','1','updatetime','更新时间','','','0','0','','','datetime','array (\n  \'dateformat\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'1\',\n  \'defaultvalue\' => \'\',\n)','','','','1','1','0','1','0','0','0','0','12','0','0');
INSERT INTO `v9_model_field` VALUES('90','11','1','content','内容','<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">字符至内容摘要\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片\r\n</div>','','0','999999','','内容不能为空','editor','array (\n  \'toolbar\' => \'full\',\n  \'defaultvalue\' => \'\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'2\',\n  \'link_mode\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n  \'height\' => \'\',\n  \'disabled_page\' => \'0\',\n)','','','','0','0','0','1','0','1','1','0','13','0','0');
INSERT INTO `v9_model_field` VALUES('91','11','1','thumb','缩略图','','','0','100','','','image','array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)','','','','0','1','0','0','0','1','0','1','14','0','0');
INSERT INTO `v9_model_field` VALUES('92','11','1','relation','相关文章','','','0','0','','','omnipotent','array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"添加相关\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=content&c=content&a=public_relationlist&modelid={MODELID}\\\',\\\'添加相关文章\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"显示已有\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n)','','2,6,4,5,1,17,18,7','','0','0','0','0','0','0','1','0','15','0','0');
INSERT INTO `v9_model_field` VALUES('93','11','1','pages','分页方式','','','0','0','','','pages','array (\n)','','-99','-99','0','0','0','1','0','0','0','0','16','0','0');
INSERT INTO `v9_model_field` VALUES('94','11','1','inputtime','发布时间','','','0','0','','','datetime','array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)','','','','0','1','0','0','0','0','0','1','17','0','0');
INSERT INTO `v9_model_field` VALUES('95','11','1','posids','推荐位','','','0','0','','','posid','array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)','','','','0','1','0','1','0','0','0','0','18','0','0');
INSERT INTO `v9_model_field` VALUES('96','11','1','groupids_view','阅读权限','','','0','100','','','groupid','array (\n  \'groupids\' => \'\',\n)','','','','0','0','0','1','0','0','0','0','19','0','0');
INSERT INTO `v9_model_field` VALUES('97','11','1','url','URL','','','0','100','','','text','array (\n)','','','','1','1','0','1','0','0','0','0','50','0','0');
INSERT INTO `v9_model_field` VALUES('98','11','1','listorder','排序','','','0','6','','','number','array (\n)','','','','1','1','0','1','0','0','0','0','51','0','0');
INSERT INTO `v9_model_field` VALUES('99','11','1','template','内容页模板','','','0','30','','','template','array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','0','0','0','0','0','0','0','53','0','0');
INSERT INTO `v9_model_field` VALUES('100','11','1','allow_comment','允许评论','','','0','0','','','box','array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'tinyint\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'0\',\n)','','','','0','0','0','0','0','0','0','0','54','0','0');
INSERT INTO `v9_model_field` VALUES('101','11','1','status','状态','','','0','2','','','box','array (\n)','','','','1','1','0','1','0','0','0','0','55','0','0');
INSERT INTO `v9_model_field` VALUES('102','11','1','readpoint','阅读收费','','','0','5','','','readpoint','array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'99999\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','0','0','0','0','0','0','0','55','0','0');
INSERT INTO `v9_model_field` VALUES('103','11','1','username','用户名','','','0','20','','','text','array (\n)','','','','1','1','0','1','0','0','0','0','98','0','0');
INSERT INTO `v9_model_field` VALUES('104','11','1','islink','转向链接','','','0','0','','','islink','array (\n)','','','','0','1','0','1','0','1','0','0','20','0','0');
INSERT INTO `v9_model_field` VALUES('105','11','1','video','视频上传','','','0','0','','','video','array (\n  \'upload_allowext\' => \'flv|rm|mp4|rmv\',\n)','','','','0','0','0','1','0','1','0','0','8','0','0');
INSERT INTO `v9_model_field` VALUES('106','11','1','vision','画质','','','0','0','','','box','array (\n  \'options\' => \'高清|1\r\n普通|2\',\n  \'boxtype\' => \'select\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'0\',\n  \'outputtype\' => \'1\',\n  \'filtertype\' => \'1\',\n)','','','','0','1','0','1','0','1','0','0','9','0','0');
INSERT INTO `v9_model_field` VALUES('107','11','1','video_category','视频分类','','','0','0','','','box','array (\n  \'options\' => \'喜剧|1\r\n爱情|2\r\n科幻|3\r\n剧情|4\r\n动作|5\r\n伦理|6\',\n  \'boxtype\' => \'select\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'1\',\n  \'filtertype\' => \'1\',\n)','','','','0','1','0','1','0','1','0','0','9','0','0');
INSERT INTO `v9_model_field` VALUES('108','12','1','catid','栏目','','','1','6','/^[0-9]{1,6}$/','请选择栏目','catid','array (\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','1','0','1','1','1','0','0','1','0','0');
INSERT INTO `v9_model_field` VALUES('109','12','1','typeid','类别','','','0','0','','','typeid','array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)','','','','0','1','0','1','1','1','0','0','2','1','0');
INSERT INTO `v9_model_field` VALUES('110','12','1','title','标题','','inputtitle','1','80','','请输入标题','title','','','','','0','1','0','1','1','1','1','1','4','0','0');
INSERT INTO `v9_model_field` VALUES('111','12','1','keywords','关键词','多关键词之间用空格或者“,”隔开','','0','40','','','keyword','array (\r\n  \'size\' => \'100\',\r\n  \'defaultvalue\' => \'\',\r\n)','','-99','-99','0','1','0','1','1','1','1','0','7','1','0');
INSERT INTO `v9_model_field` VALUES('112','12','1','description','摘要','','','0','255','','','textarea','array (\r\n  \'width\' => \'98\',\r\n  \'height\' => \'46\',\r\n  \'defaultvalue\' => \'\',\r\n  \'enablehtml\' => \'0\',\r\n)','','','','0','1','0','1','0','1','1','1','10','1','0');
INSERT INTO `v9_model_field` VALUES('113','12','1','updatetime','更新时间','','','0','0','','','datetime','array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)','','','','1','1','0','1','0','0','0','0','12','0','0');
INSERT INTO `v9_model_field` VALUES('114','12','1','content','内容','<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">字符至内容摘要\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片\r\n</div>','','1','999999','','内容不能为空','editor','array (\n  \'toolbar\' => \'full\',\n  \'defaultvalue\' => \'\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'2\',\n  \'link_mode\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n)','','','','0','0','0','1','0','1','1','0','13','0','0');
INSERT INTO `v9_model_field` VALUES('115','12','1','thumb','缩略图','','','0','100','','','image','array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)','','','','0','1','0','0','0','1','0','1','14','1','0');
INSERT INTO `v9_model_field` VALUES('116','12','1','relation','相关文章','','','0','0','','','omnipotent','array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"添加相关\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=content&c=content&a=public_relationlist&modelid={MODELID}\\\',\\\'添加相关文章\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"显示已有\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n)','','2,6,4,5,1,17,18,7','','0','0','0','0','0','0','1','0','15','1','0');
INSERT INTO `v9_model_field` VALUES('117','12','1','pages','分页方式','','','0','0','','','pages','','','-99','-99','0','0','0','1','0','0','0','0','16','1','0');
INSERT INTO `v9_model_field` VALUES('118','12','1','inputtime','发布时间','','','0','0','','','datetime','array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)','','','','0','1','0','0','0','0','0','1','17','0','0');
INSERT INTO `v9_model_field` VALUES('119','12','1','posids','推荐位','','','0','0','','','posid','array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)','','','','0','1','0','1','0','0','0','0','18','1','0');
INSERT INTO `v9_model_field` VALUES('120','12','1','groupids_view','阅读权限','','','0','100','','','groupid','array (\n  \'groupids\' => \'\',\n)','','','','0','0','0','1','0','0','0','0','19','1','0');
INSERT INTO `v9_model_field` VALUES('121','12','1','url','URL','','','0','100','','','text','','','','','1','1','0','1','0','0','0','0','50','0','0');
INSERT INTO `v9_model_field` VALUES('122','12','1','listorder','排序','','','0','6','','','number','','','','','1','1','0','1','0','0','0','0','51','0','0');
INSERT INTO `v9_model_field` VALUES('123','12','1','template','内容页模板','','','0','30','','','template','array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','0','0','0','0','0','0','0','53','0','0');
INSERT INTO `v9_model_field` VALUES('124','12','1','allow_comment','允许评论','','','0','0','','','box','array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'tinyint\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'0\',\n)','','','','0','0','0','0','0','0','0','0','54','1','0');
INSERT INTO `v9_model_field` VALUES('125','12','1','status','状态','','','0','2','','','box','','','','','1','1','0','1','0','0','0','0','55','0','0');
INSERT INTO `v9_model_field` VALUES('126','12','1','readpoint','阅读收费','','','0','5','','','readpoint','array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'99999\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','0','0','0','0','0','0','0','55','1','0');
INSERT INTO `v9_model_field` VALUES('127','12','1','username','用户名','','','0','20','','','text','','','','','1','1','0','1','0','0','0','0','98','0','0');
INSERT INTO `v9_model_field` VALUES('128','12','1','islink','转向链接','','','0','0','','','islink','','','','','0','1','0','1','0','1','0','0','20','1','0');
INSERT INTO `v9_model_field` VALUES('129','12','1','year','年','','','0','0','','','box','{\"options\":\"2000|2000\\r\\n2001|2001\\r\\n2002|2002\\r\\n2003|2003\\r\\n2004|2004\\r\\n2005|2005\\r\\n2006|2006\\r\\n2007|2007\\r\\n2008|2008\\r\\n2009|2009\\r\\n2010|2010\\r\\n2011|2011\\r\\n2012|2012\\r\\n2013|2013\\r\\n2014|2014\\r\\n2015|2015\\r\\n2016|2016\\r\\n2017|2017\\r\\n2018|2018\\r\\n2019|2019\\r\\n2020|2020\\r\\n2021|2021\\r\\n2022|2022\\r\\n2023|2023\\r\\n2024|2024\\r\\n2025|2025\\r\\n2026|2026\\r\\n2027|2027\\r\\n2028|2028\\r\\n2029|2029\\r\\n2030|2030\\r\\n2031|2031\\r\\n2032|2032\\r\\n2033|2033\\r\\n2034|2034\\r\\n2035|2035\\r\\n2036|2036\\r\\n2037|2037\\r\\n2038|2038\\r\\n2039|2039\\r\\n2040|2040\\r\\n2041|2041\\r\\n2042|2042\\r\\n2043|2043\\r\\n2044|2044\\r\\n2045|2045\\r\\n2046|2046\\r\\n2047|2047\\r\\n2048|2048\\r\\n2049|2049\\r\\n2050|2050\\r\\n2051|2051\\r\\n2052|2052\\r\\n2053|2053\\r\\n2054|2054\\r\\n2055|2055\\r\\n2056|2056\\r\\n2057|2057\\r\\n2058|2058\\r\\n2059|2059\",\"boxtype\":\"select\",\"fieldtype\":\"varchar\",\"minnumber\":\"1\",\"width\":\"80\",\"size\":\"1\",\"defaultvalue\":\"2018\",\"outputtype\":\"1\"}','','','','0','0','0','1','0','1','0','0','1','0','0');
INSERT INTO `v9_model_field` VALUES('130','12','1','month','月','','','0','0','','','box','{\"options\":\"1|1\\r\\n2|2\\r\\n3|3\\r\\n4|4\\r\\n5|5\\r\\n6|6\\r\\n7|7\\r\\n8|8\\r\\n9|9\\r\\n10|10\\r\\n11|11\\r\\n12|12\",\"boxtype\":\"select\",\"fieldtype\":\"varchar\",\"minnumber\":\"1\",\"width\":\"80\",\"size\":\"1\",\"defaultvalue\":\"01\",\"outputtype\":\"1\"}','','','','0','0','0','1','0','1','0','0','2','0','0');
INSERT INTO `v9_model_field` VALUES('131','12','1','isbiaoliang','标亮','','','0','0','','','box','{\"options\":\"\\u662f|1\\r\\n\\u5426|0\",\"boxtype\":\"radio\",\"fieldtype\":\"varchar\",\"minnumber\":\"1\",\"width\":\"80\",\"size\":\"1\",\"defaultvalue\":\"0\",\"outputtype\":\"1\"}','','','','0','0','0','1','0','1','0','0','5','0','0');
INSERT INTO `v9_model_field` VALUES('132','13','1','catid','栏目','','','1','6','/^[0-9]{1,6}$/','请选择栏目','catid','array (\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','1','0','1','1','1','0','0','1','0','0');
INSERT INTO `v9_model_field` VALUES('133','13','1','typeid','类别','','','0','0','','','typeid','array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)','','','','0','1','0','1','1','1','0','0','2','0','0');
INSERT INTO `v9_model_field` VALUES('134','13','1','title','标题','','inputtitle','1','80','','请输入标题','title','','','','','0','1','0','1','1','1','1','1','4','0','0');
INSERT INTO `v9_model_field` VALUES('135','13','1','keywords','关键词','多关键词之间用空格或者“,”隔开','','0','40','','','keyword','array (\r\n  \'size\' => \'100\',\r\n  \'defaultvalue\' => \'\',\r\n)','','-99','-99','0','1','0','1','1','1','1','0','7','0','0');
INSERT INTO `v9_model_field` VALUES('136','13','1','description','摘要','','','0','255','','','textarea','array (\r\n  \'width\' => \'98\',\r\n  \'height\' => \'46\',\r\n  \'defaultvalue\' => \'\',\r\n  \'enablehtml\' => \'0\',\r\n)','','','','0','1','0','1','0','1','1','1','10','0','0');
INSERT INTO `v9_model_field` VALUES('137','13','1','updatetime','更新时间','','','0','0','','','datetime','array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)','','','','1','1','0','1','0','0','0','0','12','0','0');
INSERT INTO `v9_model_field` VALUES('138','13','1','content','内容','<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">字符至内容摘要\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片\r\n</div>','','1','999999','','内容不能为空','editor','array (\n  \'toolbar\' => \'full\',\n  \'defaultvalue\' => \'\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'2\',\n  \'link_mode\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n)','','','','0','0','0','1','0','1','1','0','13','0','0');
INSERT INTO `v9_model_field` VALUES('139','13','1','thumb','缩略图','','','0','100','','','image','array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)','','','','0','1','0','0','0','1','0','1','14','0','0');
INSERT INTO `v9_model_field` VALUES('140','13','1','relation','相关文章','','','0','0','','','omnipotent','array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"添加相关\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=content&c=content&a=public_relationlist&modelid={MODELID}\\\',\\\'添加相关文章\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"显示已有\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n)','','2,6,4,5,1,17,18,7','','0','0','0','0','0','0','1','0','15','1','0');
INSERT INTO `v9_model_field` VALUES('141','13','1','pages','分页方式','','','0','0','','','pages','','','-99','-99','0','0','0','1','0','0','0','0','16','0','0');
INSERT INTO `v9_model_field` VALUES('142','13','1','inputtime','发布时间','','','0','0','','','datetime','array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)','','','','0','1','0','0','0','0','0','1','17','0','0');
INSERT INTO `v9_model_field` VALUES('143','13','1','posids','推荐位','','','0','0','','','posid','array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)','','','','0','1','0','1','0','0','0','0','18','1','0');
INSERT INTO `v9_model_field` VALUES('144','13','1','groupids_view','阅读权限','','','0','100','','','groupid','array (\n  \'groupids\' => \'\',\n)','','','','0','0','0','1','0','0','0','0','19','1','0');
INSERT INTO `v9_model_field` VALUES('145','13','1','url','URL','','','0','100','','','text','','','','','1','1','0','1','0','0','0','0','50','0','0');
INSERT INTO `v9_model_field` VALUES('146','13','1','listorder','排序','','','0','6','','','number','','','','','1','1','0','1','0','0','0','0','51','0','0');
INSERT INTO `v9_model_field` VALUES('147','13','1','template','内容页模板','','','0','30','','','template','array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','0','0','0','0','0','0','0','53','0','0');
INSERT INTO `v9_model_field` VALUES('148','13','1','allow_comment','允许评论','','','0','0','','','box','array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'tinyint\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'0\',\n)','','','','0','0','0','0','0','0','0','0','54','1','0');
INSERT INTO `v9_model_field` VALUES('149','13','1','status','状态','','','0','2','','','box','','','','','1','1','0','1','0','0','0','0','55','0','0');
INSERT INTO `v9_model_field` VALUES('150','13','1','readpoint','阅读收费','','','0','5','','','readpoint','array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'99999\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','0','0','0','0','0','0','0','55','1','0');
INSERT INTO `v9_model_field` VALUES('151','13','1','username','用户名','','','0','20','','','text','','','','','1','1','0','1','0','0','0','0','98','0','0');
INSERT INTO `v9_model_field` VALUES('152','13','1','islink','转向链接','','','0','0','','','islink','','','','','0','1','0','1','0','1','0','0','20','1','0');
INSERT INTO `v9_model_field` VALUES('153','14','1','catid','栏目','','','1','6','/^[0-9]{1,6}$/','请选择栏目','catid','array (\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','1','0','1','1','1','0','0','1','0','0');
INSERT INTO `v9_model_field` VALUES('154','14','1','typeid','类别','','','0','0','','','typeid','array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)','','','','0','1','0','1','1','1','0','0','2','1','0');
INSERT INTO `v9_model_field` VALUES('155','14','1','title','标题','','inputtitle','1','80','','请输入标题','title','','','','','0','1','0','1','1','1','1','1','4','0','0');
INSERT INTO `v9_model_field` VALUES('156','14','1','keywords','关键词','多关键词之间用空格或者“,”隔开','','0','40','','','keyword','array (\r\n  \'size\' => \'100\',\r\n  \'defaultvalue\' => \'\',\r\n)','','-99','-99','0','1','0','1','1','1','1','0','7','1','0');
INSERT INTO `v9_model_field` VALUES('157','14','1','description','摘要','','','0','255','','','textarea','array (\r\n  \'width\' => \'98\',\r\n  \'height\' => \'46\',\r\n  \'defaultvalue\' => \'\',\r\n  \'enablehtml\' => \'0\',\r\n)','','','','0','1','0','1','0','1','1','1','10','1','0');
INSERT INTO `v9_model_field` VALUES('158','14','1','updatetime','更新时间','','','0','0','','','datetime','array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)','','','','1','1','0','1','0','0','0','0','12','0','0');
INSERT INTO `v9_model_field` VALUES('159','14','1','content','内容','<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">字符至内容摘要\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片\r\n</div>','','1','999999','','内容不能为空','editor','array (\n  \'toolbar\' => \'full\',\n  \'defaultvalue\' => \'\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'2\',\n  \'link_mode\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n)','','','','0','0','0','1','0','1','1','0','13','1','0');
INSERT INTO `v9_model_field` VALUES('160','14','1','thumb','缩略图','','','0','100','','','image','array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)','','','','0','1','0','0','0','1','0','1','14','1','0');
INSERT INTO `v9_model_field` VALUES('161','14','1','relation','相关文章','','','0','0','','','omnipotent','array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"添加相关\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=content&c=content&a=public_relationlist&modelid={MODELID}\\\',\\\'添加相关文章\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"显示已有\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n)','','2,6,4,5,1,17,18,7','','0','0','0','0','0','0','1','0','15','1','0');
INSERT INTO `v9_model_field` VALUES('162','14','1','pages','分页方式','','','0','0','','','pages','','','-99','-99','0','0','0','1','0','0','0','0','16','0','0');
INSERT INTO `v9_model_field` VALUES('163','14','1','inputtime','发布时间','','','0','0','','','datetime','array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)','','','','0','1','0','0','0','0','0','1','17','0','0');
INSERT INTO `v9_model_field` VALUES('164','14','1','posids','推荐位','','','0','0','','','posid','array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)','','','','0','1','0','1','0','0','0','0','18','1','0');
INSERT INTO `v9_model_field` VALUES('165','14','1','groupids_view','阅读权限','','','0','100','','','groupid','array (\n  \'groupids\' => \'\',\n)','','','','0','0','0','1','0','0','0','0','19','1','0');
INSERT INTO `v9_model_field` VALUES('166','14','1','url','URL','','','0','100','','','text','','','','','1','1','0','1','0','0','0','0','50','0','0');
INSERT INTO `v9_model_field` VALUES('167','14','1','listorder','排序','','','0','6','','','number','','','','','1','1','0','1','0','0','0','0','51','0','0');
INSERT INTO `v9_model_field` VALUES('168','14','1','template','内容页模板','','','0','30','','','template','array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','0','0','0','0','0','0','0','53','0','0');
INSERT INTO `v9_model_field` VALUES('169','14','1','allow_comment','允许评论','','','0','0','','','box','array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'tinyint\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'0\',\n)','','','','0','0','0','0','0','0','0','0','54','1','0');
INSERT INTO `v9_model_field` VALUES('170','14','1','status','状态','','','0','2','','','box','','','','','1','1','0','1','0','0','0','0','55','0','0');
INSERT INTO `v9_model_field` VALUES('171','14','1','readpoint','阅读收费','','','0','5','','','readpoint','array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'99999\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','0','0','0','0','0','0','0','55','1','0');
INSERT INTO `v9_model_field` VALUES('172','14','1','username','用户名','','','0','20','','','text','','','','','1','1','0','1','0','0','0','0','98','0','0');
INSERT INTO `v9_model_field` VALUES('173','14','1','islink','转向链接','','','0','0','','','islink','','','','','0','1','0','1','0','1','0','0','20','1','0');
INSERT INTO `v9_model_field` VALUES('174','14','1','zwlb','职位类别','','','0','0','','','text','{\"size\":\"50\",\"defaultvalue\":\"\",\"ispassword\":\"0\"}','','','','0','0','0','1','0','1','1','0','0','0','0');
INSERT INTO `v9_model_field` VALUES('175','14','1','address','职位地点','','','0','0','','','textarea','{\"width\":\"100\",\"height\":\"46\",\"defaultvalue\":\"\",\"enablehtml\":\"0\"}','','','','0','0','0','1','0','1','1','0','0','0','0');
INSERT INTO `v9_model_field` VALUES('176','15','1','catid','栏目','','','1','6','/^[0-9]{1,6}$/','请选择栏目','catid','array (\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','1','0','1','1','1','0','0','1','0','0');
INSERT INTO `v9_model_field` VALUES('177','15','1','typeid','类别','','','0','0','','','typeid','array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)','','','','0','1','0','1','1','1','0','0','2','1','0');
INSERT INTO `v9_model_field` VALUES('178','15','1','title','标题','','inputtitle','1','80','','请输入标题','title','','','','','0','1','0','1','1','1','1','1','4','0','0');
INSERT INTO `v9_model_field` VALUES('179','15','1','keywords','关键词','多关键词之间用空格或者“,”隔开','','0','40','','','keyword','array (\r\n  \'size\' => \'100\',\r\n  \'defaultvalue\' => \'\',\r\n)','','-99','-99','0','1','0','1','1','1','1','0','7','0','0');
INSERT INTO `v9_model_field` VALUES('180','15','1','description','摘要','','','0','255','','','textarea','array (\r\n  \'width\' => \'98\',\r\n  \'height\' => \'46\',\r\n  \'defaultvalue\' => \'\',\r\n  \'enablehtml\' => \'0\',\r\n)','','','','0','1','0','1','0','1','1','1','10','0','0');
INSERT INTO `v9_model_field` VALUES('181','15','1','updatetime','更新时间','','','0','0','','','datetime','array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)','','','','1','1','0','1','0','0','0','0','12','0','0');
INSERT INTO `v9_model_field` VALUES('182','15','1','content1','内容','<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">字符至内容摘要\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片\r\n</div>','','1','999999','','内容不能为空','editor','{\"toolbar\":\"full\",\"defaultvalue\":\"\",\"enablekeylink\":\"1\",\"replacenum\":\"2\",\"link_mode\":\"0\",\"enablesaveimage\":\"1\",\"height\":\"\",\"disabled_page\":\"0\"}','','','','0','0','0','1','0','1','1','0','13','0','0');
INSERT INTO `v9_model_field` VALUES('183','15','1','thumb','缩略图','','','0','100','','','image','array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)','','','','0','1','0','0','0','1','0','1','14','0','0');
INSERT INTO `v9_model_field` VALUES('184','15','1','relation','相关文章','','','0','0','','','omnipotent','array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"添加相关\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=content&c=content&a=public_relationlist&modelid={MODELID}\\\',\\\'添加相关文章\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"显示已有\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n)','','2,6,4,5,1,17,18,7','','0','0','0','0','0','0','1','0','15','1','0');
INSERT INTO `v9_model_field` VALUES('185','15','1','pages','分页方式','','','0','0','','','pages','','','-99','-99','0','0','0','1','0','0','0','0','16','0','0');
INSERT INTO `v9_model_field` VALUES('186','15','1','inputtime','发布时间','','','0','0','','','datetime','array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)','','','','0','1','0','0','0','0','0','1','17','0','0');
INSERT INTO `v9_model_field` VALUES('187','15','1','posids','推荐位','','','0','0','','','posid','array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)','','','','0','1','0','1','0','0','0','0','18','1','0');
INSERT INTO `v9_model_field` VALUES('188','15','1','groupids_view','阅读权限','','','0','100','','','groupid','array (\n  \'groupids\' => \'\',\n)','','','','0','0','0','1','0','0','0','0','19','1','0');
INSERT INTO `v9_model_field` VALUES('189','15','1','url','URL','','','0','100','','','text','','','','','1','1','0','1','0','0','0','0','50','0','0');
INSERT INTO `v9_model_field` VALUES('190','15','1','listorder','排序','','','0','6','','','number','','','','','1','1','0','1','0','0','0','0','51','0','0');
INSERT INTO `v9_model_field` VALUES('191','15','1','template','内容页模板','','','0','30','','','template','array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','0','0','0','0','0','0','0','53','0','0');
INSERT INTO `v9_model_field` VALUES('192','15','1','allow_comment','允许评论','','','0','0','','','box','array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'tinyint\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'0\',\n)','','','','0','0','0','0','0','0','0','0','54','1','0');
INSERT INTO `v9_model_field` VALUES('193','15','1','status','状态','','','0','2','','','box','','','','','1','1','0','1','0','0','0','0','55','0','0');
INSERT INTO `v9_model_field` VALUES('194','15','1','readpoint','阅读收费','','','0','5','','','readpoint','array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'99999\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','0','0','0','0','0','0','0','55','1','0');
INSERT INTO `v9_model_field` VALUES('195','15','1','username','用户名','','','0','20','','','text','','','','','1','1','0','1','0','0','0','0','98','0','0');
INSERT INTO `v9_model_field` VALUES('196','15','1','islink','转向链接','','','0','0','','','islink','','','','','0','1','0','1','0','1','0','0','20','1','0');
INSERT INTO `v9_model_field` VALUES('197','15','1','content2','项目成果','','','0','0','','','editor','{\"toolbar\":\"full\",\"defaultvalue\":\"\",\"enablekeylink\":\"0\",\"replacenum\":\"1\",\"link_mode\":\"0\",\"enablesaveimage\":\"0\",\"height\":\"200\",\"disabled_page\":\"0\"}','','','','0','0','0','1','0','1','1','0','13','0','0');
INSERT INTO `v9_model_field` VALUES('198','15','1','content3','营销玩法 & 优势','','','0','0','','','editor','{\"toolbar\":\"full\",\"defaultvalue\":\"\",\"enablekeylink\":\"0\",\"replacenum\":\"1\",\"link_mode\":\"0\",\"enablesaveimage\":\"0\",\"height\":\"200\",\"disabled_page\":\"0\"}','','','','0','0','0','1','0','1','1','0','13','0','0');
INSERT INTO `v9_model_field` VALUES('200','15','1','fmsl','赋码数量','','','0','0','','','text','{\"size\":\"20\",\"defaultvalue\":\"\",\"ispassword\":\"0\"}','','','','0','0','0','1','0','1','1','0','6','0','0');
INSERT INTO `v9_model_field` VALUES('201','15','1','sxtime','上线时间','','','0','0','','','text','{\"size\":\"50\",\"defaultvalue\":\"\",\"ispassword\":\"0\"}','','','','0','0','0','1','0','1','1','0','5','0','0');
INSERT INTO `v9_model_field` VALUES('202','15','1','xmneed','项目需求','','','0','0','','','text','{\"size\":\"50\",\"defaultvalue\":\"\",\"ispassword\":\"0\"}','','','','0','0','0','1','0','1','1','0','7','0','0');
INSERT INTO `v9_model_field` VALUES('203','15','1','sxgn','实现功能','','','0','0','','','text','{\"size\":\"50\",\"defaultvalue\":\"\",\"ispassword\":\"0\"}','','','','0','0','0','1','0','1','1','0','7','0','0');
INSERT INTO `v9_model_field` VALUES('204','15','1','toppic','顶部图片','','','0','0','','','image','{\"size\":\"\",\"defaultvalue\":\"\",\"show_type\":\"0\",\"upload_allowext\":\"gif|jpg|jpeg|png|bmp\",\"watermark\":\"0\",\"isselectimage\":\"1\",\"images_width\":\"\",\"images_height\":\"\"}','','','','0','0','0','1','0','1','0','0','4','0','0');
INSERT INTO `v9_model_field` VALUES('205','16','1','catid','栏目','','','1','6','/^[0-9]{1,6}$/','请选择栏目','catid','array (\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','1','0','1','1','1','0','0','1','0','0');
INSERT INTO `v9_model_field` VALUES('206','16','1','typeid','类别','','','0','0','','','typeid','array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)','','','','0','1','0','1','1','1','0','0','2','1','0');
INSERT INTO `v9_model_field` VALUES('207','16','1','title','标题','','inputtitle','1','80','','请输入标题','title','','','','','0','1','0','1','1','1','1','1','4','0','0');
INSERT INTO `v9_model_field` VALUES('208','16','1','keywords','关键词','多关键词之间用空格或者“,”隔开','','0','40','','','keyword','array (\r\n  \'size\' => \'100\',\r\n  \'defaultvalue\' => \'\',\r\n)','','-99','-99','0','1','0','1','1','1','1','0','7','1','0');
INSERT INTO `v9_model_field` VALUES('209','16','1','description','摘要','','','0','255','','','textarea','array (\r\n  \'width\' => \'98\',\r\n  \'height\' => \'46\',\r\n  \'defaultvalue\' => \'\',\r\n  \'enablehtml\' => \'0\',\r\n)','','','','0','1','0','1','0','1','1','1','10','1','0');
INSERT INTO `v9_model_field` VALUES('210','16','1','updatetime','更新时间','','','0','0','','','datetime','array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)','','','','1','1','0','1','0','0','0','0','12','0','0');
INSERT INTO `v9_model_field` VALUES('211','16','1','content','内容','<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">字符至内容摘要\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片\r\n</div>','','1','999999','','内容不能为空','editor','array (\n  \'toolbar\' => \'full\',\n  \'defaultvalue\' => \'\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'2\',\n  \'link_mode\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n)','','','','0','0','0','1','0','1','1','0','13','0','0');
INSERT INTO `v9_model_field` VALUES('212','16','1','thumb','缩略图','','','0','100','','','image','array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)','','','','0','1','0','0','0','1','0','1','14','1','0');
INSERT INTO `v9_model_field` VALUES('213','16','1','relation','相关文章','','','0','0','','','omnipotent','array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"添加相关\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=content&c=content&a=public_relationlist&modelid={MODELID}\\\',\\\'添加相关文章\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"显示已有\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n)','','2,6,4,5,1,17,18,7','','0','0','0','0','0','0','1','0','15','1','0');
INSERT INTO `v9_model_field` VALUES('214','16','1','pages','分页方式','','','0','0','','','pages','','','-99','-99','0','0','0','1','0','0','0','0','16','1','0');
INSERT INTO `v9_model_field` VALUES('215','16','1','inputtime','发布时间','','','0','0','','','datetime','array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)','','','','0','1','0','0','0','0','0','1','17','0','0');
INSERT INTO `v9_model_field` VALUES('216','16','1','posids','推荐位','','','0','0','','','posid','array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)','','','','0','1','0','1','0','0','0','0','18','1','0');
INSERT INTO `v9_model_field` VALUES('217','16','1','groupids_view','阅读权限','','','0','100','','','groupid','array (\n  \'groupids\' => \'\',\n)','','','','0','0','0','1','0','0','0','0','19','1','0');
INSERT INTO `v9_model_field` VALUES('218','16','1','url','URL','','','0','100','','','text','','','','','1','1','0','1','0','0','0','0','50','0','0');
INSERT INTO `v9_model_field` VALUES('219','16','1','listorder','排序','','','0','6','','','number','','','','','1','1','0','1','0','0','0','0','51','0','0');
INSERT INTO `v9_model_field` VALUES('220','16','1','template','内容页模板','','','0','30','','','template','array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','0','0','0','0','0','0','0','53','0','0');
INSERT INTO `v9_model_field` VALUES('221','16','1','allow_comment','允许评论','','','0','0','','','box','array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'tinyint\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'0\',\n)','','','','0','0','0','0','0','0','0','0','54','1','0');
INSERT INTO `v9_model_field` VALUES('222','16','1','status','状态','','','0','2','','','box','','','','','1','1','0','1','0','0','0','0','55','0','0');
INSERT INTO `v9_model_field` VALUES('223','16','1','readpoint','阅读收费','','','0','5','','','readpoint','array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'99999\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','0','0','0','0','0','0','0','55','1','0');
INSERT INTO `v9_model_field` VALUES('224','16','1','username','用户名','','','0','20','','','text','','','','','1','1','0','1','0','0','0','0','98','0','0');
INSERT INTO `v9_model_field` VALUES('225','16','1','islink','转向链接','','','0','0','','','islink','','','','','0','1','0','1','0','1','0','0','20','1','0');
INSERT INTO `v9_model_field` VALUES('226','16','1','jttp','静态图','','','0','0','','','image','{\"size\":\"\",\"defaultvalue\":\"\",\"show_type\":\"0\",\"upload_allowext\":\"gif|jpg|jpeg|png|bmp\",\"watermark\":\"0\",\"isselectimage\":\"1\",\"images_width\":\"\",\"images_height\":\"\"}','','','','0','0','0','1','0','1','0','0','5','0','0');
INSERT INTO `v9_model_field` VALUES('227','16','1','dtimage','动态图','','','0','0','','','image','{\"size\":\"\",\"defaultvalue\":\"\",\"show_type\":\"0\",\"upload_allowext\":\"gif|jpg|jpeg|png|bmp\",\"watermark\":\"0\",\"isselectimage\":\"1\",\"images_width\":\"\",\"images_height\":\"\"}','','','','0','0','0','1','0','1','0','0','5','0','0');

DROP TABLE IF EXISTS `v9_module`;
CREATE TABLE `v9_module` (
  `module` varchar(15) NOT NULL,
  `name` varchar(20) NOT NULL,
  `url` varchar(50) NOT NULL,
  `iscore` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `version` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL,
  `setting` mediumtext NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `installdate` date NOT NULL DEFAULT '0000-00-00',
  `updatedate` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO `v9_module` VALUES('admin','admin','','1','1.0','','array (\n  \'admin_email\' => \'phpcms@phpcms.cn\',\n  \'adminaccessip\' => \'0\',\n  \'maxloginfailedtimes\' => \'8\',\n  \'maxiplockedtime\' => \'15\',\n  \'minrefreshtime\' => \'2\',\n  \'mail_type\' => \'1\',\n  \'mail_server\' => \'smtp.qq.com\',\n  \'mail_port\' => \'25\',\n  \'mail_user\' => \'phpcms.cn@foxmail.com\',\n  \'mail_auth\' => \'1\',\n  \'mail_from\' => \'phpcms.cn@foxmail.com\',\n  \'mail_password\' => \'\',\n  \'errorlog_size\' => \'20\',\n)','0','0','2010-10-18','2010-10-18');
INSERT INTO `v9_module` VALUES('announce','公告','announce/','0','1.0','公告','','0','0','2018-04-14','2018-04-14');
INSERT INTO `v9_module` VALUES('attachment','附件','attachment','1','1.0','','','0','0','2010-09-01','2010-09-06');
INSERT INTO `v9_module` VALUES('block','碎片','','1','1.0','','','0','0','2010-09-01','2010-09-06');
INSERT INTO `v9_module` VALUES('collection','采集模块','collection','1','1.0','','','0','0','2010-09-01','2010-09-06');
INSERT INTO `v9_module` VALUES('comment','评论','comment/','0','1.0','评论','','0','0','2018-04-14','2018-04-14');
INSERT INTO `v9_module` VALUES('content','内容模块','','1','1.0','','','0','0','2010-09-06','2010-09-06');
INSERT INTO `v9_module` VALUES('dbsource','数据源','','1','','','','0','0','2010-09-01','2010-09-06');
INSERT INTO `v9_module` VALUES('digg','顶一下','','0','1.0','','','0','0','2010-09-06','2010-09-06');
INSERT INTO `v9_module` VALUES('formguide','表单向导','formguide/','0','1.0','formguide','array (\n  \'allowmultisubmit\' => \'1\',\n  \'interval\' => \'30\',\n  \'allowunreg\' => \'0\',\n  \'mailmessage\' => \'用户向我们提交了表单数据，赶快去看看吧。\',\n)','0','0','2010-10-20','2010-10-20');
INSERT INTO `v9_module` VALUES('link','友情链接','','0','1.0','','array (\n  1 => \n  array (\n    \'is_post\' => \'1\',\n    \'enablecheckcode\' => \'0\',\n  ),\n)','0','0','2010-09-06','2010-09-06');
INSERT INTO `v9_module` VALUES('member','会员','','1','1.0','','array (\n  \'allowregister\' => \'1\',\n  \'choosemodel\' => \'1\',\n  \'enablemailcheck\' => \'0\',\n  \'registerverify\' => \'0\',\n  \'showapppoint\' => \'0\',\n  \'rmb_point_rate\' => \'10\',\n  \'defualtpoint\' => \'0\',\n  \'defualtamount\' => \'0\',\n  \'showregprotocol\' => \'0\',\n  \'regprotocol\' => \'		 欢迎您注册成为phpcms用户\r\n请仔细阅读下面的协议，只有接受协议才能继续进行注册。 \r\n1．服务条款的确认和接纳\r\n　　phpcms用户服务的所有权和运作权归phpcms拥有。phpcms所提供的服务将按照有关章程、服务条款和操作规则严格执行。用户通过注册程序点击“我同意” 按钮，即表示用户与phpcms达成协议并接受所有的服务条款。\r\n2． phpcms服务简介\r\n　　phpcms通过国际互联网为用户提供新闻及文章浏览、图片浏览、软件下载、网上留言和BBS论坛等服务。\r\n　　用户必须： \r\n　　1)购置设备，包括个人电脑一台、调制解调器一个及配备上网装置。 \r\n　　2)个人上网和支付与此服务有关的电话费用、网络费用。\r\n　　用户同意： \r\n　　1)提供及时、详尽及准确的个人资料。 \r\n　　2)不断更新注册资料，符合及时、详尽、准确的要求。所有原始键入的资料将引用为注册资料。 \r\n　　3)用户同意遵守《中华人民共和国保守国家秘密法》、《中华人民共和国计算机信息系统安全保护条例》、《计算机软件保护条例》等有关计算机及互联网规定的法律和法规、实施办法。在任何情况下，phpcms合理地认为用户的行为可能违反上述法律、法规，phpcms可以在任何时候，不经事先通知终止向该用户提供服务。用户应了解国际互联网的无国界性，应特别注意遵守当地所有有关的法律和法规。\r\n3． 服务条款的修改\r\n　　phpcms会不定时地修改服务条款，服务条款一旦发生变动，将会在相关页面上提示修改内容。如果您同意改动，则再一次点击“我同意”按钮。 如果您不接受，则及时取消您的用户使用服务资格。\r\n4． 服务修订\r\n　　phpcms保留随时修改或中断服务而不需知照用户的权利。phpcms行使修改或中断服务的权利，不需对用户或第三方负责。\r\n5． 用户隐私制度\r\n　　尊重用户个人隐私是phpcms的 基本政策。phpcms不会公开、编辑或透露用户的注册信息，除非有法律许可要求，或phpcms在诚信的基础上认为透露这些信息在以下三种情况是必要的： \r\n　　1)遵守有关法律规定，遵从合法服务程序。 \r\n　　2)保持维护phpcms的商标所有权。 \r\n　　3)在紧急情况下竭力维护用户个人和社会大众的隐私安全。 \r\n　　4)符合其他相关的要求。 \r\n6．用户的帐号，密码和安全性\r\n　　一旦注册成功成为phpcms用户，您将得到一个密码和帐号。如果您不保管好自己的帐号和密码安全，将对因此产生的后果负全部责任。另外，每个用户都要对其帐户中的所有活动和事件负全责。您可随时根据指示改变您的密码，也可以结束旧的帐户重开一个新帐户。用户同意若发现任何非法使用用户帐号或安全漏洞的情况，立即通知phpcms。\r\n7． 免责条款\r\n　　用户明确同意网站服务的使用由用户个人承担风险。 　　 \r\n　　phpcms不作任何类型的担保，不担保服务一定能满足用户的要求，也不担保服务不会受中断，对服务的及时性，安全性，出错发生都不作担保。用户理解并接受：任何通过phpcms服务取得的信息资料的可靠性取决于用户自己，用户自己承担所有风险和责任。 \r\n8．有限责任\r\n　　phpcms对任何直接、间接、偶然、特殊及继起的损害不负责任。\r\n9． 不提供零售和商业性服务 \r\n　　用户使用网站服务的权利是个人的。用户只能是一个单独的个体而不能是一个公司或实体商业性组织。用户承诺不经phpcms同意，不能利用网站服务进行销售或其他商业用途。\r\n10．用户责任 \r\n　　用户单独承担传输内容的责任。用户必须遵循： \r\n　　1)从中国境内向外传输技术性资料时必须符合中国有关法规。 \r\n　　2)使用网站服务不作非法用途。 \r\n　　3)不干扰或混乱网络服务。 \r\n　　4)不在论坛BBS或留言簿发表任何与政治相关的信息。 \r\n　　5)遵守所有使用网站服务的网络协议、规定、程序和惯例。\r\n　　6)不得利用本站危害国家安全、泄露国家秘密，不得侵犯国家社会集体的和公民的合法权益。\r\n　　7)不得利用本站制作、复制和传播下列信息： \r\n　　　1、煽动抗拒、破坏宪法和法律、行政法规实施的；\r\n　　　2、煽动颠覆国家政权，推翻社会主义制度的；\r\n　　　3、煽动分裂国家、破坏国家统一的；\r\n　　　4、煽动民族仇恨、民族歧视，破坏民族团结的；\r\n　　　5、捏造或者歪曲事实，散布谣言，扰乱社会秩序的；\r\n　　　6、宣扬封建迷信、淫秽、色情、赌博、暴力、凶杀、恐怖、教唆犯罪的；\r\n　　　7、公然侮辱他人或者捏造事实诽谤他人的，或者进行其他恶意攻击的；\r\n　　　8、损害国家机关信誉的；\r\n　　　9、其他违反宪法和法律行政法规的；\r\n　　　10、进行商业广告行为的。\r\n　　用户不能传输任何教唆他人构成犯罪行为的资料；不能传输长国内不利条件和涉及国家安全的资料；不能传输任何不符合当地法规、国家法律和国际法 律的资料。未经许可而非法进入其它电脑系统是禁止的。若用户的行为不符合以上的条款，phpcms将取消用户服务帐号。\r\n11．网站内容的所有权\r\n　　phpcms定义的内容包括：文字、软件、声音、相片、录象、图表；在广告中全部内容；电子邮件的全部内容；phpcms为用户提供的商业信息。所有这些内容受版权、商标、标签和其它财产所有权法律的保护。所以，用户只能在phpcms和广告商授权下才能使用这些内容，而不能擅自复制、篡改这些内容、或创造与内容有关的派生产品。\r\n12．附加信息服务\r\n　　用户在享用phpcms提供的免费服务的同时，同意接受phpcms提供的各类附加信息服务。\r\n13．解释权\r\n　　本注册协议的解释权归phpcms所有。如果其中有任何条款与国家的有关法律相抵触，则以国家法律的明文规定为准。 \',\n  \'registerverifymessage\' => \' 欢迎您注册成为phpcms用户，您的账号需要邮箱认证，点击下面链接进行认证：{click}\r\n或者将网址复制到浏览器：{url}\',\n  \'forgetpassword\' => \' phpcms密码找回，请在一小时内点击下面链接进行操作：{click}\r\n或者将网址复制到浏览器：{url}\',\n)','0','0','2010-09-06','2010-09-06');
INSERT INTO `v9_module` VALUES('message','短消息','','0','1.0','','','0','0','2010-09-06','2010-09-06');
INSERT INTO `v9_module` VALUES('mood','新闻心情','mood/','0','1.0','新闻心情','','0','0','2018-04-14','2018-04-14');
INSERT INTO `v9_module` VALUES('pay','支付','','1','1.0','','','0','0','2010-09-06','2010-09-06');
INSERT INTO `v9_module` VALUES('poster','广告模块','poster/','0','1.0','广告模块','','0','0','2018-04-14','2018-04-14');
INSERT INTO `v9_module` VALUES('release','发布点','','1','1.0','','','0','0','2010-09-01','2010-09-06');
INSERT INTO `v9_module` VALUES('scan','木马扫描','scan','0','1.0','','','0','0','2010-09-01','2010-09-06');
INSERT INTO `v9_module` VALUES('search','全站搜索','','0','1.0','','array (\n  \'fulltextenble\' => \'1\',\n  \'relationenble\' => \'1\',\n  \'suggestenable\' => \'1\',\n  \'sphinxenable\' => \'0\',\n  \'sphinxhost\' => \'10.228.134.102\',\n  \'sphinxport\' => \'9312\',\n)','0','0','2010-09-06','2010-09-06');
INSERT INTO `v9_module` VALUES('sms','短信平台','sms/','0','1.0','短信平台','','0','0','2011-09-02','2011-09-02');
INSERT INTO `v9_module` VALUES('special','专题','','0','1.0','','','0','0','2010-09-06','2010-09-06');
INSERT INTO `v9_module` VALUES('tag','标签向导','tag/','0','1.0','标签向导','','0','0','2018-04-14','2018-04-14');
INSERT INTO `v9_module` VALUES('template','模板风格','','1','1.0','','','0','0','2010-09-01','2010-09-06');
INSERT INTO `v9_module` VALUES('upgrade','在线升级','','0','1.0','','','0','0','2011-05-18','2011-05-18');
INSERT INTO `v9_module` VALUES('video','视频库','','0','1.0','','','0','0','2012-09-28','2012-09-28');
INSERT INTO `v9_module` VALUES('vote','投票','','0','1.0','','array (\r\n  1 => \r\n  array (\r\n    \'default_style\' => \'default\',\r\n    \'vote_tp_template\' => \'vote_tp\',\r\n    \'allowguest\' => \'1\',\r\n    \'enabled\' => \'1\',\r\n    \'interval\' => \'1\',\r\n    \'credit\' => \'1\',\r\n  ),\r\n)','0','0','2010-09-06','2010-09-06');
INSERT INTO `v9_module` VALUES('wap','手机门户','wap/','0','1.0','手机门户','','0','0','2018-04-14','2018-04-14');

DROP TABLE IF EXISTS `v9_mood`;
CREATE TABLE `v9_mood` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '栏目id',
  `siteid` mediumint(6) unsigned NOT NULL DEFAULT '0' COMMENT '站点ID',
  `contentid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章id',
  `total` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '总数',
  `n1` int(10) unsigned NOT NULL DEFAULT '0',
  `n2` int(10) unsigned NOT NULL DEFAULT '0',
  `n3` int(10) unsigned NOT NULL DEFAULT '0',
  `n4` int(10) unsigned NOT NULL DEFAULT '0',
  `n5` int(10) unsigned NOT NULL DEFAULT '0',
  `n6` int(10) unsigned NOT NULL DEFAULT '0',
  `n7` int(10) unsigned NOT NULL DEFAULT '0',
  `n8` int(10) unsigned NOT NULL DEFAULT '0',
  `n9` int(10) unsigned NOT NULL DEFAULT '0',
  `n10` int(10) unsigned NOT NULL DEFAULT '0',
  `lastupdate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后更新时间',
  PRIMARY KEY (`id`),
  KEY `total` (`total`),
  KEY `lastupdate` (`lastupdate`),
  KEY `catid` (`catid`,`siteid`,`contentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_news`;
CREATE TABLE `v9_news` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` varchar(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` varchar(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO `v9_news` VALUES('1','11','0','防伪包装结构及使用该防伪包装结构的防伪包装体','','/touyun/uploadfile/2018/0414/20180414070734324.jpg','结构','','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=11&id=1','0','99','1','0','phpcms','1523704023','1523704057');
INSERT INTO `v9_news` VALUES('2','11','0','口香糖包装结构','','/touyun/uploadfile/2018/0414/20180414075116713.png','口香糖 结构','','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=11&id=2','0','99','1','0','phpcms','1523706578','1523706679');
INSERT INTO `v9_news` VALUES('3','11','0','柔性软体包装','','/touyun/uploadfile/2018/0414/20180414075141842.png','','','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=11&id=3','0','99','1','0','phpcms','1523706681','1523706714');
INSERT INTO `v9_news` VALUES('4','11','0','设置二维码标签的瓶盖防伪装置','','/touyun/uploadfile/2018/0414/20180414075218852.png','二维码 瓶盖 装置','','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=11&id=4','0','99','1','0','phpcms','1523706731','1523706741');
INSERT INTO `v9_news` VALUES('5','11','0','射频识别与移动通信结合实现物品信息查验的系统和方','','/touyun/uploadfile/2018/0414/20180414075305117.png','射频 移动通信 物品','','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=11&id=5','0','99','1','0','phpcms','1523706778','1523706787');
INSERT INTO `v9_news` VALUES('6','11','0','吸管包装结构及使用该结构的饮料包装-2','','/touyun/uploadfile/2018/0414/20180414075328893.jpg','结构 吸管 饮料','','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=11&id=6','0','99','1','0','phpcms','1523706802','1523706809');
INSERT INTO `v9_news` VALUES('7','11','0','吸管包装结构及使用该结构的饮料包装','','/touyun/uploadfile/2018/0414/20180414075350429.png','结构 吸管 饮料','','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=11&id=7','0','99','1','0','phpcms','1523706815','1523706832');
INSERT INTO `v9_news` VALUES('8','11','0','易拉罐拉环结构及使用该结构的易拉罐-1','','/touyun/uploadfile/2018/0414/20180414075418612.png','易拉罐 结构 拉环','','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=11&id=8','0','99','1','0','phpcms','1523706843','1523706859');
INSERT INTO `v9_news` VALUES('9','11','0','易拉罐拉环结构及使用该结构的易拉罐-2','','/touyun/uploadfile/2018/0414/20180414075437733.jpg','易拉罐 结构 拉环','','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=11&id=9','0','99','1','0','phpcms','1523706871','1523706878');
INSERT INTO `v9_news` VALUES('10','11','0','易拉罐内压式拉环结构及使用该结构的易拉罐','','/touyun/uploadfile/2018/0414/20180414075456903.png','易拉罐 结构 拉环','','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=11&id=10','0','99','1','0','phpcms','1523706889','1523706898');
INSERT INTO `v9_news` VALUES('11','12','0','国家金卡工程2014年度金蚂蚁奖（市场开拓奖）','','/touyun/uploadfile/2018/0414/20180414075541775.jpg','金卡工程 市场开拓 蚂蚁','','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=12&id=11','0','99','1','0','phpcms','1523706920','1523706943');
INSERT INTO `v9_news` VALUES('12','12','0','国家金卡工程2014年度金蚂蚁奖（优秀应用成果奖）','','/touyun/uploadfile/2018/0414/20180414075600711.jpg','金卡工程 成果奖 蚂蚁','','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=12&id=12','0','99','1','0','phpcms','1523706954','1523706962');
INSERT INTO `v9_news` VALUES('13','12','0','好品中国云鼎奖（骑士奖）','','/touyun/uploadfile/2018/0414/20180414075616235.jpg','中国 骑士 云鼎奖','','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=12&id=13','0','99','1','0','phpcms','1523706970','1523706985');
INSERT INTO `v9_news` VALUES('14','12','0','搜索中国正能量 点赞2015 创新中国·企业创新奖','','/touyun/uploadfile/2018/0414/20180414075643759.jpg','中国 创新奖 能量','','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=12&id=14','0','99','1','0','phpcms','1523706997','1523707004');
INSERT INTO `v9_news` VALUES('15','12','0','中国互联网+行业创新企业奖','','/touyun/uploadfile/2018/0414/20180414075657958.jpg','中国 互联网 行业','','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=12&id=15','0','99','1','0','phpcms','1523707012','1523707019');
INSERT INTO `v9_news` VALUES('16','12','0','多码防伪认证系统高新项目转化证书','','/touyun/uploadfile/2018/0414/20180414075714285.jpg','高新 证书 项目','','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=12&id=16','0','99','1','0','phpcms','1523707028','1523707035');
INSERT INTO `v9_news` VALUES('17','12','0','副理事长会员证书','','/touyun/uploadfile/2018/0414/20180414075733579.png','理事长 证书 会员','','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=12&id=17','0','99','1','0','phpcms','1523707044','1523707055');
INSERT INTO `v9_news` VALUES('18','12','0','时代创变榜—2017年度影响力企业','','/touyun/uploadfile/2018/0414/20180414075750461.jpg','影响力 年度 时代','','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=12&id=18','0','99','1','0','phpcms','1523707064','1523707072');
INSERT INTO `v9_news` VALUES('19','21','0','产品简介','','/touyun/statics/touyun/images/zhongdianbao/zbrief.jpg','简介 产品','  &ldquo;众店宝&rdquo;是透云科技旗下一款智能新零售产品，它包括面向零售门店的&ldquo;透云智售&rdquo;和面向品牌的&ldquo;透云智购&rdquo;。               ','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=21&id=19','0','99','1','0','phpcms','1523709360','1523709647');
INSERT INTO `v9_news` VALUES('20','21','0','功能','','','功能','进销存管理：快速录入商品清单，创建商品库即时库存情况更新库存不足自动提醒促销活动管理：切实享受多重品牌促销优惠优先成为品牌一物一码   ','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=21&id=20','0','99','1','0','phpcms','1523709660','1523709683');
INSERT INTO `v9_news` VALUES('21','21','0','设备及配件','','/touyun/statics/touyun/images/zhongdianbao/zparts.jpg','配件 设备','  门店智能设备：小屏为店主操作界面，大屏为消费者显示界面                店主端APP应用：轻松管理门店         ','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=21&id=21','0','99','1','0','phpcms','1523709686','1523709727');
INSERT INTO `v9_news` VALUES('22','28','0','阳光变色防伪技术—帮您远离“山寨货”','','/touyun/uploadfile/2018/0414/20180414090017870.png','防伪技术 山寨 阳光','(4月25日) 在您的购物史中，有没有买到过康帅博？有没有看见别人穿着HIKE的衣服和鞋？有没有喝到过雷碧？这些都还是小事儿，毕竟这样的都   ','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=28&id=22','0','99','1','0','phpcms','1463317080','1523710859');
INSERT INTO `v9_news` VALUES('23','28','0','合肥将建农产品可追溯平台 公交延伸到农村','','/touyun/uploadfile/2018/0414/20180414090630226.jpg','可追溯 合肥 农产品','（4月26日）晨报讯 农产品将更加安全、农村将更美丽并且有特色，城市公交将延伸到农村&hellip;&hellip;昨日，合肥市政府第65次常务会原则通过《落实发   ','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=28&id=23','0','99','1','0','phpcms','1463576760','1523711216');
INSERT INTO `v9_news` VALUES('24','28','0','二维码扫一扫 金山品牌西甜瓜安全可追溯','','/touyun/uploadfile/2018/0414/20180414090740370.jpg','二维码 西甜瓜 金山','金山小皇冠西瓜和珠丰甜瓜东方网记者黄丽春5月17日报道：近来气温逐渐走高，又到了瓜果飘香的时节，市郊的新鲜蔬果也纷纷上市。记者今天从   ','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=28&id=24','0','99','1','0','phpcms','1463663220','1523711267');
INSERT INTO `v9_news` VALUES('25','28','0','济南：食药监约谈乳粉经销商 要求可准确溯源','','/touyun/uploadfile/2018/0414/20180414090829968.jpg','乳粉 济南 经销商','（4月24日）近期，上海假奶粉事件备受社会关注，经销商问题更成为话题的焦点。4月22日，济南市食药监局打破常规，改变以往检查实体店倒逼经   ','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=28&id=25','0','99','1','0','phpcms','1463663220','1523711336');
INSERT INTO `v9_news` VALUES('26','28','0','今年10月起 郑州农产品有望实现质量全程追溯','','/touyun/uploadfile/2018/0414/20180414090927960.jpg','郑州 农产品 全程','（4月22日）市民买菜，只要手机扫一下小票上自动生成的二维码，即可查出蔬菜的产地、检测结果和流通信息。听着很高、大、上吧，今年10月份   ','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=28&id=26','0','99','1','0','phpcms','1463663340','1523711371');
INSERT INTO `v9_news` VALUES('27','28','0','今年内江苏省70%白酒企业建立电子追溯系统','','/touyun/uploadfile/2018/0414/20180414091000523.jpg','内江 白酒 系统','从江苏省食品药品监管局获悉，江苏乳制品生产企业已实现食品安全电子追溯系统100%全覆盖，今年江苏省还将推动电子追溯系统在食品生产环节实   ','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=28&id=27','0','99','1','0','phpcms','1463663340','1523711408');
INSERT INTO `v9_news` VALUES('28','28','0','南京19家食品企业建电子追溯系统 未来将逐步推开','','/touyun/uploadfile/2018/0414/20180414091038238.jpg','南京 食品 系统','(4月26日)昨天，南京市食药监局召开创建国家食品安全城市食品生产示范企业动员大会，副巡视员史建春介绍，目前，南京有19家食品生产企业建   ','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=28&id=28','0','99','1','0','phpcms','1495199400','1523711452');
INSERT INTO `v9_news` VALUES('29','28','0','南京肉制品企业将建电子追溯系统','','/touyun/uploadfile/2018/0414/20180414091131369.jpg','肉制品 南京 系统','输入条形码，食品信息一目了然4月25日 本报讯（记者 马金 通讯员 罗渐）登录查询系统，输入商品条形码，食品生产许可证、各项指标检验   ','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=28&id=29','0','99','1','0','phpcms','1463663460','1523711497');
INSERT INTO `v9_news` VALUES('30','28','0','四川确定7大类100余种重要产品纳入追溯体系','','/touyun/uploadfile/2018/0414/20180414091231471.jpg','四川 余种 大类','以前根本没办法鉴别猪肉的好坏，可以追溯对老百姓来说是件好事。刘一立认可的好事，除了在食品安全上发力，还会在更多地方使劲。围绕对老百   ','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=28&id=30','0','99','1','0','phpcms','1463663520','1523711553');
INSERT INTO `v9_news` VALUES('31','28','0','武夷山大红袍开始启用双标识防伪','','/touyun/uploadfile/2018/0414/20180414091310582.jpg','双标 武夷山 大红袍','大红袍质量从源头抓起(4月22日)武夷山大红袍使用武夷岩茶地理标志保护产品标识之后，又将使用武夷山大红袍中国驰名商标标识。两个标识同时   ','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=28&id=31','0','99','1','0','phpcms','1463663520','1523711594');
INSERT INTO `v9_news` VALUES('32','28','0','长寿：建设农产品溯源体系 电商销售额翻两倍','','/touyun/uploadfile/2018/0414/20180414091341505.jpg','电商 长寿 销售额','人民网重庆4月22日电 生产时间：2016年3月，产品类别：土鸡蛋，备注：非笼养鸡，正宗跑山鸡，郑重承诺：麦麸、玉米渣等粮食饲养，无激素，   ','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=28&id=32','0','99','1','0','phpcms','1463663580','1523711636');
INSERT INTO `v9_news` VALUES('33','28','0','浙江建成全省统一农产品质量安全追溯大平台','','/touyun/uploadfile/2018/0414/20180414091434844.jpg','质量安全 浙江 农产品','（4月26日）以物联网和云数据为技术支撑融合政府监管、主体生产、消费服务等功能质量追溯是国际上通行的全过程质量安全管理与风险控制的有   ','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=28&id=33','0','99','1','0','phpcms','1463663640','1523711678');
INSERT INTO `v9_news` VALUES('34','28','0','浙江各级人大跟踪监督食品安全情况 捍卫舌尖上的安全','','/touyun/uploadfile/2018/0414/20180414091513578.jpg','舌尖 浙江 食品安全','核心提示:习近平总书记指出，食品安全是民生，民生与安全联系在一起就是最大的政治。如何让群众吃得放心健康?最近，受全国人大常委会委托，   ','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=28&id=34','0','99','1','0','phpcms','1464873240','1523711716');
INSERT INTO `v9_news` VALUES('35','28','0','南宁：扫二维码可追溯肉菜“生命密码”','','/touyun/uploadfile/2018/0414/20180414091546583.jpg','二维码 南宁 可追溯','只需扫一扫二维码，就可以知晓肉类从上游基地、屠宰环节到零售终端等各个环节的信息&hellip;&hellip;记者昨日从有关部门获悉，我市商务部门已在飞凤市场   ','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=28&id=35','0','99','1','0','phpcms','1465823700','1523711748');
INSERT INTO `v9_news` VALUES('36','28','0','湖南进口食品加贴防伪溯源码 扫一扫可辨真伪','','/touyun/uploadfile/2018/0414/20180414091621260.jpg','湖南 真伪 源码','进口食品真伪难分，手机一扫验真身华声在线6月5日讯(湖南日报记者 彭雅惠)进口奶粉、红酒等洋食品是真是假、品质如何?如今只需手机扫一扫   ','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=28&id=36','0','99','1','0','phpcms','1465823700','1523711788');
INSERT INTO `v9_news` VALUES('37','26','0','上海透云物联网科技有限公司：','','/touyun/uploadfile/2018/0414/20180414092003295.jpg','上海 科技 有限公司','我是透云科技的用户内蒙古草原鑫河食品有限公司，非常感谢贵司全体参与我公司防伪 溯源项目的员工，贵公司训练有素，在过往的合作中所有员   ','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=26&id=37','0','99','1','0','phpcms','1523711801','1523712117');
INSERT INTO `v9_news` VALUES('38','26','0','致上海透云科技公司的感谢信','','/touyun/uploadfile/2018/0414/20180414092314593.jpg','感谢信 上海 科技','恒大地产集团有限公司是上海透云科技公司的战略合作伙伴。自2014年起双方陆续在恒大冰泉、恒大兴安粮油，咔哇熊奶粉等产业的互联网营销方面   ','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=26&id=38','0','99','1','0','phpcms','1523712159','1523712196');
INSERT INTO `v9_news` VALUES('39','31','0','焦点图1','','/touyun/uploadfile/2018/0409/20180409100142871.jpg','焦点','焦点图1','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=31&id=39','0','99','1','0','phpcms','1523712347','1523712555');
INSERT INTO `v9_news` VALUES('40','29','0','透云科技发布最新消费者扫码白皮书','','/touyun/uploadfile/2018/0414/20180414092453686.jpg','白皮书 消费者 科技','一物一码应用的领导者，透云科技在2016食品饮料创新论坛发布消费者扫码调研报告白皮书《万物互联 一物一码创造交互时代》。白皮书认为，超   ','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=29&id=40','0','99','1','0','phpcms','1462541040','1523712735');
INSERT INTO `v9_news` VALUES('41','31','0','焦点图2','','/touyun/uploadfile/2018/0409/20180409100214221.jpg','焦点','焦点图2','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=31&id=41','0','99','1','0','phpcms','1523712557','1523712653');
INSERT INTO `v9_news` VALUES('42','31','0','焦点图3','','/touyun/uploadfile/2018/0409/20180409100236554.jpg','焦点','焦点图3','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=31&id=42','0','99','1','0','phpcms','1523712655','1523712672');
INSERT INTO `v9_news` VALUES('43','31','0','焦点图4','','/touyun/uploadfile/2018/0409/20180409100405635.jpg','焦点','焦点图4','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=31&id=43','0','99','1','0','phpcms','1523712673','1523712692');
INSERT INTO `v9_news` VALUES('44','29','0','透云科技董事长王亮接受《第一财经》采访','','/touyun/uploadfile/2018/0414/20180414093815983.jpg','王亮 董事长 财经','一物一码应用的领导者&mdash;&mdash;透云科技发布的消费者扫码调研报告白皮书显示：扫码作为一种交互正在产生经济效益。69%的受访者认为商家有必要采   ','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=29&id=44','0','99','1','0','phpcms','1490275920','1523713097');
INSERT INTO `v9_news` VALUES('45','29','0','透云科技发布《2017一物一码行业现状及发展研究白皮书》','','/touyun/uploadfile/2018/0414/20180414093409579.png','一码 白皮书 现状','一物一码应用的领导者透云科技发布《2017一物一码行业现状及发展研究白皮书》（下称白皮书）。白皮书显示，2016年一物一码行业规模7 5亿元   ','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=29&id=45','0','99','1','0','phpcms','1515677580','1523713038');
INSERT INTO `v9_news` VALUES('46','28','0','福建省水产品可追溯标识正式上线 鱼儿有了\"身份证\"','','/touyun/uploadfile/2018/0414/20180414094057825.jpg','福建省 可追溯 水产品','2016海峡（福州）渔业周&middot;中国（福州）国际渔业博览会上，来自境内外的业内人士和专家学者为提升水产品质、推动渔业持续健康发展建言献策。   ','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=28&id=46','0','99','1','0','phpcms','1465825200','1523713263');
INSERT INTO `v9_news` VALUES('47','28','0','安徽欲建重要产品追溯体系','','/touyun/uploadfile/2018/0414/20180414094134483.jpg','安徽 体系 产品','中安在线讯 据市场星报报道，记者从省有关部门获悉，我省将建重要产品追溯体系，预计到2020年，全省追溯体系建设的规划标准体系得到完善；   ','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=28&id=47','0','99','1','0','phpcms','1465825260','1523713299');
INSERT INTO `v9_news` VALUES('48','28','0','甘肃着力构建农产品质量安全追溯体系','','/touyun/uploadfile/2018/0414/20180414094248476.jpg','甘肃 质量安全 农产品','中国农业新闻频道5月28日讯（记者吴晓燕鲁明）记者日前从甘肃省农产品质量安全监管工作会议上获悉，甘肃将力争到2020年全面建成农产品质量   ','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=28&id=48','0','99','1','0','phpcms','1465825320','1523713370');
INSERT INTO `v9_news` VALUES('49','28','0','聚春园将建立 食品安全可追溯示范体系','','/touyun/uploadfile/2018/0414/20180414094333584.jpg','春园 可追溯 食品安全','凤凰网记者姚瑾近期报道，福州聚春园集团与中国质量万里行产品溯源平台在榕签订战略合作协议。省政府食品安全处、福州市市场监督管理局以及   ','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=28&id=49','0','99','1','0','phpcms','1465825380','1523713418');
INSERT INTO `v9_news` VALUES('50','28','0','上海积极推进二维码食品流通信息追溯体系建设','','/touyun/uploadfile/2018/0414/20180414094409669.jpg','二维码 上海 体系','为深入贯彻落实国务院办公厅关于加快推进重要产品追溯体系建设的意见，进一步推进本市二维码食品流通信息追溯新技术、新模式应用，近期，市   ','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=28&id=50','0','99','1','0','phpcms','1465825380','1523713453');
INSERT INTO `v9_news` VALUES('51','28','0','了解产品更多信息 二维码商品追溯系统申城启用','','/touyun/uploadfile/2018/0414/20180414094444825.jpg','二维码 申城 更多','【摘要】 6月18日，由上海市商务委主办，上海质尊溯源电子科技有限公司和宝燕集团承办的上海市食品安全宣传周闵行分会场活动举行。在闵行   ','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=28&id=51','0','99','1','0','phpcms','1466689440','1523713490');
INSERT INTO `v9_news` VALUES('52','28','0','国家物联网标识管理公共服务平台积极实施标准的食品溯源','','/touyun/uploadfile/2018/0414/20180414094528210.jpg','公共服务 标识 标准','近年来，我国食品安全事件频频发生。不断暴露出来的食品生产、销售中肆意造假、有害污染等食品安全问题，严重危害民众的生命健康。为此，20   ','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=28&id=52','0','99','1','0','phpcms','1466689500','1523713534');
INSERT INTO `v9_news` VALUES('53','28','0','扫二维码将可溯源进口产品 广东检验检疫局推进产品质量建','','/touyun/uploadfile/2018/0414/20180414094600657.jpg','二维码 检疫局 广东','羊城晚报讯 记者马汉青、通讯员岳检宣报道：扫一扫二维码，进口商品可望全球质量溯源&mdash;&mdash;记者6月15日获悉，广东检验检疫局近日举行品质革   ','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=28&id=53','0','99','1','0','phpcms','1466689500','1523713564');
INSERT INTO `v9_news` VALUES('54','28','0','流沙河公司采用二维码+RFID电子耳标 实现对花猪身世的追溯','','/touyun/uploadfile/2018/0414/20180414094634302.jpg','流沙河 二维码 身世','记者日前走进湖南省流沙河花猪生态牧业股份有限公司,用微信扫一扫流沙河花猪包装盒上的二维码,很快看到相应的猪产品此前的生长周期、喂养的   ','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=28&id=54','0','99','1','0','phpcms','1467639960','1523713598');
INSERT INTO `v9_news` VALUES('55','28','0','京东携手中国物品编码中心 力推商品安全可溯源','','/touyun/uploadfile/2018/0414/20180414094725737.jpg','京东 物品编码 中国','6月28日，京东集团与中国物品编码中心在京东集团总部举行签约仪式，全面达成深入战略合作。双方将在电子商务及移动端应用等领域，充分利用   ','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=28&id=55','0','99','1','0','phpcms','1467640020','1523713651');
INSERT INTO `v9_news` VALUES('56','28','0','襄阳食药监：两年内70％中小企业完成食品安全追溯体系','','/touyun/uploadfile/2018/0414/20180414094758288.jpg','襄阳 食品安全 中小企业','长江云报道（湖北之声记者李晓雨、鲁俊 襄阳台记者汪岩岩）襄阳市食药监局日前召开新闻发布会透露：今年1到5月，襄阳市各食品安全监管部门   ','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=28&id=56','0','99','1','0','phpcms','1467640020','1523713683');
INSERT INTO `v9_news` VALUES('57','28','0','宝贝格子与中国质量认证中心码上世界防伪追溯平台','','/touyun/uploadfile/2018/0414/20180414094832245.jpg','质量认证 格子 中国','6月28日，宝贝格子与中国质量认证中心CQC码上世界防伪追溯平台（以下简称平台）正式签署战略合作协议。双方致力于海外直邮、原厂正品的供应   ','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=28&id=57','0','99','1','0','phpcms','1467640080','1523713717');
INSERT INTO `v9_news` VALUES('58','28','0','佛山拟建农产品 质量安全追溯系统','','/touyun/uploadfile/2018/0414/20180414094905445.jpg','佛山 质量安全 农产品','5日上午，记者在佛山市农村工作会议上获悉，2015年该市农地产出率达2 3万元 亩，高居全省首位。接下来，佛山拟从完善农村土地征收和宅基地   ','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=28&id=58','0','99','1','0','phpcms','1467812880','1523713749');
INSERT INTO `v9_news` VALUES('59','28','0','重庆将建立重要产品追溯体系 药品食品全程可查','','/touyun/uploadfile/2018/0414/20180414094945237.jpg','重庆 全程 体系','重庆市人民政府办公厅昨天印发《重要产品追溯体系建设实施方案的通知》，到2020年，重庆市将建立起包括农产食品、药品、特种设备等一系列的   ','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=28&id=59','0','99','1','0','phpcms','1467812940','1523713790');
INSERT INTO `v9_news` VALUES('60','28','0','国家级农产品追溯平台明年上线 给食品安全再上一把“放心','','/touyun/uploadfile/2018/0414/20180414095148388.jpg','食品安全 农产品 平台','据《经济日报》报道，日前，农业部出台了《关于加快推进农产品质量安全追溯体系建设的意见》，提出建立全国统一的追溯管理信息平台、制度规   ','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=28&id=60','0','99','1','0','phpcms','1468331460','1523713912');
INSERT INTO `v9_news` VALUES('61','28','0','伊利潘刚：打造全程可追溯系统夯实产品优质品质','','/touyun/uploadfile/2018/0414/20180414095218327.jpg','伊利 可追溯 全程','随着国民消费意识的提升，食品全程可追踪体系的建立显得尤为重要。只有产品生产透明化，才能赢得广大消费者的肯定和认可。伊利集团董事长潘   ','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=28&id=61','0','99','1','0','phpcms','1468331520','1523713942');
INSERT INTO `v9_news` VALUES('62','28','0','安徽豆制品刻“身家姓名” “刻字溯源”监管豆制品','','/touyun/uploadfile/2018/0414/20180414095255257.jpg','豆制品 安徽 身家','央广网北京7月16日消息（安徽台记者张建亚、蚌埠台记者胡艳）据中国之声《央广新闻》报道，近期，不少细心的安徽蚌埠市民在买菜的时候会发   ','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=28&id=62','0','99','1','0','phpcms','1468849920','1523713980');
INSERT INTO `v9_news` VALUES('63','28','0','上海成追溯体系建设试点，获中央财政7亿扶持','','/touyun/uploadfile/2018/0414/20180414095338375.jpg','上海 财政 体系','上海等四地成追溯体系建设试点获中央财政7亿元扶持，乳制品纳入可追溯范围，其流通秩序将重塑作为推动内贸流通现代化、促消费的重要举措，   ','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=28&id=63','0','99','1','0','phpcms','1468849980','1523714022');
INSERT INTO `v9_news` VALUES('64','28','0','四川火锅底料标准明年将强制执行','','/touyun/uploadfile/2018/0414/20180414095418954.jpg','火锅底料 四川 标准','四川省卫计委制定的四川火锅底料地方标准《食品安全地方标准火锅底料》日前出炉，并将从2017年1月15日起强制执行，四川省内所有相关企业都   ','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=28&id=64','0','99','1','0','phpcms','1469195580','1523714062');
INSERT INTO `v9_news` VALUES('65','28','0','河北：大力推行食用农产品质量可追溯','','/touyun/uploadfile/2018/0414/20180414095459871.jpg','可追溯 河北 农产品','河北省提升农产品集中交易市场食品安全水平河北新闻网讯（河北日报记者马彦铭）近日，河北省食药监局印发《食用农产品集中交易市场食品安全   ','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=28&id=65','0','99','1','0','phpcms','1469541240','1523714103');
INSERT INTO `v9_news` VALUES('66','28','0','广东省食协将在茂名市构建首个月饼流通追溯体系','','/touyun/uploadfile/2018/0414/20180414095532127.jpg','茂名市 广东省 月饼','茂名市正式启动创建中国月饼名都。24日，记者获悉，广东省食品行业协会现正在对茂名市创建中国月饼名都行动计划进行评估，同时为推进当地月   ','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=28&id=66','0','99','1','0','phpcms','1469541300','1523714137');
INSERT INTO `v9_news` VALUES('67','28','0','4300吨炎陵黄桃配上防伪“身份证”','','/touyun/uploadfile/2018/0414/20180414095609324.jpg','炎陵 黄桃 身份证','本报7月22日讯 今年炎陵黄桃挂果面积8900亩，预计可实现总产量4300吨，总产值将达2 8亿元。昨日上午，由株洲市炎陵县县委、县政府主办的炎   ','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=28&id=67','0','99','1','0','phpcms','1469541300','1523714171');
INSERT INTO `v9_news` VALUES('68','28','0','商务部：全国已有1万5千多家企业建成肉菜追溯体系','','/touyun/uploadfile/2018/0414/20180414095642995.jpg','商务部 多家 体系','中国网财经8月2日讯 商务部今日召开例行新闻发布会，新闻发言人沈丹阳表示，2010年以来，商务部、财政部分五批支持全国58个试点城市开展肉   ','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=28&id=68','0','99','1','0','phpcms','1470232560','1523714206');
INSERT INTO `v9_news` VALUES('69','28','0','天津：放心肉鸡贴上二维码　全程质量可追溯','','/touyun/uploadfile/2018/0414/20180414095729317.jpg','二维码 可追溯 肉鸡','今年是本市放心肉鸡三年工程的最后一年，已累计有300多家养殖场和8家屠宰场纳入放心肉鸡质量监控体系，所有出厂肉鸡产品都会贴上二维码，实   ','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=28&id=69','0','99','1','0','phpcms','1470232620','1523714253');
INSERT INTO `v9_news` VALUES('70','28','0','陕西推进重要产品追溯体系力求实现全面覆盖','','/touyun/uploadfile/2018/0414/20180414095809284.jpg','陕西 体系 产品','随着人们对食药安全的重视意识不断提升，在现代技术和现代设备的协力下，追溯体系的建立也初现成效，而且正有待全面建立，以保证食品安全和   ','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=28&id=70','0','99','1','0','phpcms','1471442220','1523714293');

DROP TABLE IF EXISTS `v9_news_data`;
CREATE TABLE `v9_news_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` mediumtext NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `voteid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `copyfrom` varchar(100) NOT NULL DEFAULT '',
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO `v9_news_data` VALUES('1','<img alt=\"\" src=\"/touyun/uploadfile/2018/0414/20180414070734324.jpg\" style=\"width: 212px; height: 300px;\" />','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('2','<img alt=\"\" src=\"/touyun/uploadfile/2018/0414/20180414075116713.png\" style=\"width: 209px; height: 300px;\" />','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('3','<img alt=\"\" src=\"/touyun/uploadfile/2018/0414/20180414075141842.png\" style=\"width: 208px; height: 300px;\" />','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('4','<img alt=\"\" src=\"/touyun/uploadfile/2018/0414/20180414075218852.png\" style=\"width: 208px; height: 300px;\" />','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('5','<img alt=\"\" src=\"/touyun/uploadfile/2018/0414/20180414075305117.png\" style=\"width: 206px; height: 300px;\" />','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('6','<img alt=\"\" src=\"/touyun/uploadfile/2018/0414/20180414075328893.jpg\" style=\"width: 220px; height: 300px;\" />','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('7','<img alt=\"\" src=\"/touyun/uploadfile/2018/0414/20180414075350429.png\" style=\"width: 206px; height: 300px;\" />','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('8','<img alt=\"\" src=\"/touyun/uploadfile/2018/0414/20180414075418612.png\" style=\"width: 203px; height: 300px;\" />','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('9','<img alt=\"\" src=\"/touyun/uploadfile/2018/0414/20180414075437733.jpg\" style=\"width: 212px; height: 300px;\" />','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('10','<img alt=\"\" src=\"/touyun/uploadfile/2018/0414/20180414075456903.png\" style=\"width: 202px; height: 300px;\" />','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('11','<img alt=\"\" src=\"/touyun/uploadfile/2018/0414/20180414075541775.jpg\" style=\"width: 400px; height: 282px;\" />','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('12','<img alt=\"\" src=\"/touyun/uploadfile/2018/0414/20180414075600711.jpg\" style=\"width: 400px; height: 282px;\" />','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('13','<img alt=\"\" src=\"/touyun/uploadfile/2018/0414/20180414075616235.jpg\" style=\"width: 400px; height: 282px;\" />','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('14','<img alt=\"\" src=\"/touyun/uploadfile/2018/0414/20180414075643759.jpg\" style=\"width: 400px; height: 280px;\" />','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('15','<img alt=\"\" src=\"/touyun/uploadfile/2018/0414/20180414075657958.jpg\" style=\"width: 225px; height: 300px;\" />','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('16','<img alt=\"\" src=\"/touyun/uploadfile/2018/0414/20180414075714285.jpg\" style=\"width: 400px; height: 285px;\" />','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('17','<img alt=\"\" src=\"/touyun/uploadfile/2018/0414/20180414075733579.png\" style=\"width: 400px; height: 279px;\" />','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('18','<img alt=\"\" src=\"/touyun/uploadfile/2018/0414/20180414075750461.jpg\" style=\"width: 208px; height: 300px;\" />','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('19','  <p>“众店宝”是透云科技旗下一款智能新零售产品，它包括面向零售门店的“透云智售”和面向品牌的“透云智购”。</p>\r\n            <p> “透云智售”包括门店智能设备、店主端APP应用和消费者端应用。旨在帮助店主高效实现出入库管理、电子记账对账、在线支付（包括微信、支付宝、 闪付等）、在线订货、会员系统、线上销售并享受品牌零售促销活动及实物兑奖优惠，以提高零售便利小店销售收入，实现利润最大化。</p>\r\n            <p> “透云智购”包括供货系统、精准广告投放系统、分销及新品促销活动系统、会员系统及数据洞察服务，致力于帮助品牌打通经销商、零售小店和消费者层层环节，建立品牌专属的完整生态，降低销售成本、提高营销效率。\r\n            </p>\r\n            <div class=\"img\">\r\n                <img class=\"am-img-responsive\" src=\"/touyun/statics/touyun/images/zhongdianbao/zbrief.jpg\">\r\n            </div>','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('20','<h2>进销存管理：</h2>\r\n<p>快速录入商品清单，创建商品库<br />\r\n即时库存情况更新<br />\r\n库存不足自动提醒</p>\r\n<h2>促销活动管理：</h2>\r\n<p>切实享受多重品牌促销优惠<br />\r\n优先成为品牌&ldquo;一物一码&rdquo;实物兑换点，直享品牌补贴<br />\r\n自行定制门店促销活动</p>\r\n<h2>电子记账：</h2>\r\n<p>交易流水直接生成电子账单<br />\r\n历史账单一键查询</p>\r\n<h2>在线订货：<span>100+快消品牌鼎力合作，确保进货价格更低，轻松赚更多；亚马劲线上订货平台，快速订货，低价更实惠</span></h2>\r\n<h2>线上门店：<span>开设线上门店吸引更多附近客流，对接店主或第三方配送</span></h2>\r\n<h2>多种支付：<span>提供包括微信、支付宝、 闪付等多种支付方式，一扫即买，收银更轻松</span></h2>\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('21','  <p>门店智能设备：小屏为店主操作界面，大屏为消费者显示界面<br>\r\n                店主端APP应用：轻松管理门店<br>\r\n                消费者端应用：线上下单、送货上门、简单快捷<br>\r\n                加购可得与设备适配的收银盒、小票打印机、扫描枪等配件\r\n            </p>\r\n            <div class=\"img\">\r\n                <img src=\"/touyun/statics/touyun/images/zhongdianbao/zparts.jpg\">\r\n            </div>\r\n            <h3>贴心服务：</h3>\r\n            <div class=\"zService\">\r\n                <h4>• &nbsp;&nbsp;&nbsp;&nbsp; 免费上门安装并录入商品</h4>\r\n                <h4>• &nbsp;&nbsp;&nbsp;&nbsp; 7*12小时服务热线</h4>\r\n                <h4>• &nbsp;&nbsp;&nbsp;&nbsp; 小店专员定期上门服务</h4>\r\n            </div>','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('22','(4月25日) 在您的购物史中，有没有买到过&ldquo;康帅博&rdquo;？有没有看见别人穿着&ldquo;HIKE&rdquo;的衣服和鞋？有没有喝到过&ldquo;雷碧&rdquo;？这些都还是小事儿，毕竟这样的都还是&ldquo;小把戏&rdquo;，只要咱们细心一点就能辨别出来，而且这样的造假给我们带来的损失都不会很大，大家可能笑一笑就过去了。可是当我们购买的产品有关我们的健康呢？如果这样的&ldquo;山寨货&rdquo;让我们损失惨重呢？<br />\r\n<br />\r\n<div style=\"text-align: center;\"><img alt=\"\" src=\"/touyun/uploadfile/2018/0414/20180414090017870.png\" /></div>\r\n<br />\r\n<br />\r\n<br />\r\n消费者所担心的问题都应该得到企业的高度重视，更何况&ldquo;山寨货&rdquo;所损害的不仅仅是消费者的利益，更会让企业的形象受损。<br />\r\n<br />\r\n<br />\r\n记者在市场上对部分商品的防伪功能做了简单的调查，调查发现目前市场上的商品大多没有做到较好的防伪，有些甚至根本就没有防伪功能。而其他高档奢侈品的防伪功能不易被识别，需要借助识别工具，消费者凭肉眼无法完成辨别，而且这些防伪的技术较为复杂和昂贵，不易普及。<br />\r\n<br />\r\n<br />\r\n怎么样才能做到方便有效的防伪呢？从新版人民币上能够找到答案。当我们拿起人民币的时候，我们总是先会拿着它对着阳光照一下，就能辨别出真假来。这是什么原理呢？<br />\r\n<br />\r\n<br />\r\n根据对中国印钞造币总公司的走访，我们得知这是源于采用的阳光变色防伪技术。阳光变色防伪技术依靠阳光变色材料变色的特异性而研发，变色材料会因吸收阳光和紫外线导致吸收波长的改变从而产生变色现象，以此达到防伪的目的。<br />\r\n<br />\r\n<div style=\"text-align: center;\"><img alt=\"\" src=\"/touyun/uploadfile/2018/0414/20180414090030210.png\" /></div>\r\n<br />\r\n<br />\r\n阳光变色防伪技术最大的特点在于，其识别无需任何借助任何工具，只需要阳光或者紫外线的照射即可完成瞬间识别，识别方法方便、简易、快捷、有效。<br />\r\n<br />\r\n<br />\r\n在我国，阳光变色防伪技术的开发者为天津孚信科技有限公司，孚信科技在研究军事防伪专攻材料的过程中受到启发，致力于将阳光变色防伪技术向民用领域推广，坚决抵制假冒伪劣产品，让消费者和企业都能远离&ldquo;山寨货&rdquo;。<br />\r\n<br />\r\n<br />\r\n孚信科技在对阳光变色防伪技术的研发时，考虑到不同的产品特性不同，怎么样才能让阳光变色防伪技术广泛应用到各类商品上呢？为了有效地解决这个问题，孚信科技研制出了阳光变色防伪油墨，阳光变色防伪油墨具有良好的工艺适应性，能够广泛应用于各种商品，其具有20余种独特颜色，能够满足各类产品的需要。另外，孚信科技的阳光防伪标签由特种光变材料制成，可实现光写信息，光消信息，也是目前国际上新型的防伪识别技术。<br />\r\n<br />\r\n<br />\r\n阳光变色防伪技术具有无法替代的领先优势，其防伪模式的特异性也使得这项技术无法被复制。好的防伪技术能够帮我们创造良好的消费环境，对于&ldquo;山寨&rdquo;和假冒伪劣行为我们都应共同抵制。<br />\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('23','（4月26日）晨报讯 农产品将更加安全、农村将更美丽并且有特色，城市公交将延伸到农村&hellip;&hellip;昨日，合肥市政府第65次常务会原则通过《落实发展新理念加快农业现代化实现全面小康目标的实施意见》（以下简称《实施意见》），合肥将力争在全省率先基本实现农业现代化。<br />\r\n<br />\r\n<div style=\"text-align: center;\"><img alt=\"\" src=\"/touyun/uploadfile/2018/0414/20180414090630226.jpg\" style=\"width: 500px; height: 314px;\" /></div>\r\n<br />\r\n<br />\r\n合肥的农产品将更加安全有品质。根据《实施意见》，合肥将健全从农田到餐桌的农产品质量和食品安全监管体系，建立全程可追溯、互联共享的信息平台。还将深入实施&ldquo;主食厨房&rdquo;和&ldquo;放心粮油&rdquo;工程，推进生猪屠宰行业清理整顿，加强病死畜禽无害化处理。<br />\r\n<br />\r\n<br />\r\n同时，还将加快农产品加工集中区建设，打造全国首个安全食品加工示范基地，创建一批全国农产品加工示范园区和国家级农业产业化示范基地。<br />\r\n<br />\r\n<br />\r\n合肥还将加大对农村基础设施建设的投入。推动城市公交向农村延伸，实施新一轮农村电网改造升级，并将在2020年全面解决农村饮水安全问题。<br />\r\n<br />\r\n<br />\r\n合肥的农村也越来越美丽。根据《实施意见》，合肥将优化休闲农业和乡村旅游空间布局，加速环城、沿湖、依山、戏水四大休闲农业产业集聚带建设，发展一批乡村集聚区、特色景观旅游名镇名村，打造一村一品、一村一景。<br />\r\n<br />\r\n<br />\r\n根据《实施意见》确定的总体目标，到2020年，合肥的现代农业建设取得显著成效，粮食等主要农产品生产能力和供给体系质效得到显著提高，农业产业融合发展水平持续提升，现代农业产业体系更加健全，力争在全省率先基本实现农业现代化。晨报记者 刘淑<br />\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('24','<div style=\"text-align: center;\"><img alt=\"\" src=\"/touyun/uploadfile/2018/0414/20180414090740370.jpg\" style=\"width: 580px; height: 433px;\" /><br />\r\n&ldquo;金山小皇冠&rdquo;西瓜和&ldquo;珠丰&rdquo;甜瓜</div>\r\n<br />\r\n<br />\r\n东方网记者黄丽春5月17日报道：近来气温逐渐走高，又到了瓜果飘香的时节，市郊的新鲜蔬果也纷纷上市。记者今天从金山区农委获悉，为了便于市区消费者品尝选购优质果品，金山区农学会、长宁区商业联合会和百联集团将于5月20日至6月18日期间联合举办2016金山西甜瓜节。届时，金山区&ldquo;四大名瓜&rdquo;将在徐汇、静安、普陀、长宁等中心城区设立14个销售点，开展集中销售活动。<br />\r\n<br />\r\n<br />\r\n&ldquo;金山小皇冠&rdquo;西瓜、&ldquo;珠丰&rdquo;甜瓜、&ldquo;多利升&rdquo;西瓜、&ldquo;亭林&rdquo;雪瓜被誉为金山区&ldquo;四大名瓜&rdquo;。2016年，金山区春季西甜瓜种植面积12600亩，其中西瓜面积8300亩，占65.9%；甜瓜面积4300亩，占34.1%。西瓜栽培品种中型西瓜以&ldquo;8424&rdquo;为主，小型西瓜以&ldquo;小皇冠、早春红玉&rdquo;为主，厚皮甜瓜以&ldquo;蜜天下、玉菇、西薄洛托&rdquo;为主，薄皮甜瓜以&ldquo;亭林雪瓜&rdquo;为主。此外，今年金山区还增加了230亩哈密瓜种植，丰富了金山西甜瓜的多样性。西甜瓜上市时间主要集中在5月底和6月初，盛瓜期将延续到7月中旬。<br />\r\n<br />\r\n<br />\r\n据了解，金山品牌西甜瓜基地建立了以&ldquo;二维码&rdquo;应用为特征的质量可追溯体系。消费者通过手机扫描&ldquo;二维码&rdquo;，可以查询到西甜瓜产品生产基地情况、溯源总览、种植信息、质量管理、包装加工和运输销售等六个方面的详细信息。金山品牌西甜瓜示范基地和示范种植户都对种子、肥料和农药的使用情况建有田间档案、生产记录，确保市民购买的金山品牌西甜瓜质量安全可控可追溯。','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('25','<div style=\"text-align: center;\">&nbsp;<img alt=\"\" src=\"/touyun/uploadfile/2018/0414/20180414090829968.jpg\" style=\"width: 550px; height: 353px;\" /></div>\r\n<br />\r\n<br />\r\n（4月24日）近期，&ldquo;上海假奶粉事件&rdquo;备受社会关注，经销商问题更成为话题的焦点。4月22日，济南市食药监局打破常规，改变以往检查实体店倒逼经销商规范经营的监管方式，直接组织约谈全市14家婴幼儿配方乳粉经销商，签订《婴幼儿配方乳粉经营者食品安全承诺书》，切实把好奶粉进入市场流通环节的&ldquo;关卡&rdquo;。<br />\r\n<br />\r\n<br />\r\n会议刚开始，济南市食药监局食品流通处处长姚华就开诚布公地把济南婴幼儿配方乳粉经营领域存在的问题摆了出来。&ldquo;经销商是婴幼儿配方乳粉进入济南市场的初始源头，但是到目前为止，还有一些经销商不能认真履行进货和销售记录责任，生产日期、生产批次标注不全的现象仍时有发生。这不但将影响到你的商誉，在济南监管市场上，这更有可能影响到你有没有资格继续代理奶粉品牌。&rdquo;<br />\r\n<br />\r\n<div style=\"text-align: center;\">&nbsp;&nbsp;<img alt=\"\" src=\"/touyun/uploadfile/2018/0414/20180414090839831.jpg\" style=\"width: 412px; height: 448px;\" /><br />\r\n济南市食药监局食品流通处处长姚华介绍约谈问题</div>\r\n<br />\r\n<br />\r\n同时，姚华重点结合《食品安全法》和婴幼儿配方乳粉实施条例，就经销商需要履行的法定责任进行讲解。婴幼儿配方乳粉作为重点监管商品，对其管理标准高于一般食品。经营者在制度建设、人员管理、进货查验、储存与配送、售前售后管理等，需要建立一系列成系统的经营制度，确保食品安全可追溯。<br />\r\n<br />\r\n<br />\r\n现场还下发了《婴幼儿配方乳粉经营者食品安全承诺书》，涵盖十条承诺要求。包括购入婴幼儿配方乳粉时，索取查验供货商经营证照，验明婴幼儿配方乳粉的注册、生产许可、合格证明及产品标识等资料，核实婴幼儿配方乳粉生产企业、供货单位、检验报告、发票及销售清单等方面的信息，不购进无法验证真伪的婴幼儿配方乳粉产品，确保购进的产品来源正规、渠道可靠，可以实现准确溯源；发现虚假票证等不法行为的，立即向相关部门报告。索取和查验的文件按供货商名称或者食品种类整理建档备查，保管期限不少于2年。不购进、不销售未经监管部门注册、无合格证明、无标签或标签残缺不清的婴幼儿配方乳粉；不购进、不销售过期、变质或不符合乳品质量安全国家标准的婴幼儿配方乳粉。不伪造产地，不伪造或冒用他人的厂名、厂址，不伪造或冒用认证标志等质量标志。建立并认真履行进货查验制度等。<br />\r\n<br />\r\n<br />\r\n会上，济南市食药监局向参会的14家经销商提出自查要求，并将经营地址、仓库、品牌、渠道、区域、进销货记录情况、资料保存形式和食品安全自律措施等自查内容上报。通过对经销商自查内容的梳理，绘制济南婴幼儿配方乳粉经营网络图。以后，所有流入济南市场的奶粉的流向均可通过电子监管系统进行查看，形成倒逼机制，更好地保障婴幼儿配方乳粉的质量安全。<br />\r\n<br />\r\n<br />\r\n<div style=\"text-align: center;\">&nbsp;<img alt=\"\" src=\"/touyun/uploadfile/2018/0414/20180414090851108.jpg\" style=\"width: 412px; height: 433px;\" /></div>\r\n<div style=\"text-align: center;\">济南市食药监局副局长刘金宏讲话</div>\r\n<br />\r\n<br />\r\n济南市食药监局副局长刘金宏表示，下一步的食品安全监管重点，将由实体店向供应商转变，先从婴幼儿配方乳粉开始，抓供应商监管。未来，还将在食用油、肉制品等多个重点食品监管领域，落实供应商责任义务，给全市消费者营造一个放心的消费环境。<br />\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('26','（4月22日）市民买菜，只要手机扫一下小票上自动生成的二维码，即可查出蔬菜的产地、检测结果和流通信息。听着很&ldquo;高、大、上&rdquo;吧，今年10月份起，郑州市民购买本市产的农产品，有望实现农产品从市场到产地的质量安全全程可追溯。<br />\r\n<br />\r\n<div style=\"text-align: center;\">&nbsp;<img alt=\"\" src=\"/touyun/uploadfile/2018/0414/20180414090927960.jpg\" style=\"width: 581px; height: 333px;\" /></div>\r\n<br />\r\n<br />\r\n昨日召开的郑州市都市农业生态示范园建设暨农产品质量安全监管工作推进会上，市农委组织全市各县（市）区农业部门负责人走进我市的可追溯标准化&ldquo;菜篮子&rdquo;生产基地、基层农技服务机构和都市农业生态示范园，共谋推进咱郑州&ldquo;菜篮子&rdquo;建设的&ldquo;大事&rdquo;。<br />\r\n<br />\r\n<br />\r\n近年来，我市建立了以市农产品质量检测流通中心为龙头，以县（市）区检测中心、乡镇监管站为基础，以基地和市场检测室为补充的&ldquo;三级四层&rdquo;检验监管体系，被农业部誉为&ldquo;郑州模式&rdquo;在全国推广。近两年，我市又启动了农产品质量安全追溯体系项目建设。目前，项目已基本建成，正在进行追溯网点技术人员培训，预计6月份开始试运行。该项目正式运行后，市民购买我市生产的农产品，可实现从市场到产地的质量安全全程可追溯。<br />\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('27','从江苏省食品药品监管局获悉，江苏乳制品生产企业已实现食品安全电子追溯系统100%全覆盖，今年江苏省还将推动电子追溯系统在食品生产环节实现白酒、食品添加剂生产企业70%覆盖，肉制品、可作为儿童食用食品生产企业各5%覆盖。<br />\r\n<br />\r\n<div style=\"text-align: center;\"><img alt=\"\" src=\"/touyun/uploadfile/2018/0414/20180414091000523.jpg\" style=\"width: 550px; height: 344px;\" /></div>\r\n<br />\r\n<br />\r\n据了解，南京已有19家食品生产企业建立了这样的电子追溯系统，包括卫岗等乳制品企业、同凯兆业等食品添加剂企业。登录查询系统，输入商品条形码，食品生产许证、各项指标检验结果等信息一目了然。<br />\r\n<br />\r\n<br />\r\n该电子追溯系统有3个平台，分别是企业通用平台、政府的监管平台和公众查询平台。市民登录江苏省食品追溯公众查询系统（www.jsfda.cn），不仅可以查询所购买食品的名称、型号、保质期等基本信息，还可以看到食品出厂检验结果等重要信息。\r\n<div>&nbsp;</div>\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('28','<div style=\"text-align: center;\"><span style=\"color: rgb(123, 123, 123); font-family: 微软雅黑, &quot;Helvetica Neue&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, Simsun, sans-serif; font-size: 14px; text-align: center;\">&nbsp;</span><img alt=\"\" src=\"/touyun/uploadfile/2018/0414/20180414091038238.jpg\" style=\"width: 694px; height: 493px;\" /><br />\r\n&nbsp;</div>\r\n<p style=\"box-sizing: border-box; margin: 2px; padding: 0px; font-size: 14px; line-height: 28px; color: rgb(123, 123, 123); font-family: 微软雅黑, &quot;Helvetica Neue&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, Simsun, sans-serif;\"><span style=\"box-sizing: border-box; line-height: 1.42857;\">(4月</span><span style=\"box-sizing: border-box; line-height: 1.42857;\">26</span><span style=\"box-sizing: border-box; line-height: 1.42857;\">日</span><span style=\"box-sizing: border-box; line-height: 1.42857;\">)</span><span style=\"box-sizing: border-box; line-height: 1.42857;\">昨天，南京市食药监局召开创建国家食品安全城市食品生产示范企业动员大会，副巡视员史建春介绍，目前，南京有</span><span style=\"box-sizing: border-box; line-height: 1.42857;\">19</span><span style=\"box-sizing: border-box; line-height: 1.42857;\">家食品生产企业建立了电子追溯系统，其中乳制品生产企业电子追溯系统基本建成，添加剂已经有</span><span style=\"box-sizing: border-box; line-height: 1.42857;\">12</span><span style=\"box-sizing: border-box; line-height: 1.42857;\">家建立。按照计划，电子追溯系统建设会在重点品种中逐步推开，</span><span style=\"box-sizing: border-box; line-height: 1.42857;\">2016</span><span style=\"box-sizing: border-box; line-height: 1.42857;\">年，白酒和食品添加剂生产企业</span><span style=\"box-sizing: border-box; line-height: 1.42857;\">70%</span><span style=\"box-sizing: border-box; line-height: 1.42857;\">覆盖，食用植物油、肉制品、蜂制品以及分装食品生产企业</span><span style=\"box-sizing: border-box; line-height: 1.42857;\">20%</span><span style=\"box-sizing: border-box; line-height: 1.42857;\">覆盖，探索肉制品生产电子追溯系统。</span></p>\r\n<p style=\"box-sizing: border-box; margin: 2px; padding: 0px; font-size: 14px; line-height: 28px; color: rgb(123, 123, 123); font-family: 微软雅黑, &quot;Helvetica Neue&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, Simsun, sans-serif;\">&nbsp;</p>\r\n<p style=\"box-sizing: border-box; margin: 2px; padding: 0px; font-size: 14px; line-height: 28px; color: rgb(123, 123, 123); font-family: 微软雅黑, &quot;Helvetica Neue&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, Simsun, sans-serif;\"><span style=\"box-sizing: border-box; line-height: 1.42857;\">作为公众，通过这个追溯系统能获得什么信息？据介绍，这个追溯系统有</span><span style=\"box-sizing: border-box; line-height: 1.42857;\">3</span><span style=\"box-sizing: border-box; line-height: 1.42857;\">个平台，第一个是企业的通用平台，便于企业内部的查询追溯。第二个是政府的监管平台，第三个就是公众查询平台。公众查询可以通过网站、二维码、一维码，将来用手机扫一扫，来查询产品的有关信息。</span></p>\r\n<p style=\"box-sizing: border-box; margin: 2px; padding: 0px; font-size: 14px; line-height: 28px; color: rgb(123, 123, 123); font-family: 微软雅黑, &quot;Helvetica Neue&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, Simsun, sans-serif;\">&nbsp;</p>\r\n<p style=\"box-sizing: border-box; margin: 2px; padding: 0px; font-size: 14px; line-height: 28px; color: rgb(123, 123, 123); font-family: 微软雅黑, &quot;Helvetica Neue&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, Simsun, sans-serif;\"><span style=\"box-sizing: border-box; line-height: 1.42857;\">会议提出，到</span><span style=\"box-sizing: border-box; line-height: 1.42857;\">2016</span><span style=\"box-sizing: border-box; line-height: 1.42857;\">年底，南京要完成创建生产规范化管理示范企业</span><span style=\"box-sizing: border-box; line-height: 1.42857;\">150</span><span style=\"box-sizing: border-box; line-height: 1.42857;\">家，示范企业标准较高，从业人员有效健康证明和培训合格证持证率</span><span style=\"box-sizing: border-box; line-height: 1.42857;\">100%</span><span style=\"box-sizing: border-box; line-height: 1.42857;\">。主要从业人员每人每年接受的集中培训不少于</span><span style=\"box-sizing: border-box; line-height: 1.42857;\">40</span><span style=\"box-sizing: border-box; line-height: 1.42857;\">学时。建立并落实不安全食品召回制度和应急预案；对已知的问题食品立即停止生产、主动召回并依法采取无害化处理和销毁等。（通讯员&emsp;罗渐&emsp;记者&emsp;李花）</span></p>\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('29','输入条形码，食品信息一目了然<br />\r\n4月25日 本报讯（记者 马金 通讯员 罗渐）登录查询系统，输入商品条形码，食品生产许可证、各项指标检验结果等信息一目了然。南京已有19家食品生产企业建立了这样的电子追溯系统。今年，将在肉制品生产企业探索建立电子追溯系统，同时该系统在白酒、食品添加剂生产企业的覆盖率将达70%。<br />\r\n<br />\r\n<div style=\"text-align: center;\"><img alt=\"\" src=\"/touyun/uploadfile/2018/0414/20180414091131369.jpg\" style=\"width: 900px; height: 599px;\" /></div>\r\n<br />\r\n<br />\r\n4月22日，市食药监局召开创建国家食品安全城市食品生产示范企业动员大会，提出在食品生产环节以&ldquo;一大一小&rdquo;为突破口，开展提升食品生产企业安全管理水平、提升食品加工小作坊规范管理水平的&ldquo;双提升&rdquo;行动。据市食药监局副巡视员史建春介绍，目前，我市共有19家食品生产企业已建立了电子追溯系统，包括卫岗等乳制品企业、同凯兆业等食品添加剂企业。<br />\r\n<br />\r\n<br />\r\n据了解，该电子追溯系统有3个平台，分别是企业通用平台、政府的监管平台和公众查询平台。市民登录江苏省食品追溯公众查询系统（www.jsfda.cn），不仅可以查询所购买食品的名称、型号、保质期等基本信息，还可以看到食品出厂检验结果等重要信息。<br />\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('30','&ldquo;以前根本没办法鉴别猪肉的好坏，可以追溯对老百姓来说是件好事。&rdquo;刘一立认可的好事，除了在食品安全上发力，还会在更多地方使劲。<br />\r\n<br />\r\n<br />\r\n围绕对老百姓生命财产安全和公共安全有重大影响的产品，《方案》确定将食用农产品、食品、药品、农业生产资料、特种设备、危险品、稀土产品等7大类产品作为推进追溯体系建设的重要产品。<br />\r\n其中，每一类重要产品包括多个子项目，如食品包括婴幼儿配方乳粉、乳制品、食用植物油、预包装白酒和进口红酒、乳粉；特种设备包括电梯和气瓶；危险品中有烟花爆竹。总共超过100种重要产品。<br />\r\n<br />\r\n<br />\r\n<img alt=\"\" src=\"/touyun/uploadfile/2018/0414/20180414091231471.jpg\" style=\"width: 696px; height: 269px;\" /><br />\r\n<br />\r\n<br />\r\n<br />\r\n<br />\r\n根据《方案》要求，到2020年，将初步建成覆盖全省的重要产品追溯体系。《方案》还要求，通过重要产品追溯数据统一共享交换，建立全省追溯管理信息平台，开通统一公共服务窗口，向社会公众提供追溯信息一站式查询服务。<br />\r\n<br />\r\n<br />\r\n进口奶粉红酒 生产经营主体要备案<br />\r\n食用农产品追溯体系和食品追溯体系首当其冲列入建设重点。前者包括畜禽标识及产品质量安全追溯体系建设，如家畜，活禽要佩戴标识，供追溯。<br />\r\n<br />\r\n<br />\r\n具体来说，有效期内的无公害农产品、绿色食品、有机产品（有资质的认证机构认证）都是食用农产品追溯体系&ldquo;收编&rdquo;的产品。<br />\r\n<br />\r\n<br />\r\n目前成都市基本实现了生猪、蔬菜品种的来源可追溯、去向可查证、责任可追究，提供了食品追溯体系的一个模板。如针对猪肉消费以白条鲜肉为主的特点，在生猪产品追溯上采用射频识别技术，追踪定位精度可以由批次提升到每块肉。<br />\r\n<br />\r\n<br />\r\n《方案》规定，四川将选取部分市（州）、县（市、区）作为试点区域，以婴幼儿配方乳粉、乳制品、预包装白酒、食用植物油等为试点品种，运用诸如上述的现代信息技术手段，实现追溯。<br />\r\n<br />\r\n<br />\r\n尤其值得关注的是，围绕进口乳粉和红酒等产品，追溯体系建设要求，进口食品生产经营主体要备案，这些备案食品进口商，要依法建立进口食品质量安全追溯召回制度，实现进口食品全程可追溯。<br />\r\n<br />\r\n<br />\r\n此外，还要开展国内市场流通环节进口食品追溯。<br />\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('31','大红袍质量从源头抓起<br />\r\n(4月22日)武夷山大红袍使用&ldquo;武夷岩茶地理标志保护产品&rdquo;标识之后，又将使用&ldquo;武夷山大红袍&rdquo;中国驰名商标标识。两个标识同时使用，其目的是打击&ldquo;山寨大红袍&rdquo;，有效提升&ldquo;武夷山大红袍&rdquo;品牌效益。<br />\r\n<br />\r\n<br />\r\n通过多年的发展，在政府和相关部门以及茶企的共同努力下，武夷岩茶在当前竞争激烈的茶叶市场中已具有相当的知名度和竞争力，成为中国乌龙茶中的&ldquo;第一方面军&rdquo;。但繁荣之下，武夷岩茶的发展也凸显出一些隐忧：假冒伪劣、以次充好的&ldquo;大红袍&rdquo;充斥在全国各地市场，这势必影响到武夷山茶企的发展。<br />\r\n<br />\r\n<br />\r\n为进一步规范证明商标、驰名商标和地理标志管理，有效提升&ldquo;武夷山大红袍&rdquo;品牌效益，去年12月，武夷山市政府就&ldquo;武夷山大红袍&rdquo;中国驰名商标及地理标志暂行管理办法发出《通知》。《通知》明确表示，&ldquo;武夷山大红袍&rdquo;中国驰名商标标识、中国地理标志产品专用标识，由符合条件及经许可使用的企业签定许可使用协议并办理相关手续后方可使用。这两个商标由注册人武夷山市茶叶科学研究所负责许可使用管理，许可使用的前置条件是有获得食品生产许可证（即QS）和获得使用武夷岩茶国家地理标志产品保护专用标志的企业，并采用&ldquo;两贴两印&rdquo;的管理办法，即贴&ldquo;武夷山大红袍&rdquo;中国驰名商标专用标识和武夷岩茶地理标志产品保护专用标识，印刷中国地理标志产品专用标识和QS标识。<br />\r\n<br />\r\n<br />\r\n7月19日，武夷山市茶业局局长陈泽财告诉记者，&ldquo;武夷山大红袍&rdquo;中国驰名商标专用标识将在近期启用，届时，符合条件的武夷山当地茶企可向武夷山市茶叶科学研究所申请。<br />\r\n<br />\r\n<br />\r\n在对非武夷山大红袍原产地的茶叶的管理上，武夷山继实施&ldquo;武夷岩茶地理标志保护产品&rdquo;后，又将实施&ldquo;武夷山大红袍&rdquo;中国驰名商标管理办法，&ldquo;武夷山大红袍&rdquo;中国驰名商标、中国地理标志产品标识同时使用，能否有效管理非武夷山大红袍原产地的茶叶假冒&ldquo;大红袍&rdquo;茶叶？一些茶企、涉茶人员提出了质疑。<br />\r\n<br />\r\n<div style=\"text-align: center;\">&nbsp;<img alt=\"\" src=\"/touyun/uploadfile/2018/0414/20180414091310582.jpg\" style=\"width: 639px; height: 466px;\" /></div>\r\n<br />\r\n<br />\r\n&ldquo;李鬼&rdquo;现身茶叶市场<br />\r\n&ldquo;不贴标（地理标志专用标志）的茶，你也不能说不是武夷山的茶。&rdquo;对于加贴地理标志专用标识的自愿性，武夷山添成茶业有限公司总经理吕钦亮如此说。照顾武夷山茶农而不强制贴标的作法，达到了照顾当地茶农的目的，却也为外地茶叶假冒武夷岩茶特别是&ldquo;大红袍&rdquo;提供了方便之路。<br />\r\n<br />\r\n<br />\r\n采访中，武夷山市碧丹岩生态茶业科学研究所有限公司总经理周尚荣说了一个故事就具有代表性：一个朋友前两年在北京开了一家茶叶店，可半年之后他就回武夷山了。究其原因，才知道是他的茶叶在北京没有什么竞争优势。因为自己拿的是武夷山当地产的武夷岩茶，而在北京销得最好的是非武夷山当地产的茶，价格上太有优势了。周尚荣说：&ldquo;那个时候，听他说，有相当一部分在北京卖的&quot;大红袍&quot;的零售价比他销售的茶的出厂价还要低。&rdquo;<br />\r\n<br />\r\n<br />\r\n这种情况也可以从同时期的一份资料中感受得到：武夷山原属地的茶园面积达到11.5万亩，茶叶产量6000多吨，每年市场实际销售额达23亿元；安溪原属地的茶园面积达60万亩，茶叶产量6万吨，每年市场实际销售额达80亿元。而全国市场武夷山岩茶和安溪铁观音的销售额却高达200亿元。<br />\r\n<br />\r\n<br />\r\n&ldquo;几十元的是&quot;大红袍&quot;，几百上千元的也是&quot;大红袍&quot;。现在我们国内的武夷岩茶市场确实是有点乱。&rdquo;武夷山市然韵茶业有限公司总经理占兴旺表示。<br />\r\n<br />\r\n<br />\r\n记者在采访中了解到，为了牟取眼前的利益，一些不惜损害&ldquo;大红袍&rdquo;品牌的现象已经时有出现。在年初茶青价格暴涨之时，包括武夷山本地的一些茶农和流通户为牟取利益，不惜去外地进口廉价茶青，最后制作成茶叶，冒充&ldquo;大红袍&rdquo;对外销售。此外，部分企业瞅准&ldquo;大红袍&rdquo;曾经贵为&ldquo;贡茶&rdquo;的身份，动辄推出高价&ldquo;大红袍&rdquo;，炒作概念，混淆视听，试图牟取暴利。<br />\r\n<br />\r\n<br />\r\n武夷山市隆沁苑茶业有限公司总经理傅学锋概括了这种&ldquo;乱&rdquo;的影响：品质上，本地茶与外地茶共存，造成市场上的武夷山茶叶良莠不齐。由于二者外形没什么区别，需要通过感官评审才能鉴别，因此容易让相当一部分对武夷岩茶了解不深的消费者们产生质量不可靠的认知，这必将给&ldquo;大红袍&rdquo;的品牌信誉造成很大的影响。<br />\r\n<br />\r\n<br />\r\n出现的乱象，令真心热爱&ldquo;大红袍&rdquo;的人心急如焚。&quot;大红袍&quot;品牌好不容易响彻海内外，在这个关键时刻，政府部门必须立刻行动起来，打击&quot;李鬼&quot;，维护&quot;大红袍&quot;市场的正常秩序。&rdquo;武夷星茶业有限公司董事长何一心说，政府部门还应引导广大茶企和茶农自觉加入到维护&ldquo;大红袍&rdquo;品牌的行列中来。<br />\r\n<br />\r\n<br />\r\n申请&ldquo;地标&rdquo;茶企比率偏低<br />\r\n如何让&ldquo;山寨大红袍&rdquo;不再横行？目前，武夷山市有关部门给出的答案是继实施&ldquo;武夷岩茶地理标志保护产品&rdquo;后，又将实施&ldquo;武夷山大红袍&rdquo;中国驰名商标管理办法。<br />\r\n<br />\r\n<br />\r\n&ldquo;武夷岩茶有了地理标志保护这道&quot;护身符&quot;，品质不断提升，竞争力也不断增强，茶好不愁卖啊。&rdquo;武夷山市质监局一位负责人的一句话，道出了武夷岩茶近年来持续热销的奥秘。<br />\r\n<br />\r\n<br />\r\n2002年，在开始实施地理标志产品保护后，武夷山市质监局牵头起草了武夷岩茶强制性国家标准草案，并出台了《武夷岩茶原产地域产品保护专用标志使用管理办法》，规定武夷岩茶产品包装物上必须加贴武夷岩茶地理标志专用标识。2006年12月，重新修订了武夷岩茶国家标准，使标准内容更切合岩茶实际，提高了市场竞争力，&ldquo;武夷岩茶大红袍&rdquo;这张名片更加璀璨夺目。<br />\r\n<br />\r\n<br />\r\n几年来，武夷岩茶的农药残留量、重金属等各项指标检测合格率达100%。这与武夷山市质监局积极推行标准化种植的努力密不可分。<br />\r\n<br />\r\n<br />\r\n&ldquo;这些年来，是否申报并加贴专用标识，可以直接影响企业知名度和市场效益。&rdquo;武夷山市茶叶同业公会会长刘国英告诉记者，随着武夷山和&ldquo;大红袍&rdquo;声名远扬，以劣充优、假冒武夷岩茶之名的现象时有发生，极大地影响购茶者的消费信心。而防伪地理标志产品专用标识有效地保护了规范生产的企业，也为消费者提供了快速简便的鉴别方法和国家质量担保。<br />\r\n<br />\r\n<br />\r\n虽然如此，但由于地理标志专用标识是符合一定条件的茶企自愿申请使用的，因此只有少部分茶企获准使用并在武夷岩茶产品包装物上加贴专用标识，对于大部分茶企特别是以销售散装茶叶为主的作坊式茶企来说，基本上都没有使用专用标识。据了解，目前武夷山全市注册茶企业有1215家，但获得QS的茶企不到300家，获准使用武夷岩茶地理标志保护产品专用标识的企业则比300家更少。从这个意义上来说，地理标志推动了武夷岩茶的发展，但更多的是质量上的保证，对于境外茶，&ldquo;山寨大红袍&rdquo;的管理仍是有许多不足之处。<br />\r\n<br />\r\n<br />\r\n&ldquo;两贴两印&rdquo;目前最为可行<br />\r\n《通知》对&ldquo;规范生产，严把质量关&rdquo;做出了规定：使用&ldquo;武夷山大红袍&rdquo;中国驰名商标的商品在种植及加工制造过程中，必须严格按照武夷岩茶（大红袍）国家标准样制作加工，&ldquo;武夷山大红袍&rdquo;标准样由质监局与茶业局根据国家标准（GB/T18745-2006）制作，企业必须严格按照标准样进行生产。要加强境外茶青管理，严禁获得&ldquo;武夷山大红袍&rdquo;驰名商标许可的企业收购非武夷山大红袍原产地的茶青加工制作&ldquo;武夷山大红袍&rdquo;。茶业局、质监局要结合茶企业的茶山（园）面积、产量及加工生产能力和收购本市辖区内茶青的相关手续，核定发放标识和许可。<br />\r\n<br />\r\n<br />\r\n仔细查看《通知》会发现，通过加贴&ldquo;武夷山大红袍&rdquo;中国驰名商标专用标识来&ldquo;严把质量关&rdquo;，仍然是对获得专用标识许可的企业进行管理规范，那是否意味着没贴标识的企业就不好管了？<br />\r\n<br />\r\n<br />\r\n据了解，注重品牌建设的武夷山本地茶企对于&ldquo;两贴两印&rdquo;的实施比较期待。武夷山语儿泉茶业有限公司的总经理陈新表示，茶叶包装物贴上专用标识，是企业实力和茶叶品质的表现，这有利于在茶叶市场上提高&ldquo;语儿泉&rdquo;的知名度，增加企业的效益。<br />\r\n<br />\r\n<br />\r\n武夷山市碧丹岩生态茶业科学研究所有限公司早在&ldquo;武夷山大红袍&rdquo;获得中国驰名商标的2010年1月份，就向武夷山市茶业局咨询企业如何使用这一殊荣的办法了。总经理周尚荣说：&ldquo;在引导茶企维护自身产品质量和企业信誉的同时，再通过专用标识的管理来规范，相信可以较好地对假冒行为进行打击。&rdquo;<br />\r\n<br />\r\n<br />\r\n&ldquo;对于以销售散装茶为主的茶企，最好是组织他们进行培训，引导他们规范生产、制作和销售。与此同时，再对企业建立产品追溯体系，对企业的生产能力和收购茶青数量进行备案。&rdquo;采访中，多位茶叶界人士如此表示。<br />\r\n<br />\r\n<br />\r\n其中一位姓刘的老茶人表示，在更好的切实有效的办法产生之前，&ldquo;两贴两印&rdquo;是目前最为可行的措施。<br />\r\n<div>&nbsp;</div>\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('32','人民网重庆4月22日电 &ldquo;生产时间：2016年3月，产品类别：土鸡蛋，备注：非笼养鸡，正宗跑山鸡，郑重承诺：麦麸、玉米渣等粮食饲养，无激素，假一罚十&hellip;&hellip;&rdquo;昨日长寿区邻封镇土鸡养殖大户廖长水忙着指导工作人员利用二维码，批量录入农产品基础信息。廖长水说，有了溯源体系，素未谋面的网络买家可以安心网购了。<br />\r\n<br />\r\n<div style=\"text-align: center;\">&nbsp;<img alt=\"\" src=\"/touyun/uploadfile/2018/0414/20180414091341505.jpg\" style=\"width: 418px; height: 313px;\" /></div>\r\n<br />\r\n<br />\r\n廖长水说的溯源体系是长寿区供销社利用&ldquo;互联网+&rdquo;，专为电商平台建设的&ldquo;农产品质量安全溯源体系&rdquo;，该体系包括产品种类、生产时间、星际评分、指标描述、全生长期图片、肥料饲料使用表、农药使用表、关键环境数据、无公害绿色有机认证、企业自检、生产地地图等20余项。<br />\r\n<br />\r\n<br />\r\n长寿区供销社主任助理张昭源介绍，去年区供销社组建&ldquo;长寿村村淘电子商务公司&rdquo;，在淘宝网开辟&ldquo;长寿菜园&rdquo;，同步研发电商客户端，开设微信微店，长寿特色农产品借力&ldquo;互联网+&rdquo;，开启线上网销模式。前期试运营中，由于只有简单的描述信息和图片资料，导致市场认可度较低。<br />\r\n<br />\r\n<br />\r\n长寿区供销社利用大数据调取分析了三个月的客服信息咨询和售后意见反馈，发现九成买家高度关注农产品的质量和安全，关键信息的缺失是导致网络买家进店流量减少，成交量低迷的重要原因。<br />\r\n<br />\r\n<br />\r\n目前，村村淘公司已经完成了本地农产品的溯源体系建设，6月前，将完成区外合作商家的溯源体系建设。目前，&ldquo;长寿菜园&rdquo;已累计实现农产品销售200余万元，溯源体系建成后，本地农产品的周销售额翻了两倍。（王嫚 傅智治）<br />\r\n<div>&nbsp;</div>\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('33','（4月26日）以物联网和云数据为技术支撑&nbsp;&nbsp;融合政府监管、主体生产、消费服务等功能<br />\r\n<br />\r\n<br />\r\n质量追溯是国际上通行的全过程质量安全管理与风险控制的有效手段。2008年，浙江省杭州、绍兴等市结合农产品产地准出项目开始探索农产品质量追溯体系建设。2014年，为适应农产品质量安全监管工作新形势，浙江省政府决定全面启动农产品质量安全追溯体系建设工作，经过两年多的努力，以物联网和云数据为技术支撑，融合政府监管、主体生产、消费服务等功能的全省统一农产品质量安全追溯大平台，已全面投入运行并不断扩大覆盖范围。截止2015年底，全省39个县已整建制全区域推进追溯体系建设（其中25个县通过考核评价），2万多家规模主体纳入主体信息库管理，4900多家主体实现主体追溯或过程追溯，产生了94万多条农产品检测数据。<br />\r\n<br />\r\n<div style=\"text-align: center;\">&nbsp;<img alt=\"\" src=\"/touyun/uploadfile/2018/0414/20180414091434844.jpg\" style=\"width: 550px; height: 299px;\" /></div>\r\n<br />\r\n<br />\r\n在追溯理念上增定力，着力构建统一追溯信息平台<br />\r\n浙江省深刻分析追溯体系建设现实基础和目标需求，结合各地建设经验，在追溯体系建设理念和实践上进行了创新性探索。<br />\r\n<br />\r\n<br />\r\n创新责任主体追溯理念。随着互联网等信息技术的不断发展，&ldquo;互联网+&rdquo;已经全面融入现代社会，追溯建设在技术层面上已经毫无障碍。从产业基础上看，浙江省大力建设农业&ldquo;两区&rdquo;，培育新型经营主体，发展十大主导产业，推进农村电子商务，现代农业的规模化、产业化水平不断提高，从而为推进追溯体系建设奠定了现实基础。从履职尽责上看，农业部门负责&ldquo;三前&rdquo;的农产品质量安全监管，生产主体是农产品质量安全第一责任人，规模以上农业生产主体无疑是监管的主战场。基于上述三个方面的考虑，浙江省提出了以追溯到责任主体为基本要求的追溯体系建设理念，重点解决农产品&ldquo;从哪里来，是谁的？&rdquo;这一问题，形成责任倒逼机制，落实生产主体第一责任。<br />\r\n<br />\r\n<br />\r\n构建全省统一的追溯体系。省级层面上，按照&ldquo;一个平台、多种特色&rdquo;的原则，组织开发了省、市、县统一的&ldquo;浙江省农产品质量安全追溯平台&rdquo;，统一追溯平台基本模块、数据编码标准和追溯标识，统一数据接口并免费开放。市、县层面上，各地合理确定追溯体系建设内容、建设标准和建设要求，已建平台的地方抓住最欠缺、最薄弱的环节，在现有基础上应缺补缺，不搞重复建设，原有平台按照省追溯平台数据标准与省平台对接；未开展追溯建设的市、县直接使用省追溯平台，在省平台的基础上允许地方结合区域产业特色进行深度开发，逐步开发区域监管相关模块和农业生产管理应用系统。<br />\r\n<br />\r\n<br />\r\n开发三位一体的追溯平台。融合&ldquo;政府监管、主体生产、消费服务&rdquo;三项功能，构建浙江省农产品质量安全追溯平台，概括地说由&ldquo;三个系统一个中心&rdquo;组成。第一是供各级农产品质量安全监管部门使用的追溯监管系统，实现主体信息库管理、检测、执法、红黑榜、可追溯管理、投诉处理、应急服务、统计分析等8个功能。第二是供生产主体使用的农业主体信息管理系统，实现主体基本信息、主体简介、产品推介和产品信息的采集功能。第三是供消费者使用的农产品质量安全信息公开系统，消费者可通过登陆&ldquo;省追溯平台&rdquo;或手机扫描二维码来查询农产品生产主体、地址、产品名称、生产日期等信息。第四是数据交换中心，构建统一的云数据中心，实现各类数据库系统的数据交换、互通互联、同步共享，确保基础数据的采集、传输、调度。<br />\r\n<br />\r\n<br />\r\n在平台运行上重长效，着力构建追溯建设保障机制<br />\r\n为切实推进全省农产品质量安全追溯体系建设，浙江省着力从政策引导、资金扶持、考核评价、队伍建设等方面构建追溯平台长效运行保障机制。<br />\r\n<br />\r\n<br />\r\n建立政策引导机制。在目标定位上，2014年，浙江省政府办公厅出台《关于加强农产品质量建设 加快打造绿色农业强省的意见》，明确提出要加强农产品质量追溯体系建设，力争通过5年左右的努力，将全省90%以上规模生产、经营主体进入城市批发市场的农产品纳入质量追溯信息平台。今年年初，省政府办公厅又出台《关于创建国家农产品质量安全示范省的实施意见》，提出开展农产品质量安全信息化建设，积极构建浙江省农产品质量安全追溯平台，建立规模以上农业生产经营主体信息库，县域内90%以上规模农业生产经营主体纳入追溯信息平台，着力打造&ldquo;浙江农业追溯&rdquo;监管品牌。在落实举措上，省农业厅贯彻省政府文件精神，商省财政厅出台了《关于开展农产品质量安全追溯体系建设的实施意见（试行）》，明确追溯体系建设的目标任务、重点建设内容以及考核评价要求。为进一步推进产地准出和市场准入衔接机制，构建全程可追溯体系，省农业厅又与省食药局签订建立协调合作机制共同保障食用农产品安全的备忘录，明确共同研究构建贯通食用农产品生产、流通、消费全过程的追溯体系，这些政策的出台为加快推进追溯体系建设提供了有力保障。<br />\r\n<br />\r\n<br />\r\n建立考核评价机制。首先追溯建设是示范省创建的考核指标。浙江省是全国首个整建制创建国家农产品质量安全示范省的省份，追溯体系建设作为一项重要内容列入到国家农产品质量安全示范省建设的考核指标体系，要求县域内规模以上农业生产主体可追溯率达90%以上。其次追溯建设是&ldquo;平安浙江&rdquo;的考核指标。在浙江，列入&ldquo;平安考核&rdquo;具有极其重要的意义，组织人事部门将建设平安市、县（市、区）工作是列入到干部任期目标中，考核结果是作为衡量干部政绩、晋职晋级和奖励惩处的重要依据。考核要求90%以上的省级及以上农业龙头企业、示范性农民专业合作社、示范性家庭农场要开展追溯体系建设。再次针对可追溯建设县（市、区）的第三方评价。引入第三方评价机制，对列入可追溯体系建设的县（市、区）开展追溯体系建设完成情况考核，重点考核农业生产主体信息库、主体开展农产品质量安全追溯、监管信息化等方面的内容，目前已经有25个县通过考核评价，占到全省的三分之一县，到年底将有至少50个县整县制推进追溯体系建设。最后追溯建设是省级示范性主体认定的前置指标。浙江省把追溯建设作为生产主体参与申报省级示范性农民专业合作社、示范性家庭农场的前置认定条件。<br />\r\n<br />\r\n<br />\r\n建立资金扶持机制。一方面省级财政加大扶持力度。省财政安排资金支持追溯体系建设，2014年、2015年两年已投入以奖代补资金2500万元，对通过考核评价的整县制全区域推进追溯体系建设的县（市、区），每县给予100万元奖励，主要用于组织生产主体培训，配置电脑、打印机、速测仪等追溯设备。另一方面地方政府积极出台以奖代补政策推进追溯建设。市、县在推进追溯体系建设过程中对生产主体设备配备、应用追溯系统、使用追溯标签等给予补助资金，如德清县委县政府专门成立了农产品质量安全追溯体系建设专项资金。同时，积极鼓励引导生产主体自身加大投入建设追溯系统。<br />\r\n<br />\r\n<br />\r\n建立队伍保障机制。加强追溯工作管理队伍建设。省级层面为保障工作的顺利开展，确立了由省农业厅牵头，省农产品质量安全中心负责的工作机制，省农产品质量安全中心专门成立追溯管理科，承担全省追溯体系建设的管理工作。市、县层面成立工作领导小组，农业局主要负责人为组长，追溯具体工作由质监处或质监科负责。加强追溯平台管理操作队伍建设，省农业厅制定了《浙江省农产品质量安全追溯平台用户账号与操作权限管理制度》，建立了省、市、县三级追溯平台管理员队伍，实行实名制登记注册，并对管理员、操作员、生产主体进行系统培训，确保追溯工作有序推进。<br />\r\n<br />\r\n<br />\r\n在监管水平上促提升，着力强化追溯平台推广应用<br />\r\n&nbsp;浙江省实施的以主体信息库建设、生产主体责任追溯以及监管信息化管理为重点的追溯体系建设有助于全面提升农产品质量安全监管效率和能力。<br />\r\n<br />\r\n<br />\r\n&nbsp;监管对象更加明确。通过推进追溯体系建设，各地全面摸清了辖区内规模以上农业生产经营主体的基本情况，同时将从事食用农产品生产的农民专业合作社、家庭农场、农业龙头企业全部纳入到追溯信息库管理，主体基本信息形成电子化档案库，逐步建成完善的规模生产主体信息库。<br />\r\n<br />\r\n<br />\r\n监管方式不断创新。运用信息化手段整合农业执法、风险监测、监督巡查等功能，逐步打通农资追溯平台、农作物重大病虫害监测预警平台等，实现数据同步应用，提高农产品质量安全预警分析能力，建设红黑榜名单，构建生产经营主体诚信体系，不断提升农产品质量安全监管信息化水平。<br />\r\n<br />\r\n<br />\r\n&nbsp;质量意识更加强化。建设追溯体系实际上是落实主体责任的一种重要手段。要求开展追溯建设的生产主体实施农产品上市前自检或者委托乡镇速测室检测。部分县市也选择有条件的主体开展全过程追溯的试点，加强对生产主体生产过程中投入品使用信息的管理，进一步强化主体质量安全意识。&nbsp;<br />\r\n<br />\r\n<br />\r\n社会共治更加浓厚。利用传统媒体和新媒体对追溯建设成效进行宣传，强化追溯标识管理，在智能终端和移动互联网不断普及的当下，&ldquo;扫一扫就知道你是谁&rdquo;的二维码标签，极大地提高了社会公众参与农产品质量安全监管的便利性和积极性，可追溯概念正在逐渐改变消费者认知，社会共治氛围越发浓厚，消费信心不断提振。&nbsp;<br />\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('34','核心提示:习近平总书记指出，食品安全是民生，民生与安全联系在一起就是最大的政治。如何让群众吃得放心健康?最近，受全国人大常委会委托，省人大常委会在全省范围内开展贯彻实施食品安全法执法检查。这是本届省人大常委会连续4年开展食品安全工作专项监督，各级人大和人大代表也主动作为，通过执法检查、跟踪监督、专题询问等形式，不断助推我省食品安全形势稳定趋好，保障群众&ldquo;舌尖上的安全&rdquo;。<br />\r\n<br />\r\n<br />\r\n&nbsp;<img alt=\"\" src=\"/touyun/uploadfile/2018/0414/20180414091513578.jpg\" style=\"width: 550px; height: 389px;\" /><br />\r\n<br />\r\n<br />\r\n浙江在线6月2日讯（浙江日报记者 廖小清 通讯员 沈茂 孔建）&ldquo;市场里的菜买得放心、吃得放心吗?&rdquo;这是全省各级人大和人大代表对群众的关切询问。<br />\r\n&nbsp;<br />\r\n&ldquo;有什么举措，能够保障群众吃得更加安心?&rdquo;这是他们时常向政府相关部门刨根问底的追问。<br />\r\n&nbsp;<br />\r\n&ldquo;还要补上短板，让群众吃得更加舒心。&rdquo;这是他们向有关部门负责人一次次提出的诤言良策。<br />\r\n&nbsp;<br />\r\n4月下旬以来，省人大常委会食品安全执法检查组，分赴金华、杭州、衢州等地实地查看我省食品生产经营场所，开展贯彻实施食品安全法执法检查。这是省人大常委会和各级人大以及广大代表，连续4年开展专项监督，了解全省食品安全法贯彻执行情况，督促政府和相关部门做好食品安全工作。<br />\r\n&nbsp;<br />\r\n事实证明，持续监督就能取得实效。近年来，我省食品安全形势持续向好，群众食品安全满意度稳步提升，不少工作走在全国前列。数据显示，省级层面去年开展食品安全风险监测7046批次，产品合格率达97%。<br />\r\n&nbsp;<br />\r\n一把挂面的&ldquo;升级&rdquo;&mdash;&mdash;深入一线问民情<br />\r\n在桐庐，新合乡的挂面远近闻名。当地群众世世代代制作挂面，不少人慕名来购买和品尝。随着挂面日渐受欢迎，一个食品安全问题也逐渐显现&mdash;&mdash;新合挂面全部为家庭小作坊式生产，没有经过相关审批，成了&ldquo;三无&rdquo;产品。<br />\r\n&nbsp;<br />\r\n一把挂面事小，食品安全事大。对于愈发明显的问题，桐庐县人大常委会专门成立专题调研组，对这个问题进行&ldquo;挂号&rdquo;监督。<br />\r\n&nbsp;<br />\r\n县乡人大联合视察后发现，这个仅1000多户农户的山区小乡镇，挂面生产小作坊居然近百家，但是没有一家有生产经营许可证。&ldquo;这个问题不解决好，迟早会影响新合挂面的美誉度和知名度。&rdquo;桐庐县人大常委会主任游宏说，在短短的3个月里，县乡人大专题调研组先后4次就此开展调研和视察，广泛征集挂面生产小作坊经营业主的意见和建议，倾听他们的真实心声，动员大家转变观念。<br />\r\n&nbsp;<br />\r\n功夫不负有心人。去年12月，新合乡的桐庐翠莲生态农业开发有限公司第一个通过企业食品生产许可证，&ldquo;QS&rdquo;标志印上了包装盒。<br />\r\n&nbsp;<br />\r\n这意味着，新合挂面不仅质量更有保障，而且可以进入超市销售。今年，县乡人大趁热打铁，继续推动其他挂面作坊转型升级。&ldquo;现在我们正积极推动两家挂面生产小作坊按照QS认证企业的标准进行提升，还有30多家小作坊待验收评估后按照个体工商户进行登记管理。&rdquo;新合乡政府相关负责人说。<br />\r\n&nbsp;<br />\r\n从桐庐的一个乡镇，到金华市区的各大市场，全省各级人大和人大代表一直在为捍卫群众&ldquo;舌尖上的安全&rdquo;用心用力。<br />\r\n&nbsp;<br />\r\n4月下旬，金华市区的四牌楼农贸市场就迎来了一批特殊的客人&mdash;&mdash;以省委、省人大常委会主要领导为组长的省人大常委会食品安全执法检查组，走进市场的食品检测实验室，仔细了解农产品农药残留快速检测和市场食品安全监管等工作，并叮嘱市场负责人加强管理，引导摊主诚信经营，让市民买到放心食品。<br />\r\n&nbsp;<br />\r\n紧接着，省人大常委会另外两个食品安全执法检查组也分赴杭州江干区、龙游县等地开展实地查看食品生产经营单位，了解当地食品安全工作情况，听取大家的意见建议。通过执法检查，查找破解当前我省食品安全领域存在的突出问题，补齐短板，实现长效监管。<br />\r\n&nbsp;<br />\r\n&ldquo;现在的市场准入监管还要加强，要通过自检、抽检、索证、备案等制度建立完善销售环节的安全屏障。&rdquo;&ldquo;食品协管员、监督员、义工队伍得再壮大，充分调动群众参与食品安全治理的积极性和主动性，形成食品安全共管共治的良好局面&hellip;&hellip;&rdquo;在执法检查的基础上，省人大常委会又专题听取省政府有关食品安全的情况汇报，全面掌握全省食品安全工作情况，并针对实地检查中发现的问题，现场向省政府及相关部门提出意见建议。<br />\r\n&nbsp;<br />\r\n人大一线视察监督，为政府进一步做好食品安全工作提供了不少现实路径。&ldquo;强化食品安全治理。新建中小学阳光厨房建设率达到100%，建成并向市民免费开放8家农贸市场快速检测室。&rdquo;这是杭州滨江区政府今年的十件为民办实事工程之一。政府把食品安全治理列入为民办实事工程，这与滨江区人大代表持续多年监督食品安全工作密不可分。<br />\r\n&nbsp;<br />\r\n近年来，针对国内少数学校发生学生食物中毒的事件，滨江区人大常委会多次组织人大代表开展食品安全视察、检查和暗访，并向区政府提出建设阳光厨房的建议，通过先进的信息技术为食品安全保驾护航。目前，滨江阳光厨房建设正在积极推进中。<br />\r\n&nbsp;<br />\r\n一场辛辣的询问&mdash;&mdash;持续监督不放松<br />\r\n&nbsp;&ldquo;媒体曝光的翠苑九莲庄等地的无证快餐加工点，通过网络进行销售情况，现场视频触目惊心，为什么以前我们都没有发现?&rdquo;<br />\r\n&nbsp;<br />\r\n&nbsp;&ldquo;曝光后，监管部门采取了哪些措施?&nbsp;&rdquo;<br />\r\n&nbsp;<br />\r\n&nbsp;&ldquo;无证小餐饮年年在整治，为何始终得不到根治?&rdquo;<br />\r\n&nbsp;<br />\r\n这是杭州西湖区人大常委会开展食品安全专题询问的生动场景。面对西湖区政府及相关部门负责人，区人大常委会组成人员抛出一个个问题，问出群众关切，应询者一一答复，现场气氛既庄重严肃，又辣味十足。<br />\r\n&nbsp;<br />\r\n专题询问有的放矢的背后，是人大和人大代表扎实的工作。<br />\r\n&nbsp;<br />\r\n西湖区人大常委会有关负责人说，餐桌和菜篮子是民生头等大事。去年，区人大常委会专门向全体人大代表发出倡议:针对食品安全开展一次明察暗访活动。从去年3月开始，全区各镇街代表组全体动员，组织人大代表深入校园周边、建筑工地、企业食堂等地，开展食品安全明查暗访，并提出意见建议。在此基础上，西湖区人大常委会又组织了这次专题询问，并形成专题询问意见函，交由区政府研究落实。最近，西湖区人大常委会又针对当前食品安全的现状，提出&ldquo;整合多方资源、形成合力&rdquo;等方面的建议，让人们吃得更放心。<br />\r\n&nbsp;<br />\r\n记者了解到，近年来，各级人大常委会，都在充分利用各种监督手段，围绕食品安全持续加大监督力度，督促各级政府和部门落实食品安全法等法规。特别是本届省人大常委会以来，每年都开展食品安全跟踪监督。去年10月，省人大常委会在开展食品安全&ldquo;一法两规&rdquo;执法检查、跟踪检查等基础上，还在全省范围开展食品安全审议意见落实情况的跟踪检查，督促审议意见的落实。<br />\r\n&nbsp;<br />\r\n今年4月底，省政府向省人大常委会提交的食品安全工作报告，一个个喜人的成效值得点赞:<br />\r\n&nbsp;<br />\r\n去年，全省共立案查处食品案件1.3万余件，取缔&ldquo;黑窝点&rdquo;等700多个;省级开展的食用农产品风险监测和监督抽查显示总体合格率达98.4%;开发了农产品质量安全追溯平台和水产品追溯管理信息平台，全省已有2.09万家规模以上农业生产主体纳入追溯平台生产主体信息库管理，1.77万家水产品规模生产主体已全部纳入管理&hellip;&hellip;食品安全老百姓的满意程度和信心持续提升。<br />\r\n&nbsp;<br />\r\n好成效，还需牢巩固。&ldquo;做好食品安全工作，法律法规是重要的保障。&rdquo;省人大常委会有关负责人表示，接下来，省人大常委会既要推动法律的贯彻实施，又要促进相关法规和制度的完善，从法规和制度上补齐我省食品安全领域存在的短板，为我省食品安全工作提供保障。<br />\r\n&nbsp;<br />\r\n一份兑现的建议&mdash;&mdash;代表履职不停步<br />\r\n食品安全，人人有关，人人关心。少数地方不时发生的&ldquo;火锅底料&rdquo;事件、过期食品再包装、不卫生&ldquo;消毒碗筷&rdquo;等食品安全事件，让人们对食品安全产生了更多恐惧，也提出了更高的要求。<br />\r\n&nbsp;<br />\r\n各级人大部署开展食品安全监督后，广大人大代表纷纷行动起来，通过视察、建议等方式，为做好食品安全工作建言献策。<br />\r\n&nbsp;<br />\r\n&ldquo;食品安全法出台后，虽然在打击问题食品方面取得了一定成效，但各类食品安全事故仍时有发生。究其原因，一方面是食品生产者、经营者道德缺失，违法行为屡禁不止，另一方面，也是食品监管措施不足，未能有效封堵安全漏洞。&rdquo;说起食品安全，省人大代表林宗国深有感触。<br />\r\n&nbsp;<br />\r\n他认为，必须从食品生产源头抓起，建立起一整套质量追踪、追查、追溯机制，实现全产业链全程监控，以倒逼机制补足监管短板。<br />\r\n&nbsp;<br />\r\n林宗国代表去年在省十二届人大三次会议上提出《关于建立食品安全产业链追溯体系和诚信体系的建议》，建议进一步完善食品生产企业信用体系建设，搭建包括食品产地编码、生产档案、产品标识和其他可追溯信息在内的信息资源库，完善手机终端扫描追溯技术，实现各级政府、各类食品企业和消费者之间信息互通共享，及时掌握食品安全动态信息，强化追溯、预警和信息发布。<br />\r\n&nbsp;<br />\r\n这份建议得到省有关部门的认真办理。省食药监局表示，目前，省里已建立企业信用信息公示系统、省级农产品质量安全追溯平台。在此基础上，我省还将加快制定市场准入与产地准出的管理衔接制度，积极对接农业部门农产品进入批发市场、零售市场或生产加工企业前的追溯管理，推进农产品全过程可追溯。此外，运用信息化手段，以二维码、电子标签、IC卡等为载体，建立以计算机网络信息交互功能为依托的溯源体系。<br />\r\n&nbsp;<br />\r\n&ldquo;这些年来，食品安全等民生问题，一直是人大代表提建议较多的领域。&rdquo;省人大常委会议案建议处有关负责人说，在今年初举行的省十二届人大四次会议上，又有不少代表提出与食品安全有关的建议。<br />\r\n&nbsp;<br />\r\n记者发现，在这些建议中，人大代表特别关注网络食品安全的监管，有3位代表提出这方面建议。省人大代表马慧就是其中一位，她认为，电子商务与互联网的兴盛，改变了人们传统购物理念与行为，特别是近年来在网上购买食品也成为一种时尚。但是，由于网络交易的虚拟性、隐蔽性和复杂性，网络销售食品的安全风险隐患日益增大。<br />\r\n&nbsp;<br />\r\n因此，马慧代表提出《关于加强网络食品安全监管的建议》，建议从建立市场准入机制、加强安全监管立法、加大安全监管力度等方面入手，让人们网上购买的食品吃得更安全放心。<br />\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('35','<span style=\"font-family: &quot;Helvetica Neue&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, Simsun, sans-serif; color: rgb(123, 123, 123); font-size: 14px; text-align: justify; text-indent: 0pt;\">只需扫一扫二维码，就可以知晓肉类从上游基地、屠宰环节到零售终端等各个环节的信息&hellip;&hellip;记者昨日从有关部门获悉，我市商务部门已在飞凤市场等地试点推行经营者主体二维码查询系统。据悉，这一措施将让肉菜流通追溯信息可实现事先查询、快速查询，让市民进一步可选择消费、明白消费、放心消费。</span>\r\n<p align=\"justify\" class=\"p\" style=\"box-sizing: border-box; margin: 2px 2px 2px 0pt; padding: 0px; font-size: 14px; line-height: 28px; color: rgb(123, 123, 123); font-family: 微软雅黑, &quot;Helvetica Neue&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, Simsun, sans-serif; text-indent: 0pt; text-align: justify; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">&nbsp;</p>\r\n<p align=\"center\" class=\"p\" style=\"box-sizing: border-box; margin: 2px 2px 2px 0pt; padding: 0px; font-size: 14px; line-height: 28px; color: rgb(123, 123, 123); font-family: 微软雅黑, &quot;Helvetica Neue&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, Simsun, sans-serif; text-indent: 0pt; text-align: center; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><img alt=\"\" src=\"/touyun/uploadfile/2018/0414/20180414091546583.jpg\" style=\"width: 309px; height: 220px;\" /></p>\r\n<p align=\"justify\" class=\"p\" style=\"box-sizing: border-box; margin: 2px 2px 2px 0pt; padding: 0px; font-size: 14px; line-height: 28px; color: rgb(123, 123, 123); font-family: 微软雅黑, &quot;Helvetica Neue&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, Simsun, sans-serif; text-indent: 0pt; text-align: justify; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"box-sizing: border-box; font-weight: 700;\">记者体验</span></p>\r\n<p align=\"justify\" class=\"p\" style=\"box-sizing: border-box; margin: 2px 2px 2px 0pt; padding: 0px; font-size: 14px; line-height: 28px; color: rgb(123, 123, 123); font-family: 微软雅黑, &quot;Helvetica Neue&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, Simsun, sans-serif; text-indent: 0pt; text-align: justify; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"box-sizing: border-box; font-weight: 700;\">新鲜猪肉有了&ldquo;二维码&rdquo;</span></p>\r\n<p align=\"justify\" class=\"p\" style=\"box-sizing: border-box; margin: 2px 2px 2px 0pt; padding: 0px; font-size: 14px; line-height: 28px; color: rgb(123, 123, 123); font-family: 微软雅黑, &quot;Helvetica Neue&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, Simsun, sans-serif; text-indent: 0pt; text-align: justify; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">6月6日，记者走进飞凤市场，一探究竟。</p>\r\n<p align=\"justify\" class=\"p\" style=\"box-sizing: border-box; margin: 2px 2px 2px 0pt; padding: 0px; font-size: 14px; line-height: 28px; color: rgb(123, 123, 123); font-family: 微软雅黑, &quot;Helvetica Neue&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, Simsun, sans-serif; text-indent: 0pt; text-align: justify; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">&nbsp;</p>\r\n<p align=\"justify\" class=\"p\" style=\"box-sizing: border-box; margin: 2px 2px 2px 0pt; padding: 0px; font-size: 14px; line-height: 28px; color: rgb(123, 123, 123); font-family: 微软雅黑, &quot;Helvetica Neue&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, Simsun, sans-serif; text-indent: 0pt; text-align: justify; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">拿出手机微信扫一扫猪肉摊前的二维码，只见手机页面快速跳转，随后可见摊主名字、猪肉种类及追溯码，点击追溯码，还会展示出从上游基地、屠宰场到零售终端等一串追溯信息&hellip;&hellip;不到1分钟，这一摊猪肉的&ldquo;前世今生&rdquo;就清晰展现在眼前。</p>\r\n<p align=\"justify\" class=\"p\" style=\"box-sizing: border-box; margin: 2px 2px 2px 0pt; padding: 0px; font-size: 14px; line-height: 28px; color: rgb(123, 123, 123); font-family: 微软雅黑, &quot;Helvetica Neue&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, Simsun, sans-serif; text-indent: 0pt; text-align: justify; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">&nbsp;</p>\r\n<p align=\"justify\" class=\"p\" style=\"box-sizing: border-box; margin: 2px 2px 2px 0pt; padding: 0px; font-size: 14px; line-height: 28px; color: rgb(123, 123, 123); font-family: 微软雅黑, &quot;Helvetica Neue&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, Simsun, sans-serif; text-indent: 0pt; text-align: justify; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">市场方负责人潘达诚告诉记者，这是我市商务局近期在飞凤市场推行的经营者主体二维码查询试点工作，目前已经实现猪肉摊点经营户主体二维码全覆盖。相比过去先购买再打印追溯码进行查询追溯的方式而言，二维码查询的方式具有事前性、便捷性等优势。</p>\r\n<p align=\"justify\" class=\"p\" style=\"box-sizing: border-box; margin: 2px 2px 2px 0pt; padding: 0px; font-size: 14px; line-height: 28px; color: rgb(123, 123, 123); font-family: 微软雅黑, &quot;Helvetica Neue&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, Simsun, sans-serif; text-indent: 0pt; text-align: justify; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">&nbsp;</p>\r\n<p align=\"justify\" class=\"p\" style=\"box-sizing: border-box; margin: 2px 2px 2px 0pt; padding: 0px; font-size: 14px; line-height: 28px; color: rgb(123, 123, 123); font-family: 微软雅黑, &quot;Helvetica Neue&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, Simsun, sans-serif; text-indent: 0pt; text-align: justify; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"box-sizing: border-box; font-weight: 700;\">试点推行</span></p>\r\n<p align=\"justify\" class=\"p\" style=\"box-sizing: border-box; margin: 2px 2px 2px 0pt; padding: 0px; font-size: 14px; line-height: 28px; color: rgb(123, 123, 123); font-family: 微软雅黑, &quot;Helvetica Neue&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, Simsun, sans-serif; text-indent: 0pt; text-align: justify; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"box-sizing: border-box; font-weight: 700;\">六大途径可查肉菜&ldquo;生命密码&rdquo;</span></p>\r\n<p align=\"justify\" class=\"p\" style=\"box-sizing: border-box; margin: 2px 2px 2px 0pt; padding: 0px; font-size: 14px; line-height: 28px; color: rgb(123, 123, 123); font-family: 微软雅黑, &quot;Helvetica Neue&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, Simsun, sans-serif; text-indent: 0pt; text-align: justify; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">据悉，我市目前只有飞凤市场、梦之岛丰润家超市金湖北路店两个试点推行经营者主体二维码查询肉类流通追溯信息工作。</p>\r\n<p align=\"justify\" class=\"p\" style=\"box-sizing: border-box; margin: 2px 2px 2px 0pt; padding: 0px; font-size: 14px; line-height: 28px; color: rgb(123, 123, 123); font-family: 微软雅黑, &quot;Helvetica Neue&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, Simsun, sans-serif; text-indent: 0pt; text-align: justify; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">&nbsp;</p>\r\n<p align=\"justify\" class=\"p\" style=\"box-sizing: border-box; margin: 2px 2px 2px 0pt; padding: 0px; font-size: 14px; line-height: 28px; color: rgb(123, 123, 123); font-family: 微软雅黑, &quot;Helvetica Neue&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, Simsun, sans-serif; text-indent: 0pt; text-align: justify; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">技术维护方上海中心信息发展股份有限公司服务工程师吴其胜表示，该系统于5月底投入使用，通过在每个猪肉销售摊档前设计安装经营者主体二维码，经软件设计和网络联通，实现猪肉流通追溯信息实时可查询，目前仍在试点阶段，今后将根据反馈情况再做完善。&ldquo;以后还计划在飞凤市场等地入口处设立展板，公开各摊点的二维码信息，普及肉菜追溯体系知识，让肉菜追溯体系真正成为&lsquo;民心工程&rsquo;。&rdquo;他说。</p>\r\n<p align=\"justify\" class=\"p\" style=\"box-sizing: border-box; margin: 2px 2px 2px 0pt; padding: 0px; font-size: 14px; line-height: 28px; color: rgb(123, 123, 123); font-family: 微软雅黑, &quot;Helvetica Neue&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, Simsun, sans-serif; text-indent: 0pt; text-align: justify; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">&nbsp;</p>\r\n<p align=\"justify\" class=\"p\" style=\"box-sizing: border-box; margin: 2px 2px 2px 0pt; padding: 0px; font-size: 14px; line-height: 28px; color: rgb(123, 123, 123); font-family: 微软雅黑, &quot;Helvetica Neue&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, Simsun, sans-serif; text-indent: 0pt; text-align: justify; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">记者还了解到，随着二维码查询方式的逐步普及和应用，市民可以通过零售市场现场查询机、官网、服务热线、手机客户端、微信平台及扫描二维码等六大途径查询到肉菜来源和流通信息。</p>\r\n<p align=\"justify\" class=\"p\" style=\"box-sizing: border-box; margin: 2px 2px 2px 0pt; padding: 0px; font-size: 14px; line-height: 28px; color: rgb(123, 123, 123); font-family: 微软雅黑, &quot;Helvetica Neue&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, Simsun, sans-serif; text-indent: 0pt; text-align: justify; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">&nbsp;</p>\r\n<p align=\"justify\" class=\"p\" style=\"box-sizing: border-box; margin: 2px 2px 2px 0pt; padding: 0px; font-size: 14px; line-height: 28px; color: rgb(123, 123, 123); font-family: 微软雅黑, &quot;Helvetica Neue&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, Simsun, sans-serif; text-indent: 0pt; text-align: justify; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"box-sizing: border-box; font-weight: 700;\">放心消费</span></p>\r\n<p align=\"justify\" class=\"p\" style=\"box-sizing: border-box; margin: 2px 2px 2px 0pt; padding: 0px; font-size: 14px; line-height: 28px; color: rgb(123, 123, 123); font-family: 微软雅黑, &quot;Helvetica Neue&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, Simsun, sans-serif; text-indent: 0pt; text-align: justify; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"box-sizing: border-box; font-weight: 700;\">二维码查询将纳入智慧农贸市场试点</span></p>\r\n<p align=\"justify\" class=\"p\" style=\"box-sizing: border-box; margin: 2px 2px 2px 0pt; padding: 0px; font-size: 14px; line-height: 28px; color: rgb(123, 123, 123); font-family: 微软雅黑, &quot;Helvetica Neue&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, Simsun, sans-serif; text-indent: 0pt; text-align: justify; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">根据《广西商贸流通业跨越发展行动计划》，今年我区将试点建设智慧农贸市场，加快建立广西现代农贸市场体系。记者从市商务局获悉，目前智慧农贸市场项目将在我市青秀区的十余家实现追溯体系覆盖的农贸市场进行试点，计划年内完成改造。</p>\r\n<p align=\"justify\" class=\"p\" style=\"box-sizing: border-box; margin: 2px 2px 2px 0pt; padding: 0px; font-size: 14px; line-height: 28px; color: rgb(123, 123, 123); font-family: 微软雅黑, &quot;Helvetica Neue&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, Simsun, sans-serif; text-indent: 0pt; text-align: justify; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">&nbsp;</p>\r\n<p align=\"justify\" class=\"p\" style=\"box-sizing: border-box; margin: 2px 2px 2px 0pt; padding: 0px; font-size: 14px; line-height: 28px; color: rgb(123, 123, 123); font-family: 微软雅黑, &quot;Helvetica Neue&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, Simsun, sans-serif; text-indent: 0pt; text-align: justify; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">下一阶段，市商务局将结合青秀区智慧农贸市场试点工作，推广经营者主体二维码查询肉菜流通追溯信息，强化落实食品经营者主体责任，推进部门协同管理，让广大市民可选择消费、明白消费、放心消费。</p>\r\n<p align=\"justify\" class=\"p\" style=\"box-sizing: border-box; margin: 2px 2px 2px 0pt; padding: 0px; font-size: 14px; line-height: 28px; color: rgb(123, 123, 123); font-family: 微软雅黑, &quot;Helvetica Neue&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, Simsun, sans-serif; text-indent: 0pt; text-align: justify; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">&nbsp;</p>\r\n<p align=\"justify\" class=\"p\" style=\"box-sizing: border-box; margin: 2px 2px 2px 0pt; padding: 0px; font-size: 14px; line-height: 28px; color: rgb(123, 123, 123); font-family: 微软雅黑, &quot;Helvetica Neue&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, Simsun, sans-serif; text-indent: 0pt; text-align: justify; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">据悉，随着二维码查询方式的普及和肉菜追溯体系的逐步完善，相关职能部门也能更及时、便捷地查询相关信息，督促市场开办方和食品经营者履行义务，加强食用农产品质量安全风险防控。</p>\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('36','进口食品真伪难分，手机一扫验&ldquo;真身&rdquo;<br />\r\n<br />\r\n华声在线6月5日讯(湖南日报记者 彭雅惠)进口奶粉、红酒等洋食品是真是假、品质如何?如今只需手机&ldquo;扫一扫&rdquo;就能一目了然。今天，省进口食品企业协会举行新闻发布会，宣布我省首个进口食品防伪溯源监管平台建成运行。<br />\r\n&nbsp;\r\n<div style=\"text-align: center;\">&nbsp;<img alt=\"\" src=\"/touyun/uploadfile/2018/0414/20180414091621260.jpg\" style=\"width: 421px; height: 220px;\" /><br />\r\n&nbsp;</div>\r\n省进口食品企业协会会长金家瑞介绍，这套监管平台采用了智能手机扫描二维码的互联网接入技术，手机登录微信用&ldquo;扫一扫&rdquo;功能，扫描进口食品包装上的二维码，手机就会显示进口食品的公开信息供消费者核查;当消费者决定购买后可刮开二维码标识上的涂层，在手机上输入防伪验证码进一步核对货物标签、卫生证书和网络登记信息是否一致，三者不一致的或查询网站提示该二维码属重复查询的，可高度怀疑为假货。<br />\r\n&nbsp;<br />\r\n现场，有市民用手机扫描了一罐名为&ldquo;Aincradle&rdquo;进口奶粉二维码，马上就准确地知道这罐奶粉的名称、原产地、生产商、进口商、代理商、生产日期、进口口岸、报检号、卫生证书编号、产品流向信息、检验检疫证明、海关报关单等详细信息。&ldquo;消费者完全不用担心买到假洋货，而一旦出现问题，企业也可以通过快速溯源召回商品并向国外供货商索赔。&rdquo;金家瑞说。<br />\r\n&nbsp;<br />\r\n目前，我省已接受该平台防伪溯源监管的进口食品包括乳制品、红酒、橄榄油等，今后还将进一步拓展到其他类食品。<br />\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('37','<div class=\"am-list-item-text\">我是透云科技的用户内蒙古草原鑫河食品有限公司，非常感谢贵司全体参与我公司防伪 溯源项目的员工，贵公司训练有素，在过往的合作中所有员工 本着耐心、细致、诚实的工作态度为项目保驾护航。从2014年6月合作开始，基于双方的紧密沟通与及时协调至目前为止项目一直稳定、安全的运行着。贵司参与项目的人员实际上用行动维护了你们公司，替公司做了宣传广告。我司将继续与透云科技展开紧密合作。</div>\r\n<div class=\"am-list-item-text am-text-right\">内蒙古草原鑫河食品有限公司</div>\r\n<div class=\"am-list-item-text am-text-right\">2016年1月15日</div>\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('38','<div class=\"am-list-item-text\">恒大地产集团有限公司是上海透云科技公司的战略合作伙伴。自2014年起双方陆续在恒大冰泉、恒大兴安粮油，咔哇熊奶粉等产业的互联网营销方面紧密合作，先后合作建设了一瓶一码，一品一码，一罐一码等信息化系统。上海透云科技公司为恒大集团信息化工作提供全面支持，针对我司成立了专 业团队，各团队成员在恒大地产集团服务支持中工作积极，响应迅速，工作计划及执行力都很好，在高强度高要求的工作压力下保障了恒大冰泉、粮油、乳业等产业体系的业务拓展和服务支撑。</div>\r\n                    <div class=\"am-list-item-text am-text-right\">恒大地产集团有限公司</div>','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('39','焦点图1','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('40','&ldquo;一物一码&rdquo;应用的领导者，透云科技在&rdquo;2016食品饮料创新论坛&rdquo;发布消费者扫码调研报告白皮书《万物互联 一物一码创造交互时代》。白皮书认为，超六成消费者愿为&ldquo;扫一扫&rdquo;买单。<br />\r\n<br />\r\n<br />\r\n<div style=\"text-align: center;\">&nbsp;&nbsp;<img alt=\"\" src=\"/touyun/uploadfile/2018/0414/20180414092453686.jpg\" style=\"width: 400px; height: 596px;\" /></div>\r\n<div style=\"text-align: center;\">&nbsp;</div>\r\n<br />\r\n围绕消费者的扫码行为和意愿，本次白皮书调研基于2016年1至3月，对在中国11个城市1,086位消费者进行了问卷和8组焦点访谈相结合的定性与定量研究。<br />\r\n<br />\r\n<br />\r\n扫码作为一种交互正在产生经济效益。69%的受访者认为商家有必要采用二维码，67%的受访者认为商家的二维码活动可以提升其对产品的购买意愿。通过二维码活动，60%的消费者认为可以提升其对品牌的好感，增加其对品牌&ldquo;进取拼搏积极向上&rdquo;、&ldquo;友好&rdquo;、&ldquo;自信&rdquo;、&ldquo;潮流&rdquo;、&ldquo;值得信赖&rdquo;的印象。<br />\r\n<br />\r\n<br />\r\n在被访有扫码经验的消费者中，54%的消费者每月扫码2至5次，26%的消费者每月扫码5至10次。消费者希望主动搜索信息，甚至主动定制个性化的产品或服务，并在知情的情况下，做出购买决策。<br />\r\n<br />\r\n<br />\r\n扫码已成为购物新入口。商品包装成为企业赋码主战场：透云科技的调查发现，消费者获取二维码的渠道主要集中在商品包装（63%），其次是商场海报（18%）和 电商（8%）。休闲食品（54.9%）、农产品（41.3%）和生鲜肉蛋（40.8%）荣登消费者经常扫码的商品前三甲。值得一提的是，49%的消费者认为活动激励不够会降低他们的扫码意愿。<br />\r\n<br />\r\n<br />\r\n<div style=\"text-align: center;\"><img alt=\"\" src=\"/touyun/uploadfile/2018/0414/20180414092507435.jpg\" style=\"width: 600px; height: 353px;\" /></div>\r\n<br />\r\n<br />\r\n调查还发现，&nbsp;94%的扫码消费者愿意与身边的朋友分享扫码经历，91%愿意向周围人推荐扫码经历。他们乐于分享，并积极影响周围人的消费选择。二维码的应用能力对公司创造价值或者流失价值的影响力在日益增强。<br />\r\n<br />\r\n<br />\r\n透云科技CEO王亮表示，&ldquo;二维码应用不再只是与客户互动的&lsquo;低成本方式&rsquo;，而成为开展促销、刺激销售、提升市场份额的新一驱动力。经由二维码入口，我们将迈入&lsquo;万物互联&rsquo;时代。透云科技希望通过为每一件商品赋予独一无二的二维码，并开发基于场景的有益应用。在市场营销领域，透云使商品成为品牌自有的媒介，帮助其汇合信息、实时互动、记录行为、即时传播、高度共享以创造更高的商业价值。&rdquo;<br />\r\n<br />\r\n<br />\r\n想要了解《万物互联 一物一码创造交互新时代》全文，请点击链接，<a href=\"/touyun/uploadfile/2018/0414/20180414092833312.pdf\" target=\"_blank\">免费下载</a><br />\r\n<div>&nbsp;</div>\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('41','焦点图2','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('42','焦点图3','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('43','焦点图4','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('44','一物一码应用的领导者&mdash;&mdash;透云科技发布的消费者扫码调研报告白皮书显示：扫码作为一种交互正在产生经济效益。69%的受访者认为商家有必要采用二维码。67%的受访者认为，商家的二维码活动可以提升对产品的购买意愿。透云科技王亮指出，二维码应用不再是与客户互动的低成本方式，而成为开展促销、刺激销售、提升市场份额的新一驱动力。通过二维码入口将迈入万物互联时代。<br />\r\n<div>&nbsp;</div>\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('45','&ldquo;一物一码&rdquo;应用的领导者透云科技发布《2017一物一码行业现状及发展研究白皮书》（下称白皮书）。白皮书显示，2016年一物一码行业规模7.5亿元，预计这一规模在2017年将达到13.2亿元，实现大幅增长。<br />\r\n<br />\r\n<div style=\"text-align: center;\">&nbsp;<img alt=\"\" src=\"/touyun/uploadfile/2018/0414/20180414093409579.png\" style=\"width: 500px; height: 323px;\" /></div>\r\n<br />\r\n<br />\r\n&ldquo;一物一码&rdquo;已经广泛沿用至各个行业，其中尤以在快消行业的应用最为普遍。一物一码覆盖商品的全生命周期，包含商品生产、流通、销售的各个环节，同时打通了企业、品牌与用户的关联，形成全链的全业务模式。目前一物一码应用行业处于快速发展阶段，未来仍将持续快速发展；<br />\r\n<br />\r\n<div style=\"text-align: center;\">&nbsp;<img alt=\"\" src=\"/touyun/uploadfile/2018/0414/20180414093625722.png\" style=\"width: 500px; height: 707px;\" /></div>\r\n<br />\r\n<br />\r\n在一物一码应用具体业务分类中，个性化营销业务的市场份额仍将继续扩大并成为竞争激烈的一块；溯源业务主要应用于国家监管行业，是其监督食品安全的入门门槛；但简单溯源给行业造成一定信任危机；分销管理对工业自动化和实施能力要求较高，部分企业认为中间经销商扫码意愿对分销管理有阻力。<br />\r\n&nbsp;<br />\r\n白皮书显示，各个业务占比构成，个性化营销以41%的占比傲视群雄，溯源和分销管理分别占比24%和17%紧随其后；而其他业务和防伪业务则以11%和8%处于低位。<br />\r\n<br />\r\n<div style=\"text-align: center;\">&nbsp;<img alt=\"\" src=\"/touyun/uploadfile/2018/0414/20180414093647765.png\" style=\"width: 500px; height: 312px;\" /></div>\r\n<br />\r\n<br />\r\n值得关注的是，我们发现行业中6家主要一物一码服务企业在2016年度的总营业额达到3.95亿元，占到市场总规模的52.6%；由此我们可以看出，一物一码行业已呈现规模化企业占领市场半壁江山的趋势；并且这一趋势预计在2017年还将进一步凸显，一物一码行业这6家企业在2017年度的总营业额预计将达到7.18亿，同比增长105%，占比达市场总规模的54.1%。<br />\r\n&nbsp;<br />\r\n随着一物一码行业的持续快速发展，我们有理由相信未来行业的发展趋势必然会呈现规模化。行业前6家企业将得到进一步的发展和扩张，品牌也会信任更具规模化，且能提供综合服务的企业与之合作。<br />\r\n&nbsp;<br />\r\n&ldquo;一物一码行业已进入高速发展期，品牌方更愿意信赖规模化的大型应用服务商企业。而业务方面，个性化营销在目前和可预见的未来都是业内竞争最为激烈的领域。&ldquo;透云科技CEO谢阵表示：&ldquo;透云科技在个性化营销方面优势明显，营销策划能力强，产品设计更贴近品牌需要，方案整合度高，灵活性、全面性高；产品前瞻性和延展性好。同时，作为一家专注于推动中国物联网行业发展的科技公司，&ldquo;创新&rdquo;深植于公司的基因，我们每年都在不断开发新的产品并升级现有产品。&rdquo;<br />\r\n&nbsp;<br />\r\n截止目前，透云科技已经与包括恒大冰泉、雀巢、蒙牛、光明等100多个国内外知名快消品牌展开合作，积累了非常丰富的&ldquo;一物一码&rdquo;应用服务经验。<br />\r\n&nbsp;<br />\r\n<a href=\"http://mkt.sao.so/baipishu20171113\" target=\"_blank\">欲了解更多详情，请下载白皮书全文</a><br />\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('46','2016海峡（福州）渔业周&middot;中国（福州）国际渔业博览会上，来自境内外的业内人士和专家学者为提升水产品质、推动渔业持续健康发展建言献策。<br />\r\n&nbsp;<br />\r\n留住海中那抹&ldquo;鲜&rdquo;<br />\r\n&ldquo;未来，渔业发展要坚持控制总量、提高质量效益，将发展重心由注重数量增长转到提高质量和效益上来。&rdquo;商务部研究院产业国际化战略研究所副所长、研究员董超在本届渔业周&middot;渔博会的全球渔业交流合作论坛上强调，当前消费者对水产品的卫生和健康要求越来越高，对无公害、有机水产品的需求越来越多，只有优质的产品才能在市场竞争中获得更多肯定。<br />\r\n他的这一观点，得到与会代表的广泛认同。对如何提高水产品品质，渔业从业人员正作出积极的探索。<br />\r\n&nbsp;<br />\r\n鱼儿有了&ldquo;身份证&rdquo;<br />\r\n在渔业周&middot;渔博会的展馆内，来自上海的采购商王帅时刻拿着手机，忙得不亦乐乎。他打开微信，对准展位前白刀鱼上的水产品质量安全可追溯标识二维码一扫，这只鱼的产地、投苗时间、收成时间、上市时间以及产品质量信息就显示出来。他说，多年来，自己都是靠经验来判断水产品的品质，现在鱼儿也有了&ldquo;身份证&rdquo;，将好货带回上海肯定万无一失了。<br />\r\n&nbsp;<br />\r\n3日，福建省水产品质量安全可追溯标识正式上线。以后，会有越来越多的采购商和个人消费者可以像王帅一样轻松获得福建水产品的生产信息。<br />\r\n&nbsp;<br />\r\n谈及水产品的&ldquo;身份证&rdquo;，水产生产加工企业的代表、官坞海洋开发有限公司董事长林哲龙很兴奋。在他眼中，这张&ldquo;身份证&rdquo;就是企业的一张名片。&ldquo;做好产品，还得有叫得响的品牌。如果产品质量出现问题，市场马上对这个品牌会有差评。&rdquo;林哲龙认为，有了水产品质量安全可追溯标识，有利于规范水产企业的生产，对提高福建水产品质也会产生积极作用。<br />\r\n&nbsp;\r\n<div style=\"text-align: center;\">&nbsp;<img alt=\"\" src=\"/touyun/uploadfile/2018/0414/20180414094057825.jpg\" style=\"width: 324px; height: 220px;\" /><br />\r\n&nbsp;</div>\r\n让&ldquo;最后一公里&rdquo;放心<br />\r\n&ldquo;&lsquo;鲜&rsquo;是水产品的核心竞争力。&rdquo;台湾海洋大学环境生物与渔业科学系教授廖正信说出&ldquo;吃货们&rdquo;的心声。他认为，正是消费者对&ldquo;鲜&rdquo;的要求，以及水产品易受温度影响而变质的属性，决定了水产品如果在配送环节出现问题，就前功尽弃了。<br />\r\n&nbsp;<br />\r\n因此，&ldquo;最后一公里&rdquo;的配送问题，也是本届渔业周&middot;渔博会上业内人员关注的焦点。在顺丰冷运展位，前来咨询的渔业从业人员络绎不绝。<br />\r\n&nbsp;<br />\r\n据了解，国内目前主要采用的是&ldquo;二段式&rdquo;半程冷链，即干线运输+落地配，依托城市间干线冷链运输，以城市冷库为节点，配合&ldquo;最后一公里&rdquo;的常温落地配完成宅配。而顺丰冷运服务采用的是&ldquo;一段式全程冷链&rdquo;配送，全程可视化，即达到全程温控、信息记录以及调控，可更好地确保水产品的品质和口感。<br />\r\n&nbsp;<br />\r\n我省渔业资源丰富，但主要还是采用较传统的交易方式。&ldquo;&lsquo;一段式全程冷链&rsquo;的配送方式能很好地解决水产品&lsquo;最后一公里&rsquo;的配送难题，降低水产企业在流通环节的风险。&rdquo;省渔业协会常务副理事长严飞表示，随着我省冷链物流布局不断完善，会有更多的水产企业愿试水电商销售，给我省水产企业带来更多的发展空间。<br />\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('47','中安在线讯 据市场星报报道，记者从省有关部门获悉，我省将建重要产品追溯体系，预计到2020年，全省追溯体系建设的规划标准体系得到完善；追溯数据统一共享交换机制基本形成，初步实现有关部门、地区和企业追溯信息互通共享；采用信息技术建设追溯体系的企业比例大幅提高。<br />\r\n&nbsp;<br />\r\n在食用农产品方面，我省将以生猪等&ldquo;菜篮子&rdquo;产品为重点，开展农产品质量安全追溯管理试点。推广&ldquo;二维码&rdquo;、&ldquo;耳标&rdquo;以及包装标识，力争5年内市级以上农业产业化龙头企业、农民专业合作示范社和示范家庭农场全部实现可追溯。建立食用农产品质量安全全程追溯协作机制，推动追溯管理与市场准入相衔接，实现主要食用农产品&ldquo;从农田到餐桌&rdquo;全过程追溯管理。<br />\r\n&nbsp;\r\n<div style=\"text-align: center;\">&nbsp;<img alt=\"\" src=\"/touyun/uploadfile/2018/0414/20180414094134483.jpg\" style=\"width: 294px; height: 220px;\" /><br />\r\n&nbsp;</div>\r\n我省将围绕婴幼儿配方食品、肉制品、乳制品、食用植物油、白酒等食品，督促和指导生产企业依法建立质量安全追溯体系，落实质量安全主体责任。引导企业遵循安徽省食品安全追溯码规范对产品进行赋码，推动加入安徽省食品安全电子追溯系统；逐步将追溯链条向食品原料供应环节延伸，实行全产业链可追溯管理。开展进口乳粉、红酒等产品追溯体系建设。<br />\r\n&nbsp;<br />\r\n在药品追溯体系建设方面，我省将建立健全以推进药品全品种、全过程追溯与监管为主要内容的药品追溯体系。在完成药品制剂类品种电子监管的基础上，逐步推广到原料药(材)、饮片等类别药品。推进医疗信息系统与国家药品电子监管系统对接，形成全品种、全过程完整追溯与监管链条，实现药品来源可查、去向可追、责任可究。<br />\r\n&nbsp;<br />\r\n此外，我省还将以电梯、气瓶等产品为重点，严格落实特种设备安全技术档案管理制度，建立特种设备安全管理追溯体系。用3～4年时间建成全省特种设备安全大数据信息化监管平台，实现电梯安全追溯全覆盖。对在用气瓶完成普查登记和信息数据录入，实现动态监管。以民用爆炸物品、烟花爆竹、易制爆危险化学品、剧毒化学品等产品为重点，加快生产、经营、储存、运输、使用和销毁全过程信息化追溯体系建设。<br />\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('48','<span style=\"color: rgb(123, 123, 123); font-family: 微软雅黑, &quot;Helvetica Neue&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, Simsun, sans-serif; font-size: 14px;\">中国农业新闻频道5月28日讯（记者吴晓燕鲁明）记者日前从甘肃省农产品质量安全监管工作会议上获悉，甘肃将力争到2020年全面建成农产品质量安全追溯体系，实现主要农产品质量安全追溯管理全覆盖。</span>\r\n<p class=\"p\" style=\"box-sizing: border-box; margin: 2px; padding: 0px; font-size: 14px; line-height: 28px; color: rgb(123, 123, 123); font-family: 微软雅黑, &quot;Helvetica Neue&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, Simsun, sans-serif;\">&nbsp;</p>\r\n<p align=\"center\" class=\"p\" style=\"box-sizing: border-box; margin: 2px; padding: 0px; font-size: 14px; line-height: 28px; color: rgb(123, 123, 123); font-family: 微软雅黑, &quot;Helvetica Neue&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, Simsun, sans-serif; text-align: center;\">&nbsp;<img alt=\"\" src=\"/touyun/uploadfile/2018/0414/20180414094248476.jpg\" style=\"width: 429px; height: 220px;\" /></p>\r\n<p class=\"p\" style=\"box-sizing: border-box; margin: 2px; padding: 0px; font-size: 14px; line-height: 28px; color: rgb(123, 123, 123); font-family: 微软雅黑, &quot;Helvetica Neue&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, Simsun, sans-serif;\">&nbsp;</p>\r\n<p class=\"p\" style=\"box-sizing: border-box; margin: 2px; padding: 0px; font-size: 14px; line-height: 28px; color: rgb(123, 123, 123); font-family: 微软雅黑, &quot;Helvetica Neue&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, Simsun, sans-serif;\">&ldquo;十三五&rdquo;期间，甘肃将大力推进标准化、绿色化、规模化、品牌化生产，着力强化依法监管和社会共治，全面提升农产品质量安全监管能力。为此，甘肃将完善标准体系，推进农业标准化，大力发展&ldquo;三品一标&rdquo;品牌农产品，健全和完善农产品质量安全追溯体系，深入开展农产品质量安全县创建，落实属地管理责任，全面提升基层监管能力，加强农产品检验检测，强化农产品质量安全执法监管，努力确保农产品质量安全。到2020年，力争使主要农产品和地方特色农产品均有可遵循的质量安全控制技术规范，标准化生产全面普及，安全优质农产品比重稳步提高，&ldquo;三品一标&rdquo;农产品生产规模或产量占全省同类农产品生产规模或产量的60%，主要农产品质量安全总体合格率稳定保持在98%以上，省、市、县农产品质检体系建设项目全部按期建成并发挥作用，全面建成布局合理、职能明确、功能齐全、运行高效的农产品质量安全检验检测体系，满足农产品全过程质量安全监管和现代农业发展的需要。</p>\r\n<p class=\"p\" style=\"box-sizing: border-box; margin: 2px; padding: 0px; font-size: 14px; line-height: 28px; color: rgb(123, 123, 123); font-family: 微软雅黑, &quot;Helvetica Neue&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, Simsun, sans-serif;\">&nbsp;</p>\r\n<p class=\"p\" style=\"box-sizing: border-box; margin: 2px; padding: 0px; font-size: 14px; line-height: 28px; color: rgb(123, 123, 123); font-family: 微软雅黑, &quot;Helvetica Neue&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, &quot;WenQuanYi Micro Hei&quot;, Simsun, sans-serif;\">据介绍，&ldquo;十二五&rdquo;期间，甘肃已累计创建国家级农业标准化示范县16个，创建省级农业标准化示范基地80多个，认证无公害、绿色、有机和地理标志农产品1500多个，&ldquo;三品一标&rdquo;农产品生产面积达2700多万亩。全省农产品质量安全追溯工作全面启动，已录入各类生产经营档案近1300条，上传各类农产品质量安全检测数据24万多条。2015年，甘肃省、市、县、乡四级抽检的农产品样品总量接近30万份，检测平均合格率稳定保持在98%以上。</p>\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('49','凤凰网记者姚瑾近期报道，福州聚春园集团与中国质量万里行产品溯源平台在榕签订战略合作协议。省政府食品安全处、福州市市场监督管理局以及福建中检检测有限公司等单位负责人和代表出席签约仪式。<br />\r\n&nbsp;<br />\r\n据了解，目前，中国质量万里行产品溯源平台拥有两大技术服务体系，即码根码防伪溯源系统和码根码大数据系统，并基于此搭建起行业诚信商圈。通过赋予每个产品独特的&ldquo;产品身份证&rdquo;，帮助企业实现防伪、防窜货、移动商城等功能，也使得传统企业对商品从工厂到消费者的全过程充分了解，进而完成在线化、数据化升级。而消费者通过扫码，即可获知食品从&ldquo;种子到餐桌&rdquo;的全过程。<br />\r\n&nbsp;\r\n<div style=\"text-align: center;\"><img alt=\"\" src=\"/touyun/uploadfile/2018/0414/20180414094333584.jpg\" style=\"width: 329px; height: 220px;\" /><br />\r\n&nbsp;</div>\r\n聚春园始创于1865年，是我省现存年代最为悠久的历史名店。驰名中外的闽菜&ldquo;佛跳墙&rdquo;即源于此。该集团在我省酒店业和餐饮业占有重要份额，也是我省商贸服务业和美食文化领域的名片和窗口。其生产的营养餐、调理包以及粽子等，作为双方合作的首批溯源产品，从采购、检测、入库、生产加工、物流配送到餐桌全程入手，建立起食品安全可追溯示范体系。<br />\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('50','为深入贯彻落实国务院办公厅关于加快推进重要产品追溯体系建设的意见，进一步推进本市二维码食品流通信息追溯新技术、新模式应用，近期，市商务委组织召开专题座谈会，深入推进超市环节二维码食品安全信息追溯工作，欧尚、家乐福、华润万家等20余家相关企业负责人参加座谈。<br />\r\n&nbsp;\r\n<div style=\"text-align: center;\">&nbsp;<img alt=\"\" src=\"/touyun/uploadfile/2018/0414/20180414094409669.jpg\" style=\"width: 300px; height: 220px;\" /><br />\r\n&nbsp;</div>\r\n市商务委通报了商务部会同相关部门推进重要产品追溯体系建设的有关情况，介绍了本市二维码食品流通追溯试点推进情况；上海质尊溯源电子科技有限公司介绍了在欧尚超市试点开展二维码肉菜流通追溯有关做法。一是从肉菜供应商生产加工环节入手，源头上掌握相关信息数据，每一个预包装产品均附有可追溯的二维码。二是注重发货、配送、收货等各个环节配上扫描枪，全过程、全环节实现信息追溯。三是实现产品追溯信息与食品安全信息追溯平台实时对接。消费者在购买前，通过扫描二维码可迅速了解产品的原产地、生产商、运输商、零售商等详细信息，极大地方便了消费者查询了解食品安全信息，基本实现了从田间地头到餐桌的全过程追溯。<br />\r\n&nbsp;<br />\r\n通过座谈，各企业对推进二维码食品流通追溯进一步提高了认识，本市将继续扎实推进二维码食品流通信息追溯体系建设。<br />\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('51','【摘要】 6月18日，由上海市商务委主办，上海质尊溯源电子科技有限公司和宝燕集团承办的上海市食品安全宣传周闵行分会场活动举行。在闵行区商务委和闵行区市场监督局领导们的共同见证下，相关各方共同签署了战略合作协议，并向宝燕集团授予上海市质量追溯与防伪行业协会会员铭牌。<br />\r\n&nbsp;\r\n<div style=\"text-align: center;\">&nbsp;<img alt=\"\" src=\"/touyun/uploadfile/2018/0414/20180414094444825.jpg\" style=\"width: 330px; height: 220px;\" /><br />\r\n&nbsp;</div>\r\n二维码商品追溯系统介绍<br />\r\n东方网记者方翔6月18日消息：今天，由上海市商务委主办，上海质尊溯源电子科技有限公司和宝燕集团承办的上海市食品安全宣传周闵行分会场活动举行。今年食品安全宣传周的主题为&ldquo;尚德守法共治共享食品安全&rdquo;，在活动现场，消费者进行了二维码商品追溯的现场体验活动，不少顾客们掏出手机并进行扫描，查看并了解到了产品的溯源信息。顾客们纷纷表示对于这种能查阅追溯信息的食品，更能让我们市民买的安心，吃的放心。在闵行区商务委和闵行区市场监督局领导们的共同见证下，相关各方共同签署了战略合作协议，并向宝燕集团授予上海市质量追溯与防伪行业协会会员铭牌。<br />\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('52','近年来，我国食品安全事件频频发生。不断暴露出来的食品生产、销售中肆意造假、有害污染等食品安全问题，严重危害民众的生命健康。为此，2015年10月1日起施行的新《食品安全法》明确规定：&ldquo;国家建立食品安全全程追溯制度。食品生产经营者应当依照本法的规定，建立食品安全追溯体系，保证食品可追溯。&rdquo;新法从国家层面提出了建立食品全程追溯制度，对食品安全管理提出更高的要求。<br />\r\n&nbsp;<br />\r\n虽然市场上早已有带追溯码的食品，可要吃到真正可溯源的食品并不那么容易。记者调查发现，各地食品溯源体系标准不一，由企业自建的食品溯源平台缺乏监管，变相衍生出了借助溯源码鱼目混珠、以次充好的乱象。有的食品张冠李戴，乱贴追溯码;部分原产地品牌的溯源码，变成了企业的牟利工具;消费者能查到的溯源信息也是参差不齐。<br />\r\n&nbsp;<br />\r\n建立食品追溯体系目的是规范食品安全生产销售流程，提高食品信息透明度，但是，食品溯源乱象却成为另一项安全隐患，缺乏监管的食品溯源制度反而降低了消费者对食品安全的信心。构建一个公开透明、统一标准的溯源平台有助改善以上问题。<br />\r\n&nbsp;\r\n<div style=\"text-align: center;\">&nbsp;<img alt=\"\" src=\"/touyun/uploadfile/2018/0414/20180414094528210.jpg\" style=\"width: 335px; height: 220px;\" /><br />\r\n&nbsp;</div>\r\n实施标准的食品溯源体系<br />\r\n国家物联网标识管理公共服务平台在打造物联网标识标准化、规范化管理体系的基础上，在食品溯源方面特别加大建设力度，在已有的物联网标识溯源系统中优化设置，积极实施完整的食品质量溯源体系，促进政府、企业、消费者的信息互通共享，也在统一溯源体系标准中不断努力。国家物联网标识管理公共服务平台具备以下特点：<br />\r\n&nbsp;<br />\r\n1、权威性<br />\r\n出现食品溯源乱象的其中一个原因是溯源平台缺乏监管和规范。溯源平台大致可以分为三大类：企业自建类;公共建设平台(第三方技术商开发平台);政府组建平台。企业自建类和公共建设平台均从企业利益出发搭建和维护，不具有权威性和公信力。<br />\r\n&nbsp;<br />\r\n国家物联网标识管理公共服务平台属于国家级平台，是国家发改委于2013年5月正式批复的物联网技术研发及产业化平台，具有权威性。平台以&ldquo;食品质量安全信息溯源&rdquo;作为重点标识服务项目之一，联合地方食药监局等政府机构建立产品从原材料--生产加工--产品--物流--销售等全过程的认证、跟踪、监控服务体系，采用二维码、RFID等设备，以标识码为信息载体，实现物与物之间信息交换、数据相连、资源共享，确保正规产品的信息透明，有效解决信息失真、信息不对称的问题。企业产品信息接入平台后，需经过严格审核，并且不能随意篡改，得到平台认证的企业，可独家获取平台根据产品溯源标识收集到的相关数据，共同推进食品溯源生态链建设，为中国企业树立良好的品牌形象。<br />\r\n<br />\r\n<br />\r\n&nbsp;2、技术性<br />\r\n一码溯源<br />\r\n国家物联网标识管理公共服务平台的食品溯源体系采用一码全程溯源方案，解决食品生产、运输、销售各环节信息管理模式或架构不同而造成断链，无法互联互通，做不到从生产到销售全程覆盖的问题。一码溯源减少了信息传输的人工干预环节，所有溯源资料均可在统一系统上跟踪查询、责任到人，确保食品溯源信息真实可靠。<br />\r\n&nbsp;<br />\r\n异构标识识别、转换<br />\r\n国家物联网标识管理公共服务平台在食品溯源方面主要采用异构标识识别、转换技术，通过算法进行异构标识匹配，识别不同标识所对应的类型，然后将非URI形式的物联网标识转化为URI形式的标识，从而实现食品信息的搜索、查询、数据记录与应用。食品企业接入国家物联网标识管理公共服务平台，能直接使用该技术，无须自建溯源系统，降低企业运营成本，有效促进企业开展食品溯源工作。<br />\r\n&nbsp;<br />\r\n3、联合第三方检验机构 双重保障食品溯源监管<br />\r\n国家物联网标识管理公共服务平台除了联合地方食药监局之外，还与中国检验认证集团食品安全溯源中心达成战略同盟，共促食品溯源体系发展。<br />\r\n&nbsp;<br />\r\n双平台具有权威性、高兼容性和延展性，能整合企业与政府的食品溯源相关信息，面向全国食品生产和含进出口在内的食品经营企业，实现产品追溯、防伪及监管。对消费者而言，通过标识编码可在国家物联网标识管理公共服务平台上查询到经由中国检验认证集团认证通过的食品，达到溯源信息&ldquo;双保险&rdquo;。<br />\r\n&nbsp;<br />\r\n目前，国家物联网标识管理公共服务平台已与多家知名企业在食品溯源领域实现了战略合作，并且取得一定成效。江苏省淮安市近70家食品企业加入了国家物联网标识管理公共服务平台食品溯源体系;跨境商品例如&ldquo;出前一丁&rdquo;方便面、德拉达爆米花等通过将食品溯源信息与国家物联网标识平台对接实现一码溯源;电商网站世界婴童网选择加入国家物联网标识平台溯源体系增强品牌影响力。<br />\r\n&nbsp;<br />\r\n未来，国家物联网标识管理公共服务平台将会创新技术、规范标准、接入更多相关监管部门，在食品溯源领域将发挥更加重要的作用。<br />\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('53','羊城晚报讯 记者马汉青、通讯员岳检宣报道：扫一扫二维码，进口商品可望全球质量溯源&mdash;&mdash;记者6月15日获悉，广东检验检疫局近日举行&ldquo;品质革命&rdquo;知名企业全球质量溯源启动会，宝洁、京东、苏宁、唯品会等40余家知名企业参加。<br />\r\n&nbsp;<br />\r\n据介绍，按照国务院推进大众消费品生产&ldquo;品质革命&rdquo;的部署，通过增品种、提品质，创名牌，将更好满足群众消费升级需求。广东检验检疫局从2012年开始建设进出口商品全球质量溯源体系，以信息化、智能化为手段，打造了&ldquo;智检口岸&rdquo;大数据平台，并于2015年6月1日全国率先上线跨境电商商品质量境内溯源，2015年9月1日率先实现跨境电商商品质量境外溯源，2016年1月1日率先对跨境电商进口商品和进境预包装食品实施二维码溯源。这次广东检验检疫局举行的&ldquo;品质革命&rdquo;知名企业全球质量溯源启动会，促使更多企业积极参与&ldquo;质量溯源体系&rdquo;建设，承担企业在维护质量安全方面的主体责任。<br />\r\n&nbsp;\r\n<div style=\"text-align: center;\">&nbsp;<img alt=\"\" src=\"/touyun/uploadfile/2018/0414/20180414094600657.jpg\" style=\"width: 274px; height: 220px;\" /></div>\r\n<br />\r\n<br />\r\n据悉，广东检验检疫部门的全球质量溯源体系正不断完善，从进出口商品工厂生产阶段到出厂、流通、进出口、消费等全部环节进行信息分段采集，并针对生产者、消费者、进出口商、物流企业、其他监管部门等分级展示货物名称、质量信息、检验检疫监管信息、物流信息等溯源信息，并采用我国自主研发、具有自有知识产权的闭源二维码作为溯源码。以南沙口岸为例，该口岸的进口汽车、一般贸易进口食品、跨境电商商品、市场采购出口商品已全部实现质量溯源，涉及的进出口商品货值达230亿美元，截至2016年5月31日，已有超过28.7万人次的查询量。<br />\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('54','记者日前走进湖南省流沙河花猪生态牧业股份有限公司,用微信扫一扫&ldquo;流沙河花猪&rdquo;包装盒上的二维码,很快看到相应的猪产品此前的生长周期、喂养的饲料等信息,从而确定所买是否为正牌产品、质量如何。这一流通溯源体系被纳入长沙市商务局肉菜溯源公共信息平台,让消费者能吃得安全和放心。<br />\r\n&nbsp;<br />\r\n流沙河土花猪是珍贵的家畜基因资源,其养殖食材取自自然五谷,原材料大都使用玉米。由于饲养配方一直沿用传统的五谷杂粮加青草,流沙河花猪从出生到出栏一般需要8到10个月时间,几乎是市面上普通的商品猪出栏时间的两倍。<br />\r\n&nbsp;\r\n<div style=\"text-align: center;\"><img alt=\"\" src=\"/touyun/uploadfile/2018/0414/20180414094634302.jpg\" style=\"width: 314px; height: 220px;\" /><br />\r\n&nbsp;</div>\r\n为了让消费者吃上放心猪肉,流沙河公司从饲料、养殖、防疫、屠宰、加工到流通各个环节,利用网络通讯、系统集成与数据库应用等技术,建立了完整的跟踪记录与及时追溯平台,以直观的形式将数据信息对应到每一头商品猪身上。<br />\r\n&nbsp;<br />\r\n消费者如何买到正宗健康的流沙河花猪肉呢?该公司以含RFID芯片的超高频猪耳标为信息载体,再通过追溯公共服务平台将屠宰商品猪的耳标号与检疫信息进行绑定,最后将耳标号与二维码进行绑定。<br />\r\n&nbsp;<br />\r\n流沙河公司在39家直营专卖店中,配备专用台秤、打码机与电脑。&ldquo;通过台秤,市商务局就可以查询到每天卖出了多少花猪肉,确保数据准确。&rdquo;该公司办公室主任张明明介绍,&ldquo;在最终的消费环节,经营者或消费者随时随地都可以通过扫描包装袋上二维码,获取商品基本信息。&rdquo;<br />\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('55','6月28日，京东集团与中国物品编码中心在京东集团总部举行签约仪式，全面达成深入战略合作。双方将在电子商务及移动端应用等领域，充分利用各自的资源优势，共同促进商品条码的使用规范，促进企业产品基础数据的标准化管理，推动我国电子商务、商品流通信息标准化发展。<br />\r\n&nbsp;<br />\r\n中国物品编码中心是统一组织、协调、管理我国商品条码、物品编码与自动识别技术的专门机构，隶属于国家质量监督检验检疫总局，成立于1988年，1991年正式加入国际物品编码协会(GS1)。通过中国商品信息服务平台，实现全球商品信息的互通互联，保障企业与国内外合作伙伴之间数据传递的准确、及时和高效;其物品编码与自动识别技术也已广泛应用于零售、物流、电子商务、移动商务等诸多领域。<br />\r\n&nbsp;\r\n<div style=\"text-align: center;\"><img alt=\"\" src=\"/touyun/uploadfile/2018/0414/20180414094725737.jpg\" style=\"width: 287px; height: 220px;\" /><br />\r\n&nbsp;</div>\r\n商品条码相当于商品在全球流通的&ldquo;身份证&rdquo;，不仅能够查验商品信息，还能识别生产厂商的合法身份。此次合作，双方将共同推进商品基础属性国际标准、&ldquo;可信数据源&rdquo;标识应用、产品安全追溯等方面的深入合作。事实上，双方的合作已经由来已久。此前，京东一直与中国物品编码中心及其下属的中国ECR委员会(供应链优化工作委员会)进行着长期合作。今年上半年，京东商城&ldquo;京东和美的协同型计划、预测及补货&rdquo;项目荣获&ldquo;2015中国ECR优秀案例&rdquo;，获供应链优化方向白金奖，成为零售行业供应链协同的成功范例。<br />\r\n&nbsp;<br />\r\n中国物品编码中心总工程师李建辉称，京东已经利用技术优势建立了从供应商到消费者的完整供应链体系，成为供应链的整合者。物品编码中心希望结合京东的众多优势，共同提升商品条码的使用率，不断推动中国乃至全球商品以安全、可靠、高效的方式送达消费者。<br />\r\n&nbsp;<br />\r\n&ldquo;统一编码可以有效降低成本、提升效率，完善企业供应链，不管是对企业效率和社会效率都是极大的提升，&rdquo;京东集团副总裁马松表示，&ldquo;京东一直在积极推进商品编码标准化、规范化的工作。&rdquo;<br />\r\n&nbsp;<br />\r\n业内人士称，此次合作将实现三方共赢。对中国物品编码中心而言，携手电商企业的领导者京东，开展标准基础数据的互通，有助于深化对注册商品条码企业的服务，达到优化数据的作用;对京东而言，通过与中国物品编码中心的合作，可以进一步深化其&ldquo;正品行货&rdquo;的品牌形象，并结合用户的购物习惯，优化扫码购物等上层应用，为消费者带来更加卓越的购物体验;对于终端消费者来说，商品条码的国际统一标准化，可以获得更透明的商品详细信息，有助于区分商品真伪，让消费者网购更有保障。<br />\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('56','长江云报道（湖北之声记者李晓雨、鲁俊 襄阳台记者汪岩岩）襄阳市食药监局日前召开新闻发布会透露：今年1到5月，襄阳市各食品安全监管部门和县（市）区共完成食品定量抽检任务6637批次，总体合格率95.4％，高于2015年同期水平。<br />\r\n&nbsp;<br />\r\n在抽检食品中，蔬菜、畜禽、水产品、米、面等合格率达到100％。不合格主要品种为：黄酒、仿瓷碗、消毒餐具、米面制品、食用油等。<br />\r\n&nbsp;<br />\r\n上半年，襄阳市食品安全监督管理部门共立案查处食品安全违法行为787起。襄阳市公安系统共办理制售假劣食品案件11起，抓获违法犯罪嫌疑人13人，刑事拘留9人，捣毁制假售假窝点9个。<br />\r\n&nbsp;\r\n<div style=\"text-align: center;\"><img alt=\"\" src=\"/touyun/uploadfile/2018/0414/20180414094758288.jpg\" style=\"width: 519px; height: 220px;\" /><br />\r\n&nbsp;</div>\r\n襄阳市食品药品监督管理局副局长王迪：&ldquo;今年我市将大力提升食品安全信息化的水平，在大型农贸市场、药店、商超、安装食品药品安全公共查询系统终端100台，方便市民查询食品药品相关信息。&rdquo;<br />\r\n&nbsp;<br />\r\n据了解，襄阳市力争从今年起，用两年时间，在规模以上食品生产企业、70％中小生产企业建立较为完备的食品安全追溯体系。<br />\r\n&nbsp;<br />\r\n截止目前，襄阳市已在襄阳丽波乳业有限公司、宜城市襄大农牧有限公司等120多家企业建立了食品安全电子追溯系统，实现了食品源头可追溯、过程可监控、流向可跟踪、责任可追究。市民只要扫一扫食品价格标签上所附的二维码，食品的原辅料供应商、生产信息、销售去向等关键信息就能一目了然。<br />\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('57','6月28日，宝贝格子与中国质量认证中心CQC码上世界防伪追溯平台（以下简称&ldquo;平台&rdquo;）正式签署战略合作协议。双方致力于&ldquo;海外直邮&rdquo;、&ldquo;原厂正品&rdquo;的供应链评价，引入中国质量认证中心实施验证和评价工作，以期开展全面的质量提升工作，帮助企业提高经营规范性和竞争力。<br />\r\n&nbsp;<br />\r\n中国质量认证中心CQC码上世界防伪追溯平台是由中国质量认证中心（CQC）主办的国家级防伪追溯公共服务平台。CQC是由中国政府批准设立，被多国政府和多个国际权威组织认可的第三方专业认证机构。中国质量认证中心始终致力于通过认证帮助客户提高产品和服务质量，促成各界的交流与合作，促进市场诚信体系与和谐社会建设。经过近三十年的发展，已经成为业务门类全、服务网络广、技术力量强的质量服务机构，以较高的信誉度和美誉度跻身世界知名认证品牌行列。利用CQC在产品质量领域的雄厚实力，以&ldquo;质量认证+产品评测+体系评价&rdquo;的方式，形成权威的产品检测报告，向消费者展示可信的产品认证信息。CQC码上世界平台结合先进的云计算、物联网、大数据等移动互联网技术，以&ldquo;一物一码&rdquo;防伪追溯技术为核心，为企业提供产品防伪、追溯等多项功能可靠服务。<br />\r\n&nbsp;<br />\r\n宝贝格子是海外直邮B2C电商平台。立足于整合全球海外资源，以独特的&ldquo;海外直邮+全球特卖&rdquo;运营模式以及&ldquo;海淘零差价、宝贝全球购&rdquo;的经营理念，迅速占据国内跨境电商市场，向中国消费者提供合法合格、安全的商品。宝贝格子具有独立的进出口经营权，拥有海外知名商品快速采购能力。目前已开通美国、意大利、日本、韩国、新西兰、荷兰、澳大利亚、英国等国家的海外直邮业务，合作商品上万种。<br />\r\n&nbsp;\r\n<div style=\"text-align: center;\"><img alt=\"\" src=\"/touyun/uploadfile/2018/0414/20180414094832245.jpg\" style=\"width: 427px; height: 220px;\" /><br />\r\n&nbsp;</div>\r\n合作期间，双方引入中国质量认证中心对宝贝格子开展长期性全方位质量提升工作，帮助提高企业经营的规范性、竞争力。引入中国质量认证中心对宝贝格子开展良好电子商务规范认证的相关认证评价工作。平台与宝贝格子成立联合项目工作组，协助中国质量认证中心研究制定&ldquo;海外直邮&rdquo;、&ldquo;原厂正品&rdquo;的供应链评价方案，并由中国质量认证中心对宝贝格子实施相关评价认证工作。在已获得中国质量认证中心认证证书或评价结论的情况下，平台依据中国质量认证中心授权与宝贝格子共同研究在电商展示页面、商品展示、商品销售等环节加施《中国质量认证中心CQC码上世界防伪追溯平台》标识的方案。<br />\r\n&nbsp;<br />\r\n平台运营方总经理王永建先生表示：近年来我国电子商务发展迅猛，为了更好地推动跨境电子商务迈向质量时代，CQC码上世界平台与国内跨境电商平台宝贝格子达成战略合作，平台秉承中国质量认证中心&ldquo;至臻至诚 持之以恒&rdquo;的客户服务理念，依托CQC的行业优势资源，利用&ldquo;互联网+供应链评价&rdquo;的方式，为消费者带来&ldquo;可信、可靠&rdquo;的商品。<br />\r\n&nbsp;<br />\r\n宝贝格子CEO张天天表示：此次与中国质量认证中心CQC码上世界达成战略合作协议，对宝贝格子乃至跨境电商行业有着重大的战略意义。宝贝格子率先在业内邀请权威第三方发起海外直邮商品供应链评价和防伪追溯，向消费者展示自身实力，做到宝贝格子海外直邮商品可溯源，可追踪。同时更多优秀海外品牌通过可信任平台进入中国市场。<br />\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('58','5日上午，记者在佛山市农村工作会议上获悉，2015年该市农地产出率达2.3万元/亩，高居全省首位。接下来，佛山拟从完善农村土地征收和宅基地管理制度、建立农产品质量安全可追溯系统、促进农业科技转化和成果应用等多个层面，深化&ldquo;三农&rdquo;改革发展。<br />\r\n&nbsp;<br />\r\n过去5年佛山农村居民人均纯收入年均增长超过10%，高于GDP和城镇居民收入年均增幅，2015年这一数据达到22063元。而佛山农地产出率近5年年均增长超10%，2015年达到2.3万元/亩，高居全省首位。<br />\r\n&nbsp;\r\n<div style=\"text-align: center;\"><img alt=\"\" src=\"/touyun/uploadfile/2018/0414/20180414094905445.jpg\" style=\"width: 479px; height: 300px;\" /><br />\r\n&nbsp;</div>\r\n会议还透露，佛山下一阶段将深化农村集体产权制度改革，拓展农村发展新空间。此外，佛山将建立农产品质量安全可追溯系统，探索设立农产品质量安全黑名单制度，不断健全农产品质量安全诚信体系。通过对农业企业及其产品进行建档编码、建立溯源数据库，佛山拟全面掌握全市农产品生产企业、产品种类信息并向公众提供查询服务。<br />\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('59','重庆市人民政府办公厅昨天印发《重要产品追溯体系建设实施方案的通知》，到2020年，重庆市将建立起包括农产食品、药品、特种设备等一系列的追溯数据统一共享交换机制。<br />\r\n&nbsp;<br />\r\n《通知》明确，在推进食用农产品追溯体系建设方面，建立食用农产品质量安全全程追溯协调机制，实现食用农产品&ldquo;从农田到餐桌&rdquo;全过程追溯管理。<br />\r\n&nbsp;\r\n<div style=\"text-align: center;\"><img alt=\"\" src=\"/touyun/uploadfile/2018/0414/20180414094945237.jpg\" style=\"width: 330px; height: 220px;\" /><br />\r\n&nbsp;</div>\r\n在食品追溯体系建设方面，围绕婴幼儿配方食品、肉制品、乳制品、食用植物油、白酒等食品，督促和指导生产企业依法建立质量安全追溯体系。鼓励进出口企业开展进口乳粉、红酒等产品追溯体系建设。<br />\r\n&nbsp;<br />\r\n另外，推进药品追溯体系建设方面，以推进药品全品种、全过程追溯与监管为主要内容，建设完善药品追溯体系。<br />\r\n&nbsp;<br />\r\n此外，在推进主要农业生产资料追溯体系建设方面，以农药、兽药、饲料、肥料、种子等主要农业生产资料登记、生产、经营、使用环节全程追溯监管为主要内容，建立农业生产资料电子追溯码标识制度。<br />\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('60','据《经济日报》报道，日前，农业部出台了《关于加快推进农产品质量安全追溯体系建设的意见》，提出建立全国统一的追溯管理信息平台、制度规范和技术标准，选择苹果、茶叶、猪肉、生鲜乳、大菱鲆等几类农产品统一开展追溯试点，逐步扩大追溯范围，力争&ldquo;十三五&rdquo;末农业产业化国家重点龙头企业、有条件的&ldquo;菜篮子&rdquo;产品及&ldquo;三品一标&rdquo;规模生产主体率先实现可追溯。<br />\r\n&nbsp;<br />\r\n近年来，互联网、物联网等信息技术快速发展，被广泛用于农产品安全追溯体系中，农产品质量安全追溯体系呈现出平台运营、全民参与的新趋势。生产流通全过程被摄像头、传感器准确记录，并纳入开放信息平台，消费者无论身在何处，拿起手机就可以查询所采购食品的生产流通信息。一旦发现农产品质量问题，就可以通过溯源码和互联网很快追溯到生产、流通主体的责任，从而确保农产品质量安全。<br />\r\n&nbsp;\r\n<div style=\"text-align: center;\"><img alt=\"\" src=\"/touyun/uploadfile/2018/0414/20180414095148388.jpg\" style=\"width: 293px; height: 220px;\" /><br />\r\n&nbsp;</div>\r\n据统计，目前全国所有的省、百分之八十八的地市、百分之七十五的县、百分之九十七的乡镇建立了农产品质量安全监管机构，落实专兼职监管人员十一万七千人。农业部全面启动了国家农产品质量安全县创建活动，确定首批一百零七个县、市作为创建试点单位，二十五个省同步开展了省级创建活动。<br />\r\n&nbsp;<br />\r\n农业部提出，健全完善追溯管理与市场准入的衔接机制，以扫码入市或索取追溯凭证为市场准入条件，鼓励各地会同有关部门制定农产品追溯管理地方性法规，建立主体管理、包装标识、信息采集、市场准入等追溯管理基本制度，促进和规范生产经营主体实施追溯行为。<br />\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('61','随着国民消费意识的提升，食品全程可追踪体系的建立显得尤为重要。只有产品生产透明化，才能赢得广大消费者的肯定和认可。伊利集团董事长潘刚表示，伊利作为乳业的龙头企业，在多年的发展中始终坚持以消费者的需求为发展根本，并推出了一套产品全程可追溯体系，为未来的食品行业品质透明化树立了标杆。<br />\r\n&nbsp;\r\n<div style=\"text-align: center;\"><img alt=\"\" src=\"/touyun/uploadfile/2018/0414/20180414095218327.jpg\" style=\"width: 425px; height: 220px;\" /><br />\r\n&nbsp;</div>\r\n为此，伊利建立了完善的产品追溯程序。奶源基地从奶牛出生即为其建立养殖档案，原奶运输过程实现全程可视化GPS跟踪，原奶入厂后采用条码扫描，随机编号检测;同时，建立了生产过程的产品批次信息跟踪表、关键环节的电子信息记录系统、质量管理信息的综合集成系统和覆盖全国的ERP网络系统，实现了产品信息可追溯的全面化、及时化和信息化，并且与国家平台进行对接。<br />\r\n&nbsp;<br />\r\n与此同时，据伊利董事长潘刚表示，伊利还在行业内率先探索和建立了标准化、规模化牧场SOP管理，即将现代牧场养殖、管理的所有流程和环节以统一规范、统一标准、统一格式清晰地梳理和描述出来。该SOP包括理论和实践，涵盖牧场12个管理方面，内容全面、专业精细。通过将SOP导入牧场，有利于科学地指导牧场的专业养殖和日常管理，从而提升牧场管理水平，提高牧场单产，降低生产成本，从源头控制原奶质量。<br />\r\n&nbsp;<br />\r\n除此之外，伊利集团还在伊利集团董事长潘刚的指引下，大力建设和发展标准化、规模化、集约化牧场。截至2015年底，伊利共投入约127亿元用于奶源升级与建设。2015年，伊利在全国拥有自建、在建及合作牧场2400多座，规模化集约化的养殖在奶源供应比例达到100%，居行业首位。<br />\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('62','央广网北京7月16日消息（安徽台记者张建亚、蚌埠台记者胡艳）据中国之声《央广新闻》报道，近期，不少细心的安徽蚌埠市民在买菜的时候会发现，一些千张、凉皮、豆干印刻着生产企业名称。近日，蚌埠市率先在全省&ldquo;刻字溯源&rdquo;监管豆制品，从源头上保证豆制品的质量。<br />\r\n<br />\r\n<br />\r\n<br />\r\n蚌埠市食品药品监督管理局食品生产监管科科长杨宝鼎说，豆腐、豆干、千张、凉皮上印着生产厂家的名称，可以防止经销商&ldquo;鱼龙混杂&rdquo;，让质量安全更有保证。对于豆芽类无法采用印刻&ldquo;防伪&rdquo;的豆制品，将逐步采用食品级小包装分装的方式来&ldquo;证明身家姓名&rdquo;。杨宝鼎说：&ldquo;我们创新的在几家企业和小作坊中开展了一项新的尝试，就是在我们豆制品上把自己企业的名称或者是logo刻在上面，对产品质量进行追踪溯源，同时这也是对豆制品生产企业以及小作坊是一种约束。&rdquo;<br />\r\n<br />\r\n<br />\r\n<br />\r\n<div style=\"text-align: center;\"><img alt=\"\" src=\"/touyun/uploadfile/2018/0414/20180414095255257.jpg\" style=\"width: 298px; height: 220px;\" /></div>\r\n<div style=\"text-align: center;\">&nbsp;</div>\r\n<br />\r\n据此前不完全统计，蚌埠市市区共有130家豆制品加工小作坊，一些证照不齐的加工小作坊内呈现&lsquo;脏乱差&rsquo;的现象。2014年6月蚌埠市颁布&lsquo;豆制品市场准入制度&rsquo;，豆制品加工单位必须登记在案，集贸市场购进和销售的豆制品，必须提供供货商的《食品生产小作坊登记证明》和《随货同行单》。<br />\r\n<br />\r\n<br />\r\n<br />\r\n截至目前，蚌埠市共有65家豆制品及豆芽加工小作坊取得备案登记，7家豆制品加工单位取得了食品生产企业许可证，目前蚌埠市豆制品日生产量在10万斤左右，豆芽日产量在5万斤左右。蚌埠市食品药品监督管理局食品生产监管科科长杨宝鼎表示，下一步准备在全市进行大面积的推广，所有的企业和小作坊都要按照这种模式进行生产，这种刻字的办法保证产品质量，我们蚌埠市在全省是第一家，目前我们省食品药品监督管理局把我们这种经验在向全省推广。<br />\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('63','上海等四地成追溯体系建设试点<br />\r\n获中央财政7亿元扶持，乳制品纳入可追溯范围，其流通秩序将重塑<br />\r\n作为推动内贸流通现代化、促消费的重要举措，我国重要产品追溯体系建设又获实质性重要进展。《经济参考报》记者日前从业内获悉，有关部门将在山东、上海、宁夏、厦门四地开启追溯体系建设示范试点，乳制品将纳入试点追溯范围；此外，四个试点地区还可自主选择特色产品纳入追溯范围。预计在一年半的试点期间完成体系建设，并总结经验向全国推广。这也是首次以省（计划单列市）为项目实施主体，对重要产品开展追溯体系建设示范工作。<br />\r\n<br />\r\n<div style=\"text-align: center;\"><img alt=\"\" src=\"/touyun/uploadfile/2018/0414/20180414095338375.jpg\" style=\"width: 565px; height: 220px;\" /></div>\r\n<br />\r\n<br />\r\n据悉，按照日前商务部、财政部内部下发的试点方案要求，试点地区可根据当地乳制品生产及消费总体格局，探索开展乳制品追溯体系建设，打造从奶畜养殖、生鲜乳收购到乳制品生产、销售全过程的追溯体系。鼓励开展进口奶粉追溯体系建设。<br />\r\n&nbsp;<br />\r\n此外，试点地区也可以因地制宜，根据当地条件选择1到2个产业链条完整的当地特色产品开展追溯体系建设。例如，宁夏可以选择葡萄酒、枸杞、牛羊肉等特色产品。<br />\r\n&nbsp;<br />\r\n除了追溯产品扩围之外，试点内容还包括对已有肉类蔬菜中药材流通追溯体系进行升级，包括对批发市场等关键环节实施电子结算改造，推广应用二维码等先进追溯技术等内容。<br />\r\n&nbsp;<br />\r\n&ldquo;流通的特点就在于一头连接消费一头连接生产，通过建立追溯体系，虽然流通环节不变，但起到秩序化规范化的作用，以消费者的要求倒逼生产者，最终实现生产经营者能够化被动为主动。&rdquo;业内专家告诉记者，乳制品已经成为很普遍的消费品，但是生产组织化程度还比较低，尤其是此前一些负面消息导致消费者对奶源质量等方面信心不足。将乳制品纳入&ldquo;来源可查、去向可追、责任可究&rdquo;的追溯体系中，无疑有利于大大提振消费信心，强化产业安全质量意识。<br />\r\n&nbsp;<br />\r\n以已经建立起追溯体系的产品为例，&ldquo;一些批发市场通过追溯系统将肉菜追溯、检验检测和电子交易相结合，主动了解经营户的交易信息，有效强化了进场管理，发现异常及时处理，保障产品安全。一些大型连锁超市依托追溯体系强化渠道管理，要求供应商必须建设追溯体系才能进店销售，加强了货源质量控制。消费者普遍反映，可追溯产品来源可靠，出了问题能及时找到责任人，使用起来就更加放心，消费意愿也提高了。&rdquo;商务部流通产业促进中心主任路政闽告诉《经济参考报》记者。<br />\r\n&nbsp;<br />\r\n记者还了解到，本次试点项目将获得中央财政7亿元的扶持。中央财政资金主要立足于弥补市场失灵，支持重点产品追溯体系建设中的薄弱环节和重点领域，比如乳制品和特色产品追溯体系建设中必要的基础设施改造、软硬件设备等。<br />\r\n&nbsp;<br />\r\n据山东省商务厅相关负责人介绍，山东省获得2亿元财政补助资金，资金将由山东省统筹安排用于支持先进适用追溯技术推广应用、现有老旧设备更新改造、专用标识标记制度建设、可追溯产品消费市场培育及地方重要产品追溯管理公共服务平台建设等方面。<br />\r\n&nbsp;<br />\r\n路政闽对记者表示，追溯体系的建设从2010年至今，一些成效已经显现。具体而言，促进了相关法律法规文件的出台，例如2015年4月食品安全法确立了全程追溯制度，这也是追溯第一次写入相关法律；促进了产业健康发展，企业借助追溯体系建设，提升信息化管理水平，促进产业发展方式转变，进而提升食品质量安全；此外，通过追溯试点示范的引领，倒逼生产经营主体提高质量意识和安全意识；同时，追溯体系实现了产品来源可查、去向可追、责任可究，这也使得消费者能更加明白、放心消费，从而拉动消费。<br />\r\n&nbsp;<br />\r\n在路政闽看来，追溯体系的建设依然任重而道远。她表示，当前最为迫切的应该是完善顶层设计。目前，我国重要产品追溯体系领域缺乏统一的顶层设计，已制定的追溯体系相关标准只涉及食品、农产品（12.570， -0.11， -0.87%）、药品、农业生产资料四个领域，对特种设备、危险化学品、稀土产品尚未制定，已建成的重要产品追溯系统在追溯模式等方面参照的标准具有较大差异。因此，迫切需要科学规划、制定重要产品追溯标准体系，指导追溯系统的建设。<br />\r\n&nbsp;<br />\r\n&ldquo;追溯体系跨部门、跨生产和流通环节，还涵盖了多种类产品，这就需要建立一个统一的可追溯平台，避免各部门各自为政，努力做到信息共享，打通可追溯体系下的生产、流通环节。&rdquo;她说，还需要搭建统一标准的追溯体系整体框架，避免因标准不统一造成的资源浪费，实现中央到地方、部门与部门、部门与企业之间的无障碍对接；此外，相关法律法规体系也有待进一步完善。<br />\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('64','四川省卫计委制定的四川火锅底料地方标准《食品安全地方标准火锅底料》日前出炉，并将从2017年1月15日起强制执行，四川省内所有相关企业都要达到此标准。<br />\r\n&nbsp;<br />\r\n据了解，此次出台的标准为食品安全产品标准，其中关于污染物限量、真菌毒素限量、微生物限量、农药残留限量、兽药残留限量、食品添加剂、标志标签等相关要求严格遵循国家食品安全基础标准的规定。该标准适用于以食用动物油脂和（或）食用植物油、食用盐、香辛料、辣椒、豆瓣酱中的部分或全部为主要原料，添加或不添加其他原辅料、食品添加剂，经过预处理、配料、炒制或熬制加工、包装（或分体包装）而成的火锅底料。<br />\r\n&nbsp;\r\n<div style=\"text-align: center;\"><img alt=\"\" src=\"/touyun/uploadfile/2018/0414/20180414095418954.jpg\" style=\"width: 357px; height: 220px;\" /><br />\r\n&nbsp;</div>\r\n早在2006年四川省相关部门就曾制定了《火锅底料技术要求》，是推荐性标准，企业可以选择是否执行，但这次的火锅底料标准是强制性标准，企业必须执行。不达标的企业，将受到相应处罚。此外，与火锅底料标准同时出台的还有针对酸菜调味料以及半固态复合调味料两项新食品安全地方标准，也将于明年1月15日起实施。<br />\r\n&nbsp;<br />\r\n对此，有业内人士表示，此次四川省相关部门出台针对火锅底料的强制性食品安全标准对于火锅业态的规范化和标准化有推动作用，尤其是火锅因重油重辣等原因一直是食品安全事件的高发地，且因受到消费者的喜爱遍布各地，四川火锅底料地方标准的实行也将为国内其他地区的相关部门提供监管依据，但同时，火锅也一直面临着严重的同质化问题，企业在遵守&ldquo;标准&rdquo;的同时也应当注重产品的创新及个性化发展，避免陷入更严重的同质化竞争。江边城外创始人李长江认为，企业应当遵守涉及到食品安全的相关标准，对于企业自身发展以及推动行业进步都有帮助。（记者 钱瑜 郭诗卉）<br />\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('65','河北省提升农产品集中交易市场食品安全水平<br />\r\n河北新闻网讯（河北日报记者马彦铭）近日，河北省食药监局印发《食用农产品集中交易市场食品安全&ldquo;双提升&rdquo;工作实施方案》，提出自2016年7月1日起，利用一年半时间，在全省范围内集中开展食用农产品市场主体食品安全管理水平和监管部门监管执法水平&ldquo;双提升&rdquo;行动。根据要求，全省农产品集中交易市场将大力推行食用农产品质量可追溯制度，批发市场开办者要印制统一格式的销售凭证，载明食用农产品名称、产地、数量、销售日期以及销售者名称、地址、联系方式等项目。销售凭证作为销售者的销售记录和其他购货者的进货查验记录凭证。<br />\r\n<br />\r\n<br />\r\n<br />\r\n&nbsp;鼓励和引导有条件的销售企业采用扫描、拍照、数据交换、电子表格等方式，建立食用农产品进货查验记录制度。鼓励批发市场开办者采用电子销售凭证等信息化手段落实销售者进货查验义务。鼓励大型商场超市采用扫描、拍照、数据交换、电子表格等方式，建立食用农产品进货查验记录制度。<br />\r\n<br />\r\n<br />\r\n<div style=\"text-align: center;\"><img alt=\"\" src=\"/touyun/uploadfile/2018/0414/20180414095459871.jpg\" style=\"width: 366px; height: 220px;\" /></div>\r\n<br />\r\n<br />\r\n<br />\r\n根据整治提升标准，市场开办者要查验并留存入场销售者的社会信用代码或身份证复印件，食用农产品产地证明或购货凭证、合格证明文件。无法提供社会信用代码或身份证复印件的，不得入场销售。无法提供食用农产品产地证明或者购货凭证、合格证明文件的，市场开办者进行抽样检验或者快速检测，合格方可进入市场销售。<br />\r\n<br />\r\n<br />\r\n<br />\r\n销售冷藏、冷冻食用农产品的，要配备与销售品种相适应的冷藏、冷冻设施，并符合保证食用农产品质量安全所需要的温度、湿度和环境等特殊要求。鼓励采用冷链、净菜上市，畜禽产品冷鲜上市等方式销售食用农产品。<br />\r\n<br />\r\n<br />\r\n<br />\r\n监管部门监管执法水平提升方面，县级食用农产品市场销售监管部门是基础和重点。根据要求，监管部门要对本行政区域集中交易市场开办者、销售者、贮存服务提供者等食用农产品市场主体分类建立食品安全信用信息档案，如实记录日常监督检查结果、违法行为查处等情况，依法向社会公布并实时更新。<br />\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('66','茂名市正式启动创建&ldquo;中国月饼名都&rdquo;。24日，记者获悉，广东省食品行业协会现正在对茂名市创建&ldquo;中国月饼名都&rdquo;行动计划进行评估，同时为推进当地月饼产业转型升级，该协会计划在茂名实施增品种、提品质、创品牌的&ldquo;三品&rdquo;战略的试点，并将在茂名构建首个月饼流通追溯体系。<br />\r\n&nbsp;\r\n<div style=\"text-align: center;\"><img alt=\"\" src=\"/touyun/uploadfile/2018/0414/20180414095532127.jpg\" style=\"width: 323px; height: 220px;\" />&nbsp;<br />\r\n&nbsp;</div>\r\n月饼产业是茂名的传统产业，历史悠久，制作技艺富有地方特色。目前，茂名有月饼生产企业290多家，规模以上企业80多家，从业人员超过10万人。据估算，2015年当地月饼产值超过20亿元。<br />\r\n&nbsp;<br />\r\n广东省食品行业协会将以茂名市为试点，建立以月饼为主的烘焙行业的追溯体系，从源头&mdash;&mdash;加工&mdash;&mdash;流通等全方面保障烘焙产品质量，增强消费者消费信心，提升产品销量和品牌知名度。据悉，目前协会已投资500多万元配置了追溯体系信息后台，这是全国食品医药行业唯一的一个信息后台平台。<br />\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('67','本报7月22日讯 &ldquo;今年炎陵黄桃挂果面积8900亩，预计可实现总产量4300吨，总产值将达2.8亿元。&rdquo;昨日上午，由株洲市炎陵县县委、县政府主办的炎陵黄桃大会在炎陵县中村瑶族乡拉开帷幕，炎陵县委书记黄诗燕宣布2016湖南&middot;炎陵黄桃正式开园。<br />\r\n&nbsp;<br />\r\n<img alt=\"\" src=\"/touyun/uploadfile/2018/0414/20180414095609324.jpg\" style=\"width: 385px; height: 220px;\" />&nbsp;<br />\r\n&nbsp;<br />\r\n消费者如何判断自己买的&ldquo;炎陵黄桃&rdquo;是否正宗？今年，炎陵县推行农产品身份标示&ldquo;满天星计划&rdquo;，建设农产品质量安全防伪溯源平台。该平台主要有二维码识别、登录网页、一体机扫码验证3种识别方式。其中在农产品上贴的二维码，就是该产品的&ldquo;身份证&rdquo;，消费者只要用手机扫一下，就可了解产品名、产品特征、产地信息、种植人、生长期施肥量等详细信息，既能让消费者&ldquo;知根知底&rdquo;，又能保护炎陵黄桃不被假冒。<br />\r\n&nbsp;<br />\r\n会上，流通企业代表邮政炎陵分公司、顺丰集团分别与炎陵黄桃产销企业代表炎陵搜农坊、耕夫子公司签订战略合作协议；副县长彭志、盘晓文代表炎陵县人民政府分别与京东集团和湖南搜农坊电子商务有限公司、苏宁易购签订战略合作协议。苏宁易购还授权炎陵搜农坊开设炎陵馆，搭建电商服务平台。并推出十斤黄桃省内邮费仅9元的快递优惠活动。<br />\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('68','中国网财经8月2日讯 商务部今日召开例行新闻发布会，新闻发言人沈丹阳表示，2010年以来，商务部、财政部分五批支持全国58个试点城市开展肉类蔬菜追溯体系建设，支持18个省市开展中药材追溯体系建设。目前，全国已有1万5千多家企业建成肉菜追溯体系，覆盖经营商户32万余户，初步形成了辐射全国、连接城乡的追溯网络，对推动食品安全治理模式和保障模式创新、打造放心消费环境，已经发挥了积极作用。<br />\r\n&nbsp;\r\n<div style=\"text-align: center;\"><img alt=\"\" src=\"/touyun/uploadfile/2018/0414/20180414095642995.jpg\" style=\"width: 345px; height: 220px;\" /><br />\r\n&nbsp;</div>\r\n沈丹阳表示，根据国务院的部署，最近商务部会同财政部决定支持上海市、山东省、宁夏回族自治区、厦门市开展重要产品追溯体系建设示范工作。这个示范工作主要包括四项内容：一是推进肉菜中药材流通追溯体系升级。对关键环节进行电子结算改造，推广应用更先进适用的追溯技术，优化追溯流程，建立追溯体系可持续运行长效机制。二是开展特色产品追溯体系建设。每个试点省市选取1到2个产业链完整但受假冒伪劣影响较重的特色产品开展追溯体系建设，打造特色产品绿色供应链条；鼓励支持第三方认证机构建立追溯体系专门认证制度，探索建立市场化的认证服务体系。三是开展乳制品追溯体系建设。打造从奶畜养殖、生鲜乳收购到乳制品生产、销售的全过程追溯体系；根据当地消费总体格局，探索开展进口乳粉追溯体系建设。四是建设重要产品追溯管理平台。建立权威统一的追溯大数据库，完善政府间数据共享交换机制，将平台打造成跨环节、跨部门的追溯信息互联互通的统一通道，向社会有序开放数据资源，探索追溯数据增值利用。<br />\r\n&nbsp;<br />\r\n沈丹阳表示，希望通过四个省市新的示范，打造一条从生产、流通到消费的全过程信息化追溯链条，推进生产经营全过程质量和风险管控，真正实现产品来源可查、去向可追、责任可究，打造放心消费渠道，助力消费转型升级。<br />\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('69','今年是本市放心肉鸡三年工程的最后一年，已累计有300多家养殖场和8家屠宰场纳入放心肉鸡质量监控体系，所有出厂肉鸡产品都会贴上二维码，实现全部环节的质量可追溯。<br />\r\n&nbsp;<br />\r\n武清区绿翅工贸有限公司是一家专门从事肉鸡屠宰的企业，每一批鸡肉出厂前，都会在包装上贴上一个二维码，扫描这个二维码就可以看到鸡肉的生产厂家、检疫情况等全部信息。一旦出现问题，就可以追溯相关环节的责任人。绿翅工贸有限公司董事长刘兆欣介绍说：&ldquo;您看这个二维码，从手机上一扫，就知道谁养的鸡，通过动检站检疫员检疫，检疫证号是多少，这个到供货的单位和餐桌，哪天屠宰的，整个就显示出来了。达到肉鸡可追溯。&rdquo;<br />\r\n<br />\r\n<br />\r\n<img alt=\"\" src=\"/touyun/uploadfile/2018/0414/20180414095729317.jpg\" style=\"width: 338px; height: 220px;\" /><br />\r\n&nbsp;<br />\r\n这就是本市放心肉鸡工程建立的质量安全追溯体系，除了能在扫描二维码后查看，这些信息也全部录入了市畜牧兽医局的相关信息平台。同时，检验检疫部门还要求所有的肉鸡养殖场在出栏前都要进行出栏申报检疫，从源头上确保肉鸡质量安全。正在对刚刚送来的肉鸡进行兽药残留监测的武清区动物卫生监督所窦张庄分所所长薄艳阳说：&ldquo;了解用的什么药，有没有违禁的，检测合格，给他出具检疫证，就可以出栏上市了。如果出现问题，经过确认存有，进行处罚，就是接着养殖，过段时间，再进行检测，没有了，才允许出栏。&rdquo;<br />\r\n&nbsp;<br />\r\n养殖场的出栏报检、屠宰场的上市前检疫，以及能够显示整个生产信息的二维码标示，这三者构成了放心肉鸡工程的质量安全监控体系，目前已在武清、宝坻、静海等地提升建设208个基地，今年还将再建成104个放心肉鸡养殖基地和两个放心肉鸡屠宰场。市畜牧兽医局质量监管处处长李晓东说：&ldquo;在十个有农业的区县，还有个别的龙头企业的，也设置检测点。和80个基层监测点。通过完善各个环节，初步形成了一个可追溯体系。&rdquo;<br />\r\n&nbsp;<br />\r\n据了解，目前，本市自产肉鸡能占到市场供应量的40%左右，其余要从河北、山东等外埠引入。为了确保这一部分的肉鸡产品也同样安全，本市相关部门从两方面着手，严抓产品质量安全。李晓东介绍说：&ldquo;由外阜的鸡肉产品，有一个进入市场的专用通道，设在市区周边的12个动物卫生防疫监督检查站进行登记备案，才允许进入。进入市场之后，还有市场监管部门进行监管，按照食品安全法，进行抽检。&rdquo;<br />\r\n<div>&nbsp;</div>\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('70','随着人们对食药安全的重视意识不断提升，在现代技术和现代设备的协力下，追溯体系的建立也初现成效，而且正有待全面建立，以保证食品安全和各类产品质量，最好地来维护消费者利益。近日，陕西省关于推进重要产品追溯体系的工作具体措施也正式公布。<br />\r\n&nbsp;<br />\r\n吃的食物、药品，用的电梯、烟花爆竹等出现问题，未来可查到是哪个环节出了岔子。如今，陕西省政府办公厅下发《加快推进重要产品追溯体系建设实施方案》（以下简称《方案》），明确主要任务、实施步骤，并确定了任务牵头负责单位。今年10月前，各有关部门制定具体实施细则，确定追溯体系建设的重要产品名录，明确建设目标、工作任务和具体措施；2018年6月前，建立部门追溯系统子平台；2020年12月前，建立全省重要产品追溯数据统一平台。<br />\r\n<br />\r\n<div style=\"text-align: center;\">&nbsp;<img alt=\"\" src=\"/touyun/uploadfile/2018/0414/20180414095809284.jpg\" style=\"width: 500px; height: 335px;\" /></div>\r\n<br />\r\n<br />\r\n《方案》明确：到2020年，基本形成覆盖全面、多级联通、多方协同的全省产品追溯平台体系和管理机制，初步实现有关部门、地方和企业追溯信息互通共享；食用农产品、食品、药品、农业生产资料、特种设备、危险品、稀土产品等重要产品生产经营企业追溯意识显著增强，采用信息技术建设追溯体系的企业比例大幅提高；社会公众对追溯产品的认知度和接受度逐步提升，追溯体系建设市场环境明显改善。<br />\r\n&nbsp;<br />\r\n推进食用农产品追溯体系建设<br />\r\n建立食用农产品质量安全全程追溯协作机制，以责任主体和流向管理为核心、以追溯码为载体，推动追溯管理与市场准入相衔接，实现食用农产品&ldquo;从农田到餐桌&rdquo;全过程追溯管理。推动农产品生产经营者严格履行生产安全责任，积极参与省农产品质量安全追溯管理信息平台运行。加快肉菜追溯体系建设进度，积极开展中药材追溯体系建设。<br />\r\n&nbsp;<br />\r\n推进食品追溯体系建设<br />\r\n围绕婴幼儿配方食品、肉制品、乳制品、食用植物油、酒类等食品，督促和指导生产企业依法建立质量安全追溯体系，切实落实质量安全主体责任。推动追溯链条向食品原料供应环节延伸，实行全产业链可追溯管理。积极开展进口乳粉、红酒等产品追溯体系建设。<br />\r\n&nbsp;<br />\r\n推进药品追溯体系建设<br />\r\n&nbsp;<br />\r\n以推进药品全品种、全过程追溯与监管为主要内容，建设完善药品追溯体系。完善制剂类药品电子监管，逐步推广到原料药（材）、饮片等类别药品。抓好经营环节电子监管全覆盖工作，推进医疗信息系统与省药品电子监管系统对接，形成全品种、全过程完整追溯与监管链条。<br />\r\n&nbsp;<br />\r\n推进主要农业生产资料追溯体系建设<br />\r\n&nbsp;<br />\r\n推进农业生产资料监管信息化建设。以农药、兽药、饲料、肥料、种子等主要农业生产资料登记、生产、经营、使用环节全程追溯监管为主要内容，建设主要农业生产资料追溯体系，实现农业生产资料产、购、销、用全过程追溯管理。<br />\r\n','0','','0','10000','','0','','0','1','|0');

DROP TABLE IF EXISTS `v9_page`;
CREATE TABLE `v9_page` (
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` varchar(160) NOT NULL,
  `style` varchar(24) NOT NULL,
  `keywords` varchar(40) NOT NULL,
  `content` text NOT NULL,
  `template` varchar(30) NOT NULL,
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  KEY `catid` (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO `v9_page` VALUES('8','愿景和使命',';','使命','<div style=\"background: #fff;\">\r\n<div class=\"smContainer\" style=\"height: 459px; background: url(\'/touyun/statics/touyun/images/shiming/smImg1.jpg\') no-repeat top right;\">\r\n<div class=\"smText\" style=\"padding-right: 300px;\">\r\n<h2>使命</h2>\r\n<p>我们的使命是：一物一码 万物互联</p>\r\n<p>作为&ldquo;一物一码&rdquo;应用的领导者，透云科技致力于通过为每一件商品赋予独一无二的二维码，并开发基于场景的有益应用。&ldquo;一物一码&rdquo;使商品成为品牌的自有媒介，帮助其传递信息、实时互动、记录行为、即时传播、高度共享以创造更高的商业价值。</p>\r\n<p>物物相连的物联网时代已经来临，智能手机将不再是唯一的关联登陆设备，智能穿戴等设备已可实现互联。二维码将彻底改变我们与世界交流的方式。作为连接世界的触点，二维码让一切事物连通到互联网，实现万物互联。</p>\r\n</div>\r\n</div>\r\n</div>\r\n<div style=\"background: #f2f2f3;\">\r\n<div class=\"smContainer\" style=\"height: 500px; background: url(\'/touyun/statics/touyun/images/shiming/smImg2.jpg\') no-repeat top left;\">\r\n<div class=\"smText\" style=\"padding-left: 300px;\">\r\n<h2 style=\"padding-top: 120px;\">使命</h2>\r\n<p>我们的愿景是：成为世界领先的互联网科技公司</p>\r\n<p>&bull; &nbsp;&nbsp; 不断升级&ldquo;一物一码&rdquo;技术，引领和带动中国互联网技术的进步及发展。</p>\r\n<p>&bull; &nbsp;&nbsp; 将透云的理念、技术、产品和服务推进世界舞台，实现万物真正互联。</p>\r\n<p>&bull; &nbsp;&nbsp; 与行业伙伴共同成长，赢得行业尊敬。</p>\r\n</div>\r\n</div>\r\n</div>\r\n<div style=\"background: #fff;\">\r\n<div class=\"smContainer\">\r\n<div class=\"smText\" style=\"padding-bottom: 100px;\">\r\n<h2>核心价值观</h2>\r\n<p>我们的核心价值观是：创新、分享、高效、共赢；</p>\r\n<p>创新是一种原则。是灵活变通、是革新；但不是抛弃，不是不切实际、无基础。</p>\r\n<p>分享是一种机制。是合作互惠、是协助；但不是攫取，不是不劳而获、无成果。</p>\r\n<p>高效是一种追求。是实事求是、是效率；但不是投机，不是天马行空、无执行。</p>\r\n<p>共赢是一种结果。是资源共享、是双赢；但不是纵容，不是一团和气、无规则。</p>\r\n</div>\r\n</div>\r\n</div>\r\n<div style=\"height: 600px; background: url(\'/touyun/statics/touyun/images/shiming/smImg3.jpg\') no-repeat top center;\">\r\n<div class=\"smContainer\">\r\n<div class=\"smText\" style=\"padding-left: 270px;\">\r\n<h2>企业精神</h2>\r\n<p>我们的核心精神是：价值源于创造</p>\r\n<p>我们认为，为社会创造财富，为地球创造美好环境，是企业和员工存在的价值所在。</p>\r\n<p>价值是创造出来的，没有创造，价值就是无源之水、无本之木。企业效益的实现、社会的认同、未来的发展以及员工个人的成长和价值实现，都离不开创造。</p>\r\n<p>企业的创造力是实现企业价值的源泉，而每位员工不断创造的动机和各具特色的创造能力，又是企业创造力的源泉。</p>\r\n<p>我们鼓励员工的价值创造，并为员工的价值创造提供必要的条件。企业对员工价值认可的程度，取决于员工为企业创造业绩的多寡。</p>\r\n<p>我们认为，员工的创造活动是通过工作来体现的。因此，我们每一位员工都应该尽职尽责、尽心尽力，并富有成效地工作，努力实现个人的人生价值。</p>\r\n</div>\r\n</div>\r\n</div>\r\n<div style=\"height: 310px; background: url(\'/touyun/statics/touyun/images/shiming/smImg4.jpg\') no-repeat top center;\">\r\n<div class=\"smContainer\">\r\n<div class=\"smText\" style=\"padding-left: 100px;\">\r\n<h2 style=\"padding-top: 120px;\">核心竞争力</h2>\r\n<p>我们的核心竞争力是：卓越的创新能力、优秀的企业文化、高效的组织团队。</p>\r\n</div>\r\n</div>\r\n</div>\r\n','','0');
INSERT INTO `v9_page` VALUES('13','联系我们',';','联系我们','<p>联系人：丁晨<br />\r\n电话： <span>021-61820853</span><br />\r\n邮箱：marketing@sao.so<br />\r\n上海总部地址：上海市静安区光复路581号</p>\r\n','','0');
INSERT INTO `v9_page` VALUES('22','加入我们',';','加入我们','<p>众店宝，百万小店的制胜法宝<br />\r\n马上加入，立享七重福利！<br />\r\n加盟热线：4006165073</p>\r\n<h5>七大福利</h5>\r\n<ul>\r\n<li>&bull; 免费使用价值3000元的门店智能设备及系统</li>\r\n<li>&bull; 价格更低的进货渠道</li>\r\n<li>&bull; 持续的促销活动和在线抽奖</li>\r\n<li>&bull; 众店宝店主奖励活动</li>\r\n<li>&bull; 线上线下的免费贴心服务</li>\r\n<li>&bull; 未来快速、低息的运营资金贷款保证</li>\r\n<li>&bull; 吸引更多附近客流的外送服务</li>\r\n</ul>\r\n<img src=\"/touyun/statics/touyun/images/about/interus.jpg\" />','','0');

DROP TABLE IF EXISTS `v9_pay_account`;
CREATE TABLE `v9_pay_account` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `trade_sn` char(50) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `contactname` char(50) NOT NULL,
  `email` char(40) NOT NULL,
  `telephone` char(20) NOT NULL,
  `discount` float(8,2) NOT NULL DEFAULT '0.00',
  `money` char(8) NOT NULL,
  `quantity` int(8) unsigned NOT NULL DEFAULT '1',
  `addtime` int(10) NOT NULL DEFAULT '0',
  `paytime` int(10) NOT NULL DEFAULT '0',
  `usernote` char(255) NOT NULL,
  `pay_id` tinyint(3) NOT NULL,
  `pay_type` enum('offline','recharge','selfincome','online') NOT NULL DEFAULT 'recharge',
  `payment` char(90) NOT NULL,
  `type` tinyint(3) NOT NULL DEFAULT '1',
  `ip` char(15) NOT NULL DEFAULT '0.0.0.0',
  `status` enum('succ','failed','error','progress','timeout','cancel','waitting','unpay') NOT NULL DEFAULT 'unpay',
  `adminnote` char(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `userid` (`userid`),
  KEY `trade_sn` (`trade_sn`,`money`,`status`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_pay_payment`;
CREATE TABLE `v9_pay_payment` (
  `pay_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL,
  `pay_name` varchar(120) NOT NULL,
  `pay_code` varchar(20) NOT NULL,
  `pay_desc` text NOT NULL,
  `pay_method` tinyint(1) DEFAULT NULL,
  `pay_fee` varchar(10) NOT NULL,
  `config` text NOT NULL,
  `is_cod` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_online` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pay_order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `author` varchar(100) NOT NULL,
  `website` varchar(100) NOT NULL,
  `version` varchar(20) NOT NULL,
  PRIMARY KEY (`pay_id`),
  KEY `pay_code` (`pay_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_pay_spend`;
CREATE TABLE `v9_pay_spend` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creat_at` int(10) unsigned NOT NULL DEFAULT '0',
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(20) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `logo` varchar(20) NOT NULL,
  `value` int(5) NOT NULL,
  `op_userid` int(10) unsigned NOT NULL DEFAULT '0',
  `op_username` char(20) NOT NULL,
  `msg` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `creat_at` (`creat_at`),
  KEY `logo` (`logo`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_picture`;
CREATE TABLE `v9_picture` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` char(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_picture_data`;
CREATE TABLE `v9_picture_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` text NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `pictureurls` mediumtext NOT NULL,
  `copyfrom` varchar(255) NOT NULL DEFAULT '',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_position`;
CREATE TABLE `v9_position` (
  `posid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `modelid` smallint(5) unsigned DEFAULT '0',
  `catid` smallint(5) unsigned DEFAULT '0',
  `name` char(30) NOT NULL DEFAULT '',
  `maxnum` smallint(5) NOT NULL DEFAULT '20',
  `extention` char(100) DEFAULT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `thumb` varchar(150) NOT NULL DEFAULT '',
  PRIMARY KEY (`posid`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO `v9_position` VALUES('1','0','0','首页焦点图推荐','20','','1','1','');
INSERT INTO `v9_position` VALUES('2','0','0','首页头条推荐','20','','4','1','');
INSERT INTO `v9_position` VALUES('5','69','0','推荐下载','20','','0','1','');
INSERT INTO `v9_position` VALUES('8','30','54','图片频道首页焦点图','20','','0','1','');
INSERT INTO `v9_position` VALUES('9','0','0','网站顶部推荐','20','','0','1','');
INSERT INTO `v9_position` VALUES('10','0','0','栏目首页推荐','20','','0','1','');
INSERT INTO `v9_position` VALUES('12','0','0','首页图片推荐','20','','0','1','');
INSERT INTO `v9_position` VALUES('13','82','0','栏目页焦点图','20','','0','1','');
INSERT INTO `v9_position` VALUES('14','0','0','视频首页焦点图','20','','0','1','');
INSERT INTO `v9_position` VALUES('15','0','0','视频首页头条推荐','20','','0','1','');
INSERT INTO `v9_position` VALUES('16','0','0','视频首页每日热点','20','','0','1','');
INSERT INTO `v9_position` VALUES('17','0','0','视频栏目精彩推荐','20','','0','1','');

DROP TABLE IF EXISTS `v9_position_data`;
CREATE TABLE `v9_position_data` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `posid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `module` char(20) DEFAULT NULL,
  `modelid` smallint(6) unsigned DEFAULT '0',
  `thumb` tinyint(1) NOT NULL DEFAULT '0',
  `data` mediumtext,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1',
  `listorder` mediumint(8) DEFAULT '0',
  `expiration` int(10) NOT NULL,
  `extention` char(30) DEFAULT NULL,
  `synedit` tinyint(1) DEFAULT '0',
  KEY `posid` (`posid`),
  KEY `listorder` (`listorder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_poster`;
CREATE TABLE `v9_poster` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(40) NOT NULL,
  `spaceid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `type` varchar(10) NOT NULL,
  `setting` text NOT NULL,
  `startdate` int(10) unsigned NOT NULL DEFAULT '0',
  `enddate` int(10) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `clicks` smallint(5) unsigned NOT NULL DEFAULT '0',
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `spaceid` (`spaceid`,`siteid`,`disabled`,`listorder`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO `v9_poster` VALUES('1','1','banner','1','images','array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://dev.wfyuan.com/touyun/uploadfile/poster/2.png\',\n    \'alt\' => \'\',\n  ),\n)','1285813808','1446249600','1285813833','0','1','0','0');
INSERT INTO `v9_poster` VALUES('2','1','phpcmsv9','2','images','array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://dev.wfyuan.com/touyun/statics/images/v9/ad_login.jpg\',\n    \'alt\' => \'phpcms专业建站系统\',\n  ),\n)','1285816298','1446249600','1285816310','0','1','0','0');
INSERT INTO `v9_poster` VALUES('3','1','phpcms下载推荐','3','images','array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://dev.wfyuan.com/touyun/uploadfile/poster/3.png\',\n    \'alt\' => \'phpcms官方\',\n  ),\n)','1286504815','1446249600','1286504865','0','1','0','0');
INSERT INTO `v9_poster` VALUES('4','1','phpcms广告','4','images','array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://dev.wfyuan.com/touyun/uploadfile/poster/4.gif\',\n    \'alt\' => \'phpcms官方\',\n  ),\n)','1286505141','1446249600','1286505178','0','0','0','0');
INSERT INTO `v9_poster` VALUES('5','1','phpcms下载','5','images','array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://dev.wfyuan.com/touyun/uploadfile/poster/5.gif\',\n    \'alt\' => \'官方\',\n  ),\n)','1286509363','1446249600','1286509401','0','0','0','0');
INSERT INTO `v9_poster` VALUES('6','1','phpcms下载推荐1','6','images','array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://dev.wfyuan.com/touyun/uploadfile/poster/5.gif\',\n    \'alt\' => \'官方\',\n  ),\n)','1286510183','1446249600','1286510227','0','0','0','0');
INSERT INTO `v9_poster` VALUES('7','1','phpcms下载详情','7','images','array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://dev.wfyuan.com/touyun/uploadfile/poster/5.gif\',\n    \'alt\' => \'官方\',\n  ),\n)','1286510314','1446249600','1286510341','0','0','0','0');
INSERT INTO `v9_poster` VALUES('8','1','phpcms下载页','8','images','array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://dev.wfyuan.com/touyun/uploadfile/poster/1.jpg\',\n    \'alt\' => \'官方站\',\n  ),\n)','1286522084','1446249600','1286522125','0','0','0','0');
INSERT INTO `v9_poster` VALUES('9','1','phpcms v9广告','9','images','array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://dev.wfyuan.com/touyun/uploadfile/poster/4.gif\',\n    \'alt\' => \'\',\n  ),\n)','1287041759','1446249600','1287041804','0','0','0','0');
INSERT INTO `v9_poster` VALUES('10','1','phpcms','10','images','array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://dev.wfyuan.com/touyun/uploadfile/poster/6.jpg\',\n    \'alt\' => \'phpcms官方\',\n  ),\n)','1289270509','1446249600','1289270541','1','0','0','0');

DROP TABLE IF EXISTS `v9_poster_201803`;
CREATE TABLE `v9_poster_201803` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spaceid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `area` char(40) NOT NULL,
  `ip` char(15) NOT NULL,
  `referer` char(120) NOT NULL,
  `clicktime` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`,`type`,`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_poster_201804`;
CREATE TABLE `v9_poster_201804` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spaceid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `area` char(40) NOT NULL,
  `ip` char(15) NOT NULL,
  `referer` char(120) NOT NULL,
  `clicktime` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`,`type`,`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_poster_space`;
CREATE TABLE `v9_poster_space` (
  `spaceid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` char(50) NOT NULL,
  `type` char(30) NOT NULL,
  `path` char(40) NOT NULL,
  `width` smallint(4) unsigned NOT NULL DEFAULT '0',
  `height` smallint(4) unsigned NOT NULL DEFAULT '0',
  `setting` char(100) NOT NULL,
  `description` char(100) NOT NULL,
  `items` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`spaceid`),
  KEY `disabled` (`disabled`,`siteid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO `v9_poster_space` VALUES('1','1','顶部搜索右侧广告位','banner','poster_js/1.js','430','63','array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)','','1','0');
INSERT INTO `v9_poster_space` VALUES('2','1','会员登陆页广告','banner','poster_js/2.js','310','304','array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)','会员登陆页广告右侧代替外部通行证广告','1','0');
INSERT INTO `v9_poster_space` VALUES('3','1','图片频道图片排行下方','banner','poster_js/3.js','249','87','array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)','','1','0');
INSERT INTO `v9_poster_space` VALUES('4','1','新闻中心推荐链接左侧','banner','poster_js/4.js','748','91','array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)','','1','0');
INSERT INTO `v9_poster_space` VALUES('5','1','下载列表页右侧顶部','banner','poster_js/5.js','248','162','array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)','','1','0');
INSERT INTO `v9_poster_space` VALUES('6','1','下载详情页右侧顶部','banner','poster_js/6.js','248','162','array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)','','1','0');
INSERT INTO `v9_poster_space` VALUES('7','1','下载详情页右侧下部','banner','poster_js/7.js','248','162','array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)','','1','0');
INSERT INTO `v9_poster_space` VALUES('8','1','下载频道首页','banner','poster_js/8.js','698','80','array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)','','1','0');
INSERT INTO `v9_poster_space` VALUES('9','1','下载详情页地址列表右侧','banner','poster_js/12.js','330','50','array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)','','1','0');
INSERT INTO `v9_poster_space` VALUES('10','1','首页关注下方广告','banner','poster_js/10.js','307','60','array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)','','1','0');

DROP TABLE IF EXISTS `v9_queue`;
CREATE TABLE `v9_queue` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` char(5) DEFAULT NULL,
  `siteid` smallint(5) unsigned DEFAULT '0',
  `path` varchar(100) DEFAULT NULL,
  `status1` tinyint(1) DEFAULT '0',
  `status2` tinyint(1) DEFAULT '0',
  `status3` tinyint(1) DEFAULT '0',
  `status4` tinyint(1) DEFAULT '0',
  `times` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`),
  KEY `times` (`times`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_release_point`;
CREATE TABLE `v9_release_point` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `host` varchar(100) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `port` varchar(10) DEFAULT '21',
  `pasv` tinyint(1) DEFAULT '0',
  `ssl` tinyint(1) DEFAULT '0',
  `path` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_search`;
CREATE TABLE `v9_search` (
  `searchid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `adddate` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`searchid`),
  KEY `typeid` (`typeid`,`id`),
  KEY `siteid` (`siteid`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM AUTO_INCREMENT=89 DEFAULT CHARSET=utf8;

INSERT INTO `v9_search` VALUES('1','1','1','1523704023','防伪包装结构及使用该防伪包装结构的防伪包装体 结构 防伪 结构 包装 使用','1');
INSERT INTO `v9_search` VALUES('2','1','2','1523706578','口香糖包装结构 口香糖 结构 结构 包装','1');
INSERT INTO `v9_search` VALUES('3','1','3','1523706681','柔性软体包装  包装','1');
INSERT INTO `v9_search` VALUES('4','1','4','1523706731','设置二维码标签的瓶盖防伪装置 二维码 瓶盖 装置 装置 标签 防伪 设置','1');
INSERT INTO `v9_search` VALUES('5','1','5','1523706778','射频识别与移动通信结合实现物品信息查验的系统和方 射频 移动通信 物品 物品 移动通信 结合 识别 实现 信息 系统','1');
INSERT INTO `v9_search` VALUES('6','1','6','1523706802','吸管包装结构及使用该结构的饮料包装-2 结构 吸管 饮料 结构 包装 饮料 使用','1');
INSERT INTO `v9_search` VALUES('7','1','7','1523706815','吸管包装结构及使用该结构的饮料包装 结构 吸管 饮料 结构 包装 饮料 使用','1');
INSERT INTO `v9_search` VALUES('8','1','8','1523706843','易拉罐拉环结构及使用该结构的易拉罐-1 易拉罐 结构 拉环 结构 使用','1');
INSERT INTO `v9_search` VALUES('9','1','9','1523706871','易拉罐拉环结构及使用该结构的易拉罐-2 易拉罐 结构 拉环 结构 使用','1');
INSERT INTO `v9_search` VALUES('10','1','10','1523706889','易拉罐内压式拉环结构及使用该结构的易拉罐 易拉罐 结构 拉环 结构 使用','1');
INSERT INTO `v9_search` VALUES('11','1','11','1523706920','国家金卡工程2014年度金蚂蚁奖（市场开拓奖） 金卡工程 市场开拓 蚂蚁 工程 蚂蚁 年度 国家','1');
INSERT INTO `v9_search` VALUES('12','1','12','1523706954','国家金卡工程2014年度金蚂蚁奖（优秀应用成果奖） 金卡工程 成果奖 蚂蚁 成果 工程 蚂蚁 优秀 年度 应用 国家','1');
INSERT INTO `v9_search` VALUES('13','1','13','1523706970','好品中国云鼎奖（骑士奖） 中国 骑士 云鼎奖 骑士','1');
INSERT INTO `v9_search` VALUES('14','1','14','1523706997','搜索中国正能量 点赞2015 创新中国·企业创新奖 中国 创新奖 能量 创新 能量 企业 搜索','1');
INSERT INTO `v9_search` VALUES('15','1','15','1523707012','中国互联网+行业创新企业奖 中国 互联网 行业 互联网 行业 创新 企业','1');
INSERT INTO `v9_search` VALUES('16','1','16','1523707028','多码防伪认证系统高新项目转化证书 高新 证书 项目 证书 系统 认证 新项目 转化 项目 高新 防伪','1');
INSERT INTO `v9_search` VALUES('17','1','17','1523707044','副理事长会员证书 理事长 证书 会员 证书 会员 副理事长','1');
INSERT INTO `v9_search` VALUES('18','1','18','1523707064','时代创变榜—2017年度影响力企业 影响力 年度 时代 时代 影响力 年度 企业','1');
INSERT INTO `v9_search` VALUES('19','53','1','1523707734','上海透云物联网科技有限公司正式成立  成立 正式 有限公司 科技 物联网','1');
INSERT INTO `v9_search` VALUES('20','53','2','1523707870','通过《多码防伪认证系统》高新技术成果转化项目  通过 项目 防伪 高新技术 认证 系统 优秀 应用 成果 国家 工程 蚂蚁','1');
INSERT INTO `v9_search` VALUES('21','53','3','1523707952','获得上海市“高新技术企业”称号  称号 获得 高新技术企业 上海市','1');
INSERT INTO `v9_search` VALUES('22','53','4','1523707984','通过BSI认证的ISO9001:2008和ISO/IEC 27001:2013管理体系认证  管理 认证 通过','1');
INSERT INTO `v9_search` VALUES('23','53','5','1523708012','荣膺新华网、人民网“创新中国•企业创新奖”  ','1');
INSERT INTO `v9_search` VALUES('24','53','6','1523708030','荣膺2015-2016年度“中国互联网+行业创新企业奖”  创新 企业 行业 互联网 年度','1');
INSERT INTO `v9_search` VALUES('25','53','7','1523708180','与新华网就“溯源中国”项目达成战略合作  战略合作 新华网 达成 项目','1');
INSERT INTO `v9_search` VALUES('26','53','8','1523708196','荣获微软中国“微软银牌能力合作伙伴”授权  授权 荣获 合作伙伴 能力','1');
INSERT INTO `v9_search` VALUES('27','53','9','1523708209','与新华网就“溯源中国”项目达成战略合作。  战略合作 新华网 达成 项目','1');
INSERT INTO `v9_search` VALUES('28','53','10','1523708224','在香港主板上市，香港联交所交易代码：01332  在香港 交易 代码 上市 主板 证书 荣获','1');
INSERT INTO `v9_search` VALUES('29','53','11','1523708252','透云科技母公司正式更名为中国透云科技集团有限公司  科技 有限公司 正式 母公司 集团 名为 北京 收购','1');
INSERT INTO `v9_search` VALUES('30','53','12','1523708280','推出新零售产品—众店宝  产品 零售 推出','1');
INSERT INTO `v9_search` VALUES('31','53','13','1523708305','荣膺中国财经峰会“2017年度影响力企业”  影响力 企业 年度 峰会 财经','1');
INSERT INTO `v9_search` VALUES('32','55','1','1523708956','培训主管  主管 培训 讲师','1');
INSERT INTO `v9_search` VALUES('33','1','19','1523709360','产品简介 简介 产品 零售 品牌 系统 包括 面向 产品 智能 会员 销售 提高 帮助 促销活动 应用 旗下 科技 消费者 环节 数据 建立 致力于 完整 经销商 服务 降低 新品 成本 营销 效率 生态 支付 在线 电子 高效 实现 管理 享受 设备 最大化 供货 旨在 实现利润 销售收入 实物 优惠 便利 分销','1');
INSERT INTO `v9_search` VALUES('34','1','20','1523709660','功能 功能 品牌 库存 商品 管理 促销活动 支付 快速 优先 成为 轻松 多种 上门 更多 优惠 电子 即时 情况 更新 创建 清单 促销 不足 享受 切实 多重 提醒 自动 吸引 开设 实惠 低价 附近 平台 提供 包括 方式 收银 配送 价格 第三方 交易 流水 直接 兑换 补贴 自行 定制 生成 合作 确保 在线 历史 单一 查询 实物','1');
INSERT INTO `v9_search` VALUES('35','1','21','1523709686','设备及配件 配件 设备 ','1');
INSERT INTO `v9_search` VALUES('36','1','22','1463317080','阳光变色防伪技术—帮您远离“山寨货” 防伪技术 山寨 阳光 阳光 防伪 我们 识别 有没有 科技 材料 这样 能够 消费者 技术 有效 需要 产品 功能 还是 这些 企业 无法 具有 商品 市场 问题 良好 这是 人民币 没有 抵制 不同 不易 借助 完成 工具 怎么样 广泛 才能 调查 目前 应用 做到 方便 任何 毕竟 而且 研发 吸收 小事 衣服 购物 远离 看见 别人 穿着 信息 民用 受到 特点 过程 最大 领域 推广 在于 启发 简易 方法 有限公司 快捷 我国 军事 研究 或者 开发者 即可 致力于 瞬间 无需 领先 优势 模式 替代 新型 制成 可实现 国际 使得 这项 对于 行为 共同 环境 消费 复制 创造 特种 标签 这个 工艺 解决 为了 考虑 特性 类商品 适应性 各种 各类 产品的 另外 满足 颜色 独特 坚决 新版 担心 应该 得到 健康 如果 损失 高度 重视 形象 受损 记者 利益 不仅仅 损害 有关 购买的 一点 出来 只要 造假 带来 可能 过去 可是 大家 很大 的损失 不会 部分 简单 得知 源于 采用 总公司 根据 对中国 依靠 导致 现象 以此 达到 产生 从而 改变 原理 根本 其他 高档 甚至 有些 发现 大多 较为 答案 时候 总是 找到 普及 复杂 昂贵 目的','1');
INSERT INTO `v9_search` VALUES('37','1','23','1463576760','合肥将建农产品可追溯平台 公交延伸到农村 可追溯 合肥 农产品 农村 农产品 实施 农业 意见 安全 公交 延伸 更加 示范 发展 追溯 建设 实现 现代化 晨报 根据 城市 美丽 产业 体系 健全 加工 休闲 显著 旅游 乡村 全国 基地 打造 力争 并且 平台 全省 目标 市政府 加快 落实 全面 原则通过 常务 率先 昨日 基本 解决 升级 安全问题 优化 水平 持续 改造 越来越 投入 基础设施建设 加大 推动 新一 提升 记者 融合 空间 确定 供给 总体 生产能力 粮食 主要 取得 景观 特色 提高 加速 布局 得到 产业化 四大 成效 产品质量 品质 食品安全 监管 共享 互联 全程 建立 信息 深入 小康 同时 处理 集中 园区 创建 加强 整顿 放心 厨房 以下简称 工程 推进 清理 行业 国家级','1');
INSERT INTO `v9_search` VALUES('38','1','24','1463663220','二维码扫一扫 金山品牌西甜瓜安全可追溯 二维码 西甜瓜 金山 金山 西瓜 记者 种植 品牌 为主 面积 上市 追溯 近来 销售 信息 长宁 报道 东方网 基地 消费者 示范 逐渐 情况 新鲜 走高 集中 纷纷 四大 气温 今天 特征 通过 体系 质量 建立 应用 时间 丰富 多样性 增加了 山区 今年 手机 主要 月中 延续 月底 了解 方面 档案 使用 生产 记录 质量安全 购买的 市民 确保 种子 生产基地 产品 查询 可以 质量管理 包装 详细 此外 运输 加工 扫描 销售活动 获悉 为了 便于 市区 学会 优质 选购 安全 商业 联合会 其中 春季 品种 小型 中型 开展 日期 日至 将于 集团 联合 举办 设立 城区 中心 届时 天下','1');
INSERT INTO `v9_search` VALUES('39','1','25','1463663220','济南：食药监约谈乳粉经销商 要求可准确溯源 乳粉 济南 经销商 经销商 济南市 药监局 经营 监管 食品安全 食品 销售 重点 生产 问题 履行 流通 自查 承诺 责任 供应商 经营者 管理 产品 实体 要求 市场 索取 影响 认真 合格 渠道 通过 证明 注册 内容 质量安全 需要 进行 标志 品牌 确保 制度 系统 建立 标签 记录 成为 全市 关注 社会 备受 话题 焦点 以往 检查 改变 常规 打破 开始 事件 准确 领域 处处 局长 近期 不法 票证 虚假 国家标准 消费 环境 实现 发现 符合 监管部门 行为 或者 种类 名称 文件 部门 报告 整理 保管 不少 相关 立即 期限 他人 未经 质量 网络 以后 所有 流入 未来 转变 表示 可以 机制 更好 保障 形成 查看 讲话 流向 电子 上报 制品 营造 提出 消费者 义务 参会 会上 放心 一个 地址 仓库 保存 形式 自律 措施 多个 资料 落实 区域 情况 认证 售后 日期 现象 不能 一些 目前 为止 还有 不但 代理 继续 资格 可能 有没有 但是 源头 的监管 方式 直接 组织 规范 签订 切实 出来 进入 初始 存在 会议 进入市场 环节 介绍 同时 企业 供货 单位 标识 许可 检验报告 发票 来源 正规 验证 无法 清单 方面 信息 包括 涵盖 作为 商品 标准 讲解 法定 结合 实施 条例 高于 一般 追溯 现场 下发 系列 配送 制度建设 人员 储存 可靠','1');
INSERT INTO `v9_search` VALUES('40','1','26','1463663340','今年10月起 郑州农产品有望实现质量全程追溯 郑州 农产品 全程 农产品 追溯 质量安全 市民 我市 检测 全程 市场 流通 监管 农业 今年 月份 生态 示范 建设 实现 推进 体系 都市 有望 结果 中心 项目 信息 蔬菜 只要 即可 手机 购买 全国 推广 乡镇 基地 为基础 龙头 补充 三级 农业部 检验 模式 开始 预计 正式 运行 可实现 生产 技术 基本 目前 项目建设 建成 正在 网点 进行 启动 工作 质量 本市 日召开 基层 生产基地 标准化 服务机构 近年来 大事 走进 负责人 会上 郑州市 组织 全市 部门 建立','1');
INSERT INTO `v9_search` VALUES('41','1','27','1463663340','今年内江苏省70%白酒企业建立电子追溯系统 内江 白酒 系统 食品 企业 生产 追溯 系统 电子 江苏省 覆盖 平台 制品 今年 实现 检验 信息 查询 可以 登录 食品添加剂 监管 建立 结果 获悉 药品 公众 江苏 推动 食品安全 环节 的监管 等信息 分别 通用 政府 看到 基本 重要 型号 不仅 购买 名称 市民 食用 儿童 白酒企业 作为 输入 包括 商品 各项 这样 已有 了解 指标','1');
INSERT INTO `v9_search` VALUES('42','1','28','1495199400','南京19家食品企业建电子追溯系统 未来将逐步推开 南京 食品 系统 企业 生产 食品 系统 追溯 电子 平台 制品 查询 示范 建立 创建 公众 介绍 逐步 昨天 从业 南京市 大会 动员 目前 覆盖 城市 信息 药监局 这个 召开 国家 食品安全 培训 证明 健康 管理 会议 有关 主要 产品的 提出 年底 手机 标准 规范化 完成 有效 将来 依法 主动 停止 立即 采取 记者 处理 问题 不少 集中 接受 每年 落实 应急 召回制度 安全 每人 建设 基本 其中 建成 重点 计划 按照 已经 未来 品种 第二 内部 便于 通用 政府 的监管 网站 可以通过 就是 三个 一个 获得 植物 食用 食品添加剂 以及 通过 作为 探索','1');
INSERT INTO `v9_search` VALUES('43','1','29','1463663460','南京肉制品企业将建电子追溯系统 肉制品 南京 系统 食品 企业 系统 生产 追溯 电子 平台 制品 信息 输入 检验 建立 提升 登录 查询 药监局 公众 可以 食品添加剂 结果 商品 指标 各项 生产许可证 本报 记者 水平 我市 共有 目前 行动 包括 规范 管理 介绍 购买 型号 名称 基本 看到 重要 不仅 通用 分别 政府 的监管 江苏省 市民 了解 召开 已有 等信息 这样 今年 同时 探索 提出 大会 动员 环节 一大 一小 示范 城市 创建 食品安全 国家 开展','1');
INSERT INTO `v9_search` VALUES('44','1','30','1463663520','四川确定7大类100余种重要产品纳入追溯体系 四川 余种 大类 追溯 产品 体系 食品 进口 重要 食用 农产品 方案 建设 好事 要求 围绕 包括 四川 实现 备案 大类 可以 老百姓 品种 危险 作为 标识 质量安全 全省 统一 设备 建立 提供 生产经营 植物 信息 主体 制品 包装 根本 以前 安全 办法 来说 鉴别 认可 除了 地方 食品安全 好坏 确定 更多 特种 模板 针对 消费 为主 采用 特点 一个 来源 目前 成都市 认证 资质 基本 环节 责任 蔬菜 追究 技术 还要 此外 全程 开展 有机 流通 国内市场 手段 尤其 依法 召回制度 这些 值得关注 等产品 现代 提升 追踪 定位 规定 选取 诸如 上述 运用 试点 部分 点区域 识别 交换 超过 项目 电梯 多个 财产 公共 生命 纳入 重大影响 药品 其中 一类 推进 生产资料 农业 列入 服务 查询 重点 前者 有效 社会公众 覆盖 通过 建成 初步 根据 数据 共享 公共服务 窗口 开通 平台 管理','1');
INSERT INTO `v9_search` VALUES('45','1','31','1463663520','武夷山大红袍开始启用双标识防伪 双标 武夷山 大红袍 标识 标志 专用 使用 地理 企业 产品 市场 驰名商标 保护 许可 品牌 管理 有限公司 质量 获得 总经理 实施 规范 进行 对于 管理办法 销售 质监局 制作 有效 同时 一些 通过 国家标准 部分 目前 生产 通知 表示 了解 假冒 科学研究 北京 必须 效益 商标 之后 产量 实际 销售额 打击 加工 提升 维护 条件 收购 如此 外地 本地 记者 申请 亿元 品质 相关 引导 竞争力 影响 知名度 采访 相当 可以 两个 面积 标准 的发展 价格 地产 没有 利益 生态 最好 源头 提供 一个 不惜 这种 每年 特别 产生 为主 来说 是否 年来 种植 境外 最为 生产能力 办法 他们 开始 可行 提高 由于 鉴别 因此 造成 部门 出现 防伪 消费者 达到 不断 启用 规定 如何 政府部门 信誉 这个 现象 的影响 符合 具有 全国 手续 告诉 当地 自愿 照顾 这些 申报 同业 直接 的努力 是以 之下 推行 标准化 大部分 会长 随着 快速 一定 虽然 国家 方法 信心 消费 极大 凸显 只有 积极 担保 指标 证明 强制性 起草 草案 出台 地域 奥秘 负责人 去年 好不 一句话 近年来 热销 持续 进一步 重新 各项 繁荣 检测 内容 势必 修订 各地 更加 名片 不到 增加 有利于 表现 月份 咨询 自身 共同 实力 包装 不好 意味着 注重 建设 期待 比较 产品质量 相信 其中 人士 备案 更好 切实 的措施 之前 数量 体系 以及 组织 行为 培训 与此同时 追溯 建立 仍然 发现 不足 许多 第一 成为 商品 做出 保证 更多 全市 基本上 一方 注册 增强 推动 意义 过程 本市 努力 发放 查看 仔细 结合 当前 根据 激烈 政府 竞争 严禁 加强 暂行 几十 高达 几百 现在 确实 国内 我们 万吨 能否 得到 质疑 人员 提出 有点 年初 局长 包括 印刷 进口 流通 时有 已经 符合条件的 为了 眼前 届时 损害 近期 感受 资料 一家 年在 朋友 半年 原因 知道 代表性 故事 强制 目的 标的 方便 不是 现身 不能 竞争优势 因为 出厂价 还要 情况 时候 自己 是非 那个 优势 廉价 最后 协议 时刻 关键 立刻 起来 行动 办理 海内外 很大 必将 认知 真心 热爱 人心 正常 秩序 作法 不再 有关 给出 答案 发出 比率 明确表示 董事长 广大 自觉 行列 加入 不可 混淆 概念 炒作 视听 试图 概括 暴利 高价 推出 对外 采用 此外 曾经 身份 国家地理 生产许可证 才能 评审 负责 容易 需要 区别 食品 目的是 二者 没什么 外形 市政府','1');
INSERT INTO `v9_search` VALUES('46','1','32','1463663580','长寿：建设农产品溯源体系 电商销售额翻两倍 电商 长寿 销售额 体系 信息 生产 建设 农产品 利用 产品的 买家 销售额 产品 时间 网络 关键 导致 目前 完成 本地 公司 描述 图片 数据 互联网 使用 承诺 粮食 人民网 日电 类别 鸡蛋 三个 分析 认可 市场 月的 发现 意见反馈 售后 咨询 资料 上网 开启 特色 模式 前期 简单 只有 由于 运营 高度 关注 合作 面的 已经 商家 累计 建成 万元 产品销售 实现 批量 原因 缺失 安全 质量 可以 流量 减少 重要 低迷 成交量 开设 客户端 星际 种类 包括 质量安全 评分 指标 长期 大户 平台 昨日 养殖 组建 去年 介绍 助理 基础 电子商务 研发 同步 开辟 主任 地图 工作人员 环境 指导 绿色 企业 认证 有机','1');
INSERT INTO `v9_search` VALUES('47','1','33','1463663640','浙江建成全省统一农产品质量安全追溯大平台 质量安全 浙江 农产品 追溯 建设 主体 农产品 体系 质量安全 平台 生产 农业 监管 考核 推进 浙江省 机制 数据 构建 工作 管理 开展 信息 统一 全省 评价 不断 系统 功能 建立 责任 省级 保障 消费 基础 使用 通过 质量 要求 服务 以上 实现 政府 加强 层面 信息化 着力 出台 全面 资金 规模 纳入 中心 理念 开发 强化 内容 列入 全过程 目标 区域 技术 融合 进行 规模以上 省政府 示范 生产经营 基本 实施 负责 明确 水平 第一 提高 平安 提出 产业 方面 重点 更加 落实 重要 积极 财政 指标 国家 创建 食用 农民 专业 家庭 意见 关于 消费者 产品 逐步 提升 成立 应用 扶持 作为 社会 标准 组织 结合 手段 检测 各地 产品质量 支撑 运行 投入 已经 物联网 多家 同步 确保 建成 主要 给予 政策引导 过程 标签 操作 媒体 管理员 执法 队伍 交换 设备 专门 采集 培训 打造 龙头企业 共同 第三方 进一步 政策 奖励 国际 干部 通行 风险控制 以及 探索 地方 以奖代补 加快 万元 的努力 条件 认定 参与 年底 同时 能力 形成 经营 分析 浓厚 创新 一个 按照 监测 标识 特色 现实 意识 上看 发展 模块 三个 预警 互联网 方式 积极性 正在 便利 逐渐 完善 实际上 概念 一方面 从事 安排 社会公众 资金支持 力度 全部 电子化 最后 加大 上市 申报 目前 重大 重要依据 信心 晋级 诚信 结果 衡量 氛围 运用 整合 情况 之一 三分 完成 引入 认知 监督 改变 再次 风险 针对 至少 委托 管理工作 承担 宣传 领导 人为 小组 自身 引导 加大投入 生产过程 确立 顺利 具体 管理制度 权限 三级 实行 账号 用户 有序 成效 制定 传统 智能 鼓励 部分 人事部门 用于 电脑 配置 对象 普及 当下 知道 或者 乡镇 利用 打印机 效率 试点 终端 专项资金 推广 名单 选择 补助 地方政府 另一方面 配备 移动互联网 有助于 极大 传输 部门 奠定 从而 责任人 无疑 上述 基于 战场 产业化 规模化 新型 培育 大力 十大 主导 电子商务 农村 考虑 解决 欠缺 抓住 确定 薄弱 环节 原有 重复 现有 合理 开放 多种 问题 哪里 原则 编码 免费 接口 毫无 现代 范围 覆盖 扩大 截止 其中 万多 产生了 经过 启动 杭州 有效 项目 开始 决定 形势 适应 经验 需求 深刻 实践 融入 随着 直接 精神 文件 贯彻 试行 任务 衔接 举措 品牌 左右 力争 进入 城市 年初 今年 批发市场 全程 签订 全国 首先 有力 省份 极其 具有 其次 提供 这些 安全 合作 协调 研究 流通 贯通 绿色 定位 应急 处理 投诉 第二 推介 简介 管理系统 监管部门 各级 相关 深度 允许 生产管理 组成 概括 第三 的数据 数据库 各类 互联 切实 调度 共享 等信息 扫描 手机 登陆 查询 地址 日期 名称 意义','1');
INSERT INTO `v9_search` VALUES('48','1','34','1464873240','浙江各级人大跟踪监督食品安全情况 捍卫舌尖上的安全 舌尖 浙江 食品安全 食品安全 人大 食品 建议 开展 监督 群众 追溯 工作 检查 生产 提出 执法 各级 有关 部门 全省 监管 问题 专题 企业 我省 相关 询问 负责人 去年 意见 通过 代表 这是 信息 管理 放心 建立 持续 农产品 政府 民生 安全 一个 网络 情况 市场 跟踪 视察 做好 了解 平台 杭州 落实 人们 针对 制度 进行 加强 发现 今年 完善 不少 建设 销售 基础 近年来 体系 保障 贯彻 的安全 没有 提升 方面 积极 机制 治理 阳光 厨房 推动 就是 法规 现场 农业 成效 产品 省级 实施 主体 省政府 组织 形成 检测 领域 金华 他们 实现 记者 全国 最近 生产经营 事件 这个 调研 工程 大家 质量安全 动员 纳入 次会议 全产业链 提示 十二 信用 一起 联系 指出 专项 为民 关于 强化 进入 各类 健康 表示 一直 充分 市区 人人 范围 市民 听取 当前 委托 快速 存在 如何 更加 掌握 质量 认为 包装 进一步 提供 连续 但是 最大 我们 按照 现在 其他 政治 开发 乡镇 力度 一把 措施 安全风险 监测 面的 升级 审议 当地 特别 一线 深入 显示 手段 一次 还要 全体 以来 查看 取得 这些 捍卫 网上 广大 购买 加大 全部 目前 形势 发生 专门 推进 少数 核心 曝光 接下来 食堂 法律的 食用 促进 这次 研究 重要 多个 建筑 不停 地方 活动 关心 校园 开始 风险 周边 兑现 信心 规模 规模以上 查处 案件 围绕 总体 立案 月底 提交 每年 值得 整合 多方 程度 巩固 现状 资源 满意 老百姓 各种 利用 万余 已有 法律法规 另一方面 批发市场 衔接 制定 隐患 加快 零售 信息化 运用 此外 全过程 系统 公示 因此 发布 立法 预警 及时 动态信息 这份 增大 办理 药监局 认真 日益 得到 电子 复杂性 这方面 理念 行为 的监管 成为 特别关注 购物 传统 电子商务 互联网 改变 其中 举行 时尚 计算机网络 交互 载体 标签 虚拟 功能 年来 由于 交易的 依托 共享 原因 事故 一定 虽然 打击 一方面 生产者 违法行为 不止 缺失 道德 经营者 出台 更多 购买的 产生了 消毒 卫生 恐惧 要求 起来 方式 行动 纷纷 部署 不足 未能 标识 在内 档案 编码 搭建 包括 手机 消费者 之间 技术 扫描 终端 入手 诚信 必须 源头 有感 说起 有效 整套 监控 发出 全程 追踪 火锅 知名度 影响 解决 主任 广泛 征集 就此 先后 个月 许可证 一家 明显 成立 对于 审批 联合 百家 居然 山区 农户 经营 业主 而且 可以 有保障 不仅 意味着 超市 继续 标准 认证 转型 标志 转变 观念 真实 倾听 功夫 不负 生产许可证 有限公司 生态 有心 经过 家庭 日报 举措 追问 时常 能够 形式 不断 作为 主动 稳定 衢州 场所 制作 世代 随着 日渐 显现 逐渐 安全问题 欢迎 证明 事实 执行 以及 满意度 稳步 层面 数据 前列 还有 多家 放松 媒体 正在 快餐 加工 以前 监管部门 为什么 视频 先进 列入 多年 之一 开放 免费 国内 中毒 食物 学生 学校 采取 哪些 严肃 十足 气氛 答复 背后 扎实 一一 人员 为何 始终 整治 年在 餐饮 不到 根治 组成 面对 场景 生动 建成 实验室 仔细 走进 领导 另外 引导 主要 省委 登记 个体工商户 评估 验收 大市场 用心 客人 特殊 迎来 两个 单位 局面 汇报 良好 主动性 积极性 全面 现实 达到 中小学 新建 路径 参与 调动 突出 破解 查找 备案 环节 壮大 队伍 大事','1');
INSERT INTO `v9_search` VALUES('49','1','35','1465823700','南宁：扫二维码可追溯肉菜“生命密码” 二维码 南宁 可追溯 追溯 查询 信息 市场 经营者 主体 记者 消费 试点 流通 部门 商务 我市 体系 环节 推行 零售 目前 智慧 普及 基地 上游 获悉 手机 放心 市民 实现 据悉 终端 南宁 服务 便捷 进行 试点工作 六大 食品 随着 方式 发展 覆盖 的方式 途径 逐步 各个 明白 可以 密码 选择 快速 有关 昨日 根据 完善 生命 只需 计划 阶段 设计 相关 真正 以后 客户端 设立 公开 反馈 情况 热线 成为 可以通过 了解 工程 知识 应用 入口 平台 现场 落实 职能部门 及时 广大 管理 责任 推进 协同 开办 履行 产品质量 安全风险 防控 食用 加强 今后 义务 强化 推广 今年 建设 行动计划 跨越 来源 将纳入 商贸 加快 建立 年内完成 改造 结合 项目 市场体系 现代 扫描 现在 随后 可见 名字 页面 究竟 拿出 种类 点击 清晰 眼前 负责人 分钟 展示 不到 走进 新鲜 事先 进一步 可实现 措施 体验 告诉 这是 表示 系统 月底 工程师 股份有限公司 维护 中心 投入 使用 软件 网络 联通 安装 销售 通过 每个 技术 工作 过去 购买 打印 相比 经营 近期 已经 而言 具有 北路 两个 超市 只有 事前 优势 实时','1');
INSERT INTO `v9_search` VALUES('50','1','36','1465823700','湖南进口食品加贴防伪溯源码 扫一扫可辨真伪 湖南 真伪 源码 进口 食品 手机 信息 防伪 监管 企业 平台 扫描 消费者 进一步 一致 我省 证书 卫生 查询 记者 协会 日报 在线 源码 品质 真是 如何 只需 如今 生产商 代理商 生产 日期 现场 编号 市民 怀疑 高度 名为 名称 知道 准确 马上 问题 索赔 目前 国外 商品 接受 包括 拓展 其他 今后 橄榄 制品 快速 可以通过 海关 报关 证明 流向 详细 完全 出现 重复 一旦 担心 不用 产品 标识 采用了 介绍 会长 举行 今天 新闻发布会 宣布 运行 建成 智能手机 互联网 货物 验证 输入 标签 网络 网站 三者 是否 登记 在手 购买 信用 登录 技术 接入 功能 包装 决定 公开 显示 提示','1');
INSERT INTO `v9_search` VALUES('51','1','37','1523711801','上海透云物联网科技有限公司： 上海 科技 有限公司 公司 有限公司 科技 合作 员工 目的 参与 内蒙 食品 草原 用户 非常 全体 项目 紧密 防伪 感谢 所有 人员 运行 稳定 一直 实际上 安全 展开 将继续 为止 广告 宣传 维护 你们 行动 态度 工作 物联网 诚实 细致 本着 耐心 及时 协调 沟通 双方 开始 基于 目前','1');
INSERT INTO `v9_search` VALUES('52','1','38','1523712159','致上海透云科技公司的感谢信 感谢信 上海 科技 集团 科技 公司 地产 工作 产业 有限公司 合作 团队 服务 支持 信息化 陆续 双方 年起 战略 合作伙伴 方面 互联网 营销 压力 保障 要求 执行力 强度 体系 支撑 拓展 业务 积极 系统 提供 紧密 建设 全面 对我 先后 响应 成员 成立 迅速','1');
INSERT INTO `v9_search` VALUES('53','1','39','1523712347','焦点图1 焦点 焦点','1');
INSERT INTO `v9_search` VALUES('54','1','40','1462541040','透云科技发布最新消费者扫码白皮书 白皮书 消费者 科技 消费者 科技 认为 创造 商品 应用 万物 成为 互联 交互 品牌 活动 价值 意愿 发布 时代 提升 主动 希望 购买 商家 可以 通过 每月 调查 愿意 互动 周围 经历 分享 他们 入口 发现 信息 包装 论坛 基于 调研报告 创新 行为 领导者 日益 增强 方式 最新 成本 表示 的影响 客户 只是 不再 公司 身边 朋友 推荐 能力 开展 或者 选择 消费 积极 影响 流失 刺激 商业 想要 了解 共享 高度 记录 即时 传播 新时代 全文 免费下载 点击 链接 实时 经由 我们 新一 销售 市场份额 赋予 有的 媒介 帮助 领域 市场营销 开发 场景 有益 促销 激励 友好 自信 潮流 增加 进取 值得 信赖 围绕 搜索 本次 印象 经验 调研 定性 结合 经济效益 产生 研究 作为 正在 必要 采用 城市 产品的 在中国 进行 问卷 甚至 休闲 食品 其次 商场 海报 农产品 定量 不够 经常 集中 情况 做出 服务 产品 定制 个性化 决策 购物 获取 渠道 主要 战场 企业 降低','1');
INSERT INTO `v9_search` VALUES('55','1','41','1523712557','焦点图2 焦点 焦点','1');
INSERT INTO `v9_search` VALUES('56','1','42','1523712655','焦点图3 焦点 焦点','1');
INSERT INTO `v9_search` VALUES('57','1','43','1523712673','焦点图4 焦点 焦点','1');
INSERT INTO `v9_search` VALUES('58','1','44','1490275920','透云科技董事长王亮接受《第一财经》采访 王亮 董事长 财经 科技 认为 应用 商家 正在 交互 产生 提升 必要 作为 经济效益 领导者 显示 发布 董事长 调研报告 消费者 通过 新一 刺激 促销 入口 销售 市场份额 互联 开展 时代 万物 可以 采用 活动 财经 采访 接受 第一财经 产品的 购买 互动 成本 方式 客户 不再 意愿 指出 成为','1');
INSERT INTO `v9_search` VALUES('59','1','45','1515677580','透云科技发布《2017一物一码行业现状及发展研究白皮书》 一码 白皮书 现状 行业 业务 科技 企业 应用 规模 品牌 个性化 现状 规模化 营销 我们 亿元 未来 快速发展 发布 产品 目前 市场 各个 管理 达到 预计 发展 显示 分销 研究 主要 方面 竞争 激烈 公司 趋势 处于 持续 合作 已经 最为 能力 信任 呈现 年度 服务 的发展 同时 进一步 家企业 领导者 大型 明显 优势 预见 领域 表示 业内 信赖 理由 随着 相信 凸显 同比增长 必然 得到 进入 高速 综合 提供 扩张 更具 愿意 每年 展开 积累 非常 丰富 知名 国内外 蒙牛 光明 多个 经验 详情 下载 全文 更多 了解 包括 作为 一家 灵活性 整合 贴近 需要 方案 专注 推动 开发 升级 现有 截止 不断 基因 物联网 行业发展 创新 产品设计 阶段 具体 模式 形成 用户 关联 分类 市场份额 监管 监督 食品安全 国家 一块 将继续 扩大 成为 环节 销售 广泛 增长 大幅 实现 其中 包含 流通 周期 生命 普遍 覆盖 商品 入门 门槛 防伪 其后 其他 值得关注 占领 的趋势 可以看出 由此 发现 自动化 实施 要求 工业 危机 简单 造成 一定 部分 认为 分别 构成 阻力 中间 经销商 意愿 并且','1');
INSERT INTO `v9_search` VALUES('60','1','46','1465825200','福建省水产品可追溯标识正式上线 鱼儿有了\\\"身份证\\\" 福建省 可追溯 水产品 水产 产品的 品质 企业 身份证 配送 追溯 提高 发展 全程 标识 最后 公里 福建省 信息 我省 以及 采用 质量安全 时间 问题 越来越 健康 来自 会上 更多 城市 落地 从业 产品 运输 市场 要求 肯定 代表 福建 如果 品牌 出现 认为 海洋 生产 主要 产品质量 环节 获得 博览 海峡 业内人士 持续 推动 提升 方式 国际 高质 上线 正式 效益 消费者 的发展 空间 决定 销售 带来 正是 属性 温度 说出 影响 核心竞争力 生物 科学 环境 大学 放心 试水 教授 人员 服务 解决 完成 配合 降低 节点 难题 交易 确保 还是 更好 调控 传统 达到 记录 依托 流通 前来 布局 物流 焦点 不断 业内 完善 关注 咨询 了解 常务 协会 的风险 副理事长 表示 国内 目前 随着 因此 一样 有机 需求 只有 优质 卫生 论坛 强调 当前 才能 竞争 如何 作出 积极的 认同 广泛 观点 得到 与会 交流合作 全球 总量 重心 注重 数量 控制 坚持 留住 未来 增长 上来 研究所 所长 研究员 战略 国际化 商务部 研究院 产业 探索 兴奋 眼中 就是 名片 董事长 有限公司 开发 做好 马上 作用 积极 产生 这个 有利于 规范 轻松 可以 上市 打开 时刻 手机 显示 出来 以后 个人消费者 现在 判断 多年来 自己 经验','1');
INSERT INTO `v9_search` VALUES('61','1','47','1465825260','安徽欲建重要产品追溯体系 安徽 体系 产品 追溯 体系 药品 实现 监管 我省 建设 产品 农产品 企业 管理 全过程 建立 质量安全 食用 电子 重点 部门 食品 品种 重要 特种 设备 安全 全省 有关 数据 推进 食品安全 共享 报道 信息化 标准 安徽省 机制 逐步 示范 推动 安徽 主要 完成 在线 推广 市场 电梯 系统 制品 规划 原料 方面 生产 落实 信息 责任 获悉 预计 形成 开展 记者 完善 得到 全产业链 基础 医疗 类别 进口 环节 等产品 延伸 实行 内容 健全 供应 覆盖 爆炸 物品 民用 动态 登记 危险 使用 运输 储存 加快 经营 普查 在用 此外 来源 完整 国家 严格 技术 建成 平台 时间 档案 管理制度 以上 年内 力争 包装 标识 农业 产业化 家庭 合作 专业 龙头企业 农民 以及 初步 地区 基本 交换 统一 采用 试点 提高 大幅 比例 全部 全程 植物 围绕 指导 规范 进行 遵循 引导 依法 主体 衔接 协作 加入','1');
INSERT INTO `v9_search` VALUES('62','1','48','1465825320','甘肃着力构建农产品质量安全追溯体系 甘肃 质量安全 农产品 农产品 质量安全 甘肃 全面 监管 体系 追溯 农业 检测 记者 标准化 建成 生产 创建 主要 甘肃省 力争 品牌 强化 提升 绿色 期间 全省 大力 推进 能力 安全 示范 多个 规模 检验 以上 产量 稳定 保持 各类 完善 工作会议 产品质量 管理 日前 频道 着力 新闻 获悉 介绍 需要 现代 十二五 累计 基地 省级 国家级 全过程 满足 布局 作用 发挥 合理 职能 高效 运行 明确 构建 认证 万多 数据 上传 档案 四级 平均 接近 总量 生产经营 标志 地理 有机 面积 多万 启动 工作 全部 建设项目 责任 落实 基层 加强 努力 执法 覆盖 开展 社会 为此 深入 健全 发展 标准 确保 总体 同类 质检 规模化 实现 标准化生产 控制 遵循 普及 优质 提高 稳步 比重 依法','1');
INSERT INTO `v9_search` VALUES('63','1','49','1465825380','聚春园将建立 食品安全可追溯示范体系 春园 可追溯 食品安全 产品 食品安全 平台 万里 以及 集团 质量 追溯 我省 体系 了解 系统 通过 企业 消费者 全过程 检测 数据 防伪 记者 监督管理 市场 战略 示范 近期 报道 合作协议 签订 建立 省政府 中外 源于 最为 占有 年代 现存 历史 商贸 双方 合作 入手 作为 首批 采购 配送 物流 美食 服务业 全程 份额 文化 领域 营养 生产 窗口 名片 重要 商品 搭建 基于 技术服务 拥有 行业 诚信 独特 每个 赋予 目前 仪式 单位 有限公司 福建 负责 人和 签约 出席 代表 身份证 帮助 即可 升级 在线 食品 种子 完成 进而 功能 商城 移动 实现 使得 传统 充分 工厂','1');
INSERT INTO `v9_search` VALUES('64','1','50','1465825380','上海积极推进二维码食品流通信息追溯体系建设 二维码 上海 体系 追溯 信息 推进 流通 体系 食品 建设 产品 本市 环节 重要 进一步 食品安全 深入 实现 相关 扫描 座谈 介绍了 试点 有关 了解 通过 全过程 超市 情况 商务 加快 意见 新技术 关于 贯彻 落实 国务院 应用 模式 近期 消费者 实时 包装 平台 配送 注重 数据 一个 各个 基本 掌握 各企业 提高 扎实 将继续 认识 查询 方便 产品的 迅速 生产商 运输 极大 详细 零售商 购买 参加 负责人 企业 召开 组织 专题 座谈会 家乐福 工作 开展 有限公司 科技 做法 是从 入手 供应商 电子 部门 积极 通报 商务部 头上','1');
INSERT INTO `v9_search` VALUES('65','1','51','1466689440','了解产品更多信息 二维码商品追溯系统申城启用 二维码 申城 更多 上海市 追溯 商务 食品安全 集团 活动 共同 承办 举行 有限公司 商品 主办 信息 电子 科技 防伪 现场 质量 合作协议 授予 行业 进行 了解 顾客 战略 签署 市场 系统 摘要 更多 监督 各方 领导 相关 见证 体验 不少 手机 共享 扫描 放心 消费者 对于 食品 我们 市民 查阅 这种 产品的 纷纷 表示 守法 查看 产品 启用 今天 今年 主题 消息 记者 介绍 东方网 尚德','1');
INSERT INTO `v9_search` VALUES('66','1','52','1466689500','国家物联网标识管理公共服务平台积极实施标准的食品溯源 公共服务 标识 标准 食品 标识 物联网 平台 信息 国家 企业 公共 管理 体系 食品安全 追溯 标准 建立 监管 认证 实现 销售 产品 生产 全程 通过 建设 技术 消费者 权威性 不断 具有 缺乏 制度 政府 检验 问题 数据 识别 规范 查询 采用 实施 系统 联合 相关 品牌 接入 跟踪 集团 转换 有的 地方 可在 环节 第三方 药监局 不同 一个 领域 源码 透明 形式 污染 有害 造假 安全问题 严重 民众 加入 出来 我国 近年来 公共服务 事件 频频 暴露 发生 生命 危害 并且 健康 提出 积极 方面 统一 确保 为此 解决 规定 人工 主要 传输 资料 可靠 干预 算法 所有 责任 进行 真实 推进 获取 独家 根据 收集 生态 共同 得到 严格 经过 审核 不能 随意 中国企业 树立 无法 造成 互联 不到 覆盖 架构 管理模式 形象 良好 技术性 方案 运输 减少了 达成 一定 取得 战略合作 成效 江苏省 淮安 知名企业 多家 编码 而言 防伪 由中国 达到 目前 保险 商品 例如 监管部门 更多 新技术 发挥 更加 作用 重要 未来 影响力 网站 世界 增强 选择 经营 在内 无须 使用 直接 降低 运营 有效促进 成本 应用 记录 类型 对应 然后 转化 搜索 从而 开展 工作 发展 同盟 整合 进出口 战略 不对 双重 机构 保障 除了 中心 之外 匹配 国家发改委 反而 安全隐患 降低了 信心 公开 构建 成为 但是 目的是 流程 透明度 提高 有助 以上 改善 工具 层面 新法 要求 市场 虽然 保证 明确 生产经营 依照 应当 已有 真正 衍生 借助 部分 变成 不一 各地 容易 那么 记者 调查 发现 打造 标准化 服务项目 重点 之一 政府机构 原材料 作为 质量安全 国家级 属于 正式 产业化 研发 物流 全过程 相连 交换 正规 有效 产品的 之间 载体 服务 监控 设备 公信力 维护 质量 完整 促进 共享 具备 努力 设置 优化 管理体系 规范化 基础 特别 力度 加大 以下 特点 组建 利益 搭建 出发 三大 分为 其中 出现 原因 大致 可以 失真','1');
INSERT INTO `v9_search` VALUES('67','57','1','1523713415','扫码营销  营销 轻松 部署 营销活动 品牌 系统 提供 数据 帮助','1');
INSERT INTO `v9_search` VALUES('68','1','53','1466689500','扫二维码将可溯源进口产品 广东检验检疫局推进产品质量建 二维码 检疫局 广东 质量 商品 广东 全球 进口 品质 信息 进出口 检验检疫局 记者 知名企业 体系 革命 率先 建设 生产 实现 全部 企业 食品 消费 启动 报道 推进 近日 获悉 进行 消费者 针对 环节 采集 生产者 万人 据悉 查询 部门 不断 流通 阶段 工厂 完善 物流企业 其他 源码 作为 知识产权 具有 自有 汽车 亿美元 采购 出口 市场 贸易 一般 展示 货物 超过 分级 监管部门 名称 监管 采用 我国 截至 已有 物流 涉及 促使 更好 满足 名牌 品种 通过 群众 升级 智能 化为 信息化 年开始 需求 部署 消费品 产品质量 进口产品 苏宁 国务院 大众 按照 介绍 参加 手段 打造 方面 主体 质量安全 维护 承担 责任 参与 积极 上线 境内 全国 平台 数据 境外 包装 更多 举行 这次 实施','1');
INSERT INTO `v9_search` VALUES('69','57','2','1523713543','分销管理  管理 供应链 完善 缺失 部分 促销 通过 帮助 品牌 进行 分销','1');
INSERT INTO `v9_search` VALUES('70','1','54','1467639960','流沙河公司采用二维码+RFID电子耳标 实现对花猪身世的追溯 流沙河 二维码 身世 公司 信息 消费者 商品 产品 包装 追溯 商务 进行 如何 流通 环节 养殖 放心 数据 平台 公共 股份有限公司 很快 看到 生态 湖南省 记者 日前 走进 时间 相应 周期 通过 此前 生长 芯片 健康 身上 对应 技术 数据库 应用 系统集成 利用 建立 及时 直观 记录 跟踪 完整 形式 多少 介绍 最终 明明 主任 办公室 消费 经营者 获取 基本 扫描 可以通过 准确 确保 专卖店 配备 最后 专用 电脑 卖出 每天 查询 可以 载体 自然 原材料 资源 基因 大都 使用 由于 珍贵 电子 确定 是否 从而 等信息 质量 体系 安全 实现 长沙市 纳入 一直 加工 为了 需要 个月 一般 出生 传统 几乎 的两倍 采用 普通 各个','1');
INSERT INTO `v9_search` VALUES('71','57','3','1523713585','防窜稽查  分析 预警 跟踪 货物 帮助 企业 实现','1');
INSERT INTO `v9_search` VALUES('72','1','55','1467640020','京东携手中国物品编码中心 力推商品安全可溯源 京东 物品编码 中国 商品 编码 物品 中心 条码 企业 供应链 合作 应用 消费者 数据 集团 优化 电子商务 信息 双方 全球 识别 基础 技术 标准化 共同 深入 安全 提升 可以 效率 移动 领域 利用 购物 有助于 实现 通过 而言 高效 零售 深化 结合 委员会 成为 协同 工作 优势 推进 已经 一直 国际 此次 总部 产品 达成 促进 全面 管理 推动 自动 仪式 流通 我国 战略合作 签约 举行 统一 充分 副总裁 送达 的方式 极大 完善 可靠 降低成本 有效 不管 社会 建立 范例 成功 行业 供应商 完整 表示 不断 众多 希望 体系 整合 乃至 规范化 更加 卓越 体验 带来 上层 用户 手中 习惯 对于 终端 区分 有保障 详细 透明 来说 获得 形象 品牌 携手 领导者 开展 对中国 白金 业内人士 三方 标准 进一步 作用 达到 注册 服务 积极 项目 协调 诸多 商务 专门 广泛 物流 及时 准确 质量监督 信息服务平台 协会 成立 正式 加入 国家 合作伙伴 之间 传递 国内外 保障 机构 互联 相当于 进行 长期 年上半年 使用 及其 下属 规范 商城 美的 荣获 优秀 案例 总局 预测 各自 计划 此前 生产 厂商 合法 能够 不仅 组织 身份证 身份 发展 追溯 方面 事实上 标识 可信 属性 国际标准 方向','1');
INSERT INTO `v9_search` VALUES('73','57','4','1523713623','产品溯源  共享 信息 平台 开放 打造 基于 物联网 技术 产品','1');
INSERT INTO `v9_search` VALUES('74','1','56','1467640020','襄阳食药监：两年内70％中小企业完成食品安全追溯体系 襄阳 食品安全 中小企业 食品 食品安全 记者 追溯 今年 药品 信息 生产 系统 建立 水平 企业 市民 有限公司 召开 新闻发布会 日前 阳台 药监局 透露 监管部门 中小企业 体系 完成 报道 力争 从今 年起 时间 规模以上 中小 查询 公共 较为 安全 安装 终端 相关 方便 了解 监控 价格 标签 只要 追究 责任 辅料 关键 销售 供应商 跟踪 流向 城市 目前 截止 家企业 电子 过程 源头 实现 完备 制品 消毒 品种 上半年 监督 违法行为 公安 查处 立案 管理部门 主要 合格 总体 任务 定量 高于 达到 蔬菜 同期 办理 案件 监督管理 局长 信息化 提升 大力 我市 年内 刑事 犯罪嫌疑人 违法 大型','1');
INSERT INTO `v9_search` VALUES('75','1','57','1467640080','宝贝格子与中国质量认证中心码上世界防伪追溯平台 质量认证 格子 中国 宝贝 中心 平台 海外 评价 防伪 追溯 世界 商品 认证 工作 质量 供应链 战略 企业 提高 权威 产品 消费者 展示 帮助 技术 服务 合作 电子商务 全球 致力于 引入 合作协议 双方 开展 提升 知名 品牌 业务 达成 正式 市场 体系 表示 实力 签署 资源 运营 相关 可靠 提供 的方式 以下简称 行业 可信 国内 利用 第三方 经营 规范性 实施 是由 通过 竞争力 研究制定 方案 优秀 协助 项目 更多 由中国 情况 依据 授权 追踪 结论 获得 证书 同时 联合 成立 期间 全方位 中国市场 共同 进入 信任 规范 良好 有着 时代 乃至 战略合作 为了 更好 推动 秉承 天天 优势 互联网 依托 理念 客户服务 此次 迅猛 发展 自身 发起 标识 的方案 做到 环节 页面 带来 销售 总经理 邀请 我国 意义 重大 近年来 率先 业内 先生 研究 安全 建设 经过 三十 和谐 诚信 各界 交流 促进 已经 成为 和美 行列 产品质量 信誉 服务机构 网络 力量 促成 供应 公共 中国政府 批准 国家级 主办 全面 以期 验证 设立 政府 始终 客户 专业 认可 多个 国际 组织 领域 雄厚 合格 具有 独立的 进出口 合法 中国消费者 经营理念 迅速 占据 经营权 拥有 澳大 国家 开通 目前 快速 采购 能力 以及 信息 结合 先进 云计算 报告 产品评测 形成 检测 物联网 数据 整合 独特 模式 立足 移动互联网 核心 功能','1');
INSERT INTO `v9_search` VALUES('76','1','58','1467812880','佛山拟建农产品 质量安全追溯系统 佛山 质量安全 农产品 佛山 农产品 农村 质量安全 建立 地产 追溯 系统 全省 万元 改革 发展 产品 制度 达到 年均增长 深化 基地 接下来 记者 完善 日上午 征收 工作会议 获悉 土地 健全 不断 设立 集体 阶段 透露 会议 产权 服务 探索 此外 空间 拓展 诚信 农业企业 企业 生产 全市 种类 信息 查询 公众 掌握 及其 提供 通过 进行 编码 全面 数据库 体系 年均 三农 层面 过去 人均纯收入 居民 多个 应用 管理制度 拟建 促进 成果 转化 超过 高于 城镇 居民收入 增幅 数据','1');
INSERT INTO `v9_search` VALUES('77','1','59','1467812940','重庆将建立重要产品追溯体系 药品食品全程可查 重庆 全程 体系 追溯 体系 建设 食品 药品 建立 主要 推进 方面 食用 全程 农产品 生产资料 农业 通知 重要 产品 内容 质量安全 全过程 监管 印发 人民政府 设备 系列 昨天 生产 特种 制品 机制 包括 农产 品种 企业 鼓励 开展 出口企业 依法 进口 等产品 另外 使用 经营 环节 电子 制度 标识 指导 登记 此外 种子 完善 管理 实现 协调 数据 统一 共享 明确 交换 围绕 植物','1');
INSERT INTO `v9_search` VALUES('78','1','60','1468331460','国家级农产品追溯平台明年上线 给食品安全再上一把“放心 食品安全 农产品 平台 追溯 农产品 平台 管理 质量安全 信息 建立 农业部 体系 主体 生产 全国 百分 提出 创建 制度 流通 统一 经济日报 报道 试点 意见 活动 安全 国家 食品安全 互联网 开展 加快 推进 建设 出台 关于 规范 日前 兼职 启动 监管 确定 产品质量 人员 十一 全面 首批 统计 十七 乡镇 监管机构 十八 目前 所有 落实 入市 制定 部门 有关 各地 包装 标识 实施 行为 生产经营 促进 采集 基本 鼓励 准入条件 同步 省级 个省 单位 作为 健全 完善 凭证 市场 索取 衔接 机制 一百 无论 产品 条件 龙头企业 产业化 重点 规模 率先 快速发展 广泛 物联网 实现 近年来 农业 放心 一把 明年 上线 选择 苹果 范围 力争 扩大 逐步 用于 呈现 一旦 发现 食品 采购 可以 查询 质量问题 可以通过 确保 从而 的责任 源码 很快 手机 何处 全过程 摄像头 趋势 参与 运营 全民 传感器 准确 消费者 国家级 开放 纳入 记录','1');
INSERT INTO `v9_search` VALUES('79','1','61','1468331520','伊利潘刚：打造全程可追溯系统夯实产品优质品质 伊利 可追溯 全程 产品 建立 全程 管理 追溯 养殖 董事长 集团 信息 消费者 透明化 生产 体系 提升 规模化 食品 系统 建设 标准化 行业 全面 全国 跟踪 环节 实现 统一 专业 发展 重要 尤为 只有 赢得 广大 显得 追踪 随着 品质 国民 消费 意识 肯定 才能 表示 认可 规范 合作 投入 流程 年底 截至 描述 清晰 格式 所有 现代 探索 率先 业内 在行 达到 比例 亿元 即将 用于 升级 拥有 出来 理论 提高 降低 水平 从而 日常 成本 源头 与此同时 指引 除此之外 质量 控制 指导 科学 供应 方面 涵盖 实践 大力 内容 在建 有利于 导入 通过 精细 包括 生产过程 为此 完善 树立 作为 优质 打造 龙头企业 推出 未来的 根本 需求 始终 坚持以 程序 基地 集成 覆盖 综合 质量管理 记录 平台 进行 国家 并且 及时 信息化 关键 过程 运输 出生 档案 采用 条码 检测 同时 编号 随机 扫描','1');
INSERT INTO `v9_search` VALUES('80','1','62','1468849920','安徽豆制品刻“身家姓名” “刻字溯源”监管豆制品 豆制品 安徽 身家 制品 蚌埠 生产 食品 安徽 企业 我们 加工 监管 记者 保证 这种 监督管理 进行 目前 全省 药品 登记 名称 时候 左右 单位 采用 必须 取得 不少 证明 市民 报道 消息 新闻 北京 一些 近期 推广 共有 产品质量 姓名 制度 市区 统计 呈现 现象 颁布 表示 所有 全市 准备 按照 模式 经验 第一 办法 完全 产量 提供 销售 市场 同行 许可证 备案 截至 上面 对于 质量安全 经销商 无法 防伪 的方式 包装 逐步 防止 可以 近日 发现 率先 头上 生产厂家 质量 创新 家企业 约束 以及 就是 尝试 开展 自己 或者 同时 追踪 此前','1');
INSERT INTO `v9_search` VALUES('81','1','63','1468849980','上海成追溯体系建设试点，获中央财政7亿扶持 上海 财政 体系 追溯 体系 建设 产品 试点 流通 重要 制品 消费 相关 环节 部门 生产 记者 此外 开展 管理 一些 特色 产业 促进 亿元 扶持 中央财政 范围 纳入 标准 消费者 要求 当地 改造 通过 建立 意识 设备 领域 山东省 统一 需要 制定 安全 质量 已经 方面 来源 强化 实现 系统 秩序 地区 推广 示范 选择 设计 完善 迫切 应用 批发市场 例如 我国 及时 地方 了解 先进 表示 包括 作为 经济参考报 主动 食品 生产经营 告诉 普遍 企业 提升 宁夏 信心 业内 连接 可以 日前 法律法规 责任 技术 信息 项目 推动 重点 举措 资金 更加 根据 促消费 商务部 放心 现代化 避免 提高 财政 支持 市场 销售 获得 主体 实施 中央 法律 比如 文件 出台 第一次 全程 确立 食品安全 薄弱 制度 失灵 具体 培育 用于 健康 公共 安排 制度建设 适用 更新 现有 标识 标记 统筹 专用 商务厅 而言 软硬件 基础设施 显现 成效 补助 介绍 负责人 必要 高质 指导 规划 涵盖 多种 平台 一个 科学 因此 模式 建成 参照 具有 差异 较大 努力 之间 浪费 资源 进一步 有待 造成 框架 共享 做到 搭建 整体 尚未 同时 弥补 引领 使得 明白 拉动 从而 质量安全 进而 信息化 借助 水平 产业发展 转变 方式 看来 依然 药品 农业 生产资料 危险 特种 农产品 最为 当前 应该 目前 涉及 缺乏 发展 控制 之外 除了 内容 已有 蔬菜 完整 完成 条件 期间 进行 在于 特点 自主 虽然 起到 不变 等内容 关键 升级 电子 预计 结算 进口 鼓励 工作 计划 据悉 按照 探索 格局 打造 养殖 全过程 收购 总体 总结 内部 财政部 下发 方案 经验 全国 规范化 作用 依托 大型 渠道 供应商 才能 必须 保障 处理 交易 经营 有效 异常 发现 加强 中心 主任 本次 主要 财政资金 意愿 起来 可靠 反映 问题 找到 使用 责任人 结合 电子交易 消费品 成为 但是 比较 程度 厦门 专家 生产者 将纳入 最终 能够 开启 被动 尤其 此前 进展 大大 实质性 检测 检验 有利于 无疑 消息 负面 导致 有关 不足 获悉 立足','1');
INSERT INTO `v9_search` VALUES('82','1','64','1469195580','四川火锅底料标准明年将强制执行 火锅底料 四川 标准 标准 火锅 食品安全 企业 四川 相关 地方 执行 限量 四川省 部门 出台 食用 制定 强制 同时 日起 对于 要求 其他 发展 食品添加剂 添加 针对 遵守 严重 应当 推动 受到 所有 以及 省内 出炉 日前 此次 一直 包装 强制性 事件 原因 尤其 作用 消费者 明年 喜爱 将于 复合 实施 对此 规范化 表示 业内人士 标准化 创始人 竞争 陷入 避免 认为 涉及 帮助 记者 进步 行业 自身 个性化 创新 地区 提供 国内 实行 各地 监管 依据 注重 产品的 问题 面临 遍布 规定 适用于 基础 国家 严格 遵循 动物 植物 主要 原料 全部 部分 标签 标志 了解 产品标准 达到 明年将 其中 关于 辅料 经过 可以 选择 推荐 技术 是否 这次 处罚 此外 相应 标的 必须 加工 处理 还有','1');
INSERT INTO `v9_search` VALUES('83','1','65','1469541240','河北：大力推行食用农产品质量可追溯 可追溯 河北 农产品 销售 农产品 食用 集中 提升 交易市场 凭证 记录 开办 水平 食品安全 鼓励 采用 证明 河北省 监管部门 合格 社会 信用 根据 追溯 方式 建立 要求 电子 制度 名称 批发市场 数据 交换 表格 拍照 扫描 上市 无法 或者 文件 代码 大力 印发 药监局 产品质量 推行 新闻网 日报 近日 记者 全省 身份证 市场 监管 执法 市场主体 提供 进入市场 抽样 进行 适应 符合 设施 检验 品种 检测 快速 产品的 不得 配备 基础 结果 日常 信息 档案 违法行为 查处 实时 更新 公布 依法 情况 分类 环境 特殊 温度 质量安全 需要 产品 方面 服务 重点 县级 保证 义务 格式 数量 统一 行动 日期 以及 作为 项目 联系方式 地址 食品 提出 工作 日起 利用 开展 范围 时间 其他 标准 整治 信息化 企业 条件 引导 手段 落实 超市 商场 大型','1');
INSERT INTO `v9_search` VALUES('84','1','66','1469541300','广东省食协将在茂名市构建首个月饼流通追溯体系 茂名市 广东省 月饼 茂名 广东省 中国月饼 食品 创建 体系 追溯 流通 行业协会 产业 当地 信息 品牌 多家 协会 目前 企业 超过 试点 后台 进行评估 同时 行动计划 记者 正在 获悉 推进 正式启动 构建 个月 保障 产品质量 亿元 增强 方面 建立 行业 消费者 为主 源头 加工 提升 一个 平台 配置 产值 这是 医药行业 全国 多万元 投资 唯一 信心 产品 销量 据悉 知名度 消费 战略 品质 转型 升级 计划 品种 实施 富有 生产 规模以上 万人 从业 制作 传统','1');
INSERT INTO `v9_search` VALUES('85','1','67','1469541300','4300吨炎陵黄桃配上防伪“身份证” 炎陵 黄桃 身份证 今年 代表 身份证 消费者 农产品 战略 预计 可实现 签订 面积 苏宁 平台 防伪 识别 信息 主办 集团 政府 日上午 合作协议 本报 亿元 分别 流通企业 邮政 种植 特征 产品 产品名 分公司 长期 假冒 保护 详细 会上 电子商务 推出 搭建 省内 活动 优惠 快递 开设 授权 子公司 企业 人民政府 有限公司 了解 主要 如何 拉开 大会 书记 正式 宣布 判断 自己 验证 一体机 网页 方式 其中 只要 产品的 就是 登录 质量安全 推行 是否 身份 建设 计划 手机','1');
INSERT INTO `v9_search` VALUES('86','1','68','1470232560','商务部：全国已有1万5千多家企业建成肉菜追溯体系 商务部 多家 体系 追溯 体系 建设 开展 商务部 产品 打造 全国 支持 消费 建立 表示 示范 探索 特色 试点 数据 全过程 根据 平台 日召开 生产 制品 城市 新闻发言人 新闻发布会 机制 重要 财经 环节 升级 家企业 已有 流通 推进 中国网 工作 认证 建成 放心 统一 模式 财政 部分 以来 来源 专门 制度 转型 质量 市场化 风险 真正 实现 责任 第三方 产业链 完整 选取 每个 省市 影响 鼓励 服务 渠道 供应 绿色 养殖 造成 交换 共享 政府 资源 开放 有序 通道 社会 互联 信息 完善 数据库 当地 总体 通过 销售 收购 信息化 格局 进口 权威 增值 利用 管理 希望 生产经营 内容 发挥 积极 作用 已经 环境 保障 创新 治理 食品安全 目前 覆盖 经营 蔬菜 多家 万余 网络 推动 城乡 连接 初步形成 辐射 结算 改造 推广 电子 进行 包括 关键 应用 先进 持续 运行 流程 优化 适用 技术 主要 这个 最近 部署 国务院 财政部 决定 自治 厦门 宁夏 上海市 山东省','1');
INSERT INTO `v9_search` VALUES('87','1','69','1470232620','天津：放心肉鸡贴上二维码　全程质量可追溯 二维码 可追溯 肉鸡 放心 进行 追溯 养殖 体系 质量 本市 产品 质量安全 信息 工程 检测 相关 可以 这个 一个 环节 监控 今年 所有 全部 进入市场 监测 还有 通过 动物 基地 就是 显示 监管 市场 整个 部门 介绍 确保 没有 工贸 有限公司 目前 允许 纳入 最后 累计 多家 扫描 上市 问题 出现 了解 两个 区县 农业 提升 时间 构成 三者 能够 个别 处处 以及 建成 建设 生产 着手 登记 周边 市区 通道 设在 备案 进入 食品安全 按照 之后 监管部门 专用 接着 初步形成 各个 完善 设置 基层 左右 其余 安全 方面 同样 部分 引入 为了 龙头企业 要求 单位 供货 多少 知道 出来 达到 手机 董事长 专门 从事 一家 实现 全程 企业 包装 一旦 的责任 情况 生产厂家 看到 监督 卫生 所长 合格 确认 经过 如果 出具 刚刚 正在 除了 查看 建立 这些 申报 头上 同时 平台 处罚','1');
INSERT INTO `v9_search` VALUES('88','1','70','1471442220','陕西推进重要产品追溯体系力求实现全面覆盖 陕西 体系 产品 追溯 体系 建设 推进 产品 药品 建立 管理 监管 生产资料 主要 农产品 农业 重要 食用 食品 全面 企业 全过程 质量安全 平台 环节 实现 现代 具体 电子 推动 生产 提升 部门 积极 安全 责任 覆盖 意识 明确 设备 确定 方案 有关 原料 逐步 机制 信息 生产经营 主体 全程 陕西 形成 全省 制品 开展 系统 任务 而且 有待 技术 经营 保证 措施 加快 陕西省 食品安全 工作 不断 成效 完善 内容 品种 人们 随着 重视 明显 种子 市场环境 衔接 协作 载体 流向 使用 改善 核心 登记 参与 类别 推广 抓好 落实 依法 切实 供应 延伸 进口 等产品 全产业链 实行 指导 进度 运行 完整 履行 信息化 围绕 医疗 植物 严格 联通 下发 以下简称 政府 哪个 如今 实施 步骤 制定 实施细则 名录 今年 单位 负责 未来 问题 最好 维护 消费者 产品质量 各类 力求 利益 近日 电梯 出现 食物 公布 关于 正式 目标 特种 危险 显著 共享 初步 地方 增强 采用 社会公众 产品的 认知 提高 大幅 比例 协同 多方 数据 统一 基本 接受','1');

DROP TABLE IF EXISTS `v9_search_keyword`;
CREATE TABLE `v9_search_keyword` (
  `keyword` char(20) NOT NULL,
  `pinyin` char(20) NOT NULL,
  `searchnums` int(10) unsigned NOT NULL,
  `data` char(20) NOT NULL,
  UNIQUE KEY `keyword` (`keyword`),
  UNIQUE KEY `pinyin` (`pinyin`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_session`;
CREATE TABLE `v9_session` (
  `sessionid` char(32) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ip` char(15) NOT NULL,
  `lastvisit` int(10) unsigned NOT NULL DEFAULT '0',
  `roleid` tinyint(3) unsigned DEFAULT '0',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL,
  `c` char(20) NOT NULL,
  `a` char(20) NOT NULL,
  `data` char(255) NOT NULL,
  PRIMARY KEY (`sessionid`),
  KEY `lastvisit` (`lastvisit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO `v9_session` VALUES('0mas0lejsilh3uf0bh0vfq67f1','1','127.0.0.1','1523714319','1','0','admin','index','public_session_life','code|s:0:\"\";userid|s:1:\"1\";roleid|s:1:\"1\";pc_hash|s:6:\"aucxPI\";lock_screen|i:0;');
INSERT INTO `v9_session` VALUES('e0ghtsd7o9g5b434nteth5lq15','1','120.206.223.4','1523714296','1','0','admin','database','import','code|s:0:\"\";userid|s:1:\"1\";roleid|s:1:\"1\";pc_hash|s:6:\"Gf37wg\";lock_screen|i:0;');
INSERT INTO `v9_session` VALUES('inkiffva54t5ruesm663q949r7','1','61.129.122.78','1523714318','1','0','admin','database','export','code|s:0:\"\";userid|s:1:\"1\";roleid|s:1:\"1\";pc_hash|s:6:\"c1EctC\";lock_screen|i:0;');

DROP TABLE IF EXISTS `v9_site`;
CREATE TABLE `v9_site` (
  `siteid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(30) DEFAULT '',
  `dirname` char(255) DEFAULT '',
  `domain` char(255) DEFAULT '',
  `site_title` char(255) DEFAULT '',
  `keywords` char(255) DEFAULT '',
  `description` char(255) DEFAULT '',
  `release_point` text,
  `default_style` char(50) DEFAULT NULL,
  `template` text,
  `setting` mediumtext,
  `uuid` char(40) DEFAULT '',
  PRIMARY KEY (`siteid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO `v9_site` VALUES('1','默认站点','','http://www.wfyuan.com/touyun/','透云科技|一物一码_一物一码营销_一物一码营销公司','一物一码','透云科技通过“一物一码”技术致力于为每一件商品赋予独一无二的二维码，打通品牌与每一位既有消费者之间的进一步沟通交流。','','default','default','{\"upload_maxsize\":\"20480\",\"upload_allowext\":\"jpg|jpeg|gif|bmp|png|doc|docx|xls|xlsx|ppt|pptx|pdf|txt|rar|zip|swf\",\"watermark_enable\":\"0\",\"watermark_minwidth\":\"300\",\"watermark_minheight\":\"300\",\"watermark_img\":\"statics\\/images\\/water\\/\\/mark.png\",\"watermark_pct\":\"85\",\"watermark_quality\":\"80\",\"watermark_pos\":\"9\"}','412de47a-3fbf-11e8-a101-c81fbecfcb4c');

DROP TABLE IF EXISTS `v9_sms_report`;
CREATE TABLE `v9_sms_report` (
  `id` bigint(15) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(11) NOT NULL,
  `posttime` int(10) unsigned NOT NULL DEFAULT '0',
  `id_code` varchar(10) NOT NULL,
  `msg` varchar(90) NOT NULL,
  `send_userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) NOT NULL DEFAULT '0',
  `return_id` varchar(30) NOT NULL,
  `ip` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mobile` (`mobile`,`posttime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_special`;
CREATE TABLE `v9_special` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `aid` int(10) unsigned NOT NULL DEFAULT '0',
  `title` char(60) NOT NULL,
  `typeids` char(100) NOT NULL,
  `thumb` char(100) NOT NULL,
  `banner` char(100) NOT NULL,
  `description` char(255) NOT NULL,
  `url` char(100) NOT NULL,
  `ishtml` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ispage` tinyint(1) unsigned NOT NULL,
  `filename` char(40) NOT NULL,
  `pics` char(100) NOT NULL,
  `voteid` char(60) NOT NULL,
  `style` char(20) NOT NULL,
  `index_template` char(40) NOT NULL,
  `list_template` char(40) NOT NULL,
  `show_template` char(60) NOT NULL,
  `css` text NOT NULL,
  `username` char(40) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  `listorder` smallint(5) unsigned NOT NULL,
  `elite` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isvideo` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `disabled` (`disabled`,`siteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_special_c_data`;
CREATE TABLE `v9_special_c_data` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `author` varchar(40) NOT NULL,
  `content` text NOT NULL,
  `paginationtype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `maxcharperpage` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `style` char(20) NOT NULL,
  `show_template` varchar(30) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_special_content`;
CREATE TABLE `v9_special_content` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `specialid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` char(80) NOT NULL,
  `style` char(24) NOT NULL,
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `thumb` char(100) NOT NULL,
  `keywords` char(40) NOT NULL,
  `description` char(255) NOT NULL,
  `url` char(100) NOT NULL,
  `curl` char(15) NOT NULL,
  `listorder` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `searchid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isdata` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `videoid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `specialid` (`specialid`,`typeid`,`isdata`),
  KEY `typeid` (`typeid`,`isdata`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_sphinx_counter`;
CREATE TABLE `v9_sphinx_counter` (
  `counter_id` int(11) unsigned NOT NULL,
  `max_doc_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`counter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_sso_admin`;
CREATE TABLE `v9_sso_admin` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `username` char(20) NOT NULL,
  `password` char(32) NOT NULL,
  `encrypt` char(6) DEFAULT NULL,
  `issuper` tinyint(1) DEFAULT '0',
  `lastlogin` int(10) DEFAULT NULL,
  `ip` char(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO `v9_sso_admin` VALUES('1','phpcms','6c35c6b76b7869ac2df44d7838c153c6','jwaRxC','1','0','');

DROP TABLE IF EXISTS `v9_sso_applications`;
CREATE TABLE `v9_sso_applications` (
  `appid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `type` char(16) NOT NULL DEFAULT '',
  `name` char(20) NOT NULL DEFAULT '',
  `url` char(255) NOT NULL DEFAULT '',
  `authkey` char(255) NOT NULL DEFAULT '',
  `ip` char(15) NOT NULL DEFAULT '',
  `apifilename` char(30) NOT NULL DEFAULT 'phpsso.php',
  `charset` char(8) NOT NULL DEFAULT '',
  `synlogin` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`appid`),
  KEY `synlogin` (`synlogin`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO `v9_sso_applications` VALUES('1','phpcms_v9','phpcms v9','http://dev.wfyuan.com/touyun/','oWrdwwTBQ0tTgNUDgNnkKxc0KgIqZGqc','','api.php?op=phpsso','utf-8','1');

DROP TABLE IF EXISTS `v9_sso_members`;
CREATE TABLE `v9_sso_members` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(20) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `random` char(8) NOT NULL DEFAULT '',
  `email` char(32) NOT NULL DEFAULT '',
  `regip` char(15) NOT NULL DEFAULT '',
  `regdate` int(10) unsigned NOT NULL DEFAULT '0',
  `lastip` char(15) NOT NULL DEFAULT '0',
  `lastdate` int(10) unsigned NOT NULL DEFAULT '0',
  `appname` char(15) NOT NULL,
  `type` enum('app','connect') DEFAULT NULL,
  `avatar` tinyint(1) NOT NULL DEFAULT '0',
  `ucuserid` mediumint(8) unsigned DEFAULT '0',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`),
  KEY `email` (`email`),
  KEY `ucuserid` (`ucuserid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_sso_messagequeue`;
CREATE TABLE `v9_sso_messagequeue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `operation` char(32) NOT NULL,
  `succeed` tinyint(1) NOT NULL DEFAULT '0',
  `totalnum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `noticedata` mediumtext NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `appstatus` mediumtext,
  PRIMARY KEY (`id`),
  KEY `dateline` (`dateline`),
  KEY `succeed` (`succeed`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_sso_session`;
CREATE TABLE `v9_sso_session` (
  `sessionid` char(32) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ip` char(15) NOT NULL,
  `lastvisit` int(10) unsigned NOT NULL DEFAULT '0',
  `roleid` tinyint(3) unsigned DEFAULT '0',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL,
  `c` char(20) NOT NULL,
  `a` char(20) NOT NULL,
  `data` char(255) NOT NULL,
  PRIMARY KEY (`sessionid`),
  KEY `lastvisit` (`lastvisit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_sso_settings`;
CREATE TABLE `v9_sso_settings` (
  `name` varchar(32) NOT NULL DEFAULT '',
  `data` text NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO `v9_sso_settings` VALUES('creditrate','');
INSERT INTO `v9_sso_settings` VALUES('denyemail','');
INSERT INTO `v9_sso_settings` VALUES('denyusername','');
INSERT INTO `v9_sso_settings` VALUES('sp4','');
INSERT INTO `v9_sso_settings` VALUES('ucenter','');

DROP TABLE IF EXISTS `v9_syywym`;
CREATE TABLE `v9_syywym` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` char(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO `v9_syywym` VALUES('1','33','0','扫码营销','','','','提供营销管理工具和数据洞察系统，帮助品牌轻松部署营销活动。','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=33&id=1','0','99','1','0','phpcms','1523713415','1523713541');
INSERT INTO `v9_syywym` VALUES('2','33','0','分销管理','','','','帮助品牌进行分销商管理，通过促销、返利等完善供应链中的缺失部分。','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=33&id=2','0','99','1','0','phpcms','1523713543','1523713583');
INSERT INTO `v9_syywym` VALUES('3','33','0','防窜稽查','','','','帮助企业实现货物跟踪和窜货分析、预警。','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=33&id=3','0','99','1','0','phpcms','1523713585','1523713621');
INSERT INTO `v9_syywym` VALUES('4','33','0','产品溯源','','','','基于物联网技术打造的开放、共享的溯源信息平台','0','http://www.wfyuan.com/touyun/index.php?m=content&c=index&a=show&catid=33&id=4','0','99','1','0','phpcms','1523713623','1523713656');

DROP TABLE IF EXISTS `v9_syywym_data`;
CREATE TABLE `v9_syywym_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` text NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `jttp` varchar(255) NOT NULL DEFAULT '',
  `dtimage` varchar(255) NOT NULL DEFAULT '',
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO `v9_syywym_data` VALUES('1','提供营销管理工具和数据洞察系统，帮助品牌轻松部署营销活动。<br />\r\n','0','','0','0','','0','1','','/touyun/uploadfile/2018/0414/20180414094520764.png','/touyun/uploadfile/2018/0414/20180414094447837.gif');
INSERT INTO `v9_syywym_data` VALUES('2','帮助品牌进行分销商管理，通过促销、返利等完善供应链中的缺失部分。<br />\r\n','0','','0','0','','0','1','','/touyun/uploadfile/2018/0414/20180414094603876.png','/touyun/uploadfile/2018/0414/20180414094612837.gif');
INSERT INTO `v9_syywym_data` VALUES('3','帮助企业实现货物跟踪和窜货分析、预警。<br />\r\n','0','','0','0','','0','1','','/touyun/uploadfile/2018/0414/20180414094641878.png','/touyun/uploadfile/2018/0414/20180414094651587.gif');
INSERT INTO `v9_syywym_data` VALUES('4','基于物联网技术打造的开放、共享的溯源信息平台<br />\r\n','0','','0','0','','0','1','','/touyun/uploadfile/2018/0414/20180414094719717.png','/touyun/uploadfile/2018/0414/20180414094727294.gif');

DROP TABLE IF EXISTS `v9_tag`;
CREATE TABLE `v9_tag` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `tag` text NOT NULL,
  `name` char(40) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `module` char(20) NOT NULL,
  `action` char(20) NOT NULL,
  `data` text NOT NULL,
  `page` char(15) NOT NULL,
  `return` char(20) NOT NULL,
  `cache` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `num` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_template_bak`;
CREATE TABLE `v9_template_bak` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `creat_at` int(10) unsigned DEFAULT '0',
  `fileid` char(50) DEFAULT NULL,
  `userid` mediumint(8) DEFAULT NULL,
  `username` char(20) DEFAULT NULL,
  `template` text,
  PRIMARY KEY (`id`),
  KEY `fileid` (`fileid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_times`;
CREATE TABLE `v9_times` (
  `username` char(40) NOT NULL,
  `ip` char(15) NOT NULL,
  `logintime` int(10) unsigned NOT NULL DEFAULT '0',
  `isadmin` tinyint(1) NOT NULL DEFAULT '0',
  `times` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`username`,`isadmin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_type`;
CREATE TABLE `v9_type` (
  `typeid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `module` char(15) NOT NULL,
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` char(30) NOT NULL,
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typedir` char(20) NOT NULL,
  `url` char(100) NOT NULL,
  `template` char(30) NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`typeid`),
  KEY `module` (`module`,`parentid`,`siteid`,`listorder`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO `v9_type` VALUES('1','1','search','1','新闻','0','','','','1','新闻模型搜索');
INSERT INTO `v9_type` VALUES('2','1','search','2','下载','0','','','','3','下载模型搜索');
INSERT INTO `v9_type` VALUES('3','1','search','3','图片','0','','','','2','图片模型搜索');
INSERT INTO `v9_type` VALUES('52','1','search','0','专题','0','special','','','4','专题');
INSERT INTO `v9_type` VALUES('53','1','search','12','大事记','0','','','','0','');
INSERT INTO `v9_type` VALUES('54','1','search','13','众店宝','0','','','','0','');
INSERT INTO `v9_type` VALUES('55','1','search','14','加入我们','0','','','','0','');
INSERT INTO `v9_type` VALUES('56','1','search','15','成功案例','0','','','','0','');
INSERT INTO `v9_type` VALUES('57','1','search','16','首页一物一码','0','','','','0','');

DROP TABLE IF EXISTS `v9_urlrule`;
CREATE TABLE `v9_urlrule` (
  `urlruleid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(15) NOT NULL,
  `file` varchar(20) NOT NULL,
  `ishtml` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `urlrule` varchar(255) NOT NULL,
  `example` varchar(255) NOT NULL,
  PRIMARY KEY (`urlruleid`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO `v9_urlrule` VALUES('1','content','category','1','{$categorydir}{$catdir}/index.html|{$categorydir}{$catdir}/{$page}.html','news/china/1000.html');
INSERT INTO `v9_urlrule` VALUES('6','content','category','0','index.php?m=content&c=index&a=lists&catid={$catid}|index.php?m=content&c=index&a=lists&catid={$catid}&page={$page}','index.php?m=content&c=index&a=lists&catid=1&page=1');
INSERT INTO `v9_urlrule` VALUES('11','content','show','1','{$year}/{$catdir}_{$month}{$day}/{$id}.html|{$year}/{$catdir}_{$month}{$day}/{$id}_{$page}.html','2010/catdir_0720/1_2.html');
INSERT INTO `v9_urlrule` VALUES('12','content','show','1','{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}.html|{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}_{$page}.html','it/product/2010/0720/1_2.html');
INSERT INTO `v9_urlrule` VALUES('16','content','show','0','index.php?m=content&c=index&a=show&catid={$catid}&id={$id}|index.php?m=content&c=index&a=show&catid={$catid}&id={$id}&page={$page}','index.php?m=content&c=index&a=show&catid=1&id=1');
INSERT INTO `v9_urlrule` VALUES('17','content','show','0','show-{$catid}-{$id}-{$page}.html','show-1-2-1.html');
INSERT INTO `v9_urlrule` VALUES('18','content','show','0','content-{$catid}-{$id}-{$page}.html','content-1-2-1.html');
INSERT INTO `v9_urlrule` VALUES('30','content','category','0','list-{$catid}-{$page}.html','list-1-1.html');

DROP TABLE IF EXISTS `v9_video`;
CREATE TABLE `v9_video` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` char(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `vision` varchar(255) NOT NULL DEFAULT '',
  `video_category` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_video_content`;
CREATE TABLE `v9_video_content` (
  `contentid` int(10) unsigned NOT NULL DEFAULT '0',
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `videoid` int(10) unsigned NOT NULL DEFAULT '0',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  KEY `videoid` (`videoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_video_data`;
CREATE TABLE `v9_video_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` text NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `video` tinyint(3) unsigned NOT NULL DEFAULT '0',
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_video_store`;
CREATE TABLE `v9_video_store` (
  `videoid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(60) NOT NULL,
  `vid` char(40) NOT NULL,
  `keywords` char(40) NOT NULL,
  `description` char(255) NOT NULL,
  `status` tinyint(3) NOT NULL DEFAULT '0',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `picpath` char(120) NOT NULL,
  `size` char(20) NOT NULL,
  `timelen` mediumint(9) NOT NULL DEFAULT '0',
  `userupload` tinyint(1) NOT NULL DEFAULT '0',
  `channelid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`videoid`),
  KEY `videoid` (`videoid`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_vote_data`;
CREATE TABLE `v9_vote_data` (
  `userid` mediumint(8) unsigned DEFAULT '0',
  `username` char(20) NOT NULL,
  `subjectid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `ip` char(15) NOT NULL,
  `data` text NOT NULL,
  `userinfo` text NOT NULL,
  KEY `subjectid` (`subjectid`),
  KEY `userid` (`userid`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_vote_option`;
CREATE TABLE `v9_vote_option` (
  `optionid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned DEFAULT '0',
  `subjectid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `option` varchar(255) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `listorder` tinyint(2) unsigned DEFAULT '0',
  PRIMARY KEY (`optionid`),
  KEY `subjectid` (`subjectid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_vote_subject`;
CREATE TABLE `v9_vote_subject` (
  `subjectid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned DEFAULT '0',
  `subject` char(255) NOT NULL,
  `ismultiple` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ischeckbox` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `credit` smallint(5) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `fromdate` date NOT NULL DEFAULT '0000-00-00',
  `todate` date NOT NULL DEFAULT '0000-00-00',
  `interval` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `template` char(20) NOT NULL,
  `description` text NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `allowguest` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `maxval` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `minval` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `allowview` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `optionnumber` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `votenumber` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`subjectid`),
  KEY `enabled` (`enabled`),
  KEY `fromdate` (`fromdate`,`todate`),
  KEY `todate` (`todate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_wap`;
CREATE TABLE `v9_wap` (
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1',
  `sitename` char(30) NOT NULL,
  `logo` char(100) DEFAULT NULL,
  `domain` varchar(100) DEFAULT NULL,
  `setting` mediumtext,
  `status` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`siteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO `v9_wap` VALUES('1','PHPCMS手机门户','/statics/images/wap/wlogo.gif','','array (\n  \'listnum\' => \'10\',\n  \'thumb_w\' => \'220\',\n  \'thumb_h\' => \'0\',\n  \'c_num\' => \'1000\',\n  \'index_template\' => \'index\',\n  \'category_template\' => \'category\',\n  \'list_template\' => \'list\',\n  \'show_template\' => \'show\',\n)','0');

DROP TABLE IF EXISTS `v9_wap_type`;
CREATE TABLE `v9_wap_type` (
  `typeid` smallint(5) NOT NULL AUTO_INCREMENT,
  `cat` smallint(5) NOT NULL,
  `parentid` smallint(5) NOT NULL,
  `typename` varchar(30) NOT NULL,
  `siteid` smallint(5) NOT NULL,
  `listorder` smallint(5) DEFAULT '0',
  PRIMARY KEY (`typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_workflow`;
CREATE TABLE `v9_workflow` (
  `workflowid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `steps` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `workname` varchar(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  `setting` text NOT NULL,
  `flag` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`workflowid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO `v9_workflow` VALUES('1','1','1','一级审核','审核一次','','0');
INSERT INTO `v9_workflow` VALUES('2','1','2','二级审核','审核两次','','0');
INSERT INTO `v9_workflow` VALUES('3','1','3','三级审核','审核三次','','0');
INSERT INTO `v9_workflow` VALUES('4','1','4','四级审核','四级审核','','0');

DROP TABLE IF EXISTS `v9_ywym`;
CREATE TABLE `v9_ywym` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` char(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_ywym_data`;
CREATE TABLE `v9_ywym_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` text NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `relation` varchar(255) NOT NULL DEFAULT '',
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_zdb`;
CREATE TABLE `v9_zdb` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` char(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_zdb_data`;
CREATE TABLE `v9_zdb_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` text NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `relation` varchar(255) NOT NULL DEFAULT '',
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_zongdianbao`;
CREATE TABLE `v9_zongdianbao` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` char(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `v9_zongdianbao_data`;
CREATE TABLE `v9_zongdianbao_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` text NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `relation` varchar(255) NOT NULL DEFAULT '',
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


