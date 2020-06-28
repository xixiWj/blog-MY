package com.wj.blog.common.domain;

import com.wj.blog.common.utils.DateUtil;

import java.io.Serializable;
import java.util.Date;

public class User implements Serializable {
    private String userId;

    private String userName;

    private String userPassword;

    private String userEmail;

    private String verifyCode;

    private Short userStatus;

    private Integer userRId;



    private Userinfo userInfo;

    private Long  userUpdated ;

    private Long userCreated;

    private String userUpdatedAt;

    private String userCreatedAt;

    public String getUserUpdatedAt() {
        return DateUtil.parseDateToStr(new Date(userUpdated),
                DateUtil.DATE_TIME_FORMAT_YYYY_MM_DD_HH_MI_SS);
    }

    public String getUserCreatedAt() {
        return DateUtil.parseDateToStr(new Date(userCreated),
                DateUtil.DATE_TIME_FORMAT_YYYY_MM_DD_HH_MI_SS);
    }


    private String defalutImg;

    public String getDefalutImg() {
        return defalutImg;
    }

    public void setDefalutImg(String defalutImg) {
        this.defalutImg = defalutImg;
    }


    public Long getUserUpdated() {
        return userUpdated;
    }


    public void setUserUpdated(Long userUpdated) {
        this.userUpdated = userUpdated;
    }

    public Long getUserCreated() {
        return userCreated;
    }

    public void setUserCreated(Long userCreated) {
        this.userCreated = userCreated;
    }

    private Role userRole;

    public Short getUserStatus() {
        return userStatus;
    }

    public void setUserStatus(Short userStatus) {
        this.userStatus = userStatus;
    }

    public Integer getUserRId() {
        return userRId;
    }

    public void setUserRId(Integer userRId) {
        this.userRId = userRId;
    }

    public Role getUserRole() {
        return userRole;
    }

    public void setUserRole(Role userRole) {
        this.userRole = userRole;
    }

    public Userinfo getUserInfo() {
        return userInfo;
    }

    public void setUserInfo(Userinfo userInfo) {
        this.userInfo = userInfo;
    }

    public String getVerifyCode() {
        return verifyCode;
    }

    public void setVerifyCode(String verifyCode) {
        this.verifyCode = verifyCode;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword == null ? null : userPassword.trim();
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail == null ? null : userEmail.trim();
    }

    @Override
    public String toString() {
        return "User{" +
                "userId='" + userId + '\'' +
                ", userName='" + userName + '\'' +
                ", userPassword='" + userPassword + '\'' +
                ", userEmail='" + userEmail + '\'' +
                ", verifyCode='" + verifyCode + '\'' +
                ", userStatus=" + userStatus +
                ", userRId=" + userRId +
                ", userInfo=" + userInfo +
                ", userUpdated=" + userUpdated +
                ", userCreated=" + userCreated +
                ", defalutImg='" + defalutImg + '\'' +
                ", userRole=" + userRole +
                '}';
    }
}