package com.wj.blog.dao;

import com.wj.blog.common.domain.Blog;
import com.wj.blog.common.domain.Comment;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CommentMapper {
    int deleteByPrimaryKey(String id);

    int insert(Comment record);

    int insertSelective(Comment record);

    Comment selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Comment record);

    int updateByPrimaryKeyWithBLOBs(Comment record);

    int updateByPrimaryKey(Comment record);

    //查询评论总数
    int selectTotal();

    //查询文章的评论
    List<Comment> selectCommentsByBlogId(String blogId);

    //获取最新评论
    List<Comment> selectByDate(@Param("start") Integer start, @Param("ps")Integer ps);

    List<Comment> selectAll();

    List<Comment> selectByDateAndUserId(@Param("start") int pcInt, @Param("ps") int i,@Param("userId") String userId);

    int selectTotalByUserId(String userId);
}