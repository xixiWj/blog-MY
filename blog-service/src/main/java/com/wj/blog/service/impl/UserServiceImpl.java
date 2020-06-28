package com.wj.blog.service.impl;

import com.wj.blog.common.domain.*;
import com.wj.blog.common.utils.Base64Utils;
import com.wj.blog.common.utils.IdGenerator;
import com.wj.blog.common.utils.RSAUtils;
import com.wj.blog.dao.UserMapper;
import com.wj.blog.dao.UserinfoMapper;
import com.wj.blog.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.List;

@Service
@Transactional(rollbackFor = Exception.class,readOnly = true,propagation = Propagation.SUPPORTS)
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;

	@Autowired
	private UserinfoMapper userinfoMapper;



	public User checkName(String user_name) {
		return userMapper.findUserByName(user_name);
	}

	@Override
	public List<User> findAllUser() {
		return userMapper.findAll();
	}

	@Transactional(rollbackFor = Exception.class,readOnly = false,propagation = Propagation.REQUIRED)
	@Override
	public void register(User user) {

		//加密密码 存入数据库
		String pwdMD5 = null;
		try {
			//通过工具类生成UUID
			user.setUserId(IdGenerator.getID());
			pwdMD5 = Base64Utils.md5(user.getUserName()+user.getUserPassword());
			user.setUserPassword(pwdMD5);
			user.setUserCreated(new Date().getTime());
			user.setUserUpdated(new Date().getTime());
			user.setUserRId(3);
			user.setUserStatus((short)1);
			//插入userInfo
			Userinfo userinfo = new Userinfo();
			userinfo.setuUserId(user.getUserId());
			userinfo.setUserFullName(user.getUserName());
			userinfo.setUserImage(user.getDefalutImg());
			userinfo.setUserinfoId(IdGenerator.getID());
			userinfoMapper.insert(userinfo);
			userMapper.insert(user);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}

	}
	
	public User login(User user) throws UserException {
		User user1 = userMapper.findUserByName(user.getUserName());

		if(user1==null) {
			throw new UserException("用户名或密码错误！");
		}else if(!user.getUserPassword().equals(user1.getUserPassword())) {
			throw new UserException("用户名或密码错误！");
		}else {
			return user1;
		}
	}

	@Override
	public User findByName(String username) {
		return userMapper.findUserByName(username);
	}

	@Override
	public void update(User user) {
		userMapper.updateByPrimaryKeySelective(user);
	}

	@Override
	public PageBean<User> findAllByPage(int pc, int ps) {
		PageBean<User> users = new PageBean<>();
		users.setPc(pc);
		users.setPc(ps);
		List<User> userList = userMapper.selectByDate(pc,ps);
		users.setListBean(userList);
		return users;
	}

	/**
	 * 保存更新用户
	 * @param user
	 */
	@Override
	public void save(User user) {
		//更新用户
		userMapper.updateByPrimaryKeySelective(user);
		//更新用户资料
		userinfoMapper.updateByPrimaryKeySelective(user.getUserInfo());
	}

	/**
	 *  修改密码
	 * @param user
	 * @param password
	 * @param newPwd
	 */
	@Override
	public void modifyPwd(User user, String password, String newPwd) throws NoSuchAlgorithmException, UserException {
		//MD5存储的密码
		String pwdMd5  = Base64Utils.md5(user.getUserName()+password);
		//判断原密码是否正确
		if(!pwdMd5.equals(user.getUserPassword())){
			throw  new UserException("原密码错误！");
		}
		//新密码存储
		String pwdNew = Base64Utils.md5(user.getUserName()+newPwd);
		//更新密码
		user.setUserPassword(pwdNew);
		userMapper.updateByPrimaryKey(user);


	}

	@Override
	public void delete(String userId) {
		userMapper.deleteByPrimaryKey(userId);
	}

	/**
	 * 更新密码操作
	 * @param userEmail
	 * @param password
	 */
	@Override
	public void updatePwd(String userEmail, String password) {
		//找到用户
		User user = userMapper.findUserByEmail(userEmail);
		//生成xin密码
		try {
			String newPwd =  Base64Utils.md5(user.getUserName()+password);
			user.setUserPassword(newPwd);
			//更新密码
			userMapper.updateByPrimaryKeySelective(user);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}

	}
}
