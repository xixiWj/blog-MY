package com.wj.blog.dao;

import com.wj.blog.common.domain.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

public interface UserMapper {
    int deleteByPrimaryKey(String userId);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(String userId);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    User findUserByName(String userName);

    List<User> findAll();

    List<User> selectByDate(@Param("start") int pc, @Param("ps") int ps);

    User findUserByEmail(String userEmail);
}