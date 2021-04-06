package com.ems.service;

import com.ems.dal.example.Business;
import com.ems.from.BusinessSearchForm;

import java.util.List;


public interface IBusinessService {

    int insert(Business business) throws Exception;

    int delete(Long id) throws Exception;

    int update(Business business) throws Exception;

    List<Business> select (BusinessSearchForm form) throws Exception;


    Business selectById(Long id)throws Exception;
}