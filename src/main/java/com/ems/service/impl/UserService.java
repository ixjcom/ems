package com.ems.service.impl;

import com.ems.config.ShiroConfigure;
import com.ems.dal.example.User;
import com.ems.dal.example.UserExample;
import com.ems.dal.mapper.UserMapper;
import com.ems.from.UserSearchForm;
import com.ems.service.IUserService;
import com.github.pagehelper.PageHelper;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service
public class UserService implements IUserService {

    @Resource
    private UserMapper userMapper;

    @Resource
    protected ShiroConfigure shiroConfigure;

    @Override
    public int insert(User user) throws Exception
    {
        String s = shiroConfigure.encryptPassword(user.getPassword());
        user.setPassword(s);
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


    @Override
    public void signIn(String username, String password, String requstIp) {
            AuthenticationToken token = new UsernamePasswordToken(username,password);
            Subject subject = SecurityUtils.getSubject();
            subject.login(token);
            shiroConfigure.clearCache();
    }

    @Override
    public void signOut() {

    }
}