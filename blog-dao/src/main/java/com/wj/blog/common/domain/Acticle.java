package com.wj.blog.common.domain;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Acticle implements Serializable {
    private Blog blog;

    private List<Comment> comments;

    private List<Blog> reComActicle;

    private Integer acticleCount;

    private Blog nextBlog;

    private Blog preBlog;

    private RightInfo rightInfo;

    //标签集合
    private List<Tag> tags;

    public List<Tag> getTags() {
        return tags;
    }

    public void setTags(List<Tag> tags) {
        this.tags = tags;
    }

    public RightInfo getRightInfo() {
        return rightInfo;
    }

    public void setRightInfo(RightInfo rightInfo) {
        this.rightInfo = rightInfo;
    }

    public Integer getActicleCount() {
        if(blog!=null) {
            return blog.getBlogText().length();
        }else {
            return 0;
        }
    }

    public void setActicleCount(Integer acticleCount) {
        this.acticleCount = acticleCount;
    }

    public List<Blog> getReComActicle() {
        return reComActicle;
    }

    public void setReComActicle(List<Blog> reComActicle) {
        this.reComActicle = reComActicle;
    }

    public Blog getBlog() {
        return blog;
    }

    public void setBlog(Blog blog) {
        this.blog = blog;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

    public Blog getNextBlog() {
        return nextBlog;
    }

    public void setNextBlog(Blog nextBlog) {
        this.nextBlog = nextBlog;
    }

    public Blog getPreBlog() {
        return preBlog;
    }

    public void setPreBlog(Blog preBlog) {
        this.preBlog = preBlog;
    }

    @Override
    public String toString() {
        return "Acticle{" +
                "blog=" + blog +
                ", comments=" + comments +
                ", nextBlog=" + nextBlog +
                ", preBlog=" + preBlog +
                '}';
    }
}
