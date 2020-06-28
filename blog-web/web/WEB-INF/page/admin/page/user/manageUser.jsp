<%--
  Created by IntelliJ IDEA.
  User: 魏建
  Date: 2019/4/27
  Time: 16:34
  To change this template use File | Settings | File Templates.
--%>
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
    <title>源流博客-管理用户</title>
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
    <div class="content-wrapper" style="min-height: 245px;">
        <style>
            .form-horizontal .control-label {
                text-align: left;
            }
            .third-part a {
                margin-right: 5px;
            }
            .icon-third-sina, .icon-third-qq, .icon-third-github {
                width: 32px;
                height: 32px;
            }
            .icon-third-qq {
                background-position: -112px -98px !important;
            }
            .icon-third-github {
                background-position: -186px -98px !important;
            }

        </style>
        <section class="content-header">
            <h1>
                管理用户 <small></small>
            </h1>
            <ol class="breadcrumb">
                <li>
                    <a data-pjax="true" href="/admin">
                        <i class="fa fa-dashboard"></i> 首页</a>
                </li>
                <li><a data-pjax="true" href="${pageContext}/admin/user/profile">用户</a></li>
                <li class="active">管理用户</li>
            </ol>
        </section>
        <!-- tab选项卡 -->
        <section class="content container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="box box-primary">
                        <div class="box-body table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th>用户名</th>
                                    <th>用户邮箱</th>
                                    <th>用户权限级别</th>
                                    <th>用户最后登录时间</th>
                                    <th>用户注册时间</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${userPage.listBean}" var="user">
                                    <tr id="post-${user.userId}">
                                        <td class="col-md-2">
                                            <label><a href="javascript:void(0);" >${user.userName}</a></label>
                                        </td>
                                        <td class="col-md-1">
                                            <a href="javascript:void(0);">${user.userEmail}</a>
                                        </td>
                                        <td class="col-md-2">
                                            <span id="${user.userId}rAlias">${user.userRole.rAlias}</span>
                                            <select class="form-control" id="${user.userId}" style=" display:none;width: 70%;float: left;">
                                                <c:forEach items="${roles}" var="role">
                                                    <c:if test="${user.userRole.rAlias == role.rAlias}">
                                                        <option value="${role.rId}" selected="selected">${role.rAlias}</option>
                                                    </c:if>
                                                    <c:if test="${user.userRole.rAlias != role.rAlias}">
                                                        <option value="${role.rId}">${role.rAlias}</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                            <a href="javascript:showRoles('#${user.userId}');" id="${user.userId}Show" class="btn btn-info btn-xs " style="right: 0">更改</a>
                                            <a href="javascript:saveRole('${user.userId}');" id="${user.userId}Save" class="btn btn-info btn-ms " style="display: none;" >保存</a>
                                        </td>
                                        <td>
                                           ${user.userUpdatedAt}
                                        </td>
                                        <td>
                                           ${user.userCreatedAt}
                                        </td>
                                        <td class="col-md-2">
                                            <%--<a href="/article/articleInfo/${blog.blogId}" class="btn btn-primary btn-xs " target="_blank">查看</a>--%>

                                            <button class="btn btn-danger btn-xs " onclick="throwIt('${user.userId}')" >删除</button>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div class="box-footer clearfix">
                            <div class="no-margin pull-left">
                                第 <span id="pageNum">${blogs.pc}</span>
                                /${blogs.tp}页
                            </div>
                            <ul class="pagination no-margin pull-right">
                                <c:if test="${blogs.pc==1}">
                                    <li><a class="btn btn-sm disabled" href="/admin/post">首页</a></li>
                                    <li><a class="btn btn-sm disabled" href="//admin/post">上一页</a></li>
                                </c:if>
                                <c:if test="${blogs.pc!=1}">
                                    <li><a class="btn btn-sm" href="/admin/post">首页</a>
                                    </li>
                                    <li><a class="btn btn-sm " href="/admin/post/page/${blogs.pc-1}">上一页</a></li>
                                </c:if>
                                <c:if test="${blogs.pc==blogs.tp}">
                                    <li><a class="btn btn-sm disabled" href="/admin/post/page/${blogs.pc+1}">下一页</a></li>
                                    <li><a class="btn btn-sm disabled" href="/admin/post/page/${blogs.tp}">尾页</a></li>
                                </c:if>
                                <c:if test="${blogs.pc!=blogs.tp}">
                                    <li><a class="btn btn-sm" href="/admin/post/page/${blogs.pc+1}">下一页</a></li>
                                    <li><a class="btn btn-sm" href="/admin/post/page/${blogs.tp}">尾页</a></li>
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

    function throwIt(userId) {
        layer.confirm('确定该用户吗?', {icon: 3, title: '提示'}, function (index) {
            $.ajax({
                type: "POST",
                data: {"userId": userId},
                url: "${pageContext.request.contextPath}/admin/user/delete",
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
    
    //更改用户权限
    function showRoles(userId) {
        $(userId+'rAlias').slideUp();
        $(userId).slideDown();
        $(userId+'Show').hide();
        $(userId+'Save').show();
    }
    //保存用户权限
    function saveRole(userId) {
       var  rId= $('#'+userId).val();
       $.ajax({
           url:'${pageContext.request.contextPath}/admin/user/updateRole',
           data:{
               "userRId":rId,
               'userId':userId
           },
           success:function (data) {
               if(data.result==1){
                   layer.msg(data.msg,{icon:1,time:700},function () {
                       window.location.reload();
                   })
               }else {
                   layer.msg(data.msg,{icon:5,time:700},function () {

                   })
               }
           }

       })
    }


    //保存用户
    function  saveUser(getForm) {
        $.ajax({
            type:'POST',
            data: $(getForm).serialize(),
            url:"${pageContext.request.contextPath}/admin/user/save",
            success:function (data) {
                if(data.result == 1){
                    layer.msg(data.msg,{icon:1,time:700},function () {
                        window.location.reload();
                    })
                }else {
                    layer.msg(data.msg,{icon:5,time:700},function () {

                    })
                }
            }
        });
    }





</script>
</body>
</html>



