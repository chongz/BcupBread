/*
 * Created by zhangchong on 5/30/2016.
 * Copyright (c) 2016 com.infohold.BcupBread. All rights reserved.
 */

package com.infohold.web.controller.mine;

import com.infohold.dto.UserInfo;
import com.infohold.utils.Constant;
import com.infohold.web.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
public class MineController extends BaseController {



    @RequestMapping("/mine")
    public ModelAndView mine(HttpServletRequest request) {
        Map ret = new HashMap();
        Map req = new HashMap();
        UserInfo userInfo = (UserInfo) request.getSession().getAttribute(Constant.USER_INFO);
        if (userInfo == null) {
            ret.put(Constant.USER_INFO_LOGIN, "0");
        }else{
            ret.put(Constant.USER_INFO_LOGIN, "1");
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

        return new ModelAndView("/mine/mine",ret);
    }
}
