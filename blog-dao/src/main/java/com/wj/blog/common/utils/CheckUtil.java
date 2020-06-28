package com.wj.blog.common.utils;

/**
 * 用于检测密码安全
 */
public class CheckUtil {

    /**
     * 用于检测密码是否是强密码
     * @param pwd
     * @return
     */
    public static boolean checkPwd(String pwd){
        //强密码的正则表达式
        String regStr = "^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,16}$";
        return pwd.matches(regStr);
    }
}
