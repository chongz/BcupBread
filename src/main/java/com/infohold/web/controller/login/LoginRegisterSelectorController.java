/*
 * Created by zhangchong on 5/30/2016.
 * Copyright (c) 2016 com.infohold.BcupBread. All rights reserved.
 */

package com.infohold.web.controller.login;

import com.infohold.web.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginRegisterSelectorController extends BaseController {

    @RequestMapping("/loginRegisterSelector")
    public ModelAndView loginRegisterSelector() {
        return new ModelAndView("/login/loginRegisterSelector");
    }
}
