package com.wj.blog.common.domain;

import com.wj.blog.common.utils.DateUtil;

import java.util.Date;

public class Enclosure {
    private Integer eId;

    private String eName;

    private Long eCreated;

    private String eCreatedTxt;

    private String eUId;

    private Integer eSize;

    public String geteCreatedTxt() {
        return DateUtil.parseDateToStr(new Date(eCreated),
                DateUtil.DATE_TIME_FORMAT_YYYY_MM_DD_HH_MI_SS);
    }

    public Integer geteId() {
        return eId;
    }

    public void seteId(Integer eId) {
        this.eId = eId;
    }

    public String geteName() {
        return eName;
    }

    public void seteName(String eName) {
        this.eName = eName == null ? null : eName.trim();
    }

    public Long geteCreated() {
        return eCreated;
    }

    public void seteCreated(Long eCreated) {
        this.eCreated = eCreated;
    }

    public String geteUId() {
        return eUId;
    }

    public void seteUId(String eUId) {
        this.eUId = eUId == null ? null : eUId.trim();
    }

    public Integer geteSize() {
        return eSize;
    }

    public void seteSize(Integer eSize) {
        this.eSize = eSize;
    }
}