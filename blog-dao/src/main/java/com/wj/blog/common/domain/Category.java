package com.wj.blog.common.domain;

import java.io.Serializable;
import java.util.List;

public class Category implements Serializable {
    private String categoryId;

    private String categoryPid ="";

    private String categoryName;

    private String categoryDescription;

    private String categoryOrder;

    private String categoryIcon;

    private List<Category> sons;

    //分类下的文章Pagebean
    private PageBean<Blog> pageBlogs;


    //右侧信息
    private RightInfo rightInfo;


    public RightInfo getRightInfo() {
        return rightInfo;
    }

    public void setRightInfo(RightInfo rightInfo) {
        this.rightInfo = rightInfo;
    }

    public PageBean<Blog> getPageBlogs() {
        return pageBlogs;
    }

    public void setPageBlogs(PageBean<Blog> pageBlogs) {
        this.pageBlogs = pageBlogs;
    }

    public String getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(String categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryPid() {
        return categoryPid;
    }

    public void setCategoryPid(String categoryPid) {
        this.categoryPid = categoryPid;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getCategoryDescription() {
        return categoryDescription;
    }

    public void setCategoryDescription(String categoryDescription) {
        this.categoryDescription = categoryDescription;
    }

    public String getCategoryOrder() {
        return categoryOrder;
    }

    public void setCategoryOrder(String categoryOrder) {
        this.categoryOrder = categoryOrder;
    }

    public String getCategoryIcon() {
        return categoryIcon;
    }

    public void setCategoryIcon(String categoryIcon) {
        this.categoryIcon = categoryIcon;
    }

    public List<Category> getSons() {
        return sons;
    }

    public void setSons(List<Category> sons) {
        this.sons = sons;
    }
}