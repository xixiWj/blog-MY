package com.wj.blog.filter;

import com.wj.blog.common.domain.User;
import com.wj.blog.service.PermissionService;
import com.wj.blog.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.logging.Logger;

@Component
public class RemenberMeFilter extends FormAuthenticationFilter {

//    private final Logger logger = Logger.getLogger(RemenberMeFilter.class);
     @Resource
     private UserService userService;

    public boolean isAccessAllowed(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
        //logger.info("---preHandle---");
        System.out.println(request.getContextPath());
         Subject currentUser = SecurityUtils.getSubject();
        //判断用户是通过记住我功能自动登录,此时session失效
        if(!currentUser.isAuthenticated() && currentUser.isRemembered()){
           try {
               User user = userService.findByName(currentUser.getPrincipals().toString());
              //对密码进行加密后验证
                 UsernamePasswordToken token = new UsernamePasswordToken(user.getUserName(), user.getUserPassword(),currentUser.isRemembered());
               //把当前用户放入session
                     Session session = currentUser.getSession();
                     session.setAttribute("currentUser",user);
                              //设置会话的过期时间--ms,默认是30分钟，设置负数表示永不过期
                    session.setTimeout(-1000l);
                                  }catch (Exception e){
                                      //自动登录失败,跳转到登录页面
                   response.sendRedirect(request.getContextPath()+"/login");
                               return false;
                    }
                       if(!currentUser.isAuthenticated()){
                             //自动登录失败,跳转到登录页面
                             response.sendRedirect(request.getContextPath()+"/login");
                            return false;
                        }
                 }
            return true;
          }
}
