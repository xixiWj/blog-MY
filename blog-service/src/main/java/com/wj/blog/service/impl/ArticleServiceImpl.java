package com.wj.blog.service.impl;

import com.wj.blog.common.domain.Acticle;
import com.wj.blog.common.domain.Blog;
import com.wj.blog.common.domain.PageBean;
import com.wj.blog.common.domain.RightInfo;
import com.wj.blog.dao.BlogMapper;
import com.wj.blog.dao.CommentMapper;
import com.wj.blog.service.ArticleService;
import com.wj.blog.service.BlogService;
import com.wj.blog.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Random;

@Service
@Transactional(rollbackFor = Exception.class,readOnly = false,propagation = Propagation.REQUIRED)
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    private BlogService blogService;

    @Autowired
    private CommentService commentService;


    @Autowired
    private BlogMapper blogMapper;

    /**
     * 查询文章
     * @param blogId
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class,readOnly = true,propagation = Propagation.SUPPORTS)
    public Acticle findActicleByBlogId(String blogId){
        Acticle acticle = new Acticle();
        try {
            Blog blog = null;
            //访问的是留言板
            if(blogId.equals("001")){
                 blog =  blogService.findMessage(blogId);
                blog.setBlogVisit(blog.getBlogVisit()+1);
                //更新
                blogMapper.updateByPrimaryKeySelective(blog);
                acticle.setBlog(blog);
                acticle.setComments(commentService.findCommentByBlogId(blogId));
                acticle.setRightInfo(blogService.getRightInfo(null));
            }else {
                //得到当前博客
                blog = blogService.findBlogByBlogId(blogId);
                blog.setBlogVisit(blog.getBlogVisit()+1);
                //更新
                blogMapper.updateByPrimaryKeySelective(blog);
                acticle.setBlog(blog);
                acticle.setComments(commentService.findCommentByBlogId(blogId));
                acticle.setPreBlog(blogService.findPreBlogByBlogId(blogId));
                acticle.setNextBlog(blogService.findNextBlogByBlogId(blogId));
                acticle.setReComActicle(blogService.findReComBlog(blogId));
                acticle.setRightInfo(blogService.getRightInfo(blogId));
            }
//            //浏览数加1
//            if(blog.getBlogVisit()==null){
//                blog.setBlogVisit(0);
//            }


        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            return  acticle;
        }
    }




    /**
     * 热门文章
     */
    @Override
    @Transactional(rollbackFor = Exception.class,readOnly = true,propagation = Propagation.SUPPORTS)
    public Acticle findActicleByHot(){
        Acticle acticle = new Acticle();
        try {

        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            return  acticle;
        }
    }


    /**
     * 点赞
     * @param blogId
     */
    @Override
    public void favorite(String blogId) {
        try {
            blogService.addBlogLikeCountByBlogId(blogId);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public PageBean<Blog> searchArticle(String info,int pc,int ps) {
        PageBean<Blog> pageBlogs = new PageBean<>();
        pageBlogs.setPc(pc);
        pageBlogs.setPs(ps);
        //start
        int start = (pc-1)*ps;
        //得到总数
        int tr = blogMapper.searchBlogTr(info);
        pageBlogs.setTr(tr);
        //得到blog
        List<Blog> blogs = blogMapper.searchBlog(info,start,ps);
        pageBlogs.setListBean(blogs);
        return pageBlogs;
    }
}
