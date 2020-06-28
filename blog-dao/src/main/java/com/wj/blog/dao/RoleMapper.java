package com.wj.blog.dao;

import com.wj.blog.common.domain.Role;

import java.util.List;

public interface RoleMapper {
    int deleteByPrimaryKey(Integer rId);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(Integer rId);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);

    List<Role> selectAll();
}