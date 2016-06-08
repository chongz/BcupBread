/*
 * Created by zhangchong on 5/30/2016.
 * Copyright (c) 2016 com.infohold.BcupBread. All rights reserved.
 */

package com.infohold.web.controller.mine.order;

import com.alibaba.fastjson.JSONObject;
import com.infohold.dto.UserInfo;
import com.infohold.utils.Constant;
import com.infohold.utils.JsonRPCClientUtil;
import com.infohold.web.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import java.util.HashMap;
import java.util.Map;

@Controller
public class OrderConfirmController extends BaseController{
    @RequestMapping("/orderConfirm")
    public ModelAndView orderConfirm(@RequestParam("where") String where) {
        Map ret = new HashMap();
        UserInfo userInfo = (UserInfo) getRequest().getSession().getAttribute(Constant.USER_INFO);

        if (userInfo != null) {
            ret.put("isLogin", "1");
            ret.put("picUrl", getServiceImgURL());
        }else{
            return new ModelAndView(new RedirectView("loginRegisterSelector"));
        }

        ret.put("where", where);
        return new ModelAndView("/mine/order/orderConfirm",ret);
    }

    @RequestMapping(value = "/addOrderData",method = {RequestMethod.POST},headers = {"Content-type=application/json"})
    @ResponseBody
    public JSONObject addOrderData(@RequestBody JSONObject message) {
        Map req = new HashMap();
        req.putAll(JSONObject.parseObject(message.toJSONString()));
        JSONObject jsonObject = JsonRPCClientUtil.invokeJSONObj("addShoppingCartInfo", req);
        return jsonObject;
    }
}
