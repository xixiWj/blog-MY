<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>源流博客-网站信息</title>
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
    <div class="content-wrapper">
        <!-- 内容标题 -->
        <section class="content container-fluid">
            <!-- Small boxes (Stat box) -->
            <div class="row">
                <div class="col-lg-12 col-xs-12" id="widgetOptionsPanel" style="display: none">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">部件选项</h3>
                        </div>
                        <form class="form-horizontal" id="widgetsOption">
                            <div class="box-body">
                                <div class="col-sm-6 col-xs-6">
                                    <div class="form-group">
                                        <label for="widgetPostCount" class="col-sm-4 control-label">文章总数：</label>
                                        <div class="col-sm-8 control-radio">
                                            <div class="pretty p-default p-round">
                                                <input type="radio" name="widget_postcount" id="widgetPostCount" value="true" checked="">
                                                <div class="state p-primary">
                                                    <label>显示</label>
                                                </div>
                                            </div>
                                            <div class="pretty p-default p-round">
                                                <input type="radio" name="widget_postcount" id="widgetPostCount" value="false">
                                                <div class="state p-primary">
                                                    <label>隐藏</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="widgetCommentCount" class="col-sm-4 control-label">评论总数：</label>
                                        <div class="col-sm-8 control-radio">
                                            <div class="pretty p-default p-round">
                                                <input type="radio" name="widget_commentcount" id="widgetCommentCount" value="true" checked="">
                                                <div class="state p-primary">
                                                    <label>显示</label>
                                                </div>
                                            </div>
                                            <div class="pretty p-default p-round">
                                                <input type="radio" name="widget_commentcount" id="widgetCommentCount" value="false">
                                                <div class="state p-primary">
                                                    <label>隐藏</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="widgetAttachmentCount" class="col-sm-4 control-label">附件总数：</label>
                                        <div class="col-sm-8 control-radio">
                                            <div class="pretty p-default p-round">
                                                <input type="radio" name="widget_attachmentcount" id="widgetAttachmentCount" value="true" checked="">
                                                <div class="state p-primary">
                                                    <label>显示</label>
                                                </div>
                                            </div>
                                            <div class="pretty p-default p-round">
                                                <input type="radio" name="widget_attachmentcount" id="widgetAttachmentCount" value="false">
                                                <div class="state p-primary">
                                                    <label>隐藏</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="widgetDayCount" class="col-sm-4 control-label">运行时间：</label>
                                        <div class="col-sm-8 control-radio">
                                            <div class="pretty p-default p-round">
                                                <input type="radio" name="widget_daycount" id="widgetDayCount" value="true" checked="">
                                                <div class="state p-primary">
                                                    <label>显示</label>
                                                </div>
                                            </div>
                                            <div class="pretty p-default p-round">
                                                <input type="radio" name="widget_daycount" id="widgetDayCount" value="false">
                                                <div class="state p-primary">
                                                    <label>隐藏</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-xs-6">
                                    <div class="form-group">
                                        <label for="widgetPostLastest" class="col-sm-4 control-label">最新文章：</label>
                                        <div class="col-sm-8 control-radio">
                                            <div class="pretty p-default p-round">
                                                <input type="radio" name="widget_postlastest" id="widgetPostLastest" value="true" checked="">
                                                <div class="state p-primary">
                                                    <label>显示</label>
                                                </div>
                                            </div>
                                            <div class="pretty p-default p-round">
                                                <input type="radio" name="widget_postlastest" id="widgetPostLastest" value="false">
                                                <div class="state p-primary">
                                                    <label>隐藏</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="widgetCommentLastest" class="col-sm-4 control-label">最新评论：</label>
                                        <div class="col-sm-8 control-radio">
                                            <div class="pretty p-default p-round">
                                                <input type="radio" name="widget_commentlastest" id="widgetCommentLastest" value="true" checked="">
                                                <div class="state p-primary">
                                                    <label>显示</label>
                                                </div>
                                            </div>
                                            <div class="pretty p-default p-round">
                                                <input type="radio" name="widget_commentlastest" id="widgetCommentLastest" value="false">
                                                <div class="state p-primary">
                                                    <label>隐藏</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="widgetLogsLastest" class="col-sm-4 control-label">最新日志：</label>
                                        <div class="col-sm-8 control-radio">
                                            <div class="pretty p-default p-round">
                                                <input type="radio" name="widget_logslastest" id="widgetLogsLastest" value="true" checked="">
                                                <div class="state p-primary">
                                                    <label>显示</label>
                                                </div>
                                            </div>
                                            <div class="pretty p-default p-round">
                                                <input type="radio" name="widget_logslastest" id="widgetLogsLastest" value="false">
                                                <div class="state p-primary">
                                                    <label>隐藏</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="box-footer">
                                <button type="button" class="btn btn-primary pull-right" onclick="saveOptions('widgetsOption')">保存</button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-lg-3 col-xs-6" id="widgetPostCountBody">
                    <div class="small-box bg-aqua">
                        <div class="inner"><h3>${webInfo.blogTotal}</h3><p>文章</p></div>
                        <div class="icon"><i class="ion ion-bag"></i></div>
                        <a data-pjax="true" href="/admin/post" class="small-box-footer">查看所有 <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>
                <div class="col-lg-3 col-xs-6" id="widgetCommentCountBody">
                    <div class="small-box bg-green">
                        <div class="inner"><h3>${webInfo.leaveMessageTotal}</h3><p>评论</p></div>
                        <div class="icon"><i class="ion ion-stats-bars"></i></div>
                        <a data-pjax="true" href="/admin/comment" class="small-box-footer">查看所有 <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>
                <div class="col-lg-3 col-xs-6" id="widgetAttachmentCountBody">
                    <div class="small-box bg-yellow">
                        <div class="inner"><h3>${webInfo.enclosureCount}</h3><p>附件</p></div>
                        <div class="icon"><i class="ion ion-person-add"></i></div>
                        <a data-pjax="true" href="/admin/enclosure/" class="small-box-footer">上传图片 <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>
                <div class="col-lg-3 col-xs-6" id="widgetDayCountBody">
                    <div class="small-box bg-red">
                        <div class="inner"><h4 id="blogStart">${webInfo.serverRunTimeTxt}</h4><p>运行时间</p></div>
                        <div class="icon"><i class="ion ion-pie-graph"></i></div>
                        <a href="#" class="small-box-footer" data-toggle="modal" data-target="#blogInfo"> <i class="fa fa-star"></i></a>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6 col-xs-12" id="widgetPostLastestBody">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">最新文章</h3>
                            <div class="box-tools">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
                                    <i class="fa fa-minus"></i>
                                </button>
                            </div>
                        </div>
                        <div class="box-body table-responsive">
                            <table class="table table-bordered table-hover text-center">
                                <thead>
                                <tr>
                                    <th width="50%">标题</th>
                                    <%--<th>状态</th>--%>
                                    <th>日期</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${webInfo.newBlogs}" var="blog">
                                    <tr>
                                        <td><a target="_blank" href="/article/articleInfo/${blog.blogId}">${blog.blogTitle}</a></td>
                                        <%--<c:if test="${blog.blogStatus==1}">--%>
                                            <%--<td class="text-center">--%>
                                                <%--<span class="label bg-green">已发布</span>--%>
                                            <%--</td>--%>
                                        <%--</c:if>--%>
                                        <%--<c:if test="${blog.blogStatus==0}">--%>
                                            <%--<td class="text-center">--%>
                                                <%--<span class="label bg-red">未发布</span>--%>
                                            <%--</td>--%>
                                        <%--</c:if>--%>
                                        <td>${blog.blogDateTxt}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-xs-12" id="widgetCommentLastestBody">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">最新评论</h3>
                            <div class="box-tools">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
                                    <i class="fa fa-minus"></i>
                                </button>
                            </div>
                        </div>
                        <div class="box-body table-responsive">
                            <table class="table table-bordered table-hover text-center">
                                <thead>
                                <tr>
                                    <th>评论者</th>
                                    <th width="30%">内容</th>
                                    <%--<th>状态</th>--%>
                                    <th>日期</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${webInfo.newComments}" var="comment">
                                    <tr>
                                        <c:if test="${comment.vId != null}">
                                             <td>${comment.visitor.vName}</td>
                                        </c:if>
                                        <c:if test="${comment.userId != null}">
                                            <td>${comment.user.userName}</td>
                                        </c:if>
                                        <td>
                                            <c:if test="${fn:length(comment.content)>12} ">
                                                ${fn:substring(comment.content, 0, 12)} ...
                                            </c:if>
                                            <c:if test="${fn:length(comment.content)<=12}">
                                                ${comment.content}
                                            </c:if>
                                        </td>
                                        <%--<td>--%>
                                            <%--<span class="label bg-green">已发布</span>--%>
                                        <%--</td>--%>
                                        <td>${comment.dateTxt}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6 col-xs-12" id="widgetLogsLastestBody">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">最新上传附件</h3>
                            <div class="box-tools">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-box-tool dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                        <i class="fa fa-bars"></i></button>
                                    <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
                                        <i class="fa fa-minus"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="box-body table-responsive">
                            <table class="table table-bordered table-hover text-center">
                                <thead>
                                <tr>
                                    <th>上传者</th>
                                    <th>内容</th>
                                    <th>大小</th>
                                    <th>日期</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${webInfo.newEnclosure}" var="enclosure">
                                    <tr>
                                        <td>${enclosure.eUId}</td>
                                        <td>${enclosure.eName}</td>
                                        <td>${enclosure.eSize}</td>
                                        <td>${enclosure.eCreatedTxt}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <%--引入脚部分--%>
    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/page/admin/page/common/footer.jsp"/>
