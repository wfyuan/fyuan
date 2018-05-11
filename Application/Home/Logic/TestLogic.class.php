<?php
namespace Home\Logic;
class TestLogic {
    /**
     * 新华字典接口
     * @param  string $params [请求的参数]
     * @return  array
     */
    public function juheWord($value)
    {
        //配置您申请的appkey
        $appkey = "948c1ef88a393727f784b8ed1f2b99f3";
        //************1.根据汉字查询字典************
        $url = "http://v.juhe.cn/xhzd/query";
        $params = array(
            "word" => $value,//填写需要查询的汉字，UTF8 urlencode编码
            "key" => $appkey,//应用APPKEY(应用详细页查询)
            "dtype" => "json",//返回数据的格式,xml或json，默认json
        );
        $paramstring = http_build_query($params);
        $content = juhecurl($url,$paramstring);
        $result = json_decode($content,true);
        if($result){
            if($result['error_code']=='0'){
                $result['status']= true;
                return array('result'=>$result);
            }else{
                $result['status']= false;
                return array('result'=>$result);
            }
        }else{
            echo "请求失败";
        }
    }

    /*
     * showapi
     * qq吉凶调用数据
     * */
    public function qqevaluate($qq){
        $paramArr = array(
            'qq'=> $qq
        );
        $param = createParam($paramArr);
        $url = 'http://route.showapi.com/863-1?'.$param;
        $result = json_decode(file_get_contents($url),true);
        // 先查询是否该号码已经查询过
        $record = D('Qqevaluate')->where(array('qq'=>$qq))->find();
        // 没有查询过将结果保存到表里
        if(empty($record) && !empty($result['showapi_res_body'])){
            $map = array(
                'qq'=> $qq,
                'create_time' => time(),
                'score' =>  substr($result['showapi_res_body']['score'] ,0,2),
                'grade' => $result['showapi_res_body']['grade'],
                'analysis' => $result['showapi_res_body']['analysis'],
                'desc' => $result['showapi_res_body']['desc']
            );
            $ret = D('Qqevaluate')->add($map);
        }
        return $result['showapi_res_body'];
    }
}