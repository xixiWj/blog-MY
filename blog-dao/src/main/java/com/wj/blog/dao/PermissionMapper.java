package com.wj.blog.dao;

import com.wj.blog.common.domain.Permission;

public interface PermissionMapper {
    int deleteByPrimaryKey(Integer pId);

    int insert(Permission record);

    int insertSelective(Permission record);

    Permission selectByPrimaryKey(Integer pId);

    int updateByPrimaryKeySelective(Permission record);

    int updateByPrimaryKey(Permission record);
}