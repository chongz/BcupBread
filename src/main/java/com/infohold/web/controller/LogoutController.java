/*
 * Created by zhangchong on 5/30/2016.
 * Copyright (c) 2016 com.infohold.BcupBread. All rights reserved.
 */

package com.infohold.web.controller;

import com.alibaba.fastjson.JSONObject;
import com.infohold.utils.Constant;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by zhangchong on 5/18/16.
 */
@Controller
public class LogoutController extends BaseController {
    @RequestMapping(value = "/logout",method = {RequestMethod.POST},headers = {"Content-type=application/json"})
    @ResponseBody
    public JSONObject logout(HttpServletRequest request,@RequestBody JSONObject message) {

        request.getSession().setAttribute(Constant.USER_INFO,null);

        Map ret = new HashMap();
        ret.put("logout", "1");
        return new JSONObject(ret);
    }
}
