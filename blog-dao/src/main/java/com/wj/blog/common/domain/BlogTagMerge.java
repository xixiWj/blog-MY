package com.wj.blog.common.domain;

public class BlogTagMerge {
    private Integer bTId;

    private String bId;

    private Integer tId;

    public Integer getbTId() {
        return bTId;
    }

    public void setbTId(Integer bTId) {
        this.bTId = bTId;
    }

    public String getbId() {
        return bId;
    }

    public void setbId(String bId) {
        this.bId = bId == null ? null : bId.trim();
    }

    public Integer gettId() {
        return tId;
    }

    public void settId(Integer tId) {
        this.tId = tId;
    }
}