package com.wj.blog.dao;

import com.wj.blog.common.domain.Config;

import java.util.Date;

public interface ConfigMapper {
    int deleteByPrimaryKey(String id);

    int insert(Config record);

    int insertSelective(Config record);

    Config selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Config record);

    int updateByPrimaryKey(Config record);

    Config selectFirst() throws  Exception;

    void updateBrowseCount(Long browseCount) throws  Exception;

    void updateLastUpdateTime(Date date) throws  Exception ;
}