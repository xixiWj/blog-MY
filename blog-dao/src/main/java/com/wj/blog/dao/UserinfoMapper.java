package com.wj.blog.dao;

import com.wj.blog.common.domain.Userinfo;

public interface UserinfoMapper {
    int deleteByPrimaryKey(String userinfoId);

    int insert(Userinfo record);

    int insertSelective(Userinfo record);

    Userinfo selectByPrimaryKey(String userinfoId);

    int updateByPrimaryKeySelective(Userinfo record);

    int updateByPrimaryKeyWithBLOBs(Userinfo record);

    int updateByPrimaryKey(Userinfo record);
}