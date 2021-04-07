package com.ems.controller;

import com.ems.dal.example.User;
import com.ems.service.IUserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

@Controller
@RequestMapping("/")
public class IndexController {

    @Resource
    private IUserService userService;

    @RequestMapping("index")
    public String index(Model model){
        User currentUser = userService.getCurrentUser();
        model.addAttribute("user",currentUser);
        return "index";
    }

    @RequestMapping("index/index_sum")
    public String indexSum(){
        return "indexSum";
    }



}
