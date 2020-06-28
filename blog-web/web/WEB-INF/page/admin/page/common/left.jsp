<%--
  Created by IntelliJ IDEA.
  User: 魏建
  Date: 2019/5/11
  Time: 21:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<aside class="main-sidebar">
    <section class="sidebar">
        <!-- 左边功能菜单 -->
        <!-- 用户信息 -->
        <jsp:include page="${pageContext.request.contextPath}/WEB-INF/page/admin/page/common/userInfo.jsp"/>

        <!-- 功能菜单 -->
        <ul class="sidebar-menu" data-widget="tree">
            <!-- 近期网站信息 -->
            <li class="">
                <a href="${pageContext.request.contextPath}/admin/">
                    <i class="glyphicon glyphicon-bookmark"></i> <span>近期网站信息</span>
                </a>
            </li>

            <!-- 文章操作 -->
            <li class="treeview"> <a data-pjax="true" href="#"> <i class="fa fa-book"></i> <span>文章</span> <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span> </a>
                <ul class="treeview-menu" style="">
                    <li> <a data-pjax="true" href="/admin/post"> <i class="fa fa-circle-o"></i>所有文章 </a> </li>
                    <li> <a data-pjax="true" href="/admin/post/new"> <i class="fa fa-circle-o"></i>写文章 </a> </li>
                    <%--<li> <a data-pjax="true" href="/admin/category"> <i class="fa fa-circle-o"></i>分类目录 </a> </li>--%>
                    <%--<li> <a data-pjax="true" href="/admin/tag"> <i class="fa fa-circle-o"></i>标签 </a> </li>--%>
                </ul>
            </li>

            <!-- 附件 -->
            <li> <a data-pjax="true" href="${pageContext.request.contextPath}/admin/enclosure">
                <i class="fa fa-picture-o"></i>
                <span>附件</span>
            </a></li>
            <!-- 评论 -->
            <li> <a data-pjax="true" href="/admin/comment">
                <i class="fa fa-comment"></i>
                <span>评论</span> </a>
            </li>

            <li class="treeview">
                <a data-pjax="true" href="#">
                    <i class="fa fa-user-o"></i>
                    <span>用户</span>
                    <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i></span>   </a>
                <ul class="treeview-menu" style="">
                    <!-- 判断当前用户是否已经认证,已认证就可以看到标签中的内容 -->
                    <!-- 判断当前用户是否拥有指定的角色 -->
                    <shiro:hasRole name="root">
                        <li>
                            <a data-pjax="true" href="/admin/user/all">
                                <i class="fa fa-circle-o"></i>用户列表
                            </a>
                        </li>
                    </shiro:hasRole>

                    <li>
                        <a data-pjax="true" href="/admin/user/profile">
                            <i class="fa fa-circle-o"></i>个人资料
                        </a>
                    </li>
                </ul>
            </li>

        </ul>



    </section>
</aside>
</body>
</html>
