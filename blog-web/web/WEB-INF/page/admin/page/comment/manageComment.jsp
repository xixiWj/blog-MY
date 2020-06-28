<%--
  Created by IntelliJ IDEA.
  User: 魏建
  Date: 2019/4/24
  Time: 23:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>源流博客-评论</title>
    <!-- 导入CSS-->
    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/page/admin/page/common/css_1.jsp"/>

</head>
<body class="hold-transition skin-blue  sidebar-mini layui-bg-black">
<div class="wrapper">

    <!--头部-->
    <header class="main-header">
        <jsp:include page="${pageContext.request.contextPath}/WEB-INF/page/admin/page/common/header.jsp"/>
    </header>

    <!-- 左边工具栏 -->
    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/page/admin/page/common/left.jsp"/>
    <!-- 内容 -->
    <div class="content-wrapper">
        <section class="content-header">
            <h1 style="display: inline-block;">评论管理</h1>
            <%--<a data-pjax="false" id="btnNewPost" href="/admin/post/new">--%>
                <%--写文章 </a>--%>
            <ol class="breadcrumb">
                <li>
                    <a data-pjax="true" href="/admin">
                        <i class="fa fa-dashboard"></i> 首页</a>
                </li>
                <li><a data-pjax="true" href="#">评论管理</a></li>
                <li class="active">所有评论</li>
            </ol>
        </section>
        <section class="content container-fluid">
            <div class="row">
                <div class="col-xs-12">
                    <style>
                        .draft, .publish, .trash {
                            list-style: none;
                            float: left;
                            margin: 0;
                            padding-bottom: 10px;
                        }
                    </style>
                    <%--<ul style="list-style: none;padding-left: 0">--%>
                        <%--<li class="publish">--%>
                            <%--<a data-pjax="true" href="/admin/post">已发布--%>
                                <%--<span class="count">(${blogs.tr})</span></a>&nbsp;|&nbsp;--%>
                        <%--</li>--%>
                        <%--<li class="draft">--%>
                            <%--<a data-pjax="true" href="/admin/post?status=1">草 稿--%>
                                <%--<span class="count">(0)</span></a>&nbsp;|&nbsp;--%>
                        <%--</li>--%>
                        <%--<li class="trash">--%>
                            <%--<a data-pjax="true" href="/admin/post?status=2" style="color: #000">回收站--%>
                                <%--<span class="count">(0)</span></a>--%>
                        <%--</li>--%>
                    <%--</ul>--%>
                </div>
                <div class="col-xs-12">
                    <div class="box box-primary">
                        <div class="box-body table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th>评论者</th>
                                    <th>内容</th>
                                    <th>评论页面</th>
                                    <th>日期</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${comments.listBean}" var="comment">
                                     <tr id="comment-${comment.id}">
                                         <!---->
                                    <td >
                                        <label><a href="#" target="_blank">${comment.visitor.vName}</a></label>
                                    </td>
                                    <td >
                                        ${comment.content}
                                    </td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/article/articleInfo/${comment.blogId}" target="_blank">${comment.blog.blogTitle}</a>
                                    </td>
                                    <td>${comment.dateTxt}</td>
                                    <td >
                                        <%--<a href="/article/articleInfo/${blog.blogId}" class="btn btn-primary btn-xs " target="_blank">查看</a>--%>
                                        <%--<a href="/admin/post/edit/${blog.blogId}" class="btn btn-info btn-xs ">编辑</a>--%>
                                        <button class="btn btn-danger btn-xs " onclick="deleteIt('${comment.id}')" >删除</button>
                                    </td>
                                </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div class="box-footer clearfix">
                            <div class="no-margin pull-left">
                                第 <span id="pageNum">${comments.pc}</span>
                                /${comments.tp}页
                            </div>
                            <ul class="pagination no-margin pull-right">
                                <c:if test="${comments.pc==1}">
                                    <li><a class="btn btn-sm disabled" href="${pageContext.request.contextPath}/admin/comment">首页</a></li>
                                    <li><a class="btn btn-sm disabled" href="${pageContext.request.contextPath}/admin/comment">上一页</a></li>
                                </c:if>
                                <c:if test="${comments.pc!=1}">
                                    <li><a class="btn btn-sm" href="${pageContext.request.contextPath}/admin/comment">首页</a>
                                    </li>
                                    <li><a class="btn btn-sm " href="${pageContext.request.contextPath}/admin/comment/page/${comments.pc-1}">上一页</a></li>
                                </c:if>
                                <c:if test="${comments.pc==comments.tp}">
                                    <li><a class="btn btn-sm disabled" href="${pageContext.request.contextPath}/admin/comment/page/${comments.pc+1}">下一页</a></li>
                                    <li><a class="btn btn-sm disabled" href="${pageContext.request.contextPath}/admin/comment/page/${comments.tp}">尾页</a></li>
                                </c:if>
                                <c:if test="${comments.pc!=comments.tp}">
                                    <li><a class="btn btn-sm" href="${pageContext.request.contextPath}/admin/comment/page/${comments.pc+1}">下一页</a></li>
                                    <li><a class="btn btn-sm" href="${pageContext.request.contextPath}/admin/comment/page/${comments.tp}">尾页</a></li>
                                </c:if>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <%--引入脚部分--%>
    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/page/admin/page/common/footer.jsp"/>
</div>


<!-- 导入js -->
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/page/admin/page/common/js_1.jsp"/>
<script src="${pageContext.request.contextPath}/dist/ckeditor/ckeditor.js"></script>

<!-- page script -->
<script>

    //回收文章
    function  deleteIt(id) {
        layer.confirm('确定该评论吗?', {icon: 3, title: '提示'}, function (index) {
            $.ajax({
                type: "POST",
                data: {"id": id},
                url: "${pageContext.request.contextPath}/admin/comment/delete",
                success: function (data) {
                    if (data.result) {
                        layer.msg(data.msg, {icon: 1, time: 700}, function () {
                           // layer.close(index);
                            window.location.reload();
                        })
                    } else {
                        layer.msg(data.msg, {icon: 5, time: 2000}, function () {
                           // layer.close(index);
                        })
                    }
                },
                dataType: "json"
            });
        });
    }




</script>
</body>
</html>


