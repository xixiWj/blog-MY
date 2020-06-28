package com.wj.blog.service.impl;

import com.wj.blog.common.domain.*;
import com.wj.blog.dao.CategoryMapper;
import com.wj.blog.service.BlogService;
import com.wj.blog.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

@Service
@Transactional(rollbackFor = Exception.class,readOnly = true,propagation = Propagation.SUPPORTS)
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	private CategoryMapper categoryMapper;

	@Autowired
	private BlogService blogService;




	public List<Category> findAll(){
		//查询所有分类菜单
		List<Category> categories = categoryMapper.findAll();
		//获取根节点
		List<Category> rootCate = new ArrayList<>();
		for (Category c:categories
			 ) {
			if(c.getCategoryPid()==null||c.getCategoryPid().equals("0")||c.getCategoryPid().equals("")){
				rootCate.add(c);
			}
		}
		//排序根节点
		Collections.sort(rootCate,order());
		//获取子节点
		for (Category c:rootCate
			 ) {
			List<Category> childs =  getChild(c.getCategoryId(),categories);
			c.setSons(childs);
		}

		return rootCate;
	}


	/**
	 * 菜单排序
	 * @return
	 */
	private Comparator<Category> order(){
		Comparator<Category> comparator = new Comparator<Category>() {
			@Override
			public int compare(Category o1, Category o2) {
				if(o1.getCategoryOrder()==null||o2.getCategoryOrder()==null)
					return 0;
				if(o1.getCategoryOrder().equals(o2.getCategoryOrder())){
					return o1.getCategoryOrder().compareTo(o2.getCategoryOrder());
				}
				return 0;
			}
		};
		return comparator;
	}


	/**
	 * 获取子菜单
	 * @param categoryPid
	 * @param categories
	 * @return
	 */
	private List<Category> getChild(String categoryPid,List<Category> categories){
		List<Category> childs = new ArrayList<>();
		//获取子菜单
		for (Category c:categories
			 ) {
			// 遍历所有节点，将所有菜单的父id与传过来的根节点的id比较

			//相等说明：为该根节点的子节点。
			if(c.getCategoryPid().equals(categoryPid)){
				childs.add(c);
			}
		}
		//递归
		for (Category c1:childs
			 ) {
			c1.setSons(getChild(c1.getCategoryId(),categories));
		}

		//排序
		Collections.sort(childs,order());

		//如果节点下没有子节点，返回一个空List（递归退出）
		if(childs.size()==0){
			return  null;
		}

		return childs;
	}


	/**
	 *
	 * 得到分类页面数据
	 *
	 * 1 、分类下的文章
	 *
	 * @param categoryId
	 * @return
	 */
	@Override
	public Category getCategroyInfoData(String categoryId, String pc) {
		//分类下的文章
		PageBean<Blog> pageBean = new PageBean<>();
		Category category=null;
		//查询文章条件
		BlogCriteria blogCriteria = new BlogCriteria();
		blogCriteria.setCategoryId(categoryId);
		RightInfo rightInfo = new RightInfo();
		try {
			Integer pcc = Integer.parseInt(pc);
			pageBean.setPc(pcc);
			//得到分类信息
			category = categoryMapper.selectByPrimaryKey(categoryId);
			//得到分类下的page
			pageBean = blogService.findByDate(blogCriteria,pcc,pageBean.getPs());

			category.setRightInfo(blogService.getRightInfo(null));

			category.setPageBlogs(pageBean);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			return category;
		}

	}

}
