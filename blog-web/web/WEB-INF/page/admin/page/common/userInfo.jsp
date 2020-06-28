<%--
  Created by IntelliJ IDEA.
  User: 魏建
  Date: 2019/4/30
  Time: 23:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<body>
<!-- 用户模块 -->
<div class="user-panel">
    <div class="pull-left image">
        <img style="width: 45px;height: 45px;" src="${user.userInfo.userImage}" class="img-circle"
             alt="User Image">
    </div>
    <div class="pull-left info">
        <p>${user.userName}</p>
        <a href="#"><i class="fa fa-circle text-success"></i> 在线</a>
    </div>
</div>
</body>
</html>
