package com.wj.blog.service;

import com.wj.blog.common.domain.Category;
import com.wj.blog.common.domain.Tag;

import java.util.List;

public interface TagService {

    List<Tag> findAll();
}
