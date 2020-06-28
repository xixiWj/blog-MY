<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Logo -->
<input id="PageContext" type="hidden" value="${pageContext.request.contextPath}" />
<header id="masthead" class="site-header">
    <nav id="top-header">
        <div class="top-nav">
            <div id="user-profile">
                <c:choose>
                    <c:when test="${empty user}">
                    <div class="user-login"><a href="${pageContext.request.contextPath}/user/toRegister"><i class="layui-icon layui-icon-username"></i> 注册</a></div>
                    <div class="nav-set">
                        <div class="nav-login">
                            <a href="${pageContext.request.contextPath}/user/toLogin" title="Login"><i class="layui-icon layui-icon-ok"></i> 登录 </a>
                        </div>
                    </div>
                    </c:when>
                    <c:otherwise>
                        <div class="userName" style="">
                           <a style="margin-right: 40px;" href="/admin/">${user.userName}</a> <a href="javascript:logout();" style="margin-right:20px;">退出</a>
                        </div>
                        <%--<div class="" style=" position: absolute;z-index:999;">--%>
                        <%--<ul>--%>
                        <%--<li>管理站点</li>--%>
                        <%--<li>个人中心</li>--%>
                        <%--<li>退出</li>--%>
                        <%--</ul>--%>
                        <%--</div>--%>
                    </c:otherwise>
                </c:choose>
                <div class="top-time" id="TopCurrentTime">

                </div>
                <div class="clear"></div>

            </div>
            <div class="menu-%e9%a1%b6%e9%83%a8%e8%8f%9c%e5%8d%95-container"><ul id="menu-%e9%a1%b6%e9%83%a8%e8%8f%9c%e5%8d%95" class="top-menu">
                <li id="menu-item-1947" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-1947"><a href="${pageContext.request.contextPath}/message">留言板</a></li><%--
                        <li id="menu-item-1954" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-1954"><a href="https://www.macrr.com/sponsor.html">赞助</a></li>
                        <li id="menu-item-3849" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-3849"><a href="https://www.macrr.com/dwqa-questions.html">问答</a></li>
                        <li id="menu-item-3898" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-3898"><a href="https://www.macrr.com/bulletin/pay-service.html">付费服务</a></li>
                        <li id="menu-item-3776" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-3776"><a href="https://www.macrr.com/ad.html">广告合作</a></li>
                        <li id="menu-item-3560" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-3560"><a href="https://www.macrr.com/user-center.html">用户中心</a></li>
                        <li id="menu-item-3561" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-3561"><a href="https://www.macrr.com/profile.html">消费中心</a></li>--%>
            </ul></div>
        </div>
    </nav>
    <div class="clear"></div>
    <div id="menu-box" class="navbar">
        <div id="top-menu">
            <span class="nav-search"><i class="layui-icon layui-icon-search"></i></span>
            <div class="logo-site">
                <a href="${pageContext.request.contextPath}/">
                <img src="${pageContext.request.contextPath}/dist/img/info/logo.jpg" title="源流博客" alt="源流博客" rel="home">
                </a>
            </div><!-- .logo-site -->
            <div id="sidr-close" style="display: none;">
                <a href="#sidr-close" class="toggle-sidr-close">×</a>
            </div>
            <div id="site-nav-wrap">
                <%--<div id="sidr-close"><a href="#sidr-close" class="toggle-sidr-close">×</a></div>--%>
                <nav id="site-nav"   class="main-nav">
                    <a href="#sidr-main" style="display: none" id="navigation-toggle" class="bars"><i class="fa fa-bars"></i></a>
                    <div class="menu-mainmenu-container">
                        <ul id="menu-mainmenu" class="down-menu nav-menu sf-js-enabled sf-arrows">
                            <c:forEach items="${menu}" var="c1">
                                <c:choose>
                                    <c:when test="${c1.sons == null}">
                                        <li id="menu-item-${c1.categoryId}" class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-has-children menu-item-9135">
                                            <a href="${pageContext.request.contextPath}/category/${c1.categoryId}" class=""><i class="${c1.categoryIcon}"> </i>
                                                <span class="font-text">  ${c1.categoryName}</span></a>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li id="menu-item-${c1.categoryId}" class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-has-children menu-item-9135">
                                        <a href="${pageContext.request.contextPath}/category/${c1.categoryId}" class="sf-with-ul"><i class="${c1.categoryIcon}"> </i>
                                            <span class="font-text"> ${c1.categoryName}</span></a>
                                            <ul class="sub-menu" style="display: none;">
                                                <c:forEach items="${c1.sons}" var="c2">
                                                    <c:choose>
                                                        <c:when test="${c2.sons ==null}">
                                                            <li id="menu-item-${c2.categoryId}" class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-${c2.categoryId}">
                                                                <a href="${pageContext.request.contextPath}/category/${c2.categoryId}" class=""> ${c2.categoryName}</a>
                                                            </li>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <li id="menu-item-${c2.categoryId}" class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-has-children menu-item-${c2.categoryId}">
                                                                <a href="${pageContext.request.contextPath}/category/${c2.categoryId}" class="sf-with-ul"> ${c2.categoryName}</a>
                                                                <ul class="sub-menu" class="sf-with-ul" style="display: none;">
                                                                    <c:forEach items="${c2.sons}" var="c3">
                                                                        <li id="menu-item-${c3.categoryId}" class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-${c3.categoryId}">
                                                                            <a href="${pageContext.request.contextPath}/category/${c3.categoryId}"> ${c3.categoryName}</a>
                                                                        </li>
                                                                    </c:forEach>
                                                                </ul>
                                                            </li>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </ul>
                                        </li>
                                    </c:otherwise>
                                </c:choose>

                            </c:forEach>
                            <li id="menu-item-9181" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-9181"><a href="${pageContext.request.contextPath}/message">
                                <i class="fa-comments fa"></i><span class="font-text"> 留言板</span></a>
                                </li>
                        </ul>
                                </div>

                                </nav><!-- #site-nav -->
            </div><!-- #site-nav-wrap -->
            <div class="clear"></div>
        </div><!-- #top-menu -->
    </div>
<!-- 搜索框 --->
    <div id="search-main" style="display: none;">
        <div class="clear"></div>
        <div class="searchbar">
            <form method="get" id="searchform" action="${pageContext.request.contextPath}/article/search/">
            <span>
                <input type="text" value="" name="info" id="s" placeholder="输入搜索内容" required="">
                <button type="sumbit" id="searchsubmit">搜索</button>
            </span>
            </form>
        </div>
        <div class="clear"></div>
    </div>
</header>

