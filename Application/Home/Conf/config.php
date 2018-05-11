<?php
return array(
	//'配置项'=>'配置值'
    'TMPL_PARSE_STRING'  =>array(
        '__IMG__' => '/Public/home/images',
        '__JS__'     => '/Public/home/js',
        '__CSS__' => '/Public/home/css',
        '__PLUGIN__' => '/Public/home/plugins',
        'assets' =>'/Public/home/assets'
    ),
    'LAYOUT_ON'=>true,
    'LAYOUT_NAME'=>'Layout/layout',
    'LOAD_EXT_CONFIG' => 'seo'  //加载扩展的配置文件
);