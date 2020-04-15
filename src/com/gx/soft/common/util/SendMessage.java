package com.gx.soft.common.util;

import com.alibaba.fastjson.JSON;
import com.gx.soft.common.util.HttpClient;
import com.gx.soft.common.util.Sha256;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;

import java.util.HashMap;
import java.util.Map;
@Configuration
@PropertySource(value="classpath:application.properties")
public class SendMessage {
    @Value(value="${message.appkey}")
    private String appkey;
    @Value(value="${message.random}")
    private String random;
    @Value(value="${message.sdkappid}")
    private String sdkappid;
    @Value(value="${message.sign}")
    private String sign;

    public String send(String mobile, String[] list,String tpl_id){
        String url="https://yun.tim.qq.com/v5/tlssmssvr/sendsms?sdkappid="+sdkappid+"&random="+random;
        Map<String, Object> param = new HashMap<String, Object>();
        Map<String, String> tel = new HashMap<String, String>();
        tel.put("mobile",mobile);
        tel.put("nationcode","86");
        String time=String.valueOf(System.currentTimeMillis()/1000);
//        String[] list=new String[]{bit4Rand};
        param.put("params",list);   //正文模板{1,2,3}
        param.put("sign",sign);
        param.put("sig", Sha256.getSHA256("appkey="+appkey+"&random="+random+"&time="+time+"&mobile="+mobile));
        param.put("tpl_id",tpl_id);
        param.put("tel",tel);
        param.put("time",time);
        String response= HttpClient.sendHttpRequest(url, JSON.toJSONString(param), "application/xml;charset=utf-8");
        return response;
    }
}