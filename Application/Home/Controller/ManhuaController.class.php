<?php
/**
 * Created by PhpStorm.
 * User: T450
 * Date: 2017/1/7
 * Time: 14:53
 */
namespace Home\Controller;
use Home\Logic\ManhuaLogic;
use Think\Controller;
class ManhuaController extends Controller {
    public function index(){

        $this->display();
    }

    /*
     * 黑白漫画
     * @author wfy 2016-12-30
     * */
    public function heibai(){
        $page = I('get.p');
        if(empty($page)){
            $page = '1';
        }
        $type = I('get.type');
        if(empty($type)){
            $type = '1';
        }

        $mc = new ManhuaLogic();
        $data = $mc->heiBai($type,$page);
//dump($data);die;
        $privateseo=array(
            'title'=>$data['pagebean']['name'].'-智友生活',
            'keywords' =>'短篇漫画,奇趣怪谈漫画,微漫画,故事漫画,奇趣怪谈,智友生活,内涵漫画,笑话,段子,'.$data['pagebean']['name'],
            'description'=>$data['pagebean']['name'].'是由智友生活推荐分享，智友生活让智者热爱生活，畅享智慧人生。'
        );
        $this->assign('privateseo',$privateseo);

        $this->assign('list',$data);
        $this->assign('title',$data['pagebean']['name']);
        $this->display();
    }
    /*
     * 黑白漫画详情页
     * */
    public function hbdetail(){
        $cl = new ManhuaLogic();
        $ret = $cl->hbdetail(I('get.'));

        $privateseo=array(
            'title'=>$ret['item']['title'].'-'.$ret['item']['type'],
            'keywords' =>'短篇漫画,奇趣怪谈漫画,微漫画,故事漫画,奇趣怪谈,智友生活,内涵漫画,笑话,段子,'.$ret['item']['type'],
            'description'=>$ret['item']['title'].'-'.$ret['item']['type'].'是由智友生活推荐分享，智友生活让智者热爱生活，畅享智慧人生。'
        );
        $this->assign('privateseo',$privateseo);
        $this->assign('title',$ret['item']['title']);
        $this->assign('detail',$ret['item']);
        //dump($ret);die;
        $this->display();
    }
    /*
     * 内涵漫画列表
     * @author wfy 2016-12-30
     * */
    public function neihan(){
        $page = I('get.p');
        if(empty($page)){
            $page = '1';
        }
        $cl = new ManhuaLogic();
        $ret = $cl->neihanList($page);
        //dump($ret);die;
        $this->assign('list',$ret);
        $this->assign('title','智友内涵画');
        $this->display();
    }
    /*
     * 内涵漫画详情
     * @author wfy 2016-12-31
     * */
    public function mhdetail(){
        $re = I('get.xe');
        $params = '/xe/'.$re;
        $cl = new ManhuaLogic();
        $ret = $cl->neihanDetail($params);
        $this->assign('detail',$ret);
        $this->assign('title', substr($ret['title'],15));
        $this->display();
    }
}