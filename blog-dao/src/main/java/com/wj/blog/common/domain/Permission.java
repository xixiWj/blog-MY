package com.wj.blog.common.domain;

import java.io.Serializable;

public class Permission implements Serializable {
    private Integer pId;

    private String pName;

    private String pAlias;

    private Long pCreated;

    private Long pUpdated;

    public Integer getpId() {
        return pId;
    }

    public void setpId(Integer pId) {
        this.pId = pId;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName == null ? null : pName.trim();
    }

    public String getpAlias() {
        return pAlias;
    }

    public void setpAlias(String pAlias) {
        this.pAlias = pAlias == null ? null : pAlias.trim();
    }

    public Long getpCreated() {
        return pCreated;
    }

    public void setpCreated(Long pCreated) {
        this.pCreated = pCreated;
    }

    public Long getpUpdated() {
        return pUpdated;
    }

    public void setpUpdated(Long pUpdated) {
        this.pUpdated = pUpdated;
    }
}