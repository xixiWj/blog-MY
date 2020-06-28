package com.wj.blog.service;

import com.wj.blog.common.domain.Category;

import java.util.List;

public interface CategoryService {
    List<Category> findAll();

    Category getCategroyInfoData(String categoryId,String pc);
}
