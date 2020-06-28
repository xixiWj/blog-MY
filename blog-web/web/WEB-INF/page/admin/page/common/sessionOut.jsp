<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/page/common/css_1.jsp"/>
</head>
<body>

</body>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/page/common/js_1.jsp"/>
<script type="text/javascript">
    $(function () {
        layer.msg("用户信息已过期！请重新登录",{"icon":4,time:3000},function () {
            layer.closeAll();
            window.location = "../../../login.jsp";
        });
    });
</script>
</html>

