package com.wj.blog.dao;

import com.wj.blog.common.domain.LeaveMsg;

public interface LeaveMsgMapper {
    int deleteByPrimaryKey(String id);

    int insert(LeaveMsg record);

    int insertSelective(LeaveMsg record);

    LeaveMsg selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(LeaveMsg record);

    int updateByPrimaryKey(LeaveMsg record);

    //查询留言总数
    int selectTotal();
}