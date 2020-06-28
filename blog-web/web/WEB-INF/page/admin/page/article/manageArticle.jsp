<%--
  Created by IntelliJ IDEA.
  User: 魏建
  Date: 2019/4/24
  Time: 23:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>源流博客-文章管理</title>
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
        <section class="content-header">
            <h1 style="display: inline-block;">文章管理</h1>
            <a data-pjax="false" id="btnNewPost" href="/admin/post/new">
                写文章 </a>
            <ol class="breadcrumb">
                <li>
                    <a data-pjax="true" href="/admin">
                        <i class="fa fa-dashboard"></i> 首页</a>
                </li>
                <li><a data-pjax="true" href="#">文章管理</a></li>
                <li class="active">所有文章</li>
            </ol>
        </section>
        <section class="content container-fluid">
            <div class="row">
                <div class="col-xs-12">
                    <style>
                        .draft, .publish, .trash {
                            list-style: none;
                            float: left;
                            margin: 0;
                            padding-bottom: 10px;
                        }
                    </style>
                    <%--<ul style="list-style: none;padding-left: 0">--%>
                        <%--<li class="publish">--%>
                            <%--<a data-pjax="true" href="/admin/post">已发布--%>
                                <%--<span class="count">(${blogs.tr})</span></a>&nbsp;|&nbsp;--%>
                        <%--</li>--%>
                        <%--<li class="draft">--%>
                            <%--<a data-pjax="true" href="/admin/post?status=1">草 稿--%>
                                <%--<span class="count">(0)</span></a>&nbsp;|&nbsp;--%>
                        <%--</li>--%>
                        <%--<li class="trash">--%>
                            <%--<a data-pjax="true" href="/admin/post?status=2" style="color: #000">回收站--%>
                                <%--<span class="count">(0)</span></a>--%>
                        <%--</li>--%>
                    <%--</ul>--%>
                </div>
                <div class="col-xs-12">
                    <div class="box box-primary">
                        <div class="box-body table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th>标题</th>
                                    <th>作者</th>
                                    <th>分类目录</th>
                                    <%--<th>标签</th>--%>
                                    <th>评论</th>
                                    <th>访问量</th>
                                    <th>日期</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${blogs.listBean}" var="blog">
                                     <tr id="post-${blog.blogId}">
                                    <td class="col-md-3">
                                        <label><a href="/article/articleInfo/${blog.blogId}" target="_blank">${blog.blogTitle}</a></label>
                                    </td>
                                    <td class="col-md-1">
                                        <a href="/author/${blog.user.userName}">${blog.user.userName}</a>
                                    </td>
                                    <td>
                                        <a href="/category/${blog.category.categoryId}" target="_blank">${blog.category.categoryName}</a>
                                    </td>
                                    <%--<td>--%>
                                        <%--<a href="/tag/php" target="_blank">PHP</a>--%>
                                    <%--</td>--%>
                                    <td>
                                        <span class="label" style="background-color: #d6cdcd;">${blog.blogCommentCount}</span>
                                    </td>
                                    <td>
                                        <span class="label" style="background-color: #d6cdcd;">${blog.blogVisit}</span>
                                    </td>
                                    <td>${blog.blogDateTxt}</td>
                                    <td class="col-md-2">
                                        <a href="/article/articleInfo/${blog.blogId}" class="btn btn-primary btn-xs " target="_blank">查看</a>
                                        <a href="/admin/post/edit/${blog.blogId}" class="btn btn-info btn-xs ">编辑</a>
                                        <button class="btn btn-danger btn-xs " onclick="throwIt('${blog.blogId}')" >丢弃</button>
                                    </td>
                                </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div class="box-footer clearfix">
                            <div class="no-margin pull-left">
                                第 <span id="pageNum">${blogs.pc}</span>
                                /${blogs.tp}页
                            </div>
                            <ul class="pagination no-margin pull-right">
                                <c:if test="${blogs.pc==1}">
                                    <li><a class="btn btn-sm disabled" href="/admin/post">首页</a></li>
                                    <li><a class="btn btn-sm disabled" href="//admin/post">上一页</a></li>
                                </c:if>
                                <c:if test="${blogs.pc!=1}">
                                    <li><a class="btn btn-sm" href="/admin/post">首页</a>
                                    </li>
                                    <li><a class="btn btn-sm " href="/admin/post/page/${blogs.pc-1}">上一页</a></li>
                                </c:if>
                                <c:if test="${blogs.pc==blogs.tp}">
                                    <li><a class="btn btn-sm disabled" href="/admin/post/page/${blogs.pc+1}">下一页</a></li>
                                    <li><a class="btn btn-sm disabled" href="/admin/post/page/${blogs.tp}">尾页</a></li>
                                </c:if>
                                <c:if test="${blogs.pc!=blogs.tp}">
                                    <li><a class="btn btn-sm" href="/admin/post/page/${blogs.pc+1}">下一页</a></li>
                                    <li><a class="btn btn-sm" href="/admin/post/page/${blogs.tp}">尾页</a></li>
                                </c:if>
                            </ul>
                        </div>
                    </div>
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

