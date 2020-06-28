package com.wj.blog.service;

import com.wj.blog.common.domain.Blog;
import com.wj.blog.common.domain.Comment;
import com.wj.blog.common.domain.PageBean;
import com.wj.blog.common.domain.Visitor;

import java.util.List;

public interface CommentService {

    /**
     * 查询文章的评论
     * @param blogId
     * @return
     * @throws Exception
     */
    List<Comment> findCommentByBlogId(String blogId) throws Exception;

    /**
     * 添加评论
     * @param comment visitor
     * @return
     * @throws Exception
     */
    void commentByVisitor(Comment comment, Visitor visitor);

    PageBean<Comment> selectByDate(int pc,int ps);

    void delete(String cId);

    PageBean<Comment> selectByDate(int pcInt, int i, String userId);
}
