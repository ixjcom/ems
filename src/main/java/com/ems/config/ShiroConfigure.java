package com.ems.config;

import com.ems.dal.example.Role;
import com.ems.dal.example.User;
import com.ems.dal.example.UserExample;
import com.ems.dal.mapper.RoleMapper;
import com.ems.dal.mapper.UserMapper;
import com.ems.permission.BitCode;
import com.ems.permission.PermissionConfig;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.crypto.hash.Sha256Hash;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;

import javax.annotation.Resource;
import java.util.List;

public class ShiroConfigure extends AuthorizingRealm {

    @Resource
    private UserMapper userMapper;

    @Resource
    private RoleMapper roleMapper;

    @Resource
    private PermissionConfig permissionConfig;

    private String salt = Sha256Hash.ALGORITHM_NAME;

    private String hashAlgorithmName = Sha256Hash.ALGORITHM_NAME;

    public String encryptPassword(String password) {
        return new SimpleHash(hashAlgorithmName, password, getSaltByteSource())
                .toBase64();
    }

    @Override
    protected void onInit() {
        HashedCredentialsMatcher credentialsMatcher = new HashedCredentialsMatcher(
                hashAlgorithmName);
        credentialsMatcher.setStoredCredentialsHexEncoded(false);
        setCredentialsMatcher(credentialsMatcher);
    }

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        Long userId = (Long) getAvailablePrincipal(principals);
        User user = userMapper.selectByPrimaryKey(userId);
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        BitCode userCode = null;
        if (StringUtils.isNotEmpty(user.getPermissions())) {
            userCode = new BitCode(user.getPermissions());
        }
        BitCode roleCode = null;
        if (user.getRoleId() != null) {
            Role role = roleMapper.selectByPrimaryKey(user.getRoleId());
            if (role != null && StringUtils.isNotEmpty(role.getPermissions())) {
                roleCode = new BitCode(role.getPermissions());
            }
        }
        info.addRoles(permissionConfig.getPermissionCodes(getUserPermission(userCode, roleCode)));
        return info;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        UsernamePasswordToken upToken = (UsernamePasswordToken) token;
        String username = upToken.getUsername();
        UserExample example = new UserExample();
        example.createCriteria().andUserNameEqualTo(username);
        List<User> users = userMapper.selectByExample(example);
        if (CollectionUtils.isEmpty(users)) {
            throw new UnknownAccountException();
        }
        User user = users.get(0);
        SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(user.getId(), user.getPassword(), getSaltByteSource(),getName());
        return info;
    }

    private ByteSource getSaltByteSource() {
        return ByteSource.Util.bytes(salt);
    }

    public void clearCache() {
        clearCachedAuthorizationInfo(SecurityUtils.getSubject().getPrincipals());
    }

    private BitCode getUserPermission(BitCode userCode, BitCode roleCode) {
        if (userCode != null && roleCode != null) {
            return userCode.or(roleCode);
        } else if (userCode == null && roleCode != null) {
            return roleCode;
        } else if (userCode != null && roleCode == null) {
            return userCode;
        }
        return new BitCode();
    }
}
