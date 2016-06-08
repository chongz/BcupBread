/*
 * Created by zhangchong on 5/30/2016.
 * Copyright (c) 2016 com.infohold.BcupBread. All rights reserved.
 */

package com.infohold.web.controller.mine.message;

import com.infohold.web.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;


@Controller
public class MessageController extends BaseController {
    @RequestMapping("/message")
    public ModelAndView messages() {
        RedirectView redirectView = new RedirectView("about");
        return new ModelAndView(redirectView);
    }
}
