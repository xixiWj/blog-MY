<%--
  Created by IntelliJ IDEA.
  User: 魏建
  Date: 2019/4/28
  Time: 22:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta charset="utf-8" />
    <title>注册 ‹ 源流博客</title>
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
    <!-- 注册模态框 -->
            <div id="register_error" style="display: none;"> <strong>错误</strong>：<i style="font-style:normal; color: red"></i><br>
            </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="updatePwd" style="padding: 12px;" action="<c:url value='/user/register' />" method="post">
                        <p style="    padding-top: 25px;">
                            <label for="user_email">电子邮件地址 <i class="fa fa-angle-right"></i><br>
                                <input type="text" readonly="readonly" name="userEmail" id="user_email" class="input" value="${userEmail}" size="20">
                            </label>
                        </p>
                           <p>
                               <label for="user_code">验证码 <br>
                                   <input style="width: 50%;float: left;" type="text"  class="input" id="user_code" name="verifyCode"></label>
                           </p>
                        <button  type="button"   id="forgetPwdCode"  class="btn" style="width: 45%;">获取邮箱验证码</button>
                        <p>
                            <label for="user_password">密码 <br>
                                <input type="password" class="input" id="user_password"  name="userPassword" ></label>
                        </p>

                        <p>
                            <label for="user_password2">确认密码 <br>
                                <input type="password" class="input" id="user_password2" name="userPassword2" ></label>
                        </p>
                        <div class="form-group" style="text-align: center;">
                            <button type="button" class="btn" id="submitButton" onclick="updatePwd()"
                                    style="width: 100%; margin-top: 2px;">修改密码</button>
                        </div>
                    </form>

                </div>

    <p id="nav">
        <a href="${pageContext.request.contextPath}/user/toLogin">登录</a> | <a href="${pageContext.request.contextPath}/user/toForgetPwd">忘记密码？</a>
    </p>

    <p id="backtoblog"><a href="${pageContext.request.contextPath}/">← 返回到源流博客</a></p>
</div>
<div class="clear"></div>

<script src="${pageContext.request.contextPath}/dist/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/dist/js/jsencrypt.min.js"></script>
<script src="${pageContext.request.contextPath}/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dist/js/layer/layer.js" ></script>
<script src="${pageContext.request.contextPath}/dist/js/register.js"></script>
</body>
<script>
    function  updatePwd(){
        $('#register_error').fadeOut();
        if($('#user_password').val().length<8){
            layer.msg('密码位数不能少于8位，请使用强密码',{time: 700,shift: 6})
            return;
        }
        if($('#user_password').val()!=$("#user_password2").val()){
            layer.msg('两次密码输入不一致',{time: 700,shift: 6})
            return;
        }
        console.info($("#updatePwd").serialize());
        // 实用ajax提交表单
        $.post(path+'/user/updatePwd', $("#updatePwd").serialize(), function(data) {
            if(data.result==1){
                //修改密码成功提示信息
                layer.alert(data.msg, {
                    icon: 6,
                    skin: 'layer-ext-moon'
                },function(){
                    window.location = path+"/user/toLogin";
                })
            }else if(data.result==0){
                //编写错误信息
                $('#register_error i').text(data.msg);
                $('#register_error').fadeIn();
            }else {
                layer.alert(data.msg, {
                    icon: 0,
                    skin: 'layer-ext-moon'
                })
            }
        }, 'json');
    }
</script>
</html>

