package com.wj.blog.dao;

import com.wj.blog.common.domain.Acticle;
import com.wj.blog.common.domain.Blog;
import com.wj.blog.common.domain.BlogCriteria;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BlogMapper {
    int deleteByPrimaryKey(String blogId);

    int insert(Blog record);

    int insertSelective(Blog record);

    Blog selectByPrimaryKey(String blogId);

    int updateByPrimaryKeySelective(Blog record);

    int updateByPrimaryKeyWithBLOBs(Blog record);

    int updateByPrimaryKey(Blog record);

    List<Blog> selectByDate(@Param("blogCriteria") BlogCriteria blogCriteria,@Param("start") Integer start, @Param("ps")Integer ps);

    int selectTotalBlog(BlogCriteria blogCriteria);

    List<Blog> selectByCategoryId(String cacategoryId, int start, Integer ps);

    /* 查询当前文章的上一篇文章 */
    Blog selectPreBlogByBlogId(String blogId);

    /* 查询当前文章的下一篇文章 */
    Blog selectNextBlogByBlogId(String blogId);


    /**
     * 根据浏览人数排序 查询前五条
     * @return
     */
    List<Blog> findFiveByVisit();
    /**
     * 根据评论数排序 查询前五条
     * @return
     */
    List<Blog> selectByComments();

    /**
     * 查询留言板
     * @param blogId
     * @return
     */
    Blog findMessage(String blogId);

    List<Blog> searchBlog(@Param("info") String info,@Param("start") int start,@Param("ps") int ps);

    Integer searchBlogTr(String info);
}