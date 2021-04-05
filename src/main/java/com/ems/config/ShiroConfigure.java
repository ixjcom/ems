package com.ems.config;

import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.crypto.hash.Sha256Hash;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class ShiroConfigure extends AuthorizingRealm {


    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        Long userId = (Long) getAvailablePrincipal(principals);
        //AdminUser user = adminUserMapper.selectByPrimaryKey(userId);
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        List<String> roles = new ArrayList<>();
        roles.add("test");
        info.addRoles(roles);
        return info;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        UsernamePasswordToken upToken = (UsernamePasswordToken) token;
        String username = upToken.getUsername();

       /* AdminUserExample example = new AdminUserExample();
        example.createCriteria().andUsernameEqualTo(username);
        List<AdminUser> users = adminUserMapper.selectByExample(example);

        if (CollectionUtils.isEmpty(users)) {
            throw new UnknownAccountException();
        }
        SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(user.getId(), user.getPassword(), getSaltByteSource(),getName());*/
        return null;
    }


    /**
     * 检查密码是否正确。
     * @param password       原密码
     * @param hashedPassword 加密后的密码
     * @return 如果密码正确返回true，否则返回false。
     */
/*    public Boolean checkPassword(String password, String hashedPassword) {
        return encryptPassword(password).equals(hashedPassword);
    }*/

    /**
     * 加密。
     * @param password 待加密的密码
     * @return 返回加密后的密码。
     */
/*    public String encryptPassword(String password) {
        return new SimpleHash(hashAlgorithmName, password, getSaltByteSource()).toBase64();
    }*/

    public static void main(String[] args) {
        System.out.println(new SimpleHash(Sha256Hash.ALGORITHM_NAME, "123456", ByteSource.Util.bytes(Sha256Hash
                .ALGORITHM_NAME))
                .toBase64());
    }

}
