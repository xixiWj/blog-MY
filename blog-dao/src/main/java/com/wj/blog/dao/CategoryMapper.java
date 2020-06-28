package com.wj.blog.dao;

import com.wj.blog.common.domain.Category;

import java.util.List;

public interface CategoryMapper {
    int deleteByPrimaryKey(String categoryId);

    int insert(Category record);

    int insertSelective(Category record);

    Category selectByPrimaryKey(String categoryId);

    int updateByPrimaryKeySelective(Category record);

    int updateByPrimaryKey(Category record);

    List<Category> findAll();

    //查询分类总数
    int selectTotal();
}