<%--
  Created by IntelliJ IDEA.
  User: 魏建
  Date: 2019/4/8
  Time: 14:39
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta charset="utf-8" />
    <title>${category.categoryName}-源流博客</title>
    <!-- 头部导入头部 -->
    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/page/common/cssPart.jsp"/>
</head>
<body>
    <input type="hidden" id="path" value="${pageContext.request.contextPath}" />
    <div id="page" class="hfeed site">
        <!-- 头部导入头部 -->
        <jsp:include page="${pageContext.request.contextPath}/WEB-INF/page/common/header.jsp"/>
        <!-- 导航栏 -->
        <%--<nav class="breadcrumb">--%>
            <%--<a class="crumbs" title="返回首页" href="${pageContext.request.contextPath}"><i class="fa fa-home"></i>首页</a>--%>
            <%--<i class="fa fa-angle-right"></i>--%>
            <%--<a href="#">${category.categoryDescription}</a>--%>
            <%--<i class="fa fa-angle-right"></i>文章--%>
        <%--</nav>--%>

        <!-- 主体内容 -->
        <div id="content" class="site-content">
            <div class="clear"></div>
            <!--  子分类 -->
            <ul class="child-cat">
                <c:forEach items="${category.sons}" var="c" varStatus="">
                    <li class="cat-item cat-item-${c.categoryId}">
                        <a href="${pageContext.request.contextPath}/category/${c.categoryName}" title="${c.categoryDescription}">${c.categoryName}</a>
                    </li>
                </c:forEach>
                <div class="clear"></div>
            </ul>
            <div id="cat-top" class="wow" data-wow-delay="0.3s"> </div>
            <!--分类描述图片-->
            <ul class="cat-des" style="background: url(${pageContext.request.contextPath}/dist/img/category_bg.jpg);background-size: cover;">
                <li class="des-title">${category.categoryName}</li>
                <li>${category.categoryDescription}</li>
            </ul>

            <!-- 分类文章 -->
            <section id="primary" class="content-area">
                <main id="main" class="site-main" role="main">
                    <c:forEach items="${category.pageBlogs.listBean}" var="blog">
                        <div class="wow" data-wow-delay="0.3s">
                            <article id="post-3298" class="post-3298  bulletin type-post status-publish format-standard hentry category-java category-444 tag-java tag-406 tag-452 zqu">
                                <figure class="thumbnail">
                                    <div class="load">
                                        <a href="${pageContext.request.contextPath}/article/articleInfo/${blog.blogId}"><img src="${blog.coverImg}" data-original="" alt="${blog.blogTitle}" style="display: block;" /></a>
                                    </div>
                                    <span class="cat"><a href="${pageContext.request.contextPath}/category/${blog.category.categoryId}">Java</a></span>
                                </figure>
                                <header class="entry-header">
                                    <h2 class="entry-title"><a href="${pageContext.request.contextPath}/article/articleInfo/${blog.blogId}" rel="bookmark">${blog.blogTitle}</a></h2>
                                </header>
                                <!-- .entry-header -->
                                <div class="entry-content">
                                    <div class="archive-content">
                                        ${blog.blogInfo}
                                    </div>
                                    <span class="title-l"></span>
                                    <span class="entry-meta" style="bottom: 14px;">
                                        <span class="date">${blog.blogDateTxt}&nbsp;&nbsp;</span>
                                        <span class="views">阅读 ${blog.blogVisit}</span>
                                        <span class="comment">&nbsp;&nbsp;
                                            <a href="${pageContext.request.contextPath}/article/articleInfo/${blog.blogId}" rel="external nofollow"><i class="fa fa-comment-o"></i> ${blog.blogCommentCount}</a></span> </span>
                                    <div class="clear"></div>
                                </div>
                                <!-- .entry-content -->
                                <span class="entry-more"><a href="${pageContext.request.contextPath}/article/articleInfo/${blog.blogId}" rel="bookmark">阅读全文</a></span>
                            </article>
                            <!-- #post -->
                        </div>
                    </c:forEach>
                </main>
                <!-- .site-main -->
                <nav class="navigation pagination" role="navigation">
                    <h2 class="screen-reader-text">文章导航</h2>
                    <div class="nav-links">
                        <c:if test="${category.pageBlogs.pc!=1}">
                            <a class="prev page-numbers" href="${pageContext.request.contextPath}/category/${category.categoryId}/page/${category.pageBlogs.tp-1}">
                                <i class="fa fa-angle-left"></i>
                            </a>
                        </c:if>
                        <c:set var="begin" value="${category.pageBlogs.pc-2}"></c:set>
                        <c:set var="end" value="${category.pageBlogs.pc+2}"></c:set>
                        <c:if test="${end >= (category.pageBlogs.tp-3)}">
                            <c:set var="end" value="${category.pageBlogs.tp}"></c:set>
                            <c:set var="begin" value="${category.pageBlogs.tp-7}"></c:set>
                        </c:if>
                        <c:if test="${category.pageBlogs.tp < 8}">
                            <c:set var="begin" value="1"></c:set>
                            <c:set var="end" value="${category.pageBlogs.tp}"></c:set>
                        </c:if>
                        <c:if test="${begin < 1}">
                            <c:set var="begin" value="1"></c:set>
                            <c:set var="end" value="5"></c:set>
                        </c:if>
                        <c:forEach begin="${begin}" end="${end}" var="i" varStatus="status">
                            <c:choose>
                                <c:when test="${category.pageBlogs.pc==i}">
                                    <span aria-current="page" class="page-numbers current"><span class="screen-reader-text">第 </span>${i}<span class="screen-reader-text"> 页</span></span>
                                </c:when>
                                <c:otherwise>
                                    <a class="page-numbers" href="${pageContext.request.contextPath}/category/${category.categoryId}/page/${i}"><span class="screen-reader-text">第 </span>${i}<span class="screen-reader-text"> 页</span></a>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        <c:if test="${end<(category.pageBlogs.tp-3)&&begin>=1}">
                            <span class="page-numbers dots">…</span>
                            <a class="page-numbers" href="${pageContext.request.contextPath}/category/${category.categoryId}/page/${category.pageBlogs.tp-1}"><span class="screen-reader-text">第 </span>${category.pageBlogs.tp-1}<span class="screen-reader-text"> 页</span></a>
                            <a class="page-numbers" href="${pageContext.request.contextPath}/category/${category.categoryId}/page/${category.pageBlogs.tp}"><span class="screen-reader-text">第 </span>${category.pageBlogs.tp}<span class="screen-reader-text"> 页</span></a>
                        </c:if>
                        <c:if test="${category.pageBlogs.pc!=category.pageBlogs.tp}">
                            <a class="next page-numbers" href="${pageContext.request.contextPath}/category/${category.categoryId}/page/${category.pageBlogs.pc+1}"><i class="fa fa-angle-right"></i></a>
                        </c:if>
                    </div>
                </nav>
            </section>



            <div id="sidebar" class="widget-area">
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
                            <c:forEach items="${category.rightInfo.relate}" var="blog" varStatus="status">
                                <li>
                                    <a href="${pageContext.request.contextPath}/article/articleInfo/${blog.blogId}" rel="bookmark">${blog.blogTitle}</a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="clear"></div>
                </aside>
                <div class="sidebar-roll">
                    <aside id="random_post-4" class="widget widget_random_post wow" data-wow-delay="0.3s">
                        <h3 class="widget-title"><i class="fa fa-bars"></i>猜你喜欢</h3>
                        <div id="random_post_widget">
                            <ul>
                                <c:forEach items="${category.rightInfo.like}" var="blog" varStatus="status">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/article/articleInfo/${blog.blogId}" rel="bookmark">${blog.blogTitle}</a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                        <div class="clear"></div>
                    </aside>
                    <aside id="categories-2" class="widget widget_categories wow" data-wow-delay="0.3s">
                        <h3 class="widget-title"><i class="fa fa-bars"></i>分类目录</h3>
                        <ul>
                            <c:forEach items="${category.rightInfo.categorys}" var="c" varStatus="status">
                                <li class="cat-item cat-item-55"><a href="${pageContext.request.contextPath}/category/${c.categoryId}" title="${c.categoryDescription}">${c.categoryName}</a></li>
                            </c:forEach>
                        </ul>
                        <div class="clear"></div>
                    </aside>
                </div>
            </div>
            <div class="clear"></div>
            <div class="clear"></div>
        </div>
        <!-- 导入底部 -->
        <jsp:include page="${pageContext.request.contextPath}/WEB-INF/page/common/footer.jsp"/>
    </div>

    <!-- 头部导入头部 -->
    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/page/common/jsPart.jsp"/>
</body>
</html>
