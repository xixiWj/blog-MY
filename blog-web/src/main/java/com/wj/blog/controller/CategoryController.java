package com.wj.blog.controller;

import com.wj.blog.common.domain.Category;
import com.wj.blog.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;


import javax.servlet.http.HttpServletRequest;
import java.util.List;


@Controller
@RequestMapping("/category")
public class CategoryController {

    @Autowired
    private CategoryService  categoryService;

    @RequestMapping("menu")
    public String findAll(HttpServletRequest request){
            List<Category> menu = categoryService.findAll();
            request.setAttribute("menu",menu);
            return "common/header";
    }

    @RequestMapping("/{categoryId}")
    public String category(@PathVariable("categoryId") String categoryId, HttpServletRequest request){
        Category category = categoryService.getCategroyInfoData(categoryId,"1");
        request.setAttribute("category",category);
        return "categoryInfo";
    }


    @RequestMapping("/{categoryId}/page/{pc}")
    public String categoryPage(@PathVariable("categoryId") String categoryId,@PathVariable("pc") String pc, HttpServletRequest request){
        Category category = categoryService.getCategroyInfoData(categoryId,pc);
        request.setAttribute("category",category);
        return "categoryInfo";
    }

}
