/*
 * Created by zhangchong on 5/30/2016.
 * Copyright (c) 2016 com.infohold.BcupBread. All rights reserved.
 */

package com.infohold.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by zhangchong on 5/18/16.
 */
@Controller
public class AnnouncementController extends BaseController {
    @RequestMapping("announcement")
    public ModelAndView announcement() {
        return new ModelAndView("announcement");
    }
}
