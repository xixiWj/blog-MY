<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html style="height: auto; min-height: 100%;"><head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- 导入CSS-->
    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/page/admin/page/common/css_1.jsp"/>
    <style>
        .attachDesc, .attachImg {
            padding-top: 15px;
            padding-bottom: 15px
        }

        .form-horizontal .control-label {
            text-align: left
        }
    </style>
    <link rel="stylesheet" href="http://cdn-blog.liuyanzhao.com/static/plugins/layer/theme/default/layer.css?v=3.1.1" id="layuicss-layer"></head>
<body style="height: auto; min-height: 100%;">
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-6 attachImg">
            <img id="oImg" src="${pageContext.request.contextPath}/dist/img/enclosure/${enclosure.eName} " style="width: 100%;">
        </div>
        <div class="col-lg-6 attachDesc">
            <div class="box box-solid">
                <div class="box-header with-border">
                    <h3 class="box-title">附件详情</h3>
                </div>
                <form class="form-horizontal">
                    <div class="box-body">
                        <div class="form-group">
                            <label for="attachName" class="col-sm-2 control-label">附件名:</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="attachName" value="${enclosure.eName}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="attachType" class="col-sm-2 control-label">附件类型:</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="attachType" value="image/jpeg" disabled="">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="attachPath" class="col-sm-2 control-label">附件路径:</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="attachPath" value="${pageContext.request.contextPath}/dist/img/enclosure/${enclosure.eName}" disabled="">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="attachCreated" class="col-sm-2 control-label">上传时间:</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="attachCreated" value="${enclosure.eCreatedTxt}" disabled="">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="attachStorage" class="col-sm-2 control-label">附件大小:</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="attachStorage" value="${enclosure.eSize/1024}KB" disabled="">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="attachSize" class="col-sm-2 control-label">图片尺寸:</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="attachSize" value="" disabled="">
                            </div>
                        </div>
                    </div>
                    <div class="box-footer">
                        <button type="button" class="btn btn-danger btn-sm pull-left" onclick="enclosureDel(${enclosure.eId})">永久删除</button>
                        <button type="button" class="btn btn-info btn-sm pull-right btn-copy" data-clipboard-text="">复制链接</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<!-- 导入js -->
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/page/admin/page/common/js_1.jsp"/>
<script>
    function enclosureDel(eId) {
        console.info(eId)
        parent.layer.confirm('你确定要删除？', function (index) {
            $.ajax({
                    type: 'POST',
                    url: '/admin/enclosure/del/del',
                    async: false,
                    data: {
                        'eId': eId
                    },
                    success: function (data) {
                        if (data.result == 1) {
                            parent.layer.msg(data.msg, {icon: 1, time: 700}, function () {
                                // 先获取窗口索引，才能关闭窗口
                                var index = parent.layer.getFrameIndex(window.name);
                                parent.layer.close(index);
                                parent.window.location.reload();
                            })
                        } else {
                            parent.layer.msg(data.msg, {icon: 5, time: 700}, function () {
                            })
                        }
                    }
                }
            );
            parent.layer.close(index);
        });
    }
    $(function () {

        }
    );
</script>

</body></html>