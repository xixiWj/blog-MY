package com.wj.blog.filter;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.FilterChain;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wj.blog.common.domain.Category;
import com.wj.blog.service.CategoryService;
import eu.bitwalker.useragentutils.UserAgent;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.context.support.XmlWebApplicationContext;
import org.springframework.web.filter.OncePerRequestFilter;


public class BrowseFilter extends OncePerRequestFilter{

    private CategoryService categoryService;

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
            throws ServletException, IOException {
        try {
            if(isAjaxRequest(request)){
                filterChain.doFilter(request, response);
            }else {
                ServletContext sc = request.getServletContext();
                XmlWebApplicationContext cxt = (XmlWebApplicationContext) WebApplicationContextUtils.getWebApplicationContext(sc);
                if(cxt != null && cxt.getBean("categoryServiceImpl") != null && categoryService == null)
                    categoryService = (CategoryService) cxt.getBean("categoryServiceImpl");

                List<Category> menu = categoryService.findAll();
                request.setAttribute("menu",menu);//            //得到用户信息
                UserAgent userAgent = UserAgent.parseUserAgentString(request.getHeader("User-Agent"));
//            //得到IP
                String ip = request.getRemoteAddr();
                if (ip.equals("0:0:0:0:0:0:0:1")) {
                    ip = "127.0.0.1";
                }
//            //得到浏览器信息
                String browseInfo = userAgent.getBrowser().toString();
                //得到系统信息
                String systemInfo = userAgent.getOperatingSystem().toString();
                ServletContext context = request.getServletContext();
                Map<String, Object> userIP = (Map<String, Object>) context.getAttribute("userIP");
                if (userIP.containsKey(ip)) {
                    Date date = (Date) userIP.get(ip);
                    if ((new Date().getTime() - date.getTime()) > 86400000) {
                        long browseCount = (long) context.getAttribute("browseCount");
                        context.setAttribute("browseCount", browseCount++);
                    }
                } else {
                    userIP.put(ip, new Date());
                    long browseCount = (long) context.getAttribute("browseCount");
                    browseCount++;
                    context.setAttribute("browseCount", browseCount);
                }
                filterChain.doFilter(request, response);
            }
        }catch (Exception e){
            e.printStackTrace();
        }


        /*//不过滤的uri
        String[] notFilter = new String[]{"/login"};

        //请求的uri
        String uri = request.getRequestURI();
        System.out.println("filter>>>uri>>>"+uri);

        //是否过滤
        boolean doFilter = true;
        for(String s : notFilter){
            if(uri.indexOf(s) != -1){
                //uri中包含不过滤uri，则不进行过滤
                doFilter = false;
                break;
            }
        }

        if(doFilter){
            System.out.println("doFilter>>>");
            //过滤操作
            //从session中获取登陆者实体
            Object obj = request.getSession().getAttribute("user");
            if(obj==null){
                System.out.println("doFilter>>>obj is null");
                boolean isAjaxRequest = isAjaxRequest(request);
                if(isAjaxRequest){
                    response.setCharacterEncoding("UTF-8");
                    response.sendError(HttpStatus.UNAUTHORIZED.value(),"您已经太长时间没有操作,请刷新页面");

                    System.out.println("doFilter>>>ajax request");

                    return ;
                }else{
                    System.out.println("doFilter>>>http request");
                    response.sendRedirect("./login");
                    //跳转到登录页面
                    return ;
                }
            }else{
                User user = (User) obj;
                System.out.println("doFilter>>>username>>"+user.getUsername());
                // 如果session中存在登录者实体，则继续
                filterChain.doFilter(request, response);
            }
        }else{
            //不执行过滤操作
            filterChain.doFilter(request, response);
        }*/
    }
    /**
     * is Ajax request
     * @param request
     * @return
     */
    private boolean isAjaxRequest(HttpServletRequest request) {
        String header = request.getHeader("X-Requested-With");
        if(header != null && "XMLHttpRequest".equals(header)){
            //ajax request
            return true;
        }else{
            //traditional sync http request
            return false;
        }
    }

}