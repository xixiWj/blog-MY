package com.wj.blog.common.domain;

public class BlogCriteria extends Blog{
    private User user;

    private  String userId = null;

    private String categoryId = null;

    public String getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(String categoryId) {
        if(categoryId.equals("null") || categoryId.equals("undefined")){
            this.categoryId = null;
        }else {
            this.categoryId = categoryId;
        }
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        if(userId.equals("null") || userId.equals("undefined")){
            this.userId = null;
        }else {
            this.userId = userId;
        }
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "BlogCriteria{" +
                "user=" + user +
                ", userId='" + userId + '\'' +
                ", categoryId='" + categoryId + '\'' +
                '}';
    }
}
