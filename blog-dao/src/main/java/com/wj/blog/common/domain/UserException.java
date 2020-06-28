package com.wj.blog.common.domain;

public class UserException extends Exception {
	public UserException() {
		super("未知错误");
	}
	
	public UserException(String msg) {
		super(msg);
	}
}
