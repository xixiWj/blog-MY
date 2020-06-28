package com.wj.blog.dao;

import com.wj.blog.common.domain.Visitor;

public interface VisitorMapper {
    int deleteByPrimaryKey(String vId);

    int insert(Visitor record);

    int insertSelective(Visitor record);

    Visitor selectByPrimaryKey(String vId);

    int updateByPrimaryKeySelective(Visitor record);

    int updateByPrimaryKey(Visitor record);
}