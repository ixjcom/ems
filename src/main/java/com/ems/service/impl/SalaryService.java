package com.ems.service.impl;

import com.ems.dal.example.*;
import com.ems.dal.mapper.RoleMapper;
import com.ems.dal.mapper.SalaryMapper;
import com.ems.service.ISalaryService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;


@Service
public class SalaryService implements ISalaryService {
    @Resource
    private SalaryMapper salaryMapper;

    @Resource
    private RoleMapper roleMapper;

    @Override
    public int insert(Salary salary) throws Exception {

        Role role = roleMapper.selectByPrimaryKey(salary.getRoleId());
        salary.setRoleName(role.getName());
        salary.setCreateTime(new Date());
        salary.setUpdateTime(new Date());
        return salaryMapper.insert(salary);
    }

    @Override
    public int delete(Long id) throws Exception {
        return salaryMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int update(Salary salary) throws Exception {
        Role role = roleMapper.selectByPrimaryKey(salary.getRoleId());
        salary.setRoleName(role.getName());
        salary.setUpdateTime(new Date());
        return salaryMapper.updateByPrimaryKeySelective(salary);
    }

    @Override
    public List<Salary> select() throws Exception {
        return salaryMapper.selectByExample(new SalaryExample());
    }

    @Override
    public Salary selectById(Long id) {
        return salaryMapper.selectByPrimaryKey(id);
    }
}