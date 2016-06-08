/*
 * Created by zhangchong on 5/30/2016.
 * Copyright (c) 2016 com.infohold.BcupBread. All rights reserved.
 */

package com.infohold.web.controller.mine;

import com.alibaba.fastjson.JSONObject;
import com.infohold.dto.UserInfo;
import com.infohold.utils.Constant;
import com.infohold.utils.JsonRPCClientUtil;
import com.infohold.web.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
public class PersonalInfoController extends BaseController {
    @RequestMapping(value = "/personalInfo")
    public ModelAndView personalInfo() {

        Map ret = new HashMap();

        UserInfo userInfo = (UserInfo) getRequest().getSession().getAttribute(Constant.USER_INFO);
        if (userInfo != null) {
            ret.put("picUrl", getServiceImgURL());
            ret.put("memberID", userInfo.getMemberID());
            ret.put("memberPhone", userInfo.getMemberPhone());
            ret.put("memberPic", userInfo.getMemberPic());
            ret.put("memberCity", userInfo.getMemberCity());
            ret.put("type", userInfo.getType());
            ret.put("nickName", userInfo.getMemberNickname());
            ret.put("sex", userInfo.getMemberSex());
            ret.put("birthday", userInfo.getMemberBirth());
            ret.put("grade", userInfo.getMemberGrade());
            ret.put("thmemberAccount",userInfo.getThmemberAccount());
        }

        return new ModelAndView("/mine/personalInfo",ret);
    }

    @RequestMapping(value = "/savePersonalInfo",method = {RequestMethod.POST},headers = {"Content-type=application/json"})
    @ResponseBody
    public JSONObject savePersonalInfo(HttpSession session, HttpServletRequest request, @RequestBody JSONObject message) {

        Map req = new HashMap();

        req.putAll(JSONObject.parseObject(message.toJSONString()));
        JSONObject json = JsonRPCClientUtil.invokeJSONObj("editMemberInfo", req);

        if (Constant.REP_CODE_SUCCESS.equals(json.get("repCode"))) {

            UserInfo userInfo = (UserInfo) request.getSession().getAttribute(Constant.USER_INFO);
            if (userInfo != null) {
                String memberNickname = message.getString("memberNickname");
                if (!StringUtils.isEmpty(memberNickname)) {
                    userInfo.setMemberNickname(memberNickname);
                }

                String memberSex = message.getString("memberSex");
                if (!StringUtils.isEmpty(memberSex)) {
                    userInfo.setMemberSex(memberSex);
                }

                String memberBirth = message.getString("memberBirth");
                if (!StringUtils.isEmpty(memberBirth)) {
                    userInfo.setMemberBirth(memberBirth);
                }

                request.getSession().setAttribute(Constant.USER_INFO,userInfo);
            }
        }

        return json;
    }
}
