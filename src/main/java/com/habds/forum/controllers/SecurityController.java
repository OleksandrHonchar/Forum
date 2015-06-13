package com.habds.forum.controllers;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class SecurityController {




    @RequestMapping(value = {"/login", "/logout"}, method = RequestMethod.GET)
    public ModelAndView login() {

        return new ModelAndView();
    }


    // for 403 access denied page
    @RequestMapping(value = "/error403", method = RequestMethod.GET)
    public ModelAndView accessDenied() {

        return new ModelAndView();
    }

}


