package com.wj.blog.shiro;

import com.wj.blog.common.domain.Permission;
import com.wj.blog.common.domain.Role;
import com.wj.blog.common.domain.User;
import com.wj.blog.common.utils.DateUtil;
import com.wj.blog.service.RoleService;
import com.wj.blog.service.UserService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.client.utils.DateUtils;
import org.apache.log4j.Logger;
import org.apache.shiro.authc.*;
import org.apache.shiro.authc.credential.AllowAllCredentialsMatcher;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.Date;
import java.util.List;

/**
 * Shiro 身份校验
 */
@Component
public class UserRealm extends AuthorizingRealm {

    private static final Log log = LogFactory.getLog(UserRealm.class);

    @Autowired
    private  UserService userService ;

    @Autowired
    private RoleService roleService ;

    public UserRealm(){
        super(new AllowAllCredentialsMatcher());
        setAuthenticationTokenClass(UsernamePasswordToken.class);
        //FIXME:暂时禁用Cache
        setCachingEnabled(false);
    }

    /**
     *    验证时调用
     *    方法调用subject.hasRole("admin")或subject.isPermitted("admin");
     *    自己去调用这个是否有什么角色或有什么权限
     *
     * @param principalCollection
     * @return
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        log.debug("##################执行Shiro权限认证##################");
        User user = (User) principalCollection.getPrimaryPrincipal();
        if(user!=null){
            SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
            Role role = roleService.getById(user.getUserRole().getrId());
            List<Permission> permissions = role.getPermissions();
            if(permissions!=null) {
                for (Permission p : permissions
                ) {
                    info.addStringPermission(p.getpAlias());
                }
            }
            info.addRole(role.getrName());
            return info;
        }
        return  null;
    }

    /**
     * 登陆时调用
     *     调用Subject currentUser = SecurityUtils.getSubject();
     *       currentUser.login(token);
     * @param authenticationToken
     * @return
     * @throws AuthenticationException
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;
        log.debug("用户验证执行："+token.getUsername());
        User user = userService.findByName(token.getUsername());
        if(user==null){
            throw  new AccountException("账号不存在！");
        }
        if(user.getUserStatus()==0){
            throw  new DisabledAccountException("账号已经被禁止登陆！");
        }else {
            user.setUserUpdated(new Date().getTime());

            userService.update(user);
        }
        return new SimpleAuthenticationInfo(user,user.getUserPassword(),user.getUserName());
    }


    //该句作用是重写shiro的密码验证，让shiro用我自己的验证
    @PostConstruct
    public void initCredentialsMatcher() {
        setCredentialsMatcher(new CredentialsMatcher());

    }
}
