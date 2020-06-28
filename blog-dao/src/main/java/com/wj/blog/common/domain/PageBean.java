package com.wj.blog.common.domain;

import java.util.ArrayList;
import java.util.List;

public class PageBean<T> {
	private Integer pc;//当前页数，page Code
	private Integer ps = 10;//每页记录数
//	private Integer tp;//总页数
	private Integer tr;//总记录数
	
	private List<T> listBean = new ArrayList<>();//当前页的bean集合
	
	private String url;
	
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public Integer getPc() {
		return pc;
	}
	public void setPc(Integer pc) {
		this.pc = pc;
	}
	public Integer getPs() {
		return ps;
	}
	public void setPs(Integer ps) {
		this.ps = ps;
	}
	public Integer getTp() {
		Integer tp = tr/ps;
		return tr%ps==0?tp:tp+1;
	}
	public Integer getTr() {
		return tr;
	}
	public void setTr(Integer tr) {
		this.tr = tr;
	}
	public List<T> getListBean() {
		return listBean;
	}
	public void setListBean(List<T> listBean) {
		this.listBean = listBean;
	}
	@Override
	public String toString() {
		return "PageBean [pc=" + pc + ", ps=" + ps + ", tr=" + tr + ", listPage=" + listBean + "]";
	}
	
	
}

