package com.ems.service.impl;

import com.ems.dal.mapper.DataRankMapper;
import com.ems.service.IDataRankService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class DataRankService implements IDataRankService {

    @Resource
    private DataRankMapper dataRankMapper;

    @Override
    public Object selectDataRankBusiness() {
        return dataRankMapper.selectDataRankBusiness();
    }

    @Override
    public Object selectDataRankRraction() {
        return dataRankMapper.selectDataRankRraction();
    }
}
