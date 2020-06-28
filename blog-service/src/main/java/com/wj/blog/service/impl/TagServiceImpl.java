package com.wj.blog.service.impl;

import com.wj.blog.common.domain.Category;
import com.wj.blog.common.domain.Tag;
import com.wj.blog.dao.TagMapper;
import com.wj.blog.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(rollbackFor = Exception.class,readOnly = true,propagation = Propagation.SUPPORTS)
public class TagServiceImpl implements TagService {

    @Autowired
    private TagMapper tagMapper;

    /**
     * 查询所有标签
     * @return
     */
    @Override
    public List<Tag> findAll() {
        return tagMapper.selectAll();
    }
}
