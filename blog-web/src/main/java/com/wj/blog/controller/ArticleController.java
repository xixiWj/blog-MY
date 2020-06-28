package com.wj.blog.controller;

import com.wj.blog.common.domain.*;
import com.wj.blog.service.ArticleService;
import com.wj.blog.service.CategoryService;
import com.wj.blog.service.CommentService;
import eu.bitwalker.useragentutils.UserAgent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
@RequestMapping("/article")
public class ArticleController {

    @Autowired
    private ArticleService articleService;

    @Autowired
    private CommentService commentService;
    @Autowired
    private CategoryService categoryService;


    /**
     *  搜索文章
     * @param info
     * @return
     */
    @RequestMapping("/search")
    public String searchBlog(String info,HttpServletRequest request){
        PageBean<Blog> pageBlogs =  articleService.searchArticle(info,1,10);
        //存入request域中
        request.setAttribute("pageBlogs",pageBlogs);
        //存入搜索信息
        request.getSession().setAttribute("info",info);
        return "searchRes";
    }

    /**
     *  搜索文章
     * @param info
     * @return
     */
    @RequestMapping("/search/page/{pc}")
    public String searchBlog(@PathVariable("pc") String pc, String info,HttpServletRequest request){
        int pcInt = 1;
        if(pc!=null){
            pcInt = Integer.parseInt(pc);
        }
        PageBean<Blog> pageBlogs =  articleService.searchArticle(info,pcInt,10);
        //存入request域中
        request.setAttribute("pageBlogs",pageBlogs);
        return "searchRes";
    }


    /**
     * 通过博客Id获得文章信息
     * @return 转发
     */
    @RequestMapping("articleInfo/{blogId}")
    public String articleInfo(@PathVariable("blogId") String blogId, HttpServletRequest request) {
        try {
            Acticle acticle = articleService.findActicleByBlogId(blogId);
            request.setAttribute("article",acticle);
            request.setAttribute("rightInfo",acticle.getRightInfo());
            if(blogId.equals("001")){
                return "message";
            }
            if(acticle.getBlog()==null){
                return  "error/404";
            }
            return "articleInfo";
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
    }

    /**
     * 评论
     * @param
     * @return
     */
    @RequestMapping("comment")
    @ResponseBody
    public Object comment(Comment comment,Visitor visitor,HttpServletRequest request){
        Map<String,Object> map = new HashMap<>();
        HttpSession session = request.getSession();
        User userLogin = (User) session.getAttribute("user");
        Visitor sessionVisitor = (Visitor) session.getAttribute("visitor");
        try{
            if(visitor.getvName()==null || visitor.getvEmail()==null || comment.getContent()==null){
                map.put("status",0);
                map.put("msg","必输入项不能为空~");
            }else {
                if(userLogin==null&&sessionVisitor==null) {
                    session.setAttribute("visitor",visitor);
                }
                //得到用户信息
                UserAgent userAgent = UserAgent.parseUserAgentString(request.getHeader("User-Agent"));
                //获取系统
                String system = userAgent.getOperatingSystem().getName();
                //浏览器信息
                String bro = userAgent.getBrowser().getName();
                comment.setBrowserInfo(bro);
                comment.setSystemVersion(system);
                comment.setDate(new Date());
                if(userLogin!=null){
                    visitor.setvId(userLogin.getUserId());
                }
                //添加评论
                commentService.commentByVisitor(comment, visitor);
                map.put("status", 1);
                map.put("msg", "评论成功");
            }
        }catch (Exception e){
            e.printStackTrace();
            map.put("status",0);
            map.put("msg","服务器拉闸~");
        }finally {
            return map;
        }
    }

    /**
     * 浏览时 点赞
     * @param blogId
     * @return
     */
    @RequestMapping("favorite")
    @ResponseBody
    public Object favorite(String blogId,HttpServletRequest request){
        Map<String,Object> map = new HashMap<>();
        try{
            if(blogId==null){
                map.put("status",0);
                map.put("msg","服务器拉闸~");
            }else {
                //得到用户信息
                UserAgent userAgent = UserAgent.parseUserAgentString(request.getHeader("User-Agent"));
                //获取IP
                String userIP = request.getRemoteAddr();
                //得到容器
                ServletContext context = request.getServletContext();
                Map<String, Set<String>> favorite = (Map<String, Set<String>>) context.getAttribute("favorite");
                /**
                 * 判断用户是否已经点赞
                 */
                if (favorite.containsKey(userIP)) {
                    Set blogs = favorite.get(userIP);
                    if (blogs.contains(blogId)) {
                        map.put("status", -1);
                        map.put("msg", "你已经点赞~");
                    } else {
                        articleService.favorite(blogId);
                        blogs.add(blogId);
                        map.put("status", 1);
                        map.put("msg", "点赞~");
                    }
                } else {
                    // 点赞
                    articleService.favorite(blogId);
                    Set<String> newSet = new HashSet<>();
                    newSet.add(blogId);
                    favorite.put(userIP, newSet);
                    map.put("status", 1);
                    map.put("msg", "点赞~");
                }
            }
        }catch (Exception e){
            e.printStackTrace();
            map.put("status",0);
            map.put("msg","服务器拉闸~");
        }finally {
            return map;
        }
    }
}
