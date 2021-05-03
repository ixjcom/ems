package com.ems.service.impl;

import com.ems.config.ShiroConfigure;
import com.ems.dal.example.*;
import com.ems.dal.mapper.UserInfoMapper;
import com.ems.dal.mapper.UserMapper;
import com.ems.from.UserSearchForm;
import com.ems.service.IAdminRoleService;
import com.ems.service.IUserService;
import com.github.pagehelper.PageHelper;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.UUID;


@Service
public class UserService implements IUserService {

    @Resource
    private UserMapper userMapper;

    @Resource
    protected ShiroConfigure shiroConfigure;

    @Resource
    private UserInfoMapper userInfoMapper;

    @Resource
    private IAdminRoleService adminRoleService;

    @Override
    public int insert(User user) throws Exception
    {
        String s = shiroConfigure.encryptPassword(user.getPassword());
        user.setPassword(s);

        if (StringUtils.isEmpty(user.getUserName())){
            user.setUserName(UUID.randomUUID().toString().substring(0,20));
        }

        if (user.getRoleId()==null){
            user.setRoleId(4l);
        }
        Role role = adminRoleService.selectById(user.getRoleId());
        user.setPermissions(role.getPermissions());
        UserExample example = new UserExample();
        UserExample.Criteria criteria = example.createCriteria().andUserNameEqualTo(user.getUserName());

        int count = userMapper.countByExample(example);

        if (count>0){
            throw new Exception("用户名重复");
        }

        return userMapper.insertSelective(user);
    }

    @Override
    public int delete(Long id) throws Exception
    {
        return userMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int update(User user) throws Exception
    {
        return userMapper.updateByPrimaryKeySelective(user);
    }

    @Override
    public List<User> select(UserSearchForm form) throws Exception
    {
        PageHelper.startPage(form.getPageNum(), form.getPageSize());
        UserExample example = new UserExample();
        UserExample.Criteria criteria = example.createCriteria();
       	if(form.getId()!=null){
          	criteria.andIdEqualTo(form.getId());
        } 		
       	if(StringUtils.isNotBlank(form.getUserName())){
          	criteria.andUserNameEqualTo(form.getUserName());
        } 		
       	if(StringUtils.isNotBlank(form.getPassword())){
          	criteria.andPasswordEqualTo(form.getPassword());
        } 		
       	if(StringUtils.isNotBlank(form.getMobil())){
          	criteria.andMobilEqualTo(form.getMobil());
        } 		
        if(form.getStartCreateTime()!=null){
          	criteria.andCreateTimeGreaterThanOrEqualTo(form.getStartCreateTime());
        }
        if(form.getEndCreateTime()!=null){
          	criteria.andCreateTimeLessThanOrEqualTo(form.getEndCreateTime());
        }
        if(form.getStartUpdateTime()!=null){
          	criteria.andUpdateTimeGreaterThanOrEqualTo(form.getStartUpdateTime());
        }
        if(form.getEndUpdateTime()!=null){
          	criteria.andUpdateTimeLessThanOrEqualTo(form.getEndUpdateTime());
        }
      
        example.setOrderByClause("id desc");
        return userMapper.selectByExample(example);
    }

	@Override
	public User selectById(Long id)throws Exception{
		return userMapper.selectByPrimaryKey(id);
	}


    @Override
    public void signIn(String username, String password, String requstIp) {
            AuthenticationToken token = new UsernamePasswordToken(username,password);
            Subject subject = SecurityUtils.getSubject();
            subject.login(token);
            shiroConfigure.clearCache();

        User currentUser = getCurrentUser();
        //获取当前用户,设置登陆次数和登陆IP
        UserInfoExample exaple = new UserInfoExample();
        exaple.createCriteria().andUserIdEqualTo(currentUser.getId());
        List<UserInfo> userInfos = userInfoMapper.selectByExample(exaple);
        if (CollectionUtils.isEmpty(userInfos)){
            UserInfo userInfo = new UserInfo();
            userInfo.setUserId(currentUser.getId());
            userInfo.setUpdateTime(new Date());
            userInfo.setLoginCount(0);
            userInfo.setPostType(currentUser.getRoleId().intValue());
            userInfo.setLoginIp(requstIp);
            userInfoMapper.insertSelective(userInfo);
        }else {
            UserInfo userInfo = new UserInfo();
            UserInfo userInfo1 = userInfos.get(0);
            userInfo.setLoginIp(requstIp);
            userInfo.setUpdateTime(new Date());
            userInfo.setId(userInfo1.getId());
            userInfo.setLoginCount(userInfo1.getLoginCount()+1);
            userInfoMapper.updateByPrimaryKeySelective(userInfo);
        }
    }



    @Override
    public void signOut() {
        shiroConfigure.clearCache();
        SecurityUtils.getSubject().logout();
    }

    @Override
    public User getCurrentUser() {
        Long userId = (Long) SecurityUtils.getSubject().getPrincipal();
        return userMapper.selectByPrimaryKey(userId);
    }

    @Override
    public String updateImage(UserSearchForm form) {
        User currentUser = getCurrentUser();
        User user = new User();
        user.setId(currentUser.getId());
        user.setImage(form.getImage());
        userMapper.updateByPrimaryKeySelective(user);

        UserInfoExample example = new UserInfoExample();
        example.createCriteria().andUserIdEqualTo(user.getId());
        List<UserInfo> userInfos = userInfoMapper.selectByExample(example);
        if (CollectionUtils.isNotEmpty(userInfos)){
            UserInfo userInfo = userInfos.get(0);
            userInfo.setImage(form.getImage());
            userInfoMapper.updateByPrimaryKeySelective(userInfo);
        }
        return form.getImage();
    }

    @Override
    public void updatePasswd(UserSearchForm passwdUpdateForm) throws Exception {
        if(!StringUtils.equals(passwdUpdateForm.getNewPassword(),passwdUpdateForm.getNewPasswordConfirm())){
            throw new Exception("confirm.passwd.not");
        }
        User adminUser = this.userMapper.selectByPrimaryKey(passwdUpdateForm.getId());
        if(adminUser==null){
            throw new Exception("user.not.exist");
        }
        if(!StringUtils.equals(shiroConfigure.encryptPassword(passwdUpdateForm.getOldPassword()),adminUser.getPassword())){
            throw new Exception("user.passwd.wrong");
        }
        adminUser.setPassword(shiroConfigure.encryptPassword(passwdUpdateForm.getNewPassword()));
        this.userMapper.updateByPrimaryKeySelective(adminUser);
    }

    @Override
    public List<User> selectAll() {
        return userMapper.selectByExample(new UserExample());
    }
}