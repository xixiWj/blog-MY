package com.wj.blog.common.domain;

import java.io.Serializable;

/**
 *  封装一个 时间转换成 天 时 分 对象
 */
public class MyDate implements Serializable {
    //天
    private Long dayCount;
    //时
    private Long hour;
    //分
    private Long mintue;

    //毫秒数

    private Long times;

    public MyDate(Long times){
        System.out.println(times);
        this.times = times;
        //转换成天
        dayCount =  (times/(24*60*60*1000));
        Long t =  times%(24*60*60*1000);
        //转换成时
        hour = (t/(60*60*1000));
         t=t%(60*60*1000);
        //转换成分
        mintue =(t/(60*1000));
    }

    public Long getDayCount() {
        return dayCount;
    }

    public void setDayCount(Long dayCount) {
        this.dayCount = dayCount;
    }

    public Long getHour() {
        return hour;
    }

    public void setHour(Long hour) {
        this.hour = hour;
    }

    public Long getMintue() {
        return mintue;
    }

    public void setMintue(Long mintue) {
        this.mintue = mintue;
    }

    @Override
    public String toString() {
        System.out.println(mintue);
        return
               dayCount +
                "天 " + hour +
                "时 " + mintue +
                "分";
    }
}
