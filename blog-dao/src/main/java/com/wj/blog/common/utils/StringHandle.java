package com.wj.blog.common.utils;

/**
 * 字符串处理类
 */
public class StringHandle {

    /**
     * 使用正则表达式去掉多余的"0"和"."
     *
     * @param str 传入的字符串
     * @return 返回处理后的字符串
     */
    public static String subZeroAndDot(String str) {
        if (!(str.isEmpty()) && str.indexOf('.') >= 0) {
            // 去掉多余的0
            String newStr = str.replaceAll("0+?$", "");
            // 如最后一位是.则去掉
            return newStr.replaceAll("[.]$", "");
        }
        return str;
    }

}
