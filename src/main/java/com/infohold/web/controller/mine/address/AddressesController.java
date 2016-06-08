/*
 * Created by zhangchong on 5/30/2016.
 * Copyright (c) 2016 com.infohold.BcupBread. All rights reserved.
 */

package com.infohold.web.controller.mine.address;

import com.alibaba.fastjson.JSONObject;
import com.infohold.utils.JsonRPCClientUtil;
import com.infohold.web.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

import static com.infohold.utils.JsonRPCClientUtil.invokeJSONObj;

@Controller
public class AddressesController extends BaseController {
    @RequestMapping("/address")
    public ModelAndView addresses(@RequestParam("isFromMine") String isFromMine) {
        Map req = new HashMap();
        req.put("isFromMine", isFromMine);
        return new ModelAndView("/mine/address/address",req);
    }


    @RequestMapping("/addAddress")
    public ModelAndView addAddress(HttpServletRequest request) {
        return new ModelAndView("/mine/address/addAddress");
    }


    @RequestMapping(value = "/addAddressData",method = {RequestMethod.POST},headers = {"Content-type=application/json"})
    @ResponseBody
    public JSONObject addAddressData(@RequestBody JSONObject message) {
        Map req = new HashMap();
        req.putAll(JSONObject.parseObject(message.toJSONString()));
        JSONObject json = invokeJSONObj("addAddressInfo",req);
        return json;
    }

    @RequestMapping("/editAddress")
    public ModelAndView editAddress() {
        return new ModelAndView("/mine/address/editAddress");
    }

    @RequestMapping(value = "/editAddressData",method = {RequestMethod.POST},headers = {"Content-type=application/json"})
    @ResponseBody
    public JSONObject editAddressData(@RequestBody JSONObject message) {
        Map req = new HashMap();
        req.putAll(JSONObject.parseObject(message.toJSONString()));
        JSONObject jsonObject = invokeJSONObj("editAddressInfo",req);
        return jsonObject;
    }

    @RequestMapping(value = "/searchAddressData",method = {RequestMethod.POST},headers = {"Content-type=application/json"})
    @ResponseBody
    public JSONObject searchAddressData(@RequestBody JSONObject message) {
        Map req = new HashMap();
        req.putAll(JSONObject.parseObject(message.toJSONString()));
        JSONObject jsonObject = JsonRPCClientUtil.invokeJSONObj("getAddressList",req);
        return jsonObject;
    }

    @RequestMapping(value = "/delAddressData",method = {RequestMethod.POST},headers = {"Content-type=application/json"})
    @ResponseBody
    public JSONObject delAddressData(@RequestBody JSONObject message) {
        Map req = new HashMap();
        req.putAll(JSONObject.parseObject(message.toJSONString()));
        JSONObject jsonObject =  invokeJSONObj("deleteAddress",req);
        return jsonObject;
    }
}
