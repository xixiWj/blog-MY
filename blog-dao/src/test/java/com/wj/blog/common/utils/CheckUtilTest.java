package com.wj.blog.common.utils;

import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.context.annotation.ApplicationScope;

import static org.junit.jupiter.api.Assertions.*;
@RunWith(SpringJUnit4ClassRunner.class)
@ApplicationScope()
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml","classpath:spring-mvc.xml"})
class CheckUtilTest {

    @Test
    void checkPwd() {
        String pwd = "Wei123456";
        System.out.println( CheckUtil.checkPwd(pwd));
    }
}