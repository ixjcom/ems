package com.ems.service.impl;

import com.ems.dal.example.UserInfo;
import com.ems.dal.example.UserInfoExample;
import com.ems.dal.mapper.UserInfoMapper;
import com.ems.from.UserInfoSearchForm;
import com.ems.service.IUserInfoService;
import com.github.pagehelper.PageHelper;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service
public class UserInfoService implements IUserInfoService {

    @Resource
    private UserInfoMapper userInfoMapper;

    @Override
    public int insert(UserInfo userInfo) throws Exception
    {
        return userInfoMapper.insertSelective(userInfo);
    }

    @Override
    public int delete(Long id) throws Exception
    {
        return userInfoMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int update(UserInfo userInfo) throws Exception
    {
        return userInfoMapper.updateByPrimaryKeySelective(userInfo);
    }

    @Override
    public List<UserInfo> select(UserInfoSearchForm form) throws Exception
    {
        PageHelper.startPage(form.getPageNum(), form.getPageSize());
        UserInfoExample example = new UserInfoExample();
        UserInfoExample.Criteria criteria = example.createCriteria();
       	if(form.getId()!=null){
          	criteria.andIdEqualTo(form.getId());
        } 		
       	if(StringUtils.isNotBlank(form.getLoginIp())){
          	criteria.andLoginIpEqualTo(form.getLoginIp());
        }
       	if (form.getUserId()!=null)
       	    criteria.andUserIdEqualTo(form.getUserId());

       	if (form.getPostType()!=null)
       	    criteria.andPostTypeEqualTo(form.getPostType());

       	if (form.getLoginCount()!=null){
       	    criteria.andLoginCountEqualTo(form.getLoginCount());
        }

        if(form.getStartUpdateTime()!=null){
          	criteria.andUpdateTimeGreaterThanOrEqualTo(form.getStartUpdateTime());
        }
        if(form.getEndUpdateTime()!=null){
          	criteria.andUpdateTimeLessThan(form.getEndUpdateTime());
        }

        return userInfoMapper.selectByExample(example);
    }

	@Override
	public UserInfo selectById(Long id)throws Exception{
		return userInfoMapper.selectByPrimaryKey(id);
	}
}