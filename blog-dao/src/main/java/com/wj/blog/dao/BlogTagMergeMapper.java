package com.wj.blog.dao;

import com.wj.blog.common.domain.BlogTagMerge;
import org.apache.ibatis.annotations.Param;

public interface BlogTagMergeMapper {
    int deleteByPrimaryKey(Integer bTId);

    int insert(BlogTagMerge record);

    int insertSelective(BlogTagMerge record);

    BlogTagMerge selectByPrimaryKey(Integer bTId);

    int updateByPrimaryKeySelective(BlogTagMerge record);

    int updateByPrimaryKey(BlogTagMerge record);

    BlogTagMerge selectByBidAndTid(@Param("blogId") String blogId, @Param("tagId")Integer tagId);
}