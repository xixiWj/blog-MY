<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- 导入CSS-->
    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/page/admin/page/common/css_1.jsp"/>
</head>
<body>
<div class="container-fluid">
    <section class="content">
        <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
                <li class="active">
                    <a href="#allAttach" data-toggle="tab" aria-expanded="true">所有附件</a>
                </li>
                <li class="">
                    <a href="#uploadAttach" data-toggle="tab" aria-expanded="false">本地上传</a>
                </li>
                <li class="pull-right">
                    <form>
                        <div class="form-group">
                            <input type="text" class="form-control input-group-lg" id="keywords" name="keywords" value="" placeholder="搜索附件文件">
                        </div>
                    </form>
                </li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="allAttach">
                    <div class="row">
                        <div id="attachment-box">
                            <c:forEach items="${pageEnclosure.listBean}" var="enclosure">
                                <div class="col-lg-2 col-md-3 col-sm-6 col-xs-6 div-thumbnail" onclick="openEnclosure(${enclosure.eId})">
                                    <a href="#" class="thumbnail" onclick="addCoverImg('${pageContext.request.contextPath}/dist/img/enclosure/${enclosure.eName}')">
                                        <img style="display: block;width: 170px;height: 170px;" src="${pageContext.request.contextPath}/dist/img/enclosure/${enclosure.eName}" class="img-responsive" title="${enclosure.eName}">
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
                    </div>

                <div class="tab-pane" id="uploadAttach">
                    <div class="row" id="uploadFrom">
                        <div class="col-md-12">
                            <input id="uploadImg" type="file"  multiple class="file-loading"/>
                        </div>
                    </div>
                </div>
              </div>
        </div>

    </section>
</div>

<!-- 导入js -->
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/page/admin/page/common/js_1.jsp"/>
<script>
    var index ;

    //点开详情附近
    function openEnclosure(eId){
        index = layer.open({
                type: 2,
                title: "附件详情",
                content: "${pageContext.request.contextPath}/admin/enclosure/" + eId ,
                area: ['1233px', '588px'],
                maxmin: true
            }
        );
    }

    //给文章添加略缩图
    function addCoverImg(imgUrl){
        //关闭弹窗
        //当你在iframe页面关闭自身时
        var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
        parent.layer.close(index); //再执行关闭
        //设置封面图片路径
        parent.setCoverImg(imgUrl);
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
</div>

</body></html>