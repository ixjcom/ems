package com.ems.controller;


import com.ems.dal.example.Role;
import com.ems.dal.example.User;
import com.ems.from.UserSearchForm;
import com.ems.mode.ConsoleResultModel;
import com.ems.service.IAdminRoleService;
import com.ems.service.IUserService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController{

    @Resource
    private IUserService userService;

    @Resource
    private IAdminRoleService adminRoleService;

    @RequestMapping("/to-list")
    public String toList(Model model) throws Exception
    {
        List<Role> roles = adminRoleService.selectAll();
        model.addAttribute("roles",roles);
        return "User";
    }

    @RequestMapping(value="select")
    @ResponseBody
    public ConsoleResultModel<PageInfo<List<User>>> select(UserSearchForm form) throws Exception
    {
        ConsoleResultModel<PageInfo<List<User>>>  resultModel = new ConsoleResultModel<>();
        List<User> list =  userService.select(form);
        PageInfo<List<User>> pageInfo = new PageInfo(list);
        resultModel.setData(pageInfo);
        return resultModel;
    }

	@RequestMapping("/search-detail")
    @ResponseBody
    public ConsoleResultModel<User> searchDetail(Long id)throws Exception{
        ConsoleResultModel<User> resultModel = new ConsoleResultModel<>();
        User model = this.userService.selectById(id);
        resultModel.setData(model);
        return resultModel;
    }
    
    @RequestMapping("/update")
    @ResponseBody
    public ConsoleResultModel<Integer> update(UserSearchForm form)throws Exception{
        ConsoleResultModel<Integer> resultModel = new ConsoleResultModel<>();
        User model = new User();
		BeanUtils.copyProperties(form, model);
        Integer result = this.userService.update(model);
        resultModel.setData(result);
        return resultModel;
    }
    
    @RequestMapping("/delete")
    @ResponseBody
    public ConsoleResultModel<Integer> delete(Long id)throws Exception{
        ConsoleResultModel<Integer> resultModel = new ConsoleResultModel<>();
        Integer result = this.userService.delete(id);
        resultModel.setData(result);
        return resultModel;
    }
    
    @RequestMapping("insert")
    @ResponseBody
    public ConsoleResultModel<Integer> insert(UserSearchForm form)throws Exception{
        ConsoleResultModel<Integer> resultModel = new ConsoleResultModel<>();
        User model = new User();
        BeanUtils.copyProperties(form, model);
        int row = this.userService.insert(model);
        if(row<=0){
            resultModel.setSuccess(false);
        }
        resultModel.setData(row);
        return resultModel;
    }
}
