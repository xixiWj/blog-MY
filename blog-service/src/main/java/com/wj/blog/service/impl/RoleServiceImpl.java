package com.wj.blog.service.impl;

import com.wj.blog.common.domain.Role;
import com.wj.blog.dao.RoleMapper;
import com.wj.blog.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(rollbackFor = Exception.class,
        readOnly = false,propagation = Propagation.REQUIRED)
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleMapper roleMapper;

    @Override
    @Transactional(rollbackFor = Exception.class,
            readOnly = true,propagation = Propagation.SUPPORTS)
    public Role getById(Integer getrId) {
        return roleMapper.selectByPrimaryKey(getrId);
    }

    @Override
    @Transactional(rollbackFor = Exception.class,
            readOnly = true,propagation = Propagation.SUPPORTS)
    public List<Role> findAll() {
        return roleMapper.selectAll();
    }
}
