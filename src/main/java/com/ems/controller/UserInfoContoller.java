package com.ems.controller;


import com.ems.dal.example.UserInfo;
import com.ems.from.UserInfoSearchForm;
import com.ems.mode.ConsoleResultModel;
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
@RequestMapping("/userinfo")
public class UserInfoContoller {

    @Resource
    private IUserInfoService userInfoService;

    @RequestMapping("/to-list")
    public String toList(Model model) throws Exception
    {
      
        return "UserInfo";
    }

    @RequestMapping(value="select")
    @ResponseBody
    public ConsoleResultModel<PageInfo<List<UserInfo>>> select(UserInfoSearchForm form) throws Exception
    {
        ConsoleResultModel<PageInfo<List<UserInfo>>>  resultModel = new ConsoleResultModel<>();
        List<UserInfo> list =  userInfoService.select(form);
        PageInfo<List<UserInfo>> pageInfo = new PageInfo(list);
        resultModel.setData(pageInfo);
        return resultModel;
    }

	@RequestMapping("/search-detail")
    @ResponseBody
    public ConsoleResultModel<UserInfo> searchDetail(Long id)throws Exception{
        ConsoleResultModel<UserInfo> resultModel = new ConsoleResultModel<>();
        UserInfo model = this.userInfoService.selectById(id);
        resultModel.setData(model);
        return resultModel;
    }
    
    @RequestMapping("/update")
    @ResponseBody
    public ConsoleResultModel<Integer> update(UserInfoSearchForm form)throws Exception{
        ConsoleResultModel<Integer> resultModel = new ConsoleResultModel<>();
        UserInfo model = new UserInfo();
		BeanUtils.copyProperties(form, model);
        model.setUpdateTime(new Date());
        Integer result = this.userInfoService.update(model);
        resultModel.setData(result);
        return resultModel;
    }
    
    @RequestMapping("/delete")
    @ResponseBody
    public ConsoleResultModel<Integer> delete(Long id)throws Exception{
        ConsoleResultModel<Integer> resultModel = new ConsoleResultModel<>();
        Integer result = this.userInfoService.delete(id);
        resultModel.setData(result);
        return resultModel;
    }
    
    @RequestMapping("insert")
    @ResponseBody
    public ConsoleResultModel<Integer> insert(UserInfoSearchForm form)throws Exception{
        ConsoleResultModel<Integer> resultModel = new ConsoleResultModel<>();
        UserInfo model = new UserInfo();
        BeanUtils.copyProperties(form, model);
        model.setUpdateTime(new Date());
        int row = this.userInfoService.insert(model);
        if(row<=0){
            resultModel.setSuccess(false);
        }
        resultModel.setData(row);
        return resultModel;
    }
}
