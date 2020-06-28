package com.wj.blog.shiro;

import com.wj.blog.common.utils.Base64Utils;
import com.wj.blog.common.utils.RSAUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.HttpRequest;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authc.credential.SimpleCredentialsMatcher;
import org.junit.platform.commons.logging.Logger;
import org.junit.platform.commons.logging.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@Component
public class CredentialsMatcher  extends SimpleCredentialsMatcher {

    private static final Log log = LogFactory.getLog(CredentialsMatcher.class);


    private final static Logger LOGGER = LoggerFactory.getLogger(CredentialsMatcher.class);

    @Override
    public boolean doCredentialsMatch(AuthenticationToken token, AuthenticationInfo info) {
        UsernamePasswordToken authcToken = (UsernamePasswordToken) token;
        Object tokenCredentials = null;
        try {
            //获取私钥
            String up =new String(authcToken.getPassword()).trim().replaceAll(" ","+");;
            String userPwdByte =  RSAUtils.decryptDataOnJava(up,authcToken.getHost());
            //用户名+密码
            String namePwd = authcToken.getUsername()+userPwdByte;
            tokenCredentials = Base64Utils.md5(namePwd);
            String str = Base64Utils.md5(namePwd);
        } catch (Exception e) {
            e.printStackTrace();
        }
        Object accountCredentials = getCredentials(info);
        return accountCredentials.equals(tokenCredentials);
    }
}
