package com.ems.controller;

import com.ems.dal.example.Notify;
import com.ems.dal.example.User;
import com.ems.from.NotifySearchForm;
import com.ems.service.INotifyService;
import com.ems.service.IUserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/")
public class IndexController {

    @Resource
    private INotifyService notifyService;

    @Resource
    private IUserService userService;

    @RequestMapping("index")
    public String index(Model model){
        User currentUser = userService.getCurrentUser();
        model.addAttribute("user",currentUser);
        return "index";
    }

    @RequestMapping("index/index_sum")
    public String indexSum(Model model) throws Exception {
        NotifySearchForm form = new NotifySearchForm();
        form.setPageNum(1);
        form.setPageSize(20);
        form.setIsShow(1);
        List<Notify> select = notifyService.select(form);
        model.addAttribute("notifys",select);
        return "indexSum";
    }



}
