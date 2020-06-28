package com.wj.blog.service;

import com.wj.blog.common.domain.*;

import java.util.List;

/**
 * 博客的业务接口
 */
public interface BlogService {
    List<Blog> findAllByCategoryIdAndUid(BlogCriteria BlogCriteria, Integer pc, Integer ps);

    List<Blog> findHot();

    public PageBean<Blog> findByDate(BlogCriteria BlogCriteria, Integer pc, Integer ps);

    PageBean<Blog> findAllByUserId(BlogCriteria BlogCriteria);

    PageBean<Blog> findByCategoryId(BlogCriteria BlogCriteria, Integer pc, Integer ps);

    PageBean<Blog> findByUserid(BlogCriteria blogCriteria, Integer pc, Integer ps);

    PageBean<Blog> findByUserIdAndCategoryId(BlogCriteria blogCriteria, String cacategoryId, Integer pc, Integer ps);

    Blog findBlogByBlogId(String blogId) throws  Exception;

     RightInfo getRightInfo(String blogId);



     List<Blog> findByRandom();
    /**
     * 查询该文章的上一个博客标题
     *
     * @param blogId
     * @return
     * @throws Exception
     */
    Blog findPreBlogByBlogId(String blogId) throws  Exception;


    /**
     * 查询该文章的下一个博客标题
     *
     * @param blogId
     * @return
     * @throws Exception
     */
    Blog findNextBlogByBlogId(String blogId) throws Exception ;


    //得到网站信息
    WebInfo getWebInfo();


    /**
     * 推荐博客
     * @param blogId
     * @return
     */
    List<Blog> findReComBlog(String blogId) throws Exception ;

    /**
     * 增加文章点赞数量
     * @param blogId
     */
    void addBlogLikeCountByBlogId(String blogId) throws Exception;

    List<Blog> findByComments();

    List<Blog> findByRelate(String blogId);

    WebInfo addInfo(WebInfo webInfo);


    void addArticle(Blog blog, List<String> tagNames) throws Exception;

    void throwArticle(String blogId);

    Blog findMessage(String blogId);
}
