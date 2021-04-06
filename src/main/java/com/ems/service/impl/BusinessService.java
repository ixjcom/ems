package com.ems.service.impl;

import com.ems.dal.example.Business;
import com.ems.dal.example.BusinessExample;
import com.ems.dal.mapper.BusinessMapper;
import com.ems.from.BusinessSearchForm;
import com.ems.service.IBusinessService;
import com.github.pagehelper.PageHelper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service
public class BusinessService implements IBusinessService {

    @Resource
    private BusinessMapper businessMapper;

    @Override
    public int insert(Business business) throws Exception
    {
        return businessMapper.insertSelective(business);
    }

    @Override
    public int delete(Long id) throws Exception
    {
        return businessMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int update(Business business) throws Exception
    {
        return businessMapper.updateByPrimaryKeySelective(business);
    }

    @Override
    public List<Business> select(BusinessSearchForm form) throws Exception
    {
        PageHelper.startPage(form.getPageNum(), form.getPageSize());
        BusinessExample example = new BusinessExample();
        BusinessExample.Criteria criteria = example.createCriteria();
       	if(form.getId()!=null){
          	criteria.andIdEqualTo(form.getId());
        }
       	if (form.getUserId()!=null)
       	    criteria.andUserIdEqualTo(form.getUserId());

       	if (form.getBusinessCount()!=null)
       	    criteria.andBusinessCountEqualTo(form.getBusinessCount());

       	if (form.getFraction()!=null)
       	    criteria.andFractionEqualTo(form.getFraction());

        if(form.getStartUpdateTime()!=null){
          	criteria.andUpdateTimeGreaterThanOrEqualTo(form.getStartUpdateTime());
        }
        if(form.getEndUpdateTime()!=null){
          	criteria.andUpdateTimeLessThanOrEqualTo(form.getEndUpdateTime());
        }
        example.setOrderByClause("id desc");
        return businessMapper.selectByExample(example);
    }

	@Override
	public Business selectById(Long id)throws Exception{
		return businessMapper.selectByPrimaryKey(id);
	}
}