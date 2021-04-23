package com.util;

import java.util.Map;

public class ResultUtil {
//      请求成功返回
    public static Msg success(Object object){
        Msg msg=new Msg();
        msg.setCode(200);
        msg.setMsg("请求成功！");
        msg.setData(object);
        return msg;
    }
    /*public static Msg success(Map<String, Object> data){
        return success(null);
    }*/
    public static Msg success(Integer code,String resultmsg){
        Msg msg=new Msg();
        msg.setCode(code);
        msg.setMsg(resultmsg);
        return msg;
    }

    public static Msg error(Integer code,String resultmsg){
     Msg msg=new Msg();
     msg.setCode(code);
     msg.setMsg(resultmsg);
     return msg;
    }
}
