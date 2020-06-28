package com.wj.blog.service;

import com.wj.blog.common.domain.Role;

import java.util.List;


public interface RoleService {

    Role getById(Integer getrId);

    List<Role> findAll();
}
