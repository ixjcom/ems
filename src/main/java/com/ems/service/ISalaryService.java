package com.ems.service;

import com.ems.dal.example.Salary;

import java.util.List;


public interface ISalaryService {

    int insert(Salary salary) throws Exception;

    int delete(Long id) throws Exception;

    int update(Salary salary) throws Exception;

    List<Salary> select () throws Exception;

    Salary selectById(Long id);
}