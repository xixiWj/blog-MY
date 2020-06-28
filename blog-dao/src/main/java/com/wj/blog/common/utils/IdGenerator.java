package com.wj.blog.common.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

/**
 * 处理UUID类
 */
public class IdGenerator {

    private static SimpleDateFormat format = new SimpleDateFormat("yyMMddHH");

    /**
     * 处理UUID，格式为当前时间加UUID后24位
     *
     * @return 处理好的UUID
     */
    public static String getID() {
        String rs = null;
        rs = UUID.randomUUID().toString().replace("-", "").substring(9);
        rs = format.format(new Date()) + "_" + rs;
        return rs;
    }

}
