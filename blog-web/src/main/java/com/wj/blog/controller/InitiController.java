package com.wj.blog.controller;

import com.wj.blog.common.domain.*;
import com.wj.blog.service.ArticleService;
import com.wj.blog.service.BlogService;
import org.apache.http.HttpRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

@Controller
@RequestMapping("")
public class InitiController {

    @Autowired
    private BlogService blogService;

    @Autowired
    private ServletContext context;

    @Autowired
    private ArticleService articleService;


    @RequestMapping("/page/{pc}")
    public String page(@PathVariable("pc") String pc,HttpServletRequest request){
        Integer pcInt=1;
        if(pc!=null){
            pcInt = Integer.parseInt(pc);
        }
        PageBean<Blog> pageBlogs = blogService.findByDate(new BlogCriteria(),pcInt,10);
        request.setAttribute("pageBlogs",pageBlogs);
        WebInfo webInfo = blogService.getWebInfo();
        /* 换算运行时间 转换为天数 */
        Date nowDate = new Date();
        Date startDate = (Date) context.getAttribute("runTime");
        Long runTimeLong =  nowDate.getTime() - startDate .getTime();
        long runTime = runTimeLong/86400000;
        webInfo.setServerRunTime(runTime);
        webInfo.setBrowseTotal((Long) context.getAttribute("browseCount"));
        request.setAttribute("webInfo",webInfo);
        return "index";
    }

    @RequestMapping("/initi")
    public String initi(HttpServletRequest request){
        //查询分页文章
         PageBean<Blog> pageBlogs = blogService.findByDate(new BlogCriteria(),1,10);
        request.setAttribute("pageBlogs",pageBlogs);

        WebInfo webInfo = blogService.getWebInfo();
        /* 换算运行时间 转换为天数 */
        Date nowDate = new Date();
        Date startDate = (Date) context.getAttribute("runTime");
        Long runTimeLong =  nowDate.getTime() - startDate .getTime();
        long runTime = runTimeLong/86400000;
        webInfo.setServerRunTime(runTime);
        webInfo.setBrowseTotal((Long) context.getAttribute("browseCount"));
        request.setAttribute("webInfo",webInfo);
        return "index";
    }

    @RequestMapping("/go")
    public void goToUrl(String url, HttpServletResponse response) throws IOException {
        response.setHeader("refresh","3;/hrm/login.jsp");
        response.sendRedirect(url);
        return ;
    }

    @RequestMapping("/message")
    public String goMessage(HttpServletRequest request){
        Acticle acticle = articleService.findActicleByBlogId("001");
        request.setAttribute("article",acticle);
        request.setAttribute("rightInfo",acticle.getRightInfo());
        return "message";
    }

    @RequestMapping("/404")
    public String to404(HttpServletRequest request){
        return "error/404";
    }
}
