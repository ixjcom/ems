package com.ems.service.impl;

import com.ems.dal.example.Role;
import com.ems.dal.example.RoleExample;
import com.ems.dal.mapper.RoleMapper;
import com.ems.from.AdminRoleAddForm;
import com.ems.from.AdminRoleSearchForm;
import com.ems.from.AdminRoleUpdateForm;
import com.ems.permission.BitCode;
import com.ems.permission.PermissionConfig;
import com.ems.service.IAdminRoleService;
import com.github.pagehelper.PageHelper;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * Created by z on 2016/10/10.
 */
@Service
public class AdminRoleService implements IAdminRoleService {

	@Resource
	private PermissionConfig permissionConfig;

	@Resource
	private RoleMapper roleMapper;

	@Override
	public List<Role> selectList(AdminRoleSearchForm adminRoleSearchForm) {
		RoleExample adminRoleExample = new RoleExample();
		if (StringUtils.isNotBlank(adminRoleSearchForm.getName())) {
			adminRoleExample.createCriteria().andNameLike(adminRoleSearchForm.getName() + "%");
		}
		PageHelper.startPage(adminRoleSearchForm.getPageNum(), adminRoleSearchForm.getPageSize());
		List<Role> adminRoles = this.roleMapper.selectByExample(adminRoleExample);
		return adminRoles;
	}

	@Override
	public Integer insert(AdminRoleAddForm adminRoleAddForm) {
		//检查角色名是否已经存在
		if (!this.selectByCheckRoleName(adminRoleAddForm.getName())) {
			Role adminRole = new Role();
			BeanUtils.copyProperties(adminRoleAddForm, adminRole);
			if (CollectionUtils.isNotEmpty((adminRoleAddForm.getPermissionIds()))) {
				adminRole.setPermissions(permissionConfig.getPermissionCode(adminRoleAddForm.getPermissionIds()).getCode());
			}
			adminRole.setCreateTime(new Date());
			adminRole.setUpdateTime(new Date());
			return roleMapper.insert(adminRole);
		}
		return 0;
	}

	@Override
	public List<Role> selectAll() {
		return this.roleMapper.selectByExample(null);
	}

	@Override
	public Role selectById(Long roleId) {
		if (roleId == null || roleId == 0) {
			return null;
		}

		Role role = this.roleMapper.selectByPrimaryKey(roleId);
		role.setPermissionCodes(permissionConfig.getPermissionCodes(new BitCode(role.getPermissions())));
		return role;
	}

	@Override
	public Integer updateById(AdminRoleUpdateForm adminRoleUpdateForm) {
		Role dataAdminRole = this.roleMapper.selectByPrimaryKey(adminRoleUpdateForm.getId());
		boolean flg = true;
		if (!dataAdminRole.getName().equals(adminRoleUpdateForm.getName())) {
			flg = this.selectByCheckRoleName(adminRoleUpdateForm.getName());
		}
		if (false == flg) {
			return 0;
		}
		Role adminRole = new Role();
		BeanUtils.copyProperties(adminRoleUpdateForm, adminRole);
		if (CollectionUtils.isNotEmpty((adminRoleUpdateForm.getPermissionIds()))) {
			adminRole.setPermissions(permissionConfig.getPermissionCode(adminRoleUpdateForm.getPermissionIds()).getCode());
		}
		adminRole.setUpdateTime(new Date());
		return roleMapper.updateByPrimaryKeySelective(adminRole);
	}

	@Override
	public Integer deleteById(Long roleId) {
		return this.roleMapper.deleteByPrimaryKey(roleId);
	}

	@Override
	public boolean selectByCheckRoleName(String roleName) {
		RoleExample adminRoleExample = new RoleExample();
		adminRoleExample.createCriteria().andNameEqualTo(roleName);
		int count = this.roleMapper.countByExample(adminRoleExample);
		return count > 0 ? true : false;
	}
}
