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
    <title>搜索结果-源流博客</title>
    <!-- 头部导入头部 -->
    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/page/common/cssPart.jsp"/>
</head>
<body>
<input type="hidden" id="path" value="${pageContext.request.contextPath}" />
<div id="page" class="hfeed site">
    <!-- 头部导入头部 -->
    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/page/common/header.jsp"/>
    <!-- 导航栏 -->
    <nav class="breadcrumb">
        <a class="crumbs" title="返回首页" href="${pageContext.request.contextPath}"><i class="fa fa-home"></i>首页</a>
    </nav>
    <div style="font-size:16px;margin: 10px auto;width: 78%">
        <p>在网站一共搜索到<b style="color: red">${fn:length(pageBlogs.listBean)}</b>篇相关的文章</p>
    </div>
    <!-- 主体内容 -->
    <div id="content" class="site-content">
        <div class="clear"></div>
        <!--  子分类 -->

        <!-- 分类文章 -->
        <section  class="content-area">
            <main id="main" class="site-main"  role="main">
                <c:forEach items="${pageBlogs.listBean}" var="blog">
                    <div  style="font-size: 17px;padding: 10px;">
                     <a href="/article/articleInfo/${blog.blogId}" target="_blank">${blog.blogTitle}</a>
                        <p style="color: #0b93d5;float: right">${blog.blogDateTxt}</p>
                    </div>
                </c:forEach>
            </main>
            <!-- .site-main -->
            <nav class="navigation pagination" role="navigation">
                <h2 class="screen-reader-text">文章导航</h2>
                <div class="nav-links">
                    <c:if test="${pageBlogs.pc!=1}">
                        <a class="prev page-numbers" href="${pageContext.request.contextPath}/article/search/page/${pageBlogs.tp-1}?info=${info}">
                            <i class="fa fa-angle-left"></i>
                        </a>
                    </c:if>
                    <c:set var="begin" value="${pageBlogs.pc-2}"></c:set>
                    <c:set var="end" value="${pageBlogs.pc+2}"></c:set>
                    <c:if test="${end >= (pageBlogs.tp-3)}">
                        <c:set var="end" value="${pageBlogs.tp}"></c:set>
                        <c:set var="begin" value="${pageBlogs.tp-7}"></c:set>
                    </c:if>
                    <c:if test="${pageBlogs.tp < 8}">
                        <c:set var="begin" value="1"></c:set>
                        <c:set var="end" value="${pageBlogs.tp}"></c:set>
                    </c:if>
                    <c:if test="${begin < 1}">
                        <c:set var="begin" value="1"></c:set>
                        <c:set var="end" value="5"></c:set>
                    </c:if>
                    <c:forEach begin="${begin}" end="${end}" var="i" varStatus="status">
                        <c:choose>
                            <c:when test="${pageBlogs.pc==i}">
                                <span aria-current="page" class="page-numbers current"><span class="screen-reader-text">第 </span>${i}<span class="screen-reader-text"> 页</span></span>
                            </c:when>
                            <c:otherwise>
                                <a class="page-numbers" href="${pageContext.request.contextPath}/article/search/page/${i}?info=${info}"><span class="screen-reader-text">第 </span>${i}<span class="screen-reader-text"> 页</span></a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <c:if test="${end<(pageBlogs.tp-3)&&begin>=1}">
                        <span class="page-numbers dots">…</span>
                        <a class="page-numbers" href="${pageContext.request.contextPath}/article/search/page/${pageBlogs.tp-1}?info=${info}"><span class="screen-reader-text">第 </span>${pageBlogs.tp-1}<span class="screen-reader-text"> 页</span></a>
                        <a class="page-numbers" href="${pageContext.request.contextPath}/article/search/page/${pageBlogs.tp}?info=${info}"><span class="screen-reader-text">第 </span>${pageBlogs.tp}<span class="screen-reader-text"> 页</span></a>
                    </c:if>
                    <c:if test="${pageBlogs.pc!=pageBlogs.tp}">
                        <a class="next page-numbers" href="${pageContext.request.contextPath}/article/search/page/${pageBlogs.pc+1}?info=${info}"><i class="fa fa-angle-right"></i></a>
                    </c:if>
                </div>
            </nav>
        </section>

        <div class="clear"></div>
    </div>
    <!-- 导入底部 -->
    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/page/common/footer.jsp"/>
</div>

<!-- 头部导入头部 -->
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/page/common/jsPart.jsp"/>
</body>
</html>
