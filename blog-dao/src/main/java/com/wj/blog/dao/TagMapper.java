package com.wj.blog.dao;

import com.wj.blog.common.domain.Category;
import com.wj.blog.common.domain.Tag;

import java.util.List;

public interface TagMapper {
    int deleteByPrimaryKey(Integer tagId);

    int insert(Tag record);

    int insertSelective(Tag record);

    Tag selectByPrimaryKey(Integer tagId);

    int updateByPrimaryKeySelective(Tag record);

    int updateByPrimaryKey(Tag record);

    List<Tag> selectAll();

    Tag selectByName(String tagName);
}