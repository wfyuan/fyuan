<?php
namespace Home\Logic;
class ManhuaLogic {
    /**
     * 内涵漫画【showapi】
     * @param  string $page [请求页数]
     * @param  string $size [每页条数]
     * @return  array
     */
    public function neihanList($page,$size)
    {
        header("Content-Type:text/html;charset=UTF-8");
        date_default_timezone_set("PRC"); //设定时区
        $paramArr = array(
            'page'=> $page,
            //添加其他参数
        );
        $param = createParam($paramArr);
        $url = 'http://route.showapi.com/978-2?'.$param;
        $result = json_decode(file_get_contents($url),true);
        $resultList = $result['showapi_res_body'];
        //给数据添加编号
        foreach($resultList['pagebean']['contentlist'] as $k=>$v){
            $resultList['pagebean']['contentlist'][$k]['item']= ($page-1)*50 + $k+1;
        }
        //快捷分页
        $fastPage = array();
        for($i=0; $i<= ($resultList['pagebean']['allPages']-1); $i++){
            Array_push($fastPage, $i+1);
        }
        $resultList['pagebean']['fastPage'] =$fastPage;

        return $resultList;
    }

    /**
     * 内涵漫画详情【showapi】
     * @param  string 请求参数
     * @return  array
     */
    public function neihanDetail($id)
    {
        $paramArr = array(
            'id'=> $id,
        );
        $param = createParam($paramArr);
        $url = 'http://route.showapi.com/978-1?'.$param;
        $result = json_decode(file_get_contents($url),true);
        return $result['showapi_res_body'];
    }

    /**
     * 黑白漫画【showapi】
     * @param  string $page [请求页数]
     * @param  string $size [每页条数]
     * @return  array
     */
    public function heiBai($type,$page){
        switch($type){
            case 1;
                $categories = '/category/weimanhua/kbmh';
                $name = '智友恐怖漫画';
                break;
            case 2;
                $categories = '/category/weimanhua/gushimanhua';
                $name = '智友故事漫画';
                break;
            case 3;
                $categories = '/category/duanzishou';
                $name = '智友段子手';
                break;
            case 4;
                $categories = '/category/lengzhishi';
                $name = '智友冷知识';
                break;
            case 5;
                $categories = '/category/qiqu';
                $name = '智友奇趣';
                break;
            case 6;
                $categories = '/category/dianying';
                $name = '智友电影';
                break;
            case 7;
                $categories = '/category/gaoxiao';
                $name = '智友搞笑';
                break;
            case 8;
                $categories = '/category/mengchong';
                $name = '智友萌宠';
                break;
            case 9;
                $categories = '/category/xinqi';
                $name = '智友新奇';
                break;
            case 10;
                $categories = '/category/huanqiu';
                $name = '智友环球';
                break;
            case 11;
                $categories = '/category/sheying';
                $name = '智友摄影';
                break;
            case 12;
                $categories = '/category/wanyi';
                $name = '智友玩艺';
                break;
            case 13;
                $categories = '/category/chahua';
                $name = '智友插画';
                break;
            default:
                $categories = '/category/weimanhua/kbmh';
                $name = '智友恐怖漫画';
        }
        $paramArr = array(
            'type'=> $categories,
            'page'=> $page
            //添加其他参数
        );

        $param = createParam($paramArr);
        $url = 'http://route.showapi.com/958-1?'.$param;
        $result = json_decode(file_get_contents($url),true);
        $data = $result['showapi_res_body']['pagebean']['contentlist'];
        foreach($data as $k=>$v){
            if(strstr($data[$k]['id'], 'weimanhua') ){
                $data[$k]['id'] =  substr($data[$k]['id'], 10);
            }
            $explode =  explode("/",$data[$k]['id']);
            $data[$k]['type'] = $explode['1'];
            $data[$k]['num'] = $explode['2'];
        }
        $result['showapi_res_body']['pagebean']['contentlist'] = $data;
        $result['showapi_res_body']['pagebean']['name']=$name;
        $result['showapi_res_body']['type']=$type;
        return $result['showapi_res_body'];
    }

    /*
     * 黑白漫画详情
     * */
    public function hbdetail($params){
        if( $params['type']=='gushimanhua' ||  $params['type']=='kbmh'){
            $params['mhid'] = '/weimanhua/'.$params['type'].'/'.$params['id'].'.html';
        }else{
            $params['mhid'] = '/'.$params['type'].'/'.$params['id'].'.html';
        }
        $paramArr = array(
            'id'=> $params['mhid']
        );
        $param = createParam($paramArr);
        $url = 'http://route.showapi.com/958-2?'.$param;
        $result = json_decode(file_get_contents($url),true);
        switch($params['type']){
            case kbmh;
                $type = '智友恐怖漫画';
                break;
            case gushimanhua;
                $type = '智友故事漫画';
                break;
            case duanzishou;
                $type = '智友段子手';
                break;
            case lengzhishi;
                $type = '智友冷知识';
                break;
            case qiqu;
                $type = '智友奇趣';
                break;
            case dianying;
                $type = '智友电影';
                break;
            case gaoxiao;
                $type = '智友搞笑';
                break;
            case mengchong;
                $type = '智友萌宠';
                break;
            case xinqi;
                $type = '智友新奇';
                break;
            case huanqiu;
                $type = '智友环球';
                break;
            case sheying;
                $type = '智友摄影';
                break;
            case wanyi;
                $type = '智友玩艺';
                break;
            case chahua;
                $type = '智友插画';
                break;
            default:
                $type = '智友恐怖漫画';
        }
        $result['showapi_res_body']['item']['type']= $type;
        return $result['showapi_res_body'];
    }
}