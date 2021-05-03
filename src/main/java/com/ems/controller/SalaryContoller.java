package com.ems.controller;


import com.ems.dal.example.Role;
import com.ems.dal.example.Salary;
import com.ems.dal.example.UserInfo;
import com.ems.from.UserInfoSearchForm;
import com.ems.mode.ConsoleResultModel;
import com.ems.service.IAdminRoleService;
import com.ems.service.ISalaryService;
import com.ems.service.IUserInfoService;
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
@RequestMapping("/salary")
public class SalaryContoller {

    @Resource
    private ISalaryService salaryService;

    @Resource
    private IAdminRoleService adminRoleService;

    @RequestMapping("/to-list")
    public String toList(Model model) throws Exception
    {
        List<Role> roles = adminRoleService.selectAll();
        model.addAttribute("roles",roles);
        return "SalaryProperties";
    }

    @RequestMapping(value="select")
    @ResponseBody
    public ConsoleResultModel<PageInfo<List<Salary>>> select() throws Exception
    {
        ConsoleResultModel<PageInfo<List<Salary>>> resultModel = new ConsoleResultModel<>();
        List<Salary> list =  salaryService.select();
        PageInfo<List<Salary>> pageInfo = new PageInfo(list);
        resultModel.setData(pageInfo);
        return resultModel;
    }

	@RequestMapping("/search-detail")
    @ResponseBody
    public ConsoleResultModel<Salary> searchDetail(Long id)throws Exception{
        ConsoleResultModel<Salary> resultModel = new ConsoleResultModel<>();
        Salary model = this.salaryService.selectById(id);
        resultModel.setData(model);
        return resultModel;
    }
    
    @RequestMapping("/update")
    @ResponseBody
    public ConsoleResultModel<Integer> update(Salary salary)throws Exception{
        ConsoleResultModel<Integer> resultModel = new ConsoleResultModel<>();
        Integer result = this.salaryService.update(salary);
        resultModel.setData(result);
        return resultModel;
    }
    
    @RequestMapping("/delete")
    @ResponseBody
    public ConsoleResultModel<Integer> delete(Long id)throws Exception{
        ConsoleResultModel<Integer> resultModel = new ConsoleResultModel<>();
        Integer result = this.salaryService.delete(id);
        resultModel.setData(result);
        return resultModel;
    }
    
    @RequestMapping("insert")
    @ResponseBody
    public ConsoleResultModel<Integer> insert(Salary salary)throws Exception{
        ConsoleResultModel<Integer> resultModel = new ConsoleResultModel<>();
        int row = this.salaryService.insert(salary);
        if(row<=0){
            resultModel.setSuccess(false);
        }
        resultModel.setData(row);
        return resultModel;
    }
}
