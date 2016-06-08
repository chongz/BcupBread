/*
 * Created by zhangchong on 5/30/2016.
 * Copyright (c) 2016 com.infohold.BcupBread. All rights reserved.
 */

package com.infohold.web.controller.login;

import com.alibaba.fastjson.JSONObject;
import com.infohold.dto.UserInfo;
import com.infohold.utils.Constant;
import com.infohold.utils.JsonRPCClientUtil;
import com.infohold.web.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@SessionAttributes("memberID")
public class PhoneLoginController extends BaseController{

    @RequestMapping("phoneLogin")
    public ModelAndView phoneLogin() {
        return new ModelAndView("/login/phoneLogin");
    }

    @RequestMapping(value = "/login",method = {RequestMethod.POST},headers = {"Content-type=application/json"})
    @ResponseBody
    public JSONObject login(HttpSession session, HttpServletRequest request,@RequestBody JSONObject message) {

        Map req = new HashMap();
//        req.put("memberPhone", message.get("memberPhone"));
//        req.put("memberPassword", message.get("memberPassword"));

        req.putAll(JSONObject.parseObject(message.toJSONString()));
        JSONObject json = JsonRPCClientUtil.invokeJSONObj("getMemberInfo", req);

        String repCode = json.getString("repCode");
        if (Constant.REP_CODE_SUCCESS.equals(repCode)) {
            String repDataStr = json.getString(Constant.REP_DATA);
            List lists = JSONObject.parseArray(repDataStr, UserInfo.class);
            if (lists != null && lists.size() > 0) {
                UserInfo userInfo = (UserInfo) lists.get(0);
                if (userInfo != null) {
                    userInfo.setType("1");
                    request.getSession().setAttribute(Constant.USER_INFO,userInfo);
                }
            }
        }


        return json;
    }
}
