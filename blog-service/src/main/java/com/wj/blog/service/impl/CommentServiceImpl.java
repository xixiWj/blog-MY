package com.wj.blog.service.impl;

import com.wj.blog.common.domain.*;
import com.wj.blog.common.utils.IdGenerator;
import com.wj.blog.dao.BlogMapper;
import com.wj.blog.dao.CommentMapper;
import com.wj.blog.dao.VisitorMapper;
import com.wj.blog.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
@Transactional(rollbackFor = Exception.class,readOnly = false,propagation = Propagation.REQUIRED)
public class CommentServiceImpl implements CommentService {

    @Autowired
    private  CommentMapper commentMapper;

    @Autowired
    private VisitorMapper visitorMapper;

    @Autowired
    private BlogMapper blogMapper;

    @Override
    @Transactional(rollbackFor = Exception.class,readOnly = true,propagation = Propagation.SUPPORTS)
    public List<Comment> findCommentByBlogId(String blogId) throws Exception {
        List<Comment> comments =commentMapper.selectCommentsByBlogId(blogId);
//        for (Comment comment:
//             comments) {
//            String fatherId = comment.getFatherId();
//            if(fatherId==null){
//                break;
//            }
//            for (Comment comment1:
//                comments ) {
//                if(comment1.getId() == fatherId){
//                    comment1.getSons().add(comment);
//                    break;
//                }
//            }
//        }
        return comments;
    }

    @Override
    public void commentByVisitor(Comment comment, Visitor visitor) {
        try {
            String vId= IdGenerator.getID();
            if(visitor.getvId()==null) {
                visitor.setvId(vId);
            }
            comment.setvId(visitor.getvId());
            comment.setId(IdGenerator.getID());
            Blog blog ;
            //获取当前评论的文章
            if(comment.getBlogId().equals("001")) {
                blog = blogMapper.findMessage(comment.getBlogId());
            }else {
                blog = blogMapper.selectByPrimaryKey(comment.getBlogId());
            }
            //评论数+1
            blog.setBlogCommentCount(blog.getBlogCommentCount()+1);
            //更新
            blogMapper.updateByPrimaryKeySelective(blog);
            commentMapper.insert(comment);
            visitorMapper.insert(visitor);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public PageBean<Comment> selectByDate(int pc, int ps) {
        //new PageBean<Comment>
        PageBean<Comment> commentPageBean = new PageBean<>();
        commentPageBean.setPc(pc);
        commentPageBean.setPs(ps);
        //查询评论总数
        int total = commentMapper.selectTotal();
        int start = (pc-1)*ps;
        //查询评论
        List<Comment> comments = commentMapper.selectByDate(start,ps);
        commentPageBean.setListBean(comments);
        commentPageBean.setTr(total);
        return commentPageBean;
    }

    @Override
    public void delete(String cId) {
        commentMapper.deleteByPrimaryKey(cId);
    }

    @Override
    public PageBean<Comment> selectByDate(int pcInt, int ps, String userId) {
        //new PageBean<Comment>
        PageBean<Comment> commentPageBean = new PageBean<>();
        commentPageBean.setPc(pcInt);
        commentPageBean.setPs(ps);//查询评论总数
        int total = commentMapper.selectTotalByUserId(userId);
        int start = (pcInt-1)*ps;
        //查询评论
        List<Comment> comments = commentMapper.selectByDateAndUserId(start,ps,userId);
        commentPageBean.setListBean(comments);
        commentPageBean.setTr(total);
        return commentPageBean;
    }


}
