<?php
namespace Home\Logic;
class XiuxianLogic {
    /**
     * 最新笑话
     * @param  string $page [请求页数]
     * @param  string $size [每页条数]
     * @return  array
     */
    public function newestJoke($page,$size)
    {
        $paramArr = array(
            'time'=> '',
            'page'=>$page,
            'maxResult'=> 10
        );
        $param = createParam($paramArr);
        $url = 'http://route.showapi.com/341-1?'.$param;
        $result = json_decode(file_get_contents($url),true);
        foreach($result['showapi_res_body']['contentlist'] as $k=>$v ){
            $result['showapi_res_body']['contentlist'][$k]['text'] = str_replace("<p></p>","<br>",$v['text']);
        }
        return $result['showapi_res_body'];
    }

    /**
     * 最新趣图【聚合数据】
     * @param  string $page [请求页数]
     * @param  string $size [每页条数]
     * @return  array
     */
    public function newestImages($page,$size)
    {
        $paramArr = array(
            'page'=> $page,
            'maxResult'=> $size
            //添加其他参数
        );
        $param = createParam($paramArr);
        $url = 'http://route.showapi.com/341-3?'.$param;
        $result = file_get_contents($url);
        $result = json_decode($result,true);
        return $result['showapi_res_body'];
    }

    /**
     * 鬼故事【showapi】
     * @param  string $page [请求页数]
     * @param  string $size [每页条数]
     * @return  array
     */
    public function storyList($page,$type)
    {
        $paramArr = array(
            'type'=> $type,
            'page'=>$page
        );
        $param = createParam($paramArr);
        $url = 'http://route.showapi.com/955-1?'.$param;
        $result = json_decode(file_get_contents($url),true);
        $resultList = $result['showapi_res_body'];
        //快捷分页
        $fastPage = array();
        for($i=0; $i<= ($resultList['pagebean']['allPages']-1); $i++){
            Array_push($fastPage, $i+1);
        }
        $resultList['pagebean']['fastPage'] =$fastPage;

        return $resultList;
    }
    /**
     * 鬼故事详情【showapi】
     * @param  string 请求参数
     * @return  array
     */
    public function storyDetail($id,$page)
    {
        $paramArr = array(
            'id'=> $id,
            'page'=> $page
            //添加其他参数
        );
        $param = createParam($paramArr);
        $url = 'http://route.showapi.com/955-2?'.$param;
        $result = json_decode(file_get_contents($url),true);
        $result['showapi_res_body']['text']=str_replace("&nbsp;&nbsp;&nbsp;","</p><p>",$result['showapi_res_body']['text']);
        $result['showapi_res_body']['text'] = substr( $result['showapi_res_body']['text'],29,-9);
        $resultList = $result['showapi_res_body'];
        //快捷分页
        $fastPage = array();
        for($i=0; $i<= ($resultList['allPages']-1); $i++){
            Array_push($fastPage, $i+1);
        }
        $resultList['fastPage'] =$fastPage;

        return $resultList;
    }
}