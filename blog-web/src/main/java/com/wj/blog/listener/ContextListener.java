package com.wj.blog.listener;

import com.wj.blog.common.domain.Blog;
import com.wj.blog.common.domain.BlogCriteria;
import com.wj.blog.common.domain.Config;
import com.wj.blog.dao.BlogMapper;
import com.wj.blog.dao.ConfigMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;


public class ContextListener implements ServletContextListener {

    /* 当服务器容器开启时  加载容器的浏览记录 */
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        Config config = null;
        try {
            ServletContext sevletContex  =  sce.getServletContext();
            //新建一个map 用户识别用户ip
            Map<String,Object> map = new HashMap<>();
            //新建一个map，识别用户点赞
            Map<String, Set<String>> favorite  = new HashMap<>();
            sevletContex.setAttribute("favorite",favorite);
            sevletContex.setAttribute("userIP",map);
              //从数据库中查询
             ConfigMapper configMapper = WebApplicationContextUtils.getWebApplicationContext(sce.getServletContext()).getBean(ConfigMapper.class);
            config = configMapper.selectFirst();
            if(config.getBrowseCount()==null){
                sevletContex.setAttribute("browseCount",new Long(0));
            }else {
                sevletContex.setAttribute("browseCount", config.getBrowseCount());
            }
            //存入启动时间
            Date date = new Date();
            sevletContex.setAttribute("runTime",date);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    /**
     * 当服务器容器关闭时  存储容器的浏览记录
     * @param sce
     */
    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        try {
            //存入数据库
            ConfigMapper configMapper = WebApplicationContextUtils.getWebApplicationContext(sce.getServletContext()).getBean(ConfigMapper.class);
            ServletContext servletContext = sce.getServletContext();
            Long browseCount = (Long) servletContext.getAttribute("browseCount");
            configMapper.updateBrowseCount(browseCount);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
