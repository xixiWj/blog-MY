<%--
  Created by IntelliJ IDEA.
  User: 魏建
  Date: 2019/4/9
  Time: 19:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta charset="utf-8" />
    <title>登录 ‹ 源流博客</title>
    <link rel="stylesheet" href='${pageContext.request.contextPath}/dist/layui/css/layui.css'/>
    <link href='${pageContext.request.contextPath}/dist/fonts/font-awesome-4.7.0/css/font-awesome.min.css' rel="stylesheet"/>
    <link rel="stylesheet" href='${pageContext.request.contextPath}/dist/css/login.css'/>
</head>
<body class="login login-action-login wp-core-ui  locale-zh-cn" style="cursor: auto;">

<div id="login">
    <input type="hidden" id="path" value="${pageContext.request.contextPath}" />
    <h1><a href="${pageContext.request.contextPath}/" title="欢迎您光临本站！" tabindex="-1">欢迎您光临本站！</a></h1>
    <form name="loginform" id="loginform" action="" method="post">
        <p>
            <label for="user_login">用户名或电子邮件地址 <i class="fa fa-angle-right"></i><br>
                <input type="text" name="log" id="user_login" class="input" value="" size="20"></label>
        </p>
        <p>
                <input type="password" name="pwd" id="user_pass" class="input" value="" size="20"></label></label>
        </p>

        <p class="forgetmenot"  style="float: left" ><label for="rememberme">
            <input name="rememberme" type="checkbox" id="rememberme" value="forever"> 记住我的登录信息</label></p>
        <p class="submit">
            <input type="button" name="wp-submit" id="wp-submit" class="button button-primary button-large" value="登录">
            <input type="hidden" name="redirect_to" value="${pageContext.request.contextPath}">
            <input type="hidden" name="testcookie" value="1">
        </p>
    </form>
    <p id="nav">
        <a href="${pageContext.request.contextPath}/user/toRegister">注册</a> | <a href="${pageContext.request.contextPath}/user/toForgetPwd">忘记密码？</a>
    </p>

    <p id="backtoblog"><a href="${pageContext.request.contextPath}/">← 返回到源流博客</a></p>
</div>
<div class="clear"></div>

<script src="${pageContext.request.contextPath}/dist/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/dist/js/jsencrypt.min.js"></script>
<script src="${pageContext.request.contextPath}/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dist/js/layer/layer.js" ></script>
<script src="${pageContext.request.contextPath}/dist/js/login.js"></script>
</body>

</html>
