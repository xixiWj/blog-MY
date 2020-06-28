package com.wj.blog.controller;

import com.wj.blog.common.domain.*;
import com.wj.blog.service.BlogService;
import com.wj.blog.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/blog")
public class BlogController {
    @Autowired
    private BlogService blogService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private ServletContext context;





    /**
     * 通过用户查找 博客
     * @return
     */
    @RequestMapping("findAllByUserId")
    @ResponseBody
    public Object findAllByUserId(PageBean pageBean, BlogCriteria blogCriteria, HttpServletRequest req, HttpSession session) {
        Map<String, Object> map = new HashMap<>();
        try {
            User user = (User) req.getSession().getAttribute("user");
            blogCriteria.setUser(user);
            PageBean<Blog> page = null;
            if (pageBean.getPc() == null) {
                pageBean.setPc(1);
            }
            page = blogService.findByDate(blogCriteria,pageBean.getPc(), pageBean.getPs());
            map.put("success", true);
            map.put("blogs", page);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success", false);
            map.put("msg", e.getMessage());
        } finally {
            return map;
        }
    }



   /*public void findHot(HttpServletRequest req,HttpServletResponse resp) {
        String pcStr = req.getParameter("pc");
        String cid= req.getParameter("category_id");
        User user = (User) req.getSession().getAttribute("user");
        int ps=5;
        PageBean<BlogCategory> blogs = null;
        int pc=0;
        if(pcStr==null) {
            pc =1;
        }else {
            pc= Integer.parseInt(pcStr);
        }
        if((cid==null||cid.equals("undefined"))&&user==null) {
            System.out.println("寻找所有blog");
            blogs= blogService.findAll(pc,ps);

        }else if(cid!=null&&user==null) {
            int category_id = Integer.parseInt(cid);
            blogs= blogService.findByCid(category_id,pc,ps);
        }else if((cid==null||cid.equals("undefined"))&&user!=null) {
            blogs= blogService.findByUid(user.getUser_id(),pc,ps);
        }else {
            int category_id = Integer.parseInt(cid);
            blogs =blogService.findByUidCid(user.getUser_id(),category_id,pc,ps);
        }
        JSONObject json = JSONObject.fromObject(blogs);
        req.setAttribute("blog", blogs);
        try {
            resp.getWriter().print(json.toString());
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public void findByCid(HttpServletRequest req,HttpServletResponse resp) {
        String cid = req.getParameter("category_id");
        User user = (User) req.getSession().getAttribute("user");
        JSONArray json = new JSONArray();
        List<BlogCategory> bcs = null;
        if(cid==null) {
            json.add(false);
            json.add("未知错误");
            try {
                resp.getWriter().print(json.toString());
                return;
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else if(user==null) {
            int category_id= Integer.parseInt(cid);
            bcs = blogService.findByCid(category_id);
        }else {
            int category_id= Integer.parseInt(cid);
            String user_id= user.getUser_id();
            bcs =blogService.findAllByUidCid(user_id,category_id);
        }
        json.addAll(bcs);
        try {
            resp.getWriter().print(json.toString());
            return;
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
*/

    @RequestMapping("toIndex")
    public String toIndex(){
        return  "index";
    }


    /**
     * 测试博客提交
     */
    @RequestMapping("add")
    public void  add(String blogText){
        System.out.println(blogText);
    }
}
