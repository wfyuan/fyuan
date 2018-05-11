<?php
namespace Home\Controller;
use Home\Logic\TestLogic;
use Think\Controller;
class TestController extends Controller {
    public function index(){
        $this->display();
    }

    /*
     * 新华字典方法
     * */
    public function word(){
        $this->display();
    }
    /*
     * 查询的结果，新华字典查询结果
     * */
    public function wordresult (){
        $params = I('get.');
        $juheWord = new TestLogic();
        $ret = $juheWord->juheWord($params['content']);
        $this->assign($ret);
        $this->display();
    }

    /*
     * qq 测试吉凶
     * */
    public function qqevaluate(){
        $qq = I('get.qq');
        if(empty($qq)){
            $this->display();
        }else{
            $showapi = new TestLogic();
            $ret = $showapi-> qqevaluate($qq);
            $ret['qq'] = $qq;
            $this->assign('ret',$ret);
            $this->display();
        }
    }

}