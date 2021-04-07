package com.ems.controller;

import com.ems.service.IDataRankService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

@Controller
@RequestMapping("datarank")
public class DataRankController {

    @Resource
    IDataRankService dataRankService;


    @RequestMapping("to-list")
    public String  toList(Model model){
        Object o = dataRankService.selectDataRankBusiness();
        model.addAttribute("data",o);
        return "BusinessRank";
    }
    @RequestMapping("toFraction")
    public String toFrantion(Model model){
        Object o = dataRankService.selectDataRankRraction();
        model.addAttribute("data",o);
        return "FractionRank";
    }

}
