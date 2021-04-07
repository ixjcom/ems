package com.ems.service.impl;

import com.ems.dal.example.Notify;
import com.ems.dal.example.NotifyExample;
import com.ems.dal.mapper.NotifyMapper;
import com.ems.from.NotifySearchForm;
import com.ems.service.INotifyService;
import com.github.pagehelper.PageHelper;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service
public class NotifyService implements INotifyService {

    @Resource
    private NotifyMapper notifyMapper;

    @Override
    public int insert(Notify notify) throws Exception
    {
        return notifyMapper.insertSelective(notify);
    }

    @Override
    public int delete(Long id) throws Exception
    {
        return notifyMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int update(Notify notify) throws Exception
    {
        return notifyMapper.updateByPrimaryKeySelective(notify);
    }

    @Override
    public List<Notify> select(NotifySearchForm form) throws Exception
    {
        PageHelper.startPage(form.getPageNum(), form.getPageSize());
        NotifyExample example = new NotifyExample();
        NotifyExample.Criteria criteria = example.createCriteria();
       	if(form.getId()!=null){
          	criteria.andIdEqualTo(form.getId());
        } 		
       	if(StringUtils.isNotBlank(form.getTitle())){
          	criteria.andTitleEqualTo(form.getTitle());
        } 		
        if(form.getStartReleaseTime()!=null){
          	criteria.andReleaseTimeGreaterThanOrEqualTo(form.getStartReleaseTime());
        }
        if(form.getEndReleaseTime()!=null){
          	criteria.andReleaseTimeLessThan(form.getEndReleaseTime());
        }
        if(form.getIsShow()!=null){
          	criteria.andIsShowEqualTo(form.getIsShow());
        }
      
        example.setOrderByClause("id desc");
        return notifyMapper.selectByExample(example);
    }

	@Override
	public Notify selectById(Long id)throws Exception{
		return notifyMapper.selectByPrimaryKey(id);
	}
}