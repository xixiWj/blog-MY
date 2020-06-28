package com.wj.blog.common.domain;

import com.wj.blog.common.utils.DateUtil;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class Blog  implements Serializable {
    private String blogId;

    private String blogTitle;

    private Integer blogVisit=0;

    private String userId;

    private User user;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date blogDate;

    private String blogDateTxt;


    private String blogCate;

    private Date blogUpdate;

    private String blogInfo;

    private String blogText;

    //包含的分类
    private Category category;

    //包含的标签



    private  String categoryId;


    private Integer blogLikeCount=0;

    private Integer blogCommentCount=0;

    private Integer blogStatus;

    private Integer blogOrder=0;

    private String coverImg = "/dist/img/category/Java.jpg";

    private List<Tag> tag;

    public List<Tag> getTag() {
        return tag;
    }

    public void setTag(List<Tag> tag) {
        this.tag = tag;
    }

    public String getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(String categoryId) {
        this.categoryId = categoryId;
    }

    public String getCoverImg() {
        return coverImg;
    }

    public void setCoverImg(String coverImg) {
        this.coverImg = coverImg;
    }

    public Integer getBlogCommentCount() {
        return blogCommentCount;
    }

    public void setBlogCommentCount(Integer blogCommentCount) {
        this.blogCommentCount = blogCommentCount;
    }

    public Integer getBlogStatus() {
        return blogStatus;
    }

    public void setBlogStatus(Integer blogStatus) {
        this.blogStatus = blogStatus;
    }

    public Integer getBlogOrder() {
        return blogOrder;
    }

    public void setBlogOrder(Integer blogOrder) {
        this.blogOrder = blogOrder;
    }

    public String getBlogDateTxt() {

        return DateUtil.parseDateToStr(blogDate,DateUtil.DATE_TIME_FORMAT_YYYY年MM月DD日);
    }



    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public String getBlogId() {
        return blogId;
    }

    public void setBlogId(String blogId) {
        this.blogId = blogId == null ? null : blogId.trim();
    }

    public String getBlogTitle() {
        return blogTitle;
    }

    public void setBlogTitle(String blogTitle) {
        this.blogTitle = blogTitle == null ? null : blogTitle.trim();
    }

    public Integer getBlogVisit() {
        return blogVisit;
    }

    public void setBlogVisit(Integer blogVisit) {
        this.blogVisit = blogVisit;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public Date getBlogDate() {
        return blogDate;
    }

    public void setBlogDate(Date blogDate) {
        this.blogDate = blogDate;
    }

    public String getBlogCate() {
        return blogCate;
    }

    public void setBlogCate(String blogCate) {

        this.blogCate = blogCate == null ? null : blogCate.trim();
    }

    public Date getBlogUpdate() {
        return blogUpdate;
    }

    public void setBlogUpdate(Date blogUpdate) {
        this.blogUpdate = blogUpdate;
    }

    public String getBlogInfo() {
        return blogInfo;
    }

    public void setBlogInfo(String blogInfo) {
        this.blogInfo = blogInfo == null ? null : blogInfo.trim();
    }

    public String getBlogText() {
        return blogText;
    }

    public void setBlogText(String blogText) {
        this.blogText = blogText == null ? null : blogText.trim();
    }

    public Integer getBlogLikeCount() {
        return blogLikeCount;
    }

    public void setBlogLikeCount(Integer blogLikeCount) {
        this.blogLikeCount = blogLikeCount;
    }

    @Override
    public String toString() {
        return "Blog{" +
                "blogId='" + blogId + '\'' +
                ", blogTitle='" + blogTitle + '\'' +
                ", blogVisit=" + blogVisit +
                ", userId='" + userId + '\'' +
                ", user=" + user +
                ", blogDate=" + blogDate +
                ", blogDateTxt='" + blogDateTxt + '\'' +
                ", blogCate='" + blogCate + '\'' +
                ", blogUpdate=" + blogUpdate +
                ", blogInfo='" + blogInfo + '\'' +
                ", blogText='" + blogText + '\'' +
                ", category=" + category +
                ", categoryId='" + categoryId + '\'' +
                ", blogLikeCount=" + blogLikeCount +
                ", blogCommentCount=" + blogCommentCount +
                ", blogStatus=" + blogStatus +
                ", blogOrder=" + blogOrder +
                ", coverImg='" + coverImg + '\'' +
                ", tags=" + tag +
                '}';
    }
}