<!-- page script -->
<script>

    //回收文章
    function  throwIt(blogId) {
        layer.confirm('确定该文章吗?', {icon: 3, title: '提示'}, function (index) {
            $.ajax({
                type: "POST",
                data: {"blogId": blogId},
                url: "${pageContext.request.contextPath}/admin/post/delete",
                success: function (data) {
                    if (data.result) {
                        layer.msg(data.msg, {icon: 1, time: 700}, function () {
                           // layer.close(index);
                            window.location.reload();
                        })
                    } else {
                        layer.msg(data.msg, {icon: 5, time: 2000}, function () {
                           // layer.close(index);
                        })
                    }
                },
                dataType: "json"
            });
        });
    }

    //提交写的文章
    function push(index) {
        // 获取CKEditor带HTML标签的文本
        var blogText= CKEDITOR.instances.description.getData();
        //取得纯文本
        var blogInfo=CKEDITOR.instances.description.document.getBody().getText();
        //获取文章标题
        var blogTitle =$('#post_title').val();
        //获取封面图片路径
        var coverImg = $('#selectImg').attr("src");
        console.info(coverImg);
        //获取分类
        var blogCate=$('input:radio[name="categories"]:checked').val();

        //获取tag标签集合
        var tags= $('#tagList').tagEditor('getTags')[0].tags;

        //是否原创
        var isOriginal = $('#postSource option:selected').val();
        //是否允许评论
        var allowComment = $('#allowComment option:selected').val();
        $.ajax({
            type:'POST',
            url:'${pageContext.request.contextPath}/admin/post/add',
            data: {
                "blogText":blogText,
                "blogInfo":blogInfo,
                "blogTitle":blogTitle,
                "coverImg":coverImg,
                "blogCate":blogCate,
                'tags':tags
            },
            success:function (data) {
                if(data.result==1){
                    layer.msg(data["msg"], {icon:1,time: 700}, function () {
                        <%--window.location="${pageContext.request.contextPath}/admin";--%>
                    })
                }else {
                    layer.msg(data.msg,{icon:5,time:700},function () {

                    });
                }
            },
            dataType:'json'
        });
    }

    //添加封面
    function setCoverImg(imgUrl){
        $('#selectImg').attr("src",imgUrl);
    }

    //查看附件 弹窗
    function openAttach(div) {
        layer.open({
            type: 2,
            title: '所有附件',
            content: "${pageContext.request.contextPath}/admin/enclosure?type="+ div,
            area: ['1233px', '588px'],
            maxmin: true
        });
    }

    $(function () {



        //加载jQuery-tag-editor
        $("#tagList").tagEditor({
            // initialTags:[ 'Hello','World','Example','Tags' ],
            delimiter:',',   // space和逗号
            placeholder:'请输入标签',
            clickDelete:true
        });


        //标签下拉列表 事件
        $("#chooseTag").change(function () {
            var tag = $("#chooseTag").val();
            //添加到tagList中
            $('#tagList').tagEditor('addTag', tag);
        });
        //加载Ckeditor
        CKEDITOR.replace( 'description', {
            filebrowserImageUploadUrl : '${pageContext.request.contextPath}/enclosure/upload',
            language : 'zh-cn',
            image_previewText:' ' ,
            height: 800
        });










        /* 删除班级 ajax */
        $(".content").delegate(".deleteClazz", "click", function () {
            var $tr = $(this).parents("tr");
            var clazzId = $tr.attr("id");
            layer.confirm('确定该班级吗?', {icon: 3, title: '提示'}, function (index) {
                $.ajax({
                    type: "POST",
                    data: {"clazzId": clazzId},
                    url: "${pageContext.request.contextPath}/clazz/delClazz",
                    success: function (data) {
                        if (data.result) {
                            layer.msg(data.msg, {icon: 1, time: 700}, function () {
                                layer.close(index);
                                window.location.reload();
                            })
                        } else {
                            layer.msg(data.msg, {icon: 5, time: 2000}, function () {
                                layer.close(index);
                            })
                        }
                    },
                    dataType: "json"
                });
            });

        });


    });

</script>
</body>
</html>


