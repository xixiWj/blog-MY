package com.wj.blog.common.domain;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Role implements Serializable {
    private Integer rId;

    private String rName;

    private String rAlias;

    private Long rCreated;

    private Long rUpdated;

    private String createdat;


    private List<Permission> permissions =  new ArrayList<>();

    public List<Permission> getPermissions() {
        return permissions;
    }

    public void setPermissions(List<Permission> permissions) {
        this.permissions = permissions;
    }

    public Integer getrId() {
        return rId;
    }

    public void setrId(Integer rId) {
        this.rId = rId;
    }

    public String getrName() {
        return rName;
    }

    public void setrName(String rName) {
        this.rName = rName == null ? null : rName.trim();
    }

    public String getrAlias() {
        return rAlias;
    }

    public void setrAlias(String rAlias) {
        this.rAlias = rAlias == null ? null : rAlias.trim();
    }

    public Long getrCreated() {
        return rCreated;
    }

    public void setrCreated(Long rCreated) {
        this.rCreated = rCreated;
    }

    public Long getrUpdated() {
        return rUpdated;
    }

    public void setrUpdated(Long rUpdated) {
        this.rUpdated = rUpdated;
    }

    public String getCreatedat() {
        return createdat;
    }

    public void setCreatedat(String createdat) {
        this.createdat = createdat == null ? null : createdat.trim();
    }
}