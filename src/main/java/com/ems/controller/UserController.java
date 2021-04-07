package com.ems.controller;


import com.ems.dal.example.Role;
import com.ems.dal.example.User;
import com.ems.from.UserSearchForm;
import com.ems.mode.ConsoleResultModel;
import com.ems.service.IAdminRoleService;
import com.ems.service.IUserService;
import com.github.pagehelper.PageInfo;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ClassUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

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
		model.setUpdateTime(new Date());
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
        model.setUpdateTime(new Date());
        model.setCreateTime(new Date());
        int row = this.userService.insert(model);
        if(row<=0){
            resultModel.setSuccess(false);
        }
        resultModel.setData(row);
        return resultModel;
    }
    @RequestMapping("updatePasswd")
    @ResponseBody
    public ConsoleResultModel<Integer> updatePasswd(UserSearchForm form) throws Exception {
        ConsoleResultModel<Integer> objectConsoleResultModel = new ConsoleResultModel<>();
        Long userId = (Long) SecurityUtils.getSubject().getPrincipal();
        form.setId(userId);
        this.userService.updatePasswd(form);
        return objectConsoleResultModel;
    }

    @RequestMapping("updateImage")
    @ResponseBody
    public ConsoleResultModel updateImage(UserSearchForm form){
        ConsoleResultModel<Integer> integerConsoleResultModel = new ConsoleResultModel<>();
        userService.updateImage(form);
        return integerConsoleResultModel;
    }


    @RequestMapping("upload")
    @ResponseBody
    public ConsoleResultModel<String> uploadImage(@RequestParam(value = "file") MultipartFile file) throws IOException {
        String path = ClassUtils.getDefaultClassLoader().getResource("").getPath();
        String s = UUID.randomUUID().toString();
        String originalFilename = file.getOriginalFilename();
        int i = originalFilename.lastIndexOf(".");
        String substring = originalFilename.substring(i);
        File file1 = new File(path + "static/image/" + s + substring);
        file.transferTo(file1);
        ConsoleResultModel<String> stringConsoleResultModel = new ConsoleResultModel<>();
        stringConsoleResultModel.setData("/static/image/" + s + substring);
        return stringConsoleResultModel;
    }
}
