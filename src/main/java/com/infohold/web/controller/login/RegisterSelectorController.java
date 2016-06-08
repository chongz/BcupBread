/*
 * Created by zhangchong on 5/30/2016.
 * Copyright (c) 2016 com.infohold.BcupBread. All rights reserved.
 */

package com.infohold.web.controller.login;

import com.alibaba.fastjson.JSONObject;
import com.infohold.utils.JsonRPCClientUtil;
import com.infohold.web.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;

@Controller
public class RegisterSelectorController extends BaseController{
    @RequestMapping("/registerSelector")
    public ModelAndView registerSelector() {
        return new ModelAndView("/login/registerSelector");
    }

    @RequestMapping(value = "/registerUser",method = {RequestMethod.POST},headers = {"Content-type=application/json"})
    @ResponseBody
    public JSONObject login(@RequestBody JSONObject message) {
        Map req = new HashMap();
        req.putAll(JSONObject.parseObject(message.toJSONString()));
        JSONObject json = JsonRPCClientUtil.invokeJSONObj("addMemberInfo",req);
        return json;
    }
}
