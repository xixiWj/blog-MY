package com.wj.blog.shiro;

import com.wj.blog.filter.RemenberMeFilter;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.shiro.cache.CacheManager;
import org.apache.shiro.cache.MemoryConstrainedCacheManager;
import org.apache.shiro.mgt.DefaultSecurityManager;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.realm.Realm;
import org.apache.shiro.spring.LifecycleBeanPostProcessor;
import org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.CookieRememberMeManager;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.apache.shiro.web.servlet.SimpleCookie;
import org.springframework.aop.framework.autoproxy.DefaultAdvisorAutoProxyCreator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.DependsOn;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;

import javax.servlet.Filter;
import java.util.*;

@Configuration
public class ShiroConfiguration {
    private static final Log log = LogFactory.getLog(ShiroConfiguration.class);

    @Autowired
    private RemenberMeFilter remenberMeFilter;
    /**
     * 用户授权信息Cache
     * */
    @Bean(name = "shiroCacheManager")
    public CacheManager cacheManager(){return new MemoryConstrainedCacheManager();}

//    @Bean
//    public UserRealm myShiroRealm(){
//        UserRealm userRealm = new UserRealm();
//        return userRealm;
//    }

    /**
     *向Cookie中保存数据的配置模板RememberMe
     * @return
     */
    @Bean
    public SimpleCookie simpleCookie(){

        //设置Cookie在浏览器中保存内容的名字
        SimpleCookie simpleCookie =  new SimpleCookie("YL-session");
        //保证该系统不会受到跨域的脚本操作攻击
        simpleCookie.setHttpOnly(true);
        //最大过期时间
        simpleCookie.setMaxAge(360000);
        return simpleCookie;
    }

    /**
     * RememberMe功能的程序管理类
     * @return
     */
    @Bean
    public CookieRememberMeManager cookieRememberMeManager(){

        CookieRememberMeManager cookieRememberMeManager =  new CookieRememberMeManager();
        //设置Cookie
        cookieRememberMeManager.setCookie(simpleCookie());
        return cookieRememberMeManager;
    }
    @Bean(name = "securityManager")
    public DefaultSecurityManager securityManager(){
        //这里注意，需要实现DefaultWebSecurityManager
        DefaultSecurityManager sm = new DefaultWebSecurityManager();
        sm.setCacheManager(cacheManager());
        sm.setRememberMeManager(cookieRememberMeManager());
        //sm.setSessionManager();
        return sm;
    }

    /**
     * shiro核心，拦截器链，顺序执行
     * */
    @Bean(name = "shiroFilter")
    @DependsOn("securityManager")
    public ShiroFilterFactoryBean getShiroFilterFactoryBean(DefaultSecurityManager securityManager, Realm realm){
        securityManager.setRealm(realm);
        //拦截器
        LinkedHashMap<String,String> filterChainDefinitionMap = new LinkedHashMap<>();

        //登出
     //   filterChainDefinitionMap.put("/user/logout", "logout");

        //<!-- 过滤链定义，从上向下顺序执行，一般将 /**放在最为下边 -->:这是一个坑呢，一不小心代码就不好使了;
        //<!-- authc:所有url都必须认证通过才可以访问; anon:所有url都都可以匿名访问-->
        filterChainDefinitionMap.put("/admin/**", "authc");
        filterChainDefinitionMap.put("/**", "anon");



        ShiroFilterFactoryBean shiroFilter = new ShiroFilterFactoryBean();
        shiroFilter.setSecurityManager(securityManager);
        shiroFilter.setLoginUrl("/user/toLogin");//未登录跳转
        shiroFilter.setUnauthorizedUrl("/user/toLogin");//未授权跳转
        // 登录成功后要跳转的链接
        shiroFilter.setSuccessUrl("/index");


        filterChainDefinitionMap.put("/admin/first","perms[1]");
        log.info("第一链");
        filterChainDefinitionMap.put("/admin/second","perms[2]");
        log.info("第二链");
        filterChainDefinitionMap.put("/admin/third","perms[3]");
        log.info("第三链");


        log.info("执行顺序 : " + filterChainDefinitionMap);
        shiroFilter.setFilters((Map<String, Filter>) new HashMap<>().put("/admin/**",remenberMeFilter));
        shiroFilter.setFilterChainDefinitionMap(filterChainDefinitionMap);
        return shiroFilter;
    }

    /**
     * 配置 shiro 异常跳转页面
     * @return
     */
    @Bean
    public SimpleMappingExceptionResolver simpleMappingExceptionResolver() {
        SimpleMappingExceptionResolver resolver = new SimpleMappingExceptionResolver();
        Properties properties = new Properties();

        /*未授权处理页*/
        properties.setProperty("org.apache.shiro.authz.UnauthorizedException", "/404");
        /*身份没有验证*/
        properties.setProperty("org.apache.shiro.authz.UnauthenticatedException", "/login.html");
        resolver.setExceptionMappings(properties);
        return resolver;
    }

    //开启shiro aop注解支持
    @Bean
    public AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor(SecurityManager manager) {
        AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor = new AuthorizationAttributeSourceAdvisor();
        authorizationAttributeSourceAdvisor.setSecurityManager(manager);
        return authorizationAttributeSourceAdvisor;
    }

    /**
     * DefaultAdvisorAutoProxyCreator，Spring的一个bean，由Advisor决定对哪些类的方法进行AOP代理。
     */
    @Bean
    public DefaultAdvisorAutoProxyCreator defaultAdvisorAutoProxyCreator() {
        DefaultAdvisorAutoProxyCreator defaultAAP = new DefaultAdvisorAutoProxyCreator();
        defaultAAP.setProxyTargetClass(true);
        return defaultAAP;
    }

}

