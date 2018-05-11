<?php
namespace Home\Controller;
use Home\Logic\XiuxianLogic;
use Think\Controller;
class XiuxianController extends Controller {
    public function index(){
        $this->assign('title','智友休闲');
        $this->display();
    }

    /*
     * 最新笑话文字笑话列表
     * @author wfy 2016-12-30
     * */
    public function newest(){

        $cl = new XiuxianLogic();
        $p = I('get.p');
        if(empty($p)){
            $p= 1;
        }
        $ret = $cl->newestJoke($p,'10');
        //dump($ret);die;
        $this->assign('ret',$ret);
        $this->assign('title','智友笑话');
        $this->display();

    }

    /*
     * 最新趣图
     * @author wfy 2016-12-30
     * */
    public function newestimages(){

        $page = I('get.p');
        if(empty($page)){
            $page = '1';
        }
        $cl = new XiuxianLogic();
        $ret = $cl->newestImages($page,'10');
        $this->assign('list',$ret);
        //dump($ret);die;
        $this->assign('title','动态搞笑图');
        $this->assign('page',$page);
        $this->display();

    }

    public function newestimagesJson(){
        layout(false);
        $page = I('post.p');
        $cl = new XiuxianLogic();
        $ret = $cl->newestImages($page,'10');
        ujson($ret);
    }

    /*
     * 鬼故事列表
     * @author wfy 2016-12-30
     * */
    public function story(){
        $params = I('get.');

        if(empty($params['p'])||empty($params['type'])){
            $params['p'] = '1';
            $params['type'] = 'dp';
        }
        $cl = new XiuxianLogic();
        $ret = $cl->storyList($params['p'],$params['type']);
        //dump($ret);die;
        $this->assign('list',$ret);
        $this->assign(array('title'=>'智友鬼故事','params'=>$params));
        $this->display();
    }
    /*
     * 鬼故事详情
     * @author wfy 2017-1-1
     * */
    public function storydetail(){
        $get = I('get.');
        $key = array_keys($get);
        $value = array_values($get);
        $params = '/'.$key['0'].'/'.$value['0'].'.html';
        if(empty($get['p'])){
            $get['p'] = '1';
        }
        $get['id'] = $key['0'].'/'.$value['0'];
        //dump($get);die;
        $cl = new XiuxianLogic();
        $ret = $cl->storyDetail($params,$get['p']);
        //dump($ret); die;
        $this->assign('params',$get);
        $this->assign('detail',$ret);
        $this->assign('title', '故事详情');
        $this->display();
    }

    /*
     * 练习
     * */
    public function test()
    {
        //$agent = $_SERVER['HTTP_USER_AGENT'];
        //dump($agent);die;
//        $a = array(1, 2, 3, 4, 5, 6, 7, 8, 9, 0);
//        $b = array_rand($a, 4);
//        dump($b);
        $this->display();
    }

}