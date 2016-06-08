/*
 * Created by zhangchong on 5/30/2016.
 * Copyright (c) 2016 com.infohold.BcupBread. All rights reserved.
 */

package com.infohold.web.controller.mine;

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
public class LocationController extends BaseController {
    @RequestMapping("/location")
    public ModelAndView location() {
        Map ret = new HashMap();
        ret.put("picUrl", getServiceImgURL());
        return new ModelAndView("/mine/location",ret);
    }

    @RequestMapping("/store")
    public ModelAndView store() {
        Map ret = new HashMap();
        ret.put("picUrl", getServiceImgURL());
        return new ModelAndView("/mine/store",ret);
    }


    @RequestMapping(value = "/locationData",method = {RequestMethod.POST},headers = {"Content-type=application/json"})
    @ResponseBody
    public JSONObject locationData(@RequestBody JSONObject message) {
        JSONObject json = JsonRPCClientUtil.invokeJSONObj("getStoreList", new HashMap());
        return json;
    }
}
