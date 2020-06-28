<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>用户登录</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/page/common/css_1.jsp"/>

    <link rel="stylesheet" href="dist/css/bg.css" />

    <style type="text/css">
        body{
            background:#fff url("${pageContext.request.contextPath}/dist/img/letter_bg_02.jpg") no-repeat left top;

        }
    </style>

</head>
<body class="hold-transition skin-blue sidebar-mini" >
<input id="PageContext" type="hidden" value="${pageContext.request.contextPath}" />
<div id="particles-js"></div>
<div class="container-fluid">
    <div class="row cb-slideshow-text-container ">
        <div class="container-fluid">
            <div class= "tm-content  ml-auto section">
                <!-- 登录表单  -->
                <div class="box box-info" style="width: 450px; margin:0 auto; margin-top: 250px;" >
                    <div class="box-header with-border">
                        <h4 class="title" style="text-align: center">用户登录</h4>
                    </div>
                    <form id="form1"  class="form-horizontal" action="${pageContext.request.contextPath}/user/login" method="post" >
                        <div id="msg" style="display:none;">
                            <h5 style="color: red;text-align: center">账户或密码错误！</h5>
                        </div>
                        <div class="box-body" >
                            <div class="form-group">
                                <label for="inputName" class="col-sm-2 control-label">账户名</label>
                                <div class="col-sm-10">
                                    <input type="email" class="form-control" name="userName" id="inputName" placeholder="账户名">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputPassword3" class="col-sm-2 control-label">密码</label>
                                <div class="col-sm-10">
                                    <input type="password" class="form-control" name="userPwd" id="inputPassword3" placeholder="密码">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox"> 下次自动登录
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="box-footer">
                            <button type="button" id="registerBtn" class="btn btn-default">注册</button>
                            <button type="button" class="btn btn-info pull-right" onclick="user_login()">登录</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<!-- 注册弹出框 -->
<div id="registerDiv" style="display: none" >
    <div class="box box-success">
        <div class="box-header with-border">
            <h4 class="title" style="text-align: center">用户注册</h4>
        </div>
        <div class="box-body" style="width: 80% ;margin-left: 40px" >
            <form class="form-horizontal" id="form2" action="${pageContext.request.contextPath}/user/register" method="post">
                <div class="form-group">
                    <input type="email" class="form-control" id="user_email" name="userEmail"  placeholder="邮箱">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" id="user_name" name="userName" placeholder="用户名">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" id="user_password"  name="userPassword" placeholder="密码">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" id="user_password2"  placeholder="确认密码">
                </div>
                <div class="form-group" style="" >
                    <button type="button" class="btn btn-primary" id="registerSmt" style="width: 100%; margin-top: 2px;">注册</button>
                </div>
            </form>
        </div>
    </div>
</div>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/page/common/js_1.jsp"/>
<script type="text/javascript" src="dist/js/particles.js"></script>
<script type="text/javascript" src="dist/js/app.js"></script>
</html>
