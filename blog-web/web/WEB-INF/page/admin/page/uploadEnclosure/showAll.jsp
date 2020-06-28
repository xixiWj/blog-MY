<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>源流博客-文章编辑</title>
    <!-- 导入CSS-->
    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/page/admin/page/common/css_1.jsp"/>

</head>
<body class="hold-transition skin-blue  sidebar-mini layui-bg-black">
<div class="wrapper">

    <!--头部-->
    <header class="main-header">
        <jsp:include page="${pageContext.request.contextPath}/WEB-INF/page/admin/page/common/header.jsp"/>
    </header>

    <!-- 菜单栏 -->
    <%--<aside class="main-sidebar">
        <jsp:include page="${pageContext.request.contextPath}/WEB-INF/page/common/memu.jsp"/>
    </aside>--%>

    <%----%>
    <!-- 左边工具栏 -->
    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/page/admin/page/common/left.jsp"/>
    <!-- 内容 -->
    <div class="content-wrapper" style="min-height: 226px;">

        <section class="content-header">
            <h1 style="display: inline-block;">附件管理</h1>
            <a style="margin-bottom: 8px" id="btnOpenAttach" href="#" class="btn btn-primary btn-sm" onclick="upload()"><i class="glyphicon glyphicon-cloud"></i>  上传 </a>
            <ol class="breadcrumb">
                <li> <a data-pjax="true" href="#"><i class="fa fa-dashboard"></i> 首页</a> </li>
                <li class="active">附件管理</li>
            </ol>
        </section>
        <script type="text/javascript">
            function upload() {
                var  uf =$('#uploadForm');
                if(uf.is(':hidden')){　　//如果node是隐藏的则显示node元素，否则隐藏

                    uf.fadeIn();

                }else{

                    uf.fadeOut();

                }

            }
        </script>

        <!-- 内容标题 -->
        <section class="content container-fluid">

            <div class="row" id="uploadForm" style="display: none;">
                <div class="col-md-12">
                    <input id="uploadImg" type="file"  multiple class="file-loading"/>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4 col-sm-6 col-xs-6 pull-right">
                    <form>
                        <div class="form-group">
                            <%--<input type="text" class="form-control input-group-lg" id="keywords" name="keywords" value="" placeholder="搜索附件文件(回车确认)">--%>
                        </div>
                    </form>
                </div>
                <div class="clear"></div>
                <div id="attachment-box">
                    <c:forEach items="${pageEnclosure.listBean}" var="enclosure">
                        <div class="col-lg-2 col-md-3 col-sm-6 col-xs-6 div-thumbnail" onclick="openEnclosure(${enclosure.eId})">
                            <a href="#" class="thumbnail">
                                <img style="display: block;width: 170px;height: 170px;" src="${pageContext.request.contextPath}/dist/img/enclosure/${enclosure.eName}?imageMogr2/thumbnail/400x400!/blur/1x0/quality/100" class="img-responsive" title="${enclosure.eName}">
                            </a>
                        </div>
                    </c:forEach>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="no-margin pull-left">
                        第 <span id="pageNum">${pageEnclosure.pc}</span>
                        /${pageEnclosure.tp}页
                    </div>
                    <ul class="pagination no-margin pull-right">
                        <c:if test="${pageEnclosure.pc==1}">
                            <li><a class="btn btn-sm disabled" href="/admin/enclosure/page">首页</a></li>
                            <li><a class="btn btn-sm disabled" href="//admin/enclosure/page">上一页</a></li>
                        </c:if>
                        <c:if test="${pageEnclosure.pc!=1}">
                            <li><a class="btn btn-sm" href="/admin/enclosure/page">首页</a>
                            </li>
                            <li><a class="btn btn-sm " href="/admin/enclosure/page/${pageEnclosure.pc-1}">上一页</a></li>
                        </c:if>
                        <c:if test="${pageEnclosure.pc==pageEnclosure.tp}">
                            <li><a class="btn btn-sm disabled" href="/admin/enclosure/page/${pageEnclosure.pc+1}">下一页</a></li>
                            <li><a class="btn btn-sm disabled" href="/admin/enclosure/page/${pageEnclosure.ps}">尾页</a></li>
                        </c:if>
                        <c:if test="${pageEnclosure.pc!=pageEnclosure.tp}">
                            <li><a class="btn btn-sm" href="/admin/enclosure/page/${pageEnclosure.pc+1}">下一页</a></li>
                            <li><a class="btn btn-sm" href="/admin/enclosure/page/${pageEnclosure.ps}">尾页</a></li>
                        </c:if>
                    </ul>
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
<%--<script>--%>
<%--window.onload = function()--%>
<%--{--%>

<%--};--%>
<%--</script>--%>
<!-- page script -->
<script>

    //点开详情附近
    function openEnclosure(eId){
        layer.open({
                type: 2,
                title: "附件详情",
                content: "${pageContext.request.contextPath}/admin/enclosure/" + eId ,
                area: ['1233px', '588px'],
                maxmin: true
            }
        );
    }


    $(function () {
        //加载fileUpload
        $('#uploadImg').fileinput({
            autoReplace:false,
            language: 'zh',
            uploadUrl: '${pageContext.request.contextPath}/admin/enclosure/upload',
            uploadAsync: true,
// allowedFileExtensions: ['jpg','gif','png','jpeg','svg','psd'],
            maxFileCount: 100,
            enctype: 'multipart/form-data',
            showClose: true,
            msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！"
        }).on("fileuploaded", function (event, data, previewId, index) {
            var data = data.jqXHR.responseJSON;
            if (data.uploaded == "1") {
                layer.msg("上传成功.", {icon: 1, time: 700}, function () {
                    window.location.reload();
                })
            }else {
                layer.msg(data.msg, {icon: 5, time: 700}, function () {

                })
            }

        });


    });

</script>
</body>
</html>

