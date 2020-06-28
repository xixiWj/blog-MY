
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
    <title>忘记密码 ‹ 源流博客</title>
    <link rel="stylesheet" href='${pageContext.request.contextPath}/dist/layui/css/layui.css'/>
    <link href='${pageContext.request.contextPath}/dist/fonts/font-awesome-4.7.0/css/font-awesome.min.css' rel="stylesheet"/>
    <link rel="stylesheet" href='${pageContext.request.contextPath}/dist/css/login.css'/>
</head>
<style>
    .btn{
        width: 100%;
        margin-top: 3px;
        /* border: 1px solid #C9C9C9; */
        display: inline-block;
        height: 39px;
        line-height: 38px;
        padding: 0 18px;
        background-color: #008ec2;
        color: #fff;
        white-space: nowrap;
        text-align: center;
        font-size: 14px;
        border: none;
        border-radius: 2px;
        cursor: pointer;
    }

    .btn-hover{
        opacity:0.5;
        transition: .5s;
    }

    .btn .disabled, .btn[disabled], fieldset[disabled] .btn {
        cursor: not-allowed;
        filter: alpha(opacity=65);
        -webkit-box-shadow: none;
        box-shadow: none;
        opacity: .65;
    }

    .login #register_error, .login .message, .login .success {
        border-left: 4px solid #00a0d2;
        padding: 12px;
        margin-left: 0;
        margin-bottom: 20px;
        background-color: #fff;
        box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
    }
</style>
<body class="login login-action-login wp-core-ui  locale-zh-cn" style="cursor: auto;">
<div id="login">
    <input type="hidden" id="path" value="${pageContext.request.contextPath}" />
    <h1><a href="${pageContext.request.contextPath}/" title="欢迎您光临本站！" tabindex="-1">欢迎您光临本站！</a></h1>
    <!-- 忘记密码模态框 -->
            <div id="register_error" style="display: none;"> <strong>错误</strong>：<i style="font-style:normal; color: red"></i><br>
            </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="form2" style="padding: 12px;"  method="post">
                        <input type="hidden" name="method" value="register" />
                        <p style="    padding-top: 25px;">
                            <label for="user_email">电子邮件地址 <i class="fa fa-angle-right"></i><br>
                             <input type="text" name="userEmail" id="user_email" class="input" value="" size="20"></label>
                        </p>
                        <div class="form-group" style="text-align: center;">
                            <button type="button" class="btn" id="submitButton" onclick="forgetPwd()"
                                    style="width: 100%; margin-top: 2px;">找回密码</button>
                        </div>
                    </form>

                </div>

    <p id="nav">
        <a href="${pageContext.request.contextPath}/user/toLogin">登录</a> | <a href="${pageContext.request.contextPath}/user/toRegister">注册</a>
    </p>

    <p id="backtoblog"><a href="${pageContext.request.contextPath}/">← 返回到源流博客</a></p>
</div>
<div class="clear"></div>

<script src="${pageContext.request.contextPath}/dist/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/dist/js/jsencrypt.min.js"></script>
<script src="${pageContext.request.contextPath}/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dist/js/layer/layer.js" ></script>
<script src="${pageContext.request.contextPath}/dist/js/register.js"></script>
<script>
    function forgetPwd(){
        $('#register_error').fadeOut();
        $.ajax({
            method:'post',
            url:'${pageContext.request.contextPath}/user/forgetPwd',
            data:$('#form2').serialize(),
            success:function (data) {
                if(data.result ){
                    window.location = "${pageContext.request.contextPath}/user/updatePwdUI?userEmail="+$('#user_email').val();
                }else{
                    //编写错误信息
                    $('#register_error i').text(data.msg);
                    $('#register_error').fadeIn();
                }
            }

        })
    }
</script>
</body>

</html>

