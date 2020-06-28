package com.wj.blog.service;

import com.wj.blog.common.domain.Comment;
import com.wj.blog.common.domain.PageBean;
import com.wj.blog.common.domain.User;
import com.wj.blog.common.domain.UserException;

import java.security.NoSuchAlgorithmException;
import java.util.List;

/**
 * 用户服务层接口
 */
public interface UserService {
    User checkName(String user_name);
    List<User> findAllUser();
    void  register(User user);
    User login(User user) throws Exception;

    User findByName(String username);

    void update(User user);

    PageBean<User> findAllByPage(int pc,int ps);

    void save(User user);

    void modifyPwd(User user, String password, String newPwd) throws NoSuchAlgorithmException, UserException;

    void delete(String userId);

    void updatePwd(String userEmail, String password);
}
