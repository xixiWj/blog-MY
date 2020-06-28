<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 魏建
  Date: 2019/4/7
  Time: 13:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href='${pageContext.request.contextPath}/dist/css/rightCss.css'/>
<div id="sidebar" class="widget-area">
    <div class="wow" data-wow-delay="0.5s">
        <aside id="hot_post-4" class="widget widget_hot_post wow" data-wow-delay="0.3s">
            <h3 class="widget-title"><i class="fa fa-bars"></i>热门文章</h3>
            <div id="hot_post_widget">
                <ul>
                    <c:forEach items="${rightInfo.hots}" var="blog" varStatus="status">
                         <li><span class="li-icon li-icon-${status.count}">${status.count} </span><a href="${pageContext.request.contextPath}/article/articleInfo/${blog.blogId}">${blog.blogTitle}</a></li>
                    </c:forEach>
                </ul>
            </div>
            <div class="clear"></div>
        </aside>
        <%--<aside id="php_text-7" class="widget widget_php_text wow" data-wow-delay="0.3s">--%>
            <%--<div class="textwidget widget-text">--%>
                <%--<a href="#" title="业务接单" rel="nofollow" target="_blank"><img src="${pageContext.request.contextPath}/dist/img/service/serviceHelp1.jpg" alt="业务接单" title="业务接单" /></a>--%>
            <%--</div>--%>
            <%--<div class="clear"></div>--%>
        <%--</aside>--%>
        <aside id="hot_comment-4" class="widget widget_hot_comment wow" data-wow-delay="0.3s">
            <h3 class="widget-title"><i class="fa fa-bars"></i>热评文章</h3>
            <div id="hot_comment_widget">
                <ul>
                    <c:forEach items="${rightInfo.hotComments}" var="blog" varStatus="status">
                        <li><span class="li-icon li-icon-${status.count}">${status.count}</span>
                            <a href="${pageContext.request.contextPath}/article/articleInfo/${blog.blogId}" rel="bookmark" title=" (${blog.blogCommentCount}条评论)">
                                    ${blog.blogTitle}</a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <div class="clear"></div>
        </aside>
    </div>
    <div class="sidebar-roll">
        <aside id="related_post-2" class="widget widget_related_post wow" data-wow-delay="0.3s">
            <h3 class="widget-title"><i class="fa fa-bars"></i>相关文章</h3>
            <div id="related_post_widget">
                <ul>
                    <c:forEach items="${rightInfo.relate}" var="blog" varStatus="status">
                        <li>
                            <li><a href="${pageContext.request.contextPath}/article/articleInfo/${blog.blogId}">${blog.blogTitle}</a></li>
                        </li>
                    </c:forEach>

                </ul>
            </div>
            <div class="clear"></div>
        </aside>
        <aside id="search-4" class="widget widget_search wow" data-wow-delay="0.3s">
            <h3 class="widget-title"><i class="fa fa-bars"></i>搜索一下</h3>
            <div id="searchbar">
                <form method="get" id="searchform" action="${pageContext.request.contextPath}/article/search/">
                    <input type="text" value="" name="info" id="s" placeholder="输入搜索内容" />
                    <button type="submit" id="searchsubmit">搜索</button>
                </form>
            </div>
            <div class="clear"></div>
        </aside>
        <aside id="random_post-2" class="widget widget_random_post wow" data-wow-delay="0.3s">
            <h3 class="widget-title"><i class="fa fa-bars"></i>随机文章</h3>
            <div id="random_post_widget">
                <ul>
                    <c:forEach items="${rightInfo.relate}" var="blog" varStatus="status">
                        <li>
                            <a href="${pageContext.request.contextPath}/article/articleInfo/${blog.blogId}">${blog.blogTitle}</a></li>
                          <a href="${pageContext.request.contextPath}/article/articleInfo/${blog.blogId}" rel="bookmark">${blog.blogTitle}</a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <div class="clear"></div>
        </aside>
    </div>
    <div class="wow" data-wow-delay="0.5s">
    </div>
</div>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="${pageContext.request.contextPath}/dist/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/dist/js/right.js"></script>