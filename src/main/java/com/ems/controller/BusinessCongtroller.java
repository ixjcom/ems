package com.ems.controller;


import com.ems.dal.example.Business;
import com.ems.dal.example.User;
import com.ems.from.BusinessSearchForm;
import com.ems.mode.ConsoleResultModel;
import com.ems.service.IBusinessService;
import com.ems.service.IUserService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/business")
public class BusinessCongtroller {

    @Resource
    private IBusinessService businessService;

    @Resource
    private IUserService userService;

    @RequestMapping("/to-list")
    public String toList(Model model) throws Exception
    {
        List<User> users = userService.selectAll();
        model.addAttribute("users",users);
        return "Business";
    }

    @RequestMapping(value="select")
    @ResponseBody
    public ConsoleResultModel<PageInfo<List<Business>>> select(BusinessSearchForm form) throws Exception
    {
        ConsoleResultModel<PageInfo<List<Business>>>  resultModel = new ConsoleResultModel<>();
        List<Business> list =  businessService.select(form);
        PageInfo<List<Business>> pageInfo = new PageInfo(list);
        resultModel.setData(pageInfo);
        return resultModel;
    }

	@RequestMapping("/search-detail")
    @ResponseBody
    public ConsoleResultModel<Business> searchDetail(Long id)throws Exception{
        ConsoleResultModel<Business> resultModel = new ConsoleResultModel<>();
        Business model = this.businessService.selectById(id);
        resultModel.setData(model);
        return resultModel;
    }
    
    @RequestMapping("/update")
    @ResponseBody
    public ConsoleResultModel<Integer> update(BusinessSearchForm form)throws Exception{
        ConsoleResultModel<Integer> resultModel = new ConsoleResultModel<>();
        Business model = new Business();
		BeanUtils.copyProperties(form, model);
        model.setUpdateTime(new Date());
        Integer result = this.businessService.update(model);
        resultModel.setData(result);
        return resultModel;
    }
    
    @RequestMapping("/delete")
    @ResponseBody
    public ConsoleResultModel<Integer> delete(Long id)throws Exception{
        ConsoleResultModel<Integer> resultModel = new ConsoleResultModel<>();
        Integer result = this.businessService.delete(id);
        resultModel.setData(result);
        return resultModel;
    }
    
    @RequestMapping("insert")
    @ResponseBody
    public ConsoleResultModel<Integer> insert(BusinessSearchForm form)throws Exception{
        ConsoleResultModel<Integer> resultModel = new ConsoleResultModel<>();
        Business model = new Business();
        BeanUtils.copyProperties(form, model);
        model.setUpdateTime(new Date());
        int row = this.businessService.insert(model);
        if(row<=0){
            resultModel.setSuccess(false);
        }
        resultModel.setData(row);
        return resultModel;
    }
}
