package com.ems.dal.mapper;

import com.ems.dal.example.Notify;
import com.ems.dal.example.NotifyExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface NotifyMapper {
    int countByExample(NotifyExample example);

    int deleteByExample(NotifyExample example);

    int deleteByPrimaryKey(Long id);

    int insert(Notify record);

    int insertSelective(Notify record);

    List<Notify> selectByExampleWithBLOBs(NotifyExample example);

    List<Notify> selectByExample(NotifyExample example);

    Notify selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") Notify record, @Param("example") NotifyExample example);

    int updateByExampleWithBLOBs(@Param("record") Notify record, @Param("example") NotifyExample example);

    int updateByExample(@Param("record") Notify record, @Param("example") NotifyExample example);

    int updateByPrimaryKeySelective(Notify record);

    int updateByPrimaryKeyWithBLOBs(Notify record);

    int updateByPrimaryKey(Notify record);
}