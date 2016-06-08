/*
 * Created by zhangchong on 5/30/2016.
 * Copyright (c) 2016 com.infohold.BcupBread. All rights reserved.
 */

package com.infohold.web.controller;

import com.infohold.dto.UserInfo;
import com.infohold.utils.Constant;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;

/**
 * @ClassName: IndexController
 * 
 * @Description: 首页Controller
 * 
 * @author Delong.Yang
 * 
 * @date 2016年4月14日 上午10:16:22
 */
@Controller
public class IndexController extends BaseController {

	/**
	 * 初始化首页
	 * @return
	 */
	@RequestMapping("/index")
	public ModelAndView index() {
		Map ret = new HashMap();
		UserInfo userInfo = (UserInfo) getRequest().getSession().getAttribute(Constant.USER_INFO);
		if (userInfo != null) {
			ret.put("isLogin", "1");

		}else{
			ret.put("isLogin", "0");
		}

        ret.put("picUrl", getServiceImgURL());
        return new ModelAndView("index",ret);
	}

	@RequestMapping("/breadGallery")
	public ModelAndView breadGallery() {
		Map ret = new HashMap();
		UserInfo userInfo = (UserInfo) getRequest().getSession().getAttribute(Constant.USER_INFO);
		if (userInfo != null) {
			ret.put("isLogin", "1");
		}else{
			ret.put("isLogin", "0");
		}
        ret.put("picUrl", getServiceImgURL());
		return new ModelAndView("breadGallery",ret);
	}

    @RequestMapping("/breadInfo")
    public ModelAndView breadInfo() {
        Map ret = new HashMap();
        UserInfo userInfo = (UserInfo) getRequest().getSession().getAttribute(Constant.USER_INFO);
        if (userInfo != null) {
            ret.put("isLogin", "1");
        }else{
            ret.put("isLogin", "0");
        }
		ret.put("picUrl", getServiceImgURL());
        return new ModelAndView("breadInfo",ret);
    }

    @RequestMapping("/breadDetail")
	public ModelAndView breadDetail() {
		Map ret = new HashMap();
		UserInfo userInfo = (UserInfo) getRequest().getSession().getAttribute(Constant.USER_INFO);
		if (userInfo != null) {
			ret.put("isLogin", "1");
		}else{
			ret.put("isLogin", "0");
		}
        ret.put("picUrl", getServiceImgURL());
		return new ModelAndView("breadDetail",ret);
	}

}
