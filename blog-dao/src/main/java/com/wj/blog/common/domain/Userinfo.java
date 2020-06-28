package com.wj.blog.common.domain;

import java.io.Serializable;
import java.util.Date;

public class Userinfo implements Serializable {
    private String userinfoId;

    private String uUserId ;

    private String userFullName;

    private Boolean userSex;

    private Date userBirthday;

    private String userJob;

    private String userPost;

    private String userPlace;

    private String userImage;

    private Date userRecentLoginTime;

    private Integer userPv;

    private String userIntroduction;

    public String getUserinfoId() {
        return userinfoId;
    }

    public void setUserinfoId(String userinfoId) {
        this.userinfoId = userinfoId == null ? null : userinfoId.trim();
    }

    public String getuUserId() {
        return uUserId;
    }

    public void setuUserId(String uUserId) {
        this.uUserId = uUserId;
    }

    public String getUserFullName() {
        return userFullName;
    }

    public void setUserFullName(String userFullName) {
        this.userFullName = userFullName;
    }

    public Boolean getUserSex() {
        return userSex;
    }

    public void setUserSex(Boolean userSex) {
        this.userSex = userSex;
    }

    public Date getUserBirthday() {
        return userBirthday;
    }

    public void setUserBirthday(Date userBirthday) {
        this.userBirthday = userBirthday;
    }

    public String getUserJob() {
        return userJob;
    }

    public void setUserJob(String userJob) {
        this.userJob = userJob == null ? null : userJob.trim();
    }

    public String getUserPost() {
        return userPost;
    }

    public void setUserPost(String userPost) {
        this.userPost = userPost == null ? null : userPost.trim();
    }

    public String getUserPlace() {
        return userPlace;
    }

    public void setUserPlace(String userPlace) {
        this.userPlace = userPlace == null ? null : userPlace.trim();
    }

    public String getUserImage() {
        return userImage;
    }

    public void setUserImage(String userImage) {
        this.userImage = userImage == null ? null : userImage.trim();
    }

    public Date getUserRecentLoginTime() {
        return userRecentLoginTime;
    }

    public void setUserRecentLoginTime(Date userRecentLoginTime) {
        this.userRecentLoginTime = userRecentLoginTime;
    }

    public Integer getUserPv() {
        return userPv;
    }

    public void setUserPv(Integer userPv) {
        this.userPv = userPv;
    }

    public String getUserIntroduction() {
        return userIntroduction;
    }

    public void setUserIntroduction(String userIntroduction) {
        this.userIntroduction = userIntroduction;
    }

    @Override
    public String toString() {
        return "Userinfo{" +
                "userinfoId='" + userinfoId + '\'' +
                ", uUserId='" + uUserId + '\'' +
                ", userFullName='" + userFullName + '\'' +
                ", userSex=" + userSex +
                ", userBirthday=" + userBirthday +
                ", userJob='" + userJob + '\'' +
                ", userPost='" + userPost + '\'' +
                ", userPlace='" + userPlace + '\'' +
                ", userImage='" + userImage + '\'' +
                ", userRecentLoginTime=" + userRecentLoginTime +
                ", userPv=" + userPv +
                ", userIntroduction='" + userIntroduction + '\'' +
                '}';
    }
}