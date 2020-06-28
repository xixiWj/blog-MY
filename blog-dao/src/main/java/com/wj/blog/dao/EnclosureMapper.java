package com.wj.blog.dao;

import com.wj.blog.common.domain.Blog;
import com.wj.blog.common.domain.Enclosure;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EnclosureMapper {
    int deleteByPrimaryKey(Integer eId);

    int insert(Enclosure record);

    int insertSelective(Enclosure record);

    Enclosure selectByPrimaryKey(Integer eId);

    int updateByPrimaryKeySelective(Enclosure record);

    int updateByPrimaryKey(Enclosure record);

    List<Enclosure> selectByDate(@Param("start") Integer start, @Param("ps")Integer ps);

    int selectTotal();
}