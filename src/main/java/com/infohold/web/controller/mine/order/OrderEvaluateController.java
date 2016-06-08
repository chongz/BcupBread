/*
 * Created by zhangchong on 5/30/2016.
 * Copyright (c) 2016 com.infohold.BcupBread. All rights reserved.
 */

package com.infohold.web.controller.mine.order;

import com.infohold.web.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class OrderEvaluateController extends BaseController {
    @RequestMapping("/orderEvaluate")
    public ModelAndView orderEvaluate() {
        return new ModelAndView("/mine/order/orderEvaluate");
    }
}
