package com.wj.blog.common.domain;

public class Visitor {
    private String vId;

    private String vName;

    private String vEmail;

    private String vWebAddress;

    public String getvId() {
        return vId;
    }

    public void setvId(String vId) {
        this.vId = vId == null ? null : vId.trim();
    }

    public String getvName() {
        return vName;
    }

    public void setvName(String vName) {
        this.vName = vName == null ? null : vName.trim();
    }

    public String getvEmail() {
        return vEmail;
    }

    public void setvEmail(String vEmail) {
        this.vEmail = vEmail == null ? null : vEmail.trim();
    }

    public String getvWebAddress() {
        return vWebAddress;
    }

    public void setvWebAddress(String vWebAddress) {
        this.vWebAddress = vWebAddress == null ? null : vWebAddress.trim();
    }
}