package com.ems.dal.mapper;

import java.util.List;
import java.util.Map;

public interface DataRankMapper {

    List<Map<String,Object>> selectDataRankRraction();

    List<Map<String,Object>> selectDataRankBusiness();
}