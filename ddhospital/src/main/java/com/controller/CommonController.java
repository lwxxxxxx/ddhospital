package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommonController {

    @RequestMapping("/")
    public String toLogin(){
        return "login";
    }

    @RequestMapping("page_{status}/{pageName}")
    public String toPage(@PathVariable("status")String status, @PathVariable("pageName")String pageName){
        return status+"/"+pageName;
    }
}
