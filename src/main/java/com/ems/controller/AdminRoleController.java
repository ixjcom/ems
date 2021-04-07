package com.ems.controller;

import com.ems.dal.example.AdminRoleModel;
import com.ems.dal.example.Role;
import com.ems.from.AdminRoleAddForm;
import com.ems.from.AdminRoleSearchForm;
import com.ems.from.AdminRoleUpdateForm;
import com.ems.mode.ConsoleResultModel;
import com.ems.permission.BitCode;
import com.ems.permission.PermissionConfig;
import com.ems.permission.PermissionGroup;
import com.ems.service.IAdminRoleService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author za
 * @version V1.0
 */
@Controller
@RequestMapping("/adminRole")
public class AdminRoleController {

    @Resource
    private IAdminRoleService adminRoleService;

    @Resource
    private PermissionConfig permissionConfig;

    @RequestMapping("/to-list")
    public String roleList(Model model){
        //获取所有权限分组
        List<PermissionGroup> permissionGroups = permissionConfig.getPermissionGroups();
        model.addAttribute("permissionGroups",permissionGroups);
        return "role-list";
    }

    @RequestMapping("/search-list")
    @ResponseBody
    public ConsoleResultModel<PageInfo<Role>> searchRoleList(AdminRoleSearchForm adminRoleForm){
        List<Role> adminRoles = this.adminRoleService.selectList(adminRoleForm);
        PageInfo<Role> pageInfo = new PageInfo<>(adminRoles);
        ConsoleResultModel<PageInfo<Role>> resultModel = new ConsoleResultModel<>();
        resultModel.setData(pageInfo);
        return resultModel;
    }

    @RequestMapping("/search-detail")
    @ResponseBody
    public ConsoleResultModel<AdminRoleModel> searchRoleDetail(Long roleId){
        ConsoleResultModel<AdminRoleModel> resultModel = new ConsoleResultModel<>();
        Role adminRole = this.adminRoleService.selectById(roleId);
        if(adminRole!=null){
            AdminRoleModel adminRoleModel = new AdminRoleModel();
            BeanUtils.copyProperties(adminRole,adminRoleModel);
            BitCode bitCode = new BitCode(adminRoleModel.getPermissions());
            adminRoleModel.setPermissionIds(this.permissionConfig.getPermissionIds(bitCode));
            resultModel.setData(adminRoleModel);
        }
        return resultModel;
    }

    @RequestMapping("to-add")
    public String roleAdd(Model model){
        //获取所有权限分组
        List<PermissionGroup> permissionGroups = permissionConfig.getPermissionGroups();
        model.addAttribute("permissionGroups",permissionGroups);
        return "role-add";
    }

    @RequestMapping("insert")
    @ResponseBody
    public ConsoleResultModel<Integer> insertRole(AdminRoleAddForm adminRoleAddForm){
        ConsoleResultModel<Integer> resultModel = new ConsoleResultModel<>();
        int row = this.adminRoleService.insert(adminRoleAddForm);
        if(row<=0){
            resultModel.setSuccess(false);
        }
        resultModel.setData(row);
        return resultModel;
    }

    @RequestMapping("/update")
    @ResponseBody
    public ConsoleResultModel<Integer> updateRole(AdminRoleUpdateForm adminRoleUpdateForm){
        ConsoleResultModel<Integer> resultModel = new ConsoleResultModel<>();
        Integer result = this.adminRoleService.updateById(adminRoleUpdateForm);
        resultModel.setData(result);
        return resultModel;
    }

    @RequestMapping("/delete")
    @ResponseBody
    public ConsoleResultModel<Integer> deleteRole(Long roleId){
        ConsoleResultModel<Integer> resultModel = new ConsoleResultModel<>();
        Integer result = this.adminRoleService.deleteById(roleId);
        resultModel.setData(result);
        return resultModel;
    }
}
