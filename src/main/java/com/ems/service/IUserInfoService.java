package com.ems.service;

import com.ems.dal.example.UserInfo;
import com.ems.from.UserInfoSearchForm;

import java.util.List;


public interface IUserInfoService {

    int insert(UserInfo userInfo) throws Exception;

    int delete(Long id) throws Exception;

    int update(UserInfo userInfo) throws Exception;

    List<UserInfo> select (UserInfoSearchForm form) throws Exception;


    UserInfo selectById(Long id)throws Exception;
}