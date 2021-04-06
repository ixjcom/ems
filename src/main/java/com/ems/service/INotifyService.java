package com.ems.service;

import com.ems.dal.example.Notify;
import com.ems.from.NotifySearchForm;

import java.util.List;


public interface INotifyService {

    int insert(Notify notify) throws Exception;

    int delete(Long id) throws Exception;

    int update(Notify notify) throws Exception;

    List<Notify> select (NotifySearchForm form) throws Exception;


    Notify selectById(Long id)throws Exception;
}