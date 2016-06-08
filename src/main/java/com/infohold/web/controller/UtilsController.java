/*
 * Created by zhangchong on 5/30/2016.
 * Copyright (c) 2016 com.infohold.BcupBread. All rights reserved.
 */

package com.infohold.web.controller;

import com.alibaba.fastjson.JSONObject;
import com.infohold.utils.JsonRPCClientUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

@Controller
public class UtilsController extends BaseController{
    @RequestMapping(value = "/sendSMS",method = {RequestMethod.POST},headers = {"Content-type=application/json"})
    @ResponseBody
    public JSONObject sendSMS(@RequestBody JSONObject message) {

        String httpUrl = message.getString("httpUrl");
        String content = message.getString("content");
        String apikey = message.getString("apiKey");

        BufferedReader reader = null;
        String result = "";
        StringBuffer sbf = new StringBuffer();
        httpUrl = httpUrl + "?" + content;

        try {
            URL url = new URL(httpUrl);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.setRequestProperty("apikey",  apikey);
            connection.connect();
            InputStream is = connection.getInputStream();
            reader = new BufferedReader(new InputStreamReader(is, "UTF-8"));
            String strRead = null;
            while ((strRead = reader.readLine()) != null) {
                sbf.append(strRead);
                sbf.append("\r\n");
            }
            reader.close();
            result = sbf.toString();
        } catch (Exception e) {
            e.printStackTrace();
        }

        Map ret = new HashMap();
        ret.put("ret", result);
        JSONObject jsonObject = new JSONObject(ret);
        return jsonObject;
    }

    @RequestMapping(value = "/getStore",method = {RequestMethod.POST},headers = {"Content-type=application/json"})
    @ResponseBody
    public JSONObject getStore(@RequestBody JSONObject message) {
        Map req = new HashMap();
        req.putAll(JSONObject.parseObject(message.toJSONString()));
        JSONObject jsonObject = JsonRPCClientUtil.invokeJSONObj("getStoreList", req);
        return jsonObject;
    }

    @RequestMapping(value = "/getConfig",method = {RequestMethod.POST},headers = {"Content-type=application/json"})
    @ResponseBody
    public JSONObject getConfig(@RequestBody JSONObject message) {
        Map req = new HashMap();
        req.putAll(JSONObject.parseObject(message.toJSONString()));

        JSONObject jsonObject = JsonRPCClientUtil.invokeJSONObj("getArgumentList", req);
        return jsonObject;
    }

    @RequestMapping(value = "/getOrderNum",method = {RequestMethod.POST},headers = {"Content-type=application/json"})
    @ResponseBody
    public JSONObject getOrderNum(@RequestBody JSONObject message) {
        Map req = new HashMap();
        req.putAll(JSONObject.parseObject(message.toJSONString()));

        JSONObject jsonObject = JsonRPCClientUtil.invokeJSONObj("getOrderNumberList", req);
        return jsonObject;
    }


    @RequestMapping(value = "/getCommend",method = {RequestMethod.POST},headers = {"Content-type=application/json"})
    @ResponseBody
    public JSONObject getCommend(@RequestBody JSONObject message) {
        Map req = new HashMap();
        req.putAll(JSONObject.parseObject(message.toJSONString()));
        JSONObject jsonObject = JsonRPCClientUtil.invokeJSONObj("getGroomList", req);
        return jsonObject;
    }



    @RequestMapping(value = "/getNoticeList",method = {RequestMethod.POST},headers = {"Content-type=application/json"})
    @ResponseBody
    public JSONObject getNoticeList(@RequestBody JSONObject message) {
        Map req = new HashMap();
        req.putAll(JSONObject.parseObject(message.toJSONString()));
        JSONObject jsonObject = JsonRPCClientUtil.invokeJSONObj("getNoticeList", req);
        return jsonObject;
    }


    @RequestMapping(value = "/getProduct",method = {RequestMethod.POST},headers = {"Content-type=application/json"})
    @ResponseBody
    public JSONObject getProduct(@RequestBody JSONObject message) {
        Map req = new HashMap();
        req.putAll(JSONObject.parseObject(message.toJSONString()));
        JSONObject jsonObject = JsonRPCClientUtil.invokeJSONObj("getProductList", req);
        return jsonObject;
    }


    @RequestMapping(value = "/addProTime",method = {RequestMethod.POST},headers = {"Content-type=application/json"})
    @ResponseBody
    public JSONObject addProTime(@RequestBody JSONObject message) {
        Map req = new HashMap();
        req.putAll(JSONObject.parseObject(message.toJSONString()));
        JSONObject jsonObject = JsonRPCClientUtil.invokeJSONObj("addProTime", req);
        return jsonObject;
    }

    @RequestMapping(value = "/addOrder",method = {RequestMethod.POST},headers = {"Content-type=application/json"})
    @ResponseBody
    public JSONObject addOrder(@RequestBody JSONObject message) {
        Map req = new HashMap();
        req.putAll(JSONObject.parseObject(message.toJSONString()));
        JSONObject jsonObject = JsonRPCClientUtil.invokeJSONObj("addOrderInfo", req);
        return jsonObject;
    }
}
