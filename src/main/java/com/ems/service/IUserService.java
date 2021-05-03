package com.ems.service;

import com.ems.dal.example.User;
import com.ems.from.UserSearchForm;

import java.util.List;


public interface IUserService {

    int insert(User user) throws Exception;

    int delete(Long id) throws Exception;

    int update(User user) throws Exception;

    List<User> select (UserSearchForm form) throws Exception;
    
    
    User selectById(Long id)throws Exception;

    void signIn(String username, String password, String requstIp);

    void signOut();

    void updatePasswd(UserSearchForm form) throws Exception;

    public User getCurrentUser();

    String updateImage(UserSearchForm form);

    List<User> selectAll();
}