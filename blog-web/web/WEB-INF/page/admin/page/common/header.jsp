<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Logo -->
<input id="PageContext" type="hidden" value="${pageContext.request.contextPath}"/>

<a href="${pageContext.request.contextPath}/" class="logo">
    <span class="logo-mini">YuanLiu博客后台管理系统</span>
    <span class="logo-lg">YuanLiu博客后台管理系统</span>
</a>
<nav class="navbar navbar-static-top">

    <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
    </a>

    <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
            <li class="dropdown user user-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <img src="${user.userInfo.userImage}" class="user-image"
                                 alt="User Image">
                            <span class="hidden-xs">${user.userName}</span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="user-header">
                                <img src="${user.userInfo.userImage}"
                                     class="img-circle" alt="User Image">
                                <p>${user .userName} - 全栈架构工程师
                                    <small>上次登录时间 2018-10-20</small>
                                </p>
                            </li>
                            <li class="user-footer">
                                <div class="pull-left">
                                    <a href="${pageContext.request.contextPath}/admin/user/profile" class="btn btn-default btn-flat">个人中心</a>
                                </div>
                                <div class="pull-right">
                                    <button id="exitBtn" onclick="logout()" class="btn btn-default btn-flat">退出</button>
                                </div>
                            </li>
                        </ul>
            </li>
        </ul>
    </div>
</nav>
