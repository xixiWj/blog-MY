package com.wj.blog.controller;

import com.wj.blog.common.domain.*;
import com.wj.blog.service.*;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.*;

/**
 * 后台管理系统 控制层实现
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
    //注入博客服务
    @Autowired
    private BlogService blogService;
    //注入附件服务
    @Autowired
    private EnclosureService enclosureService;
    //注入分类服务
    @Autowired
    private CategoryService categoryService;
    //注入标签服务
    @Autowired
    private TagService tagService;

    //注入评论服务
    @Autowired
    private CommentService commentService;

    //注入用户服务
    @Autowired
    private UserService userService;

    //注入角色服务
    @Autowired
    private RoleService roleService;


    /**
     *  跳转至管理系统主页
     * @param model
     * @param req
     * @return
     */
    @RequestMapping("")
   public String getInfo(Model model, HttpServletRequest req){
        //获取application 服务器上下文
        ServletContext servletContext= req.getServletContext();
        //获取网站信息 --- 博客总数，附件总数等
        WebInfo webInfo = blogService.getWebInfo();
        webInfo= blogService.addInfo(webInfo);
        //获取服务器开启时间
        Date runTime = (Date) servletContext.getAttribute("runTime");
        Date nowTime = new Date();
        Long runTimeL = nowTime.getTime() -  runTime.getTime();
        //存入服务器运行时间
        webInfo.setServerRunTime(runTimeL);
        //存入域中
        model.addAttribute("webInfo",webInfo);
       return "/admin/page/index";
   }

    /**
     *  展示所有附件
     * @param model
     * @param request
     * @param type
     * @return
     */
    @RequestMapping("/enclosure")
    public String select(Model model,HttpServletRequest request,String type){
        //默认查询第一页
        PageBean<Enclosure> pageEnclosures = enclosureService.getEnclosureInfoData(1);
        //存入域中
        request.setAttribute("pageEnclosure",pageEnclosures);
        //判断type类型 便于返回不同的页面
        if(type != null && type.equals("div")) {
            //返回弹窗
            return "/admin/page/uploadEnclosure/showAllDIv";
        }else {
            return "/admin/page/uploadEnclosure/showAll";
        }
    }


    /**
     *  分页得到Enclosure
     * @param pcStr
     * @param request
     * @return
     */
    @RequestMapping("/enclosure/page/{pc}")
    public String selectAll(@PathVariable("pc")String pcStr,HttpServletRequest request){
        int pc =1;
        //避免空指针
        if(pcStr!=null){
            pc = Integer.getInteger(pcStr);
        }
        //分页查询
        PageBean<Enclosure> pageEnclosures = enclosureService.getEnclosureInfoData(pc);
        request.setAttribute("pageEnclosure",pageEnclosures);
        return "/admin/page/uploadEnclosure/showAll";
    }

    /**
     * 通过Id 查询 附件详情
     * @param eId
     * @param model
     * @return
     */
    @RequestMapping("/enclosure/{eId}")
    public String selectById(@PathVariable("eId")String eId,Model model){
        int eIdI = 1;
        //避免空指针
        if(eId!=null){
            eIdI  = Integer.parseInt(eId);
        }
        //通过Id 查询附件
        Enclosure enclosure = enclosureService.getEnclosureById(eIdI);
        model.addAttribute("enclosure",enclosure);
        return "/admin/page/uploadEnclosure/showByEId";
    }

    /**
     * 通过Id 删除
     * @param eId
     * @return
     */
    @RequestMapping("/enclosure/del/del")
    @ResponseBody
    public Object deleteEnclosureByEid(Integer eId){
        Map<String,Object> map = new HashMap<>();
        try {
            //删除
            enclosureService.deleteById(eId);
            map.put("result",1);
            map.put("msg","删除成功！");
        }catch (Exception e){
            map.put("result",0);
            map.put("msg","删除失败！");
        }finally {
            return map;
        }
    }

    /*
     *上传文件的方法
     */
    @RequestMapping("/enclosure/upload")
    @ResponseBody
    public Object  springUpload(HttpServletRequest request) throws IllegalStateException, IOException {
        Map<String, Object> map = new HashMap<>();
        User user = (User) request.getSession().getAttribute("user");
        long startTime = System.currentTimeMillis();
        String path = request.getServletContext().getRealPath("/dist/img/enclosure/");
        try {
            String filePath = null;
            String fileName = null;
            //将当前上下文初始化给  CommonsMutipartResolver （多部分解析器）
            CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
                    request.getSession().getServletContext());
            //检查form中是否有enctype="multipart/form-data"
            if (multipartResolver.isMultipart(request)) {
                //将request变成多部分request
                MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
                //获取multiRequest 中所有的文件名
                Iterator iter = multiRequest.getFileNames();

                while (iter.hasNext()) {
                    //一次遍历所有文件
                    MultipartFile file = multiRequest.getFile(iter.next().toString());
                    if (file != null) {
                        //new 一个附件对象
                        Enclosure enclosure = new Enclosure();
                        Date eCreated = new Date();
                        fileName = eCreated.getTime() + "_" + file.getOriginalFilename();
                        filePath = path + fileName;
                        File fileTo = new File(filePath);
                        if (!fileTo.getParentFile().exists()) {
                            fileTo.getParentFile().mkdirs();
                        }
                        //设置上传时间
                        enclosure.seteCreated(eCreated.getTime());
                        //附件名称 （加上时间唯一性）
                        enclosure.seteName(fileName);
                        //上传附件大小
                        enclosure.seteSize((int) file.getSize());
                        //谁上传的文件
                        enclosure.seteUId("15");

                        //将附件存入数据库
                        enclosureService.insert(enclosure);
                        //上传
                        file.transferTo(fileTo);
                    }
                }

            }
            map.put("uploaded", 1);
            map.put("url", "/dist/img/enclosure/" + fileName);
            map.put("msg","上传成功");
        } catch (Exception e) {
            e.printStackTrace();
            if (e instanceof MaxUploadSizeExceededException)
            {
                map.put("uploaded",0);
                map.put("msg", "上传文件过大");
            } else
            {
                map.put("uploaded",0);
                map.put("msg", "上传失败！请重试！");
            }
            map.put("uploaded", 0);
            map.put("error", new HashMap<>().put("message", "上传失败！请重试！"));
        } finally {
            return map;
        }

    }

    /**
     * 跳转发表文章页面
     * @param req
     * @return
     */
    @RequestMapping("/post/new")
    public String newArticle( HttpServletRequest req){
        //查询所有分类
        List<Category> categories  = categoryService.findAll();
        //查询所有标签
        List<Tag> tags = tagService.findAll();

        //存入request域中
        req.setAttribute("categorys",categories);
        req.setAttribute("tags",tags);
        //返回页面
        return "/admin/page/article/articleOp";
    }

    /**
     * 查询所有文章
     * @param req
     * @return
     */
    @RequestMapping("/post")
    public String postAll( HttpServletRequest req){
        //查询所有文章
        PageBean<Blog> blogs = blogService.findByDate(new BlogCriteria(),1,10);
        //判断用户权限
        User user = (User) req.getSession().getAttribute("user");
        if(user==null){
            return "error/404";
        }
        //根据权限查询不同文章
        if(user.getUserRole().getrName().equals("root")){
            //查询评论 默认第一页
            blogs  = blogService.findByDate(new BlogCriteria(), 1,10);
        }else{
            BlogCriteria blogCriteria = new BlogCriteria();
            blogCriteria.setUserId(user.getUserId());
            blogs = blogService.findByDate(blogCriteria,1,10);
        }
        //存入request域中
        req.setAttribute("blogs",blogs);
        //返回页面
        return "/admin/page/article/manageArticle";
    }

    /**
     * 编辑文章
     * @param req
     * @return
     */
    @RequestMapping("/post/edit/{blogId}")
    public String postEdit(@PathVariable("blogId") String blogId, HttpServletRequest req) throws Exception {
        //通过blogId查询博客
        Blog blog = blogService.findBlogByBlogId(blogId);
        //查询所有分类
        List<Category> categories  = categoryService.findAll();
        //查询所有标签
        List<Tag> tags = tagService.findAll();

        //存入request域中
        req.setAttribute("blog",blog);
        req.setAttribute("categorys",categories);
        req.setAttribute("tags",tags);
        //返回页面
        return "/admin/page/article/articleOp";
    }



    /**
     * 查询所有文章
     * @param req
     * @return
     */
    @RequestMapping("/post/page/{page}")
    public String post(@PathVariable("page") String page, HttpServletRequest req){
        int i = 1;
        if(page!=null){
            i = Integer.parseInt(page);
        }
        //查询所有文章
        PageBean<Blog> blogs = blogService.findByDate(new BlogCriteria(),i,10);

        //存入request域中
        req.setAttribute("blogs",blogs);
        //返回页面
        return "/admin/page/article/manageArticle";
    }

    /**
     *  添加文章
     * @param
     * @param blog
     * @param req
     * @return
     */
    @RequestMapping("/post/add")
    @ResponseBody
    //@RequestParam(value="tags[]") String[] tags,
    public Object addArticle(Blog blog, HttpServletRequest req){
        Map<String,Object> map = new HashMap<>();
        try{
            //获取当前登录用户
            HttpSession session = req.getSession();
            User user = (User) session.getAttribute("user");
            //默认管理员发布
            if (user==null){
                blog.setUserId("15");
            }else {
                blog.setUserId(user.getUserId());
            }
//            //j将数组参数转换成  List
//            List<String> tagNames = Arrays.asList(tags);
            //添加文章
            blogService.addArticle(blog, null);
            map.put("result",1);
            map.put("msg","发布成功！");
        }catch (Exception e){
            e.printStackTrace();
            map.put("result",0);
            map.put("msg","发布失败！请重试");
        }finally {
            return map;
        }
    }

    /**
     * 删除文章
     * @param blogId
     * @param req
     * @return
     */
    @RequestMapping("/post/delete")
    @ResponseBody
    public Object delArticle(String blogId, HttpServletRequest req){
        //返回信息提示
        Map<String,Object> map = new HashMap<>();
        try{
            //删除
            blogService.throwArticle(blogId);
            map.put("result",1);
            map.put("msg","删除成功！");
        }catch (Exception e){
            e.printStackTrace();
            map.put("result",0);
            map.put("msg","删除失败！请重试");
        }finally {
            return map;
        }
    }

    /**
     * 查看评论
     * @param req
     * @return
     */
    @RequestMapping("/comment")
    public String commentAll( HttpServletRequest req){
        //查询评论 默认第一页
        PageBean<Comment> comments  = commentService.selectByDate( 1,10);
        //判断用户权限
        User user = (User) req.getSession().getAttribute("user");
        if(user==null){
            return "error/404";
        }
        //根据权限查询不同文章
        if(user.getUserRole().getrName().equals("root")){
            //查询评论 默认第一页
            comments  = commentService.selectByDate( 1,10);
        }else{
            comments = commentService.selectByDate(1,10,user.getUserId());
        }
        //存入request
        req.setAttribute("comments",comments);
        return "/admin/page/comment/manageComment";
    }

    /**
     * 分页查询评论
     * @param pc
     * @param req
     * @return
     */
    @RequestMapping("/comment/page/{pc}")
    public String commentPage(@PathVariable("pc") String pc, HttpServletRequest req){
        int pcInt = Integer.parseInt(pc);
        //判断用户权限
        User user = (User) req.getSession().getAttribute("user");
        if(user==null){
            return "error/404";
        }
        PageBean<Comment> comments;
        //根据权限查询不同文章
        if(user.getUserRole().getrName().equals("root")){
            //查询评论 默认第一页
           comments  = commentService.selectByDate( pcInt,10);
        }else{
            comments = commentService.selectByDate(pcInt,10,user.getUserId());
        }

        //存入request
        req.setAttribute("comments",comments);
        return "/admin/page/comment/manageComment";
    }


    /**
     * 删除评论
     * @param id
     * @param req
     * @return
     */
    @RequestMapping("/comment/delete")
    @ResponseBody
    public Object commentDele(String id, HttpServletRequest req){
        Map<String,Object> map = new HashMap<>();
        try {
            //删除评论
            commentService.delete(id);
            map.put("result",1);
            map.put("msg","删除成功");
        }catch (Exception e){
            map.put("result",0);
            map.put("msg","删除失败，请重试");
        } finally{
            return map;
        }
    }

    /**
     * 保存用户
     * @param user
     * @param req
     * @return
     */
    @RequestMapping("/user/save")
    @ResponseBody
    public Object userSave(User user, Userinfo userinfo,HttpServletRequest req){
        Map<String,Object> map = new HashMap<>();
        try {
            //保存用户
            user.setUserInfo(userinfo);
            userService.save(user);
            map.put("result",1);
            map.put("msg","保存用户");
        }catch (Exception e){
            map.put("result",0);
            map.put("msg","保存失败");
        } finally{
            return map;
        }
    }

    /**
     * 删除用户
     * @param user
     * @param userinfo
     * @param req
     * @return
     */

    @RequestMapping("/user/delete")
    @ResponseBody
    public Object userDelete(String userId,HttpServletRequest req){
        Map<String,Object> map = new HashMap<>();
        try {
            //删除用户
            userService.delete(userId);
            map.put("result",1);
            map.put("msg","删除用户成功");
        }catch (Exception e){
            map.put("result",0);
            map.put("msg","删除失败");
        } finally{
            return map;
        }
    }


    @RequestMapping("/user/profile")
    public String profile( HttpServletRequest req){
        //查询用户 默认第一页
        User user = (User) req.getSession().getAttribute("user");
        //更新用户
        User user2 = userService.findByName(user.getUserName());
        //存入request
        req.setAttribute("user",user2);
        req.getSession().setAttribute("user",user2);
        return "/admin/page/user/showProfile";
    }

    /**
     *  修改密码
     * @param req
     * @return
     */
    @RequestMapping("/user/modifyPwd")
    @ResponseBody
    public Object updatePwd(String password,String newPwd,String newPwd2, HttpServletRequest req){
        Map<String,Object> map = new HashMap<>();
        try {
            if(newPwd==null||newPwd2==null){
                map.put("result",0);
                map.put("msg","密码不能为空");
                return  map;
            }
            if(!newPwd.equals(newPwd2)){
                map.put("result",0);
                map.put("msg","两次密码输入不一致");
                return  map;
            }
            User user = (User) req.getSession().getAttribute("user");
            userService.modifyPwd(user,password,newPwd);
            map.put("result",1);
            map.put("msg","密码修改成功");
            //获取当前主体，当前状态为没有认证的状态"未认证"
            Subject subject = SecurityUtils.getSubject();
            //修改密码 退出当前用户 重新登录
            subject.logout();
        }catch (Exception e){
            map.put("result",0);
            map.put("msg",e.getMessage());
        }finally {
            return map;
        }

    }


    /**
     *  查询用户 默认第一页
     * @param req
     * @return
     */
    @RequiresRoles("root")
    @RequestMapping("/user/all")
    public String userAll(HttpServletRequest request){
        //查询用户 默认第一页
        PageBean<User> userPage =  userService.findAllByPage(1,10);
        List<Role> roles = roleService.findAll();
        request.setAttribute("userPage",userPage);
        request.setAttribute("roles",roles);
        return "/admin/page/user/manageUser";
    }

    /**
     *  分页查询用户
     * @param req
     * @return
     */
    @RequiresRoles("root")
    @RequestMapping("/user/all/{pc}")
    public String userAllPage(@PathVariable("pc") String pc,HttpServletRequest request){
        int pcInt =1;
        if (pc!=null && !pc.trim().equals("")){
            pcInt = Integer.parseInt(pc);
        }
        //查询用户角色
        List<Role> roles = roleService.findAll();
        PageBean<User> userPage =  userService.findAllByPage(pcInt,10);
        request.setAttribute("userPage",userPage);
        request.setAttribute("roles",roles);
        return "/admin/page/user/manageUser";
    }


    /**
     *  修改用户角色
     * @param req
     * @return
     */
    @RequestMapping("/user/updateRole")
    @ResponseBody
    @RequiresRoles("root")
    public Object updateRole(User user,HttpServletRequest request){
        Map<String,Object> map = new HashMap<>();
        try {
            //更新
            userService.update(user);
            map.put("result",1);
            map.put("msg","更新成功");
        }catch (Exception e){
            map.put("result",0);
            map.put("msg","操作失败！");
            e.printStackTrace();
        }finally {
            return map;
        }
    }
}
