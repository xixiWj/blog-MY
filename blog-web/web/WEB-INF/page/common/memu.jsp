<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<aside class="main-sidebar">
    <section class="sidebar">
        <!-- 左边功能菜单 -->
        <c:choose>
            <c:when test="${empty user}">
                <div class="user-panel">
                    <div class="pull-left image">
                        <img src="${pageContext.request.contextPath}/dist/img/user_default.jpg" class="img-circle"
                             alt="User Image">
                    </div>
                    <div class="pull-left info">
                        <p>请先登录</p>
                        <a href="#"><i class="fa fa-circle text-red"></i> 离线</a>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <!-- 用户模块 -->
                <div class="user-panel">
                    <div class="pull-left image">
                        <img src="${pageContext.request.contextPath}/dist/img/user7-128x128.jpg" class="img-circle"
                             alt="User Image">
                    </div>
                    <div class="pull-left info">
                        <p>${user.userName}</p>
                        <a href="#"><i class="fa fa-circle text-success"></i> 在线</a>
                    </div>
                </div>

                <!-- 功能菜单 -->
                <ul class="sidebar-menu" data-widget="tree">

                    <li class="treeview">
                        <a href="#">
                            <i class="glyphicon glyphicon-bookmark"></i> <span>班级管理</span>
                            <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="${pageContext.request.contextPath}/clazz/findAll"><i
                                    class="fa fa-circle-o"></i> 查看班级</a></li>
                        </ul>
                    </li>

                    <li class="treeview">
                        <a href="#">
                            <i class="glyphicon glyphicon-bookmark"></i> <span>学员管理</span>
                            <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="${pageContext.request.contextPath}/stu/findAllStudent"><i
                                    class="fa fa-circle-o"></i> 查看学员</a></li>
                        </ul>
                    </li>

                    <li class="treeview">
                        <a href="#">
                            <i class="glyphicon glyphicon-bookmark"></i> <span>学员核心</span>
                            <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
                        </a>
                        <ul class="treeview-menu">
                            <li>
                                <a href="${pageContext.request.contextPath}/stuTask/showTaskByStuId?studentId=${user.userId}"><i
                                        class="fa fa-circle-o"></i>教学任务</a></li>
                        </ul>
                    </li>

                    <li class="treeview">
                        <a href="#">
                            <i class="glyphicon glyphicon-bookmark"></i> <span>项目管理</span>
                            <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="${pageContext.request.contextPath}/project/selectAll"><i
                                    class="fa fa-circle-o"></i>查看项目</a>
                            </li>
                        </ul>
                    </li>

                    <li class="treeview">
                        <a href="#">
                            <i class="glyphicon glyphicon-bookmark"></i> <span>文档管理</span>
                            <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="${pageContext.request.contextPath}/document/selectAll"><i
                                    class="fa fa-circle-o"></i>查看文档</a>
                            </li>
                        </ul>
                    </li>

                    <li class="treeview">
                        <a href="#">
                            <i class="glyphicon glyphicon-bookmark"></i> <span>教学管理</span>
                            <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="${pageContext.request.contextPath}/task/selectAll"><i
                                    class="fa fa-circle-o"></i>教学计划</a>
                            </li>
                        </ul>
                    </li>

                </ul>

            </c:otherwise>
        </c:choose>

    </section>
</aside>

<script>

</script>