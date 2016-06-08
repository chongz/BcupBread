/*
 * Created by zhangchong on 5/30/2016.
 * Copyright (c) 2016 com.infohold.BcupBread. All rights reserved.
 */

package com.infohold.web.controller.gallery;

import com.alibaba.fastjson.JSONObject;
import com.infohold.dto.UserInfo;
import com.infohold.utils.Constant;
import com.infohold.utils.JsonRPCClientUtil;
import com.infohold.web.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class GalleryController extends BaseController {
    @RequestMapping("/gallery")
    public ModelAndView gallery() {
        Map ret = new HashMap();
        UserInfo userInfo = (UserInfo) getRequest().getSession().getAttribute(Constant.USER_INFO);

        if (userInfo != null) {
            ret.put("isLogin", "1");
            ret.put("picUrl", getServiceImgURL());

            Map req = new HashMap();
            req.put("memberPhone", userInfo.getMemberPhone());
            req.put("pageNo", "1");
            req.put("pageSize", "10");
            JSONObject jsonObject = JsonRPCClientUtil.invokeJSONObj("getCustomList",req);
            if (jsonObject != null && Constant.REP_CODE_SUCCESS.equals(jsonObject.getString("repCode"))) {
                String repDataString = jsonObject.getString("repData");
                List repData = JSONObject.parseArray(repDataString);
                if (repData != null && repData.size() > 0) {
                    Map data = (Map) repData.get(0);
                    String totalNum = (String) data.get("totalNum");
                    int num = Integer.parseInt(totalNum);
                    if (num > 0) {
                        ret.put("isEmpty", "0");
                    } else {
                        ret.put("isEmpty", "1");
                    }
                }
            }else{
                ret.put("isEmpty", "1");
            }

        }else{
            ret.put("isLogin", "0");
            ret.put("isEmpty", "1");
            ret.put("picUrl", "");
        }
        return new ModelAndView("gallery/gallery",ret);
    }

    @RequestMapping(value = "/searchGalleryData",method = {RequestMethod.POST},headers = {"Content-type=application/json"})
    @ResponseBody
    public JSONObject searchGalleryData(@RequestBody JSONObject message) {
        Map req = JSONObject.parseObject(message.toJSONString());
        JSONObject jsonObject = JsonRPCClientUtil.invokeJSONObj("getCustomList", req);
        return jsonObject;
    }


    @RequestMapping(value = "/addGalleryData",method = {RequestMethod.POST},headers = {"Content-type=application/json"})
    @ResponseBody
    public JSONObject addGalleryData(@RequestBody JSONObject message) {
        Map req = JSONObject.parseObject(message.toJSONString());
        JSONObject jsonObject = JsonRPCClientUtil.invokeJSONObj("addCustomInfo", req);
        return jsonObject;
    }

    @RequestMapping(value = "/delGalleryData",method = {RequestMethod.POST},headers = {"Content-type=application/json"})
    @ResponseBody
    public JSONObject delGalleryData(@RequestBody JSONObject message) {
        Map req = JSONObject.parseObject(message.toJSONString());
        JSONObject jsonObject = JsonRPCClientUtil.invokeJSONObj("deleteCustom", req);
        return jsonObject;
    }

}
