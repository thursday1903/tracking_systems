package com.system.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController extends BaseController{
    @RequestMapping("/index")
    public String diplayAboutPage(Model model) {
    		model.addAttribute("pageTitle", "Country & City");
    		return "index";
    }
}
