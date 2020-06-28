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
    <title>源流博客-个人信息</title>
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
                个人资料 <small></small>
            </h1>
            <ol class="breadcrumb">
                <li>
                    <a data-pjax="true" href="/admin">
                        <i class="fa fa-dashboard"></i> 首页</a>
                </li>
                <li><a data-pjax="true" href="${pageContext}/admin/user/profile">用户</a></li>
                <li class="active">个人资料</li>
            </ol>
        </section>
        <!-- tab选项卡 -->
        <section class="content container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="nav-tabs-custom">
                        <ul class="nav nav-tabs">
                            <li class="active">
                                <a href="#general" data-toggle="tab" aria-expanded="true">基本资料</a>
                            </li>
                            <li class="">
                                <a href="#pass" data-toggle="tab" aria-expanded="false">密码修改</a>
                            </li>
                            <%--<li class="">--%>
                                <%--<a href="#third" data-toggle="tab" aria-expanded="false">第三方登录</a>--%>
                            <%--</li>--%>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="general">
                                <form method="post" class="form-horizontal" id="profileForm">
                                    <input type="hidden" id="userPass" name="userId" value="${user.userId}">

                                    <input type="hidden" id="userinfoId" name="userinfoId" value="${user.userInfo.userinfoId}">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label for="userName" class="col-lg-2 col-sm-4 control-label">
                                                当前角色:
                                            </label>
                                            <div class="col-lg-4 col-sm-8" style="padding-top: 7px;">
                                                <label>${user.userRole.rAlias}</label>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="userName" class="col-lg-2 col-sm-4 control-label">用户名:
                                                <span data-toggle="tooltip" data-placement="top" title="" style="cursor: pointer" data-original-title="用于登录">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i>
                                                </span>
                                            </label>
                                            <div class="col-lg-4 col-sm-8">
                                                <input disabled="disabled" type="text" class="form-control" id="userName" name="userName" value="${user.userName}">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="userFullName" class="col-lg-2 col-sm-4 control-label">显示名称:
                                                <span data-toggle="tooltip" data-placement="top" title="" style="cursor: pointer" data-original-title="页面显示的名称">
<i class="fa fa-question-circle" aria-hidden="true"></i>
</span>
                                            </label>
                                            <div class="col-lg-4 col-sm-8">
                                                <input type="text" class="form-control" id="userFullName" name="userFullName" value="${user.userInfo.userFullName}">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="userEmail" class="col-lg-2 col-sm-4 control-label">邮箱:</label>
                                            <div class="col-lg-4 col-sm-8">
                                                <input type="email" class="form-control" id="userEmail" name="userEmail" value="${user.userEmail}">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="userAvatar" class="col-lg-2 col-sm-4 control-label">头像:</label>
                                            <div class="col-lg-4 col-sm-8">
                                                <div class="input-group">
                                                    <input type="text" class="form-control" id="userAvatar" name="userImage" value="${user.userInfo.userImage}" src="${user.userInfo.userImage}">
                                                    <span class="input-group-btn">
