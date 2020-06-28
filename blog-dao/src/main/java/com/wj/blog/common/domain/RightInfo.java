package com.wj.blog.common.domain;

import java.util.List;

public class RightInfo {

    //热门文章

    private List<Blog> hots;

    //热评文章

    private List<Blog> hotComments;

    //相关文章

    private List<Blog> relate;

    //随机文章
    private List<Blog>  random;

    //猜你喜欢
    private List<Blog> like;

    //分类集合
    private List<Category> categorys;

    public List<Blog> getLike() {
        return like;
    }

    public void setLike(List<Blog> like) {
        this.like = like;
    }

    public List<Category> getCategorys() {
        return categorys;
    }

    public void setCategorys(List<Category> categorys) {
        this.categorys = categorys;
    }

    public List<Blog> getHots() {
        return hots;
    }

    public void setHots(List<Blog> hots) {
        this.hots = hots;
    }

    public List<Blog> getHotComments() {
        return hotComments;
    }

    public void setHotComments(List<Blog> hotComments) {
        this.hotComments = hotComments;
    }

    public List<Blog> getRelate() {
        return relate;
    }

    public void setRelate(List<Blog> relate) {
        this.relate = relate;
    }

    public List<Blog> getRandom() {
        return random;
    }

    public void setRandom(List<Blog> random) {
        this.random = random;
    }
}