</div>
<!-- 添加班级模态框 -->
<div id="addClazzDiv" class="box box-info" style="display: none">
    <form class="form-horizontal" id="addClazzForm">
        <div class="box-body">
            <div class="form-group">
                <label for="clazz_name" class="col-sm-3 control-label">班级姓名</label>

                <div class="col-sm-9">
                    <input type="text" class="form-control" id="clazz_name" name="clazzName" placeholder="班级姓名">
                </div>
            </div>
            <div class="form-group">
                <label for="technology_direction" class="col-sm-3 control-label">技术方向</label>

                <div class="col-sm-9">
                    <input type="text" class="form-control" id="technology_direction" name="clazzDirection"
                           placeholder="技术方向">
                </div>
            </div>
            <div class="form-group">
                <label for="start_time" class="col-sm-3 control-label">开始时间</label>

                <div class="col-sm-9">
                    <input type="text" class="form-control" id="start_time" name="clazzStartTime" placeholder="开始时间">
                </div>
            </div>
            <div class="form-group">
                <label for="end_time" class="col-sm-3 control-label">结束时间</label>

                <div class="col-sm-9">
                    <input type="text" class="form-control" id="end_time" name="clazzEndTime" placeholder="结束时间">
                </div>
            </div>
            <div class="form-group">
                <label for="clazz_engineerId" class="col-sm-3 control-label">工程师</label>
                <div class="col-sm-9">
                    <select class="form-control select2 select2-hidden-accessible" name="clazzEngineerId"
                            id="clazz_engineerId" style="width: 100%;" tabindex="-1" aria-hidden="true">

                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="remarks" class="col-sm-3 control-label">备注信息</label>
                <div class="col-sm-9">
                    <textarea class="form-control" id="remarks" name="clazzClazzRemark" placeholder="备注信息" cols="30"
                              rows="10"></textarea>
                </div>
            </div>
        </div>
        <!-- /.box-body -->
        <div class="box-footer">
            <button id="qxBtn" type="button" class="btn btn-default">取消</button>
            <button type="button" id="addSmtBtn" class="btn btn-info pull-right">提交</button>
        </div>
        <!-- /.box-footer -->
    </form>
</div>

<!-- 导入js -->
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/page/admin/page/common/js_1.jsp"/>
<!-- page script -->



</body>
</html>