<button class="btn btn-default " type="button" onclick="openAttach('div')">选择</button>
</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="userDesc" class="col-lg-2 col-sm-4 control-label">个人说明:
                                            </label>
                                            <div class="col-lg-4 col-sm-8">
                                                <textarea class="form-control" rows="3" id="userDesc" name="userIntroduction" style="resize: none">${user.userInfo.userIntroduction}</textarea>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="userEmail" class="col-lg-2 col-sm-4 control-label">个人主页:</label>
                                            <div class="col-lg-4 col-sm-8">
                                                <input type="url" class="form-control" id="userSite" name="userPlace" value="${user.userInfo.userPlace}">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="box-footer">
                                        <button type="button" class="btn btn-primary btn-sm " onclick="saveUser('#profileForm')">保存</button>
                                    </div>
                                </form>
                            </div>
                            <div class="tab-pane" id="pass">
                                <form method="post" class="form-horizontal" id="passForm">
                                    <input type="hidden" name="userinfoId" value="${user.userInfo.userinfoId}" >
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label for="beforePass" class="col-sm-2 control-label">原密码:</label>
                                            <div class="col-sm-4">
                                                <input style="float: left;" type="userPassword" class="form-control" id="beforePass" name="beforePass">
                                            </div>
                                            <a href="${pageContext.request.contextPath}/user/toForgetPwd" style="margin-top: 7px;margin-left: -16px;" class="col-sm-4">忘记密码？</a>
                                        </div>
                                        <div class="form-group">
                                            <label for="newPass" class="col-sm-2 control-label">新密码:</label>
                                            <div class="col-sm-4">
                                                <input type="password" class="form-control" id="newPass" name="newPass">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="reNewPass" class="col-sm-2 control-label">确认密码:</label>
                                            <div class="col-sm-4">
                                                <input type="password" class="form-control" id="reNewPass" name="reNewPass">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="box-footer">
                                        <button type="button" class="btn btn-primary btn-sm " onclick="changPass()">修改</button>
                                    </div>
                                </form>
                            </div>
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

    //修改密码
    function changPass() {
        var pwd = $('#beforePass').val();
        var  newPwd = $('#newPass').val();
        var reNewPass = $('#reNewPass').val();
       $.ajax({
           type:'POST',
           data:{
            'password':pwd,
               'newPwd':newPwd,
               'newPwd2':reNewPass
           },
           url:'${pageContext.request.contextPath}/admin/user/modifyPwd',
           success:function (data) {
                if(data.result==1){
                    layer.msg(data.msg,{icon:1,time:700},function () {
                        window.location.reload();
                    });
                }else {
                    layer.msg(data.msg,{icon:5,time:700},function () {
                    });
                }
            }
       });
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

    //查看附件 弹窗
    function openAttach(div) {
        layer.open({
            type: 2,
            title: '所有附件',
            content: "${pageContext.request.contextPath}/admin/enclosure?type="+ div,
            area: ['1233px', '588px'],
            maxmin: true
        });
    }

    //提交写的文章
    function push(index) {
        // 获取CKEditor带HTML标签的文本
        var blogText= CKEDITOR.instances.description.getData();
        //取得纯文本
        var blogInfo=CKEDITOR.instances.description.document.getBody().getText();
        //获取文章标题
        var blogTitle =$('#post_title').val();
        //获取封面图片路径
        var coverImg = $('#selectImg').attr("src");
        console.info(coverImg);
        //获取分类
        var blogCate=$('input:radio[name="categories"]:checked').val();

        //获取tag标签集合
        var tags= $('#tagList').tagEditor('getTags')[0].tags;

        //是否原创
        var isOriginal = $('#postSource option:selected').val();
        //是否允许评论
        var allowComment = $('#allowComment option:selected').val();
        $.ajax({
            type:'POST',
            url:'${pageContext.request.contextPath}/admin/post/add',
            data: {
                "blogText":blogText,
                "blogInfo":blogInfo,
                "blogTitle":blogTitle,
                "coverImg":coverImg,
                "blogCate":blogCate,
                'tags':tags
            },
            success:function (data) {
                if(data.result==1){
                    layer.msg(data["msg"], {icon:1,time: 700}, function () {
                        <%--window.location="${pageContext.request.contextPath}/admin";--%>
                    })
                }else {
                    layer.msg(data.msg,{icon:5,time:700},function () {

                    });
                }
            },
            dataType:'json'
        });
    }

    //添加封面
    function setCoverImg(imgUrl){
        $('#userAvatar').attr("value",imgUrl);
    }

    //查看附件 弹窗
    function openAttach(div) {
        layer.open({
            type: 2,
            title: '所有附件',
            content: "${pageContext.request.contextPath}/admin/enclosure?type="+ div,
            area: ['1233px', '588px'],
            maxmin: true
        });
    }

    $(function () {



        //标签下拉列表 事件
        $("#chooseTag").change(function () {
            var tag = $("#chooseTag").val();
            //添加到tagList中
            $('#tagList').tagEditor('addTag', tag);
        });



    });

</script>
</body>
</html>



