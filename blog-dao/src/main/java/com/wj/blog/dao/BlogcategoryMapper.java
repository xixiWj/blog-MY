package com.wj.blog.dao;

import com.wj.blog.common.domain.Blogcategory;

import java.util.List;

public interface BlogcategoryMapper {
    int deleteByPrimaryKey(String id);

    int insert(Blogcategory record);

    int insertSelective(Blogcategory record);

    Blogcategory selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Blogcategory record);

    int updateByPrimaryKey(Blogcategory record);

    List<Blogcategory> selectByBlogId(String blogId);
}