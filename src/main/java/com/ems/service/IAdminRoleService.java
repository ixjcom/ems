package com.ems.service;


import com.ems.dal.example.Role;
import com.ems.from.AdminRoleAddForm;
import com.ems.from.AdminRoleSearchForm;
import com.ems.from.AdminRoleUpdateForm;

import java.util.List;

/**
 * Created by z on 2016/10/10.
 */
public interface IAdminRoleService {

    /**
     * 根据条件查询角色列表
     * @return
     */
    public List<Role> selectList(AdminRoleSearchForm adminRoleSearchForm);

    /**
     * 保存角色
     * @param adminRoleAddForm
     */
    public Integer insert(AdminRoleAddForm adminRoleAddForm);

    /**
     * 查询所有角色
     * @return
     */
    public List<Role> selectAll();

    /**
     * 根据id查询角色详情
     * @param roleId 角色id
     * @return 角色对象
     */
    public Role selectById(Long roleId);

    /**
     * 根据ID修改角色信息
     * @param adminRoleUpdateForm 对应表单对象
     * @return 修改影响的行数
     */
    public Integer updateById(AdminRoleUpdateForm adminRoleUpdateForm);

    /**
     * 删除角色id
     * @param roleId 角色id
     * @return 删除角色行数
     */
    public Integer deleteById(Long roleId);

    /**
     * 检查角色名是否存在
     * @return
     */
    public boolean selectByCheckRoleName(String roleName);
}
