package com.ems.service.impl;

import javax.annotation.Resource;

import com.ems.dal.example.User;
import com.ems.dal.example.UserExample;
import com.ems.dal.mapper.UserMapper;
import com.ems.from.UserSearchForm;
import com.ems.service.IUserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import com.github.pagehelper.PageHelper;
import java.util.List;


@Service
public class UserService implements IUserService {

    @Resource
    private UserMapper userMapper;

    @Override
    public int insert(User user) throws Exception
    {
        return userMapper.insertSelective(user);
    }

    @Override
    public int delete(Long id) throws Exception
    {
        return userMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int update(User user) throws Exception
    {
        return userMapper.updateByPrimaryKeySelective(user);
    }

    @Override
    public List<User> select(UserSearchForm form) throws Exception
    {
        PageHelper.startPage(form.getPageNum(), form.getPageSize());
        UserExample example = new UserExample();
        UserExample.Criteria criteria = example.createCriteria();
       	if(form.getId()!=null){
          	criteria.andIdEqualTo(form.getId());
        } 		
       	if(StringUtils.isNotBlank(form.getUserName())){
          	criteria.andUserNameEqualTo(form.getUserName());
        } 		
       	if(StringUtils.isNotBlank(form.getPassword())){
          	criteria.andPasswordEqualTo(form.getPassword());
        } 		
       	if(StringUtils.isNotBlank(form.getMobil())){
          	criteria.andMobilEqualTo(form.getMobil());
        } 		
        if(form.getStartCreateTime()!=null){
          	criteria.andCreateTimeGreaterThanOrEqualTo(form.getStartCreateTime());
        }
        if(form.getEndCreateTime()!=null){
          	criteria.andCreateTimeLessThanOrEqualTo(form.getEndCreateTime());
        }
        if(form.getStartUpdateTime()!=null){
          	criteria.andUpdateTimeGreaterThanOrEqualTo(form.getStartUpdateTime());
        }
        if(form.getEndUpdateTime()!=null){
          	criteria.andUpdateTimeLessThanOrEqualTo(form.getEndUpdateTime());
        }
      
       
        return userMapper.selectByExample(example);
    }

	@Override
	public User selectById(Long id)throws Exception{
		return userMapper.selectByPrimaryKey(id);
	}
}