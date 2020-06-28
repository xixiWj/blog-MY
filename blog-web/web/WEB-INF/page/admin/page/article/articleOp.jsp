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


    <!-- 左边工具栏 -->
    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/page/admin/page/common/left.jsp"/>

    <!-- 内容 -->
    <div class="content-wrapper">
        <!-- 内容标题 -->
        <section class="content container-fluid">
            <section class="content-header">
                <h1 style="display: inline-block;">文章编辑</h1>
                <a id="btnOpenAttach" href="#" onclick="openAttachCopy()"> 附件库 </a>
                <ol class="breadcrumb">
                    <li> <a data-pjax="true" href="#"><i class="fa fa-dashboard"></i> 首页</a> </li>
                    <li> <a data-pjax="true" href="/admin/post">文章管理</a> </li>
                    <li class="active">文章编辑</li>
                </ol>
            </section>


            <section class="content">
            <div class="row">
                <div class="col-md-9">
                    <input type="hidden" id="blogId" name="blogId" value="${blog.blogId}">
                    <input type="hidden" id="status" name="status" value="">
                    <div>
                        <input type="text" class="form-control input-lg" id="post_title" name="post_title" placeholder="请输入文章标题" onblur="autoComplateUrl();" value="${blog.blogTitle}">
                    </div>
                    <div style="display: block;margin-bottom: 10px;">
<span>
<%--固定链接: <a href="#">http://blog.liuyanzhao.com/article/<span id="postUrl"><input type="text" id="newPostUrl" onblur="urlOnBlurAuto()" value=""></span>/--%>
</a>
<%--<button class="btn btn-default btn-sm " id="btn_input_postUrl" style="display: none;">编辑</button>--%>
<%--<button class="btn btn-default btn-sm " id="btn_change_postUrl" onclick="urlOnBlurAuto()" style="">确定</button>--%>
</span>
                    </div>
                    <div class="box box-primary no-border">
                    <div class="box-body no-padding">
                        <textarea name="blogText" id="description"/>${blog.blogText}</textarea>
                    </div>
                </div>
                </div>
                <div class="col-md-3">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">发布</h3>
                            <div class="box-tools">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
                                    <i class="fa fa-minus"></i>
                                </button>
                            </div>
                        </div>
                        <%--<div class="box-body">--%>
                            <%--<form class="form-horizontal">--%>
                                <%--<div class="form-group">--%>
                                    <%--<label for="postSource" class="control-label col-md-5">文章类型</label>--%>
                                    <%--<div class="col-md-7">--%>
                                        <%--<select class="form-control" id="postSource" name="postSource">--%>
                                            <%--<option value="1">原创</option>--%>
                                            <%--<option value="2">转载</option>--%>
                                            <%--<option value="3">翻译</option>--%>
                                        <%--</select>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<div class="form-group">--%>
                                    <%--<label for="allowComment" class="control-label col-md-5">开启评论</label>--%>
                                    <%--<div class="col-md-7">--%>
                                        <%--<select class="form-control" id="allowComment" name="allowComment">--%>
                                            <%--<option value="1">是</option>--%>
                                            <%--<option value="0">否</option>--%>
                                        <%--</select>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                            <%--</form>--%>
                        <%--</div>--%>
                        <div class="box-footer">
                            <%--<button onclick="push(1)" class="btn btn-default btn-sm ">保存草稿</button>--%>
                            <button onclick="push(0)" class="btn btn-primary btn-sm pull-right " data-loading-text="发布中...">
                                发布 </button>
                        </div>
                    </div>
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">分类目录</h3>
                            <div class="box-tools">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse" title="Collapse">
                                    <i class="fa fa-minus"></i>
                                </button>
                            </div>
                        </div>
                        <div class="box-body" style="display: block;max-height: 300px;overflow: auto;">
                            <div class="form-group">
                                <ul class="post-cate-ul">
                                    <li class="post-cate-li">
                                        <div class="pretty p-icon level1">
                                            <input name="categories" id="categories" type="radio" value="1">
                                            <div class="state p-primary">
                                             <label><i class="icon glyphicon glyphicon-ok"></i> 未分类</label>
                                            </div>
                                        </div>
                                    </li>
                                    <c:forEach items="${categorys}" var="category">
                                        <li class="post-cate-li">
                                            <div class="pretty p-icon level1">
                                                <c:if test="${blog.blogCate == category.categoryId}">
                                                <input name="categories" id="categories"
                                                       type="radio" class="minimal" checked="checked"
                                                       value="${category.categoryId}">
                                                </c:if>
                                                <c:if test="${blog.blogCate != category.categoryId}">
                                                    <input name="categories" id="categories"
                                                           type="radio" class="minimal"
                                                           value="${category.categoryId}">
                                                </c:if>
                                                <div class="state p-primary">
                                                    <label><i class="icon glyphicon glyphicon-ok"></i> ${category.categoryName}</label>
                                                </div>
                                            </div>
                                        </li>
                                        <c:forEach items="${category.sons}" var="category2">
                                            <li class="post-cate-li">

                                                <div class="pretty p-icon level2" style="margin-left: 20px">
                                                    <c:if test="${blog.blogCate == category2.categoryId}">
                                                        <input name="categories" id="categories"
                                                               type="radio" class="minimal" checked="checked"
                                                               value="${category.categoryId}">
                                                    </c:if>
                                                    <c:if test="${blog.blogCate != category2.categoryId}">
                                                        <input name="categories" id="categories"
                                                               type="radio" class="minimal"
                                                               value="${category2.categoryId}">
                                                    </c:if>
                                                    <div class="state p-primary">
                                                        <label><i class="icon glyphicon glyphicon-ok"></i> ${category2.categoryName}</label>
                                                    </div>
                                                </div>
                                            </li>
                                            <c:forEach items="${category2.sons}" var="category3">
                                                <li class="post-cate-li">
                                                    <div class="pretty p-icon level3" style="margin-left: 40px">
                                                        <c:if test="${blog.blogCate == category3.categoryId}">
                                                            <input name="categories" id="categories"
                                                                   type="radio" class="minimal" checked="checked"
                                                                   value="${category3.categoryId}">
                                                        </c:if>
                                                        <c:if test="${blog.blogCate != category3.categoryId}">
                                                            <input name="categories" id="categories"
                                                                   type="radio" class="minimal"
                                                                   value="${category3.categoryId}">
                                                        </c:if>
                                                        <div class="state p-primary">
                                                            <label><i class="icon glyphicon glyphicon-ok"></i> ${category3.categoryName}</label>
                                                        </div>
                                                    </div>
                                                </li>
                                            </c:forEach>
                                        </c:forEach>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                        <div class="box-footer"></div>
                    </div>
                    <%--<div class="box box-primary">--%>
                        <%--<div class="box-header with-border">--%>
                            <%--<h3 class="box-title">标签</h3>--%>
                            <%--<div class="box-tools">--%>
                                <%--<button type="button" class="btn btn-box-tool" data-widget="collapse" title="Collapse">--%>
                                    <%--<i class="fa fa-minus"></i>--%>
                                <%--</button>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                        <%--<div class="box-body">--%>
                            <%--<input type="text" class="form-control input-lg tag-editor-hidden-src" id="tagList" name="">--%>
                            <%--<br>--%>
                            <%--<select class="form-control" id="chooseTag" name="chooseTag">--%>
                                <%--<option value="">选择添加</option>--%>
                                <%--<c:forEach items="${tags}" var="tag">--%>
                                  <%--<option value="${tag.tagName}">${tag.tagName}</option>--%>
                                <%--</c:forEach>--%>
                            <%--</select>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <div class="box box-primary" >
                        <div class="box-header with-border">
                            <h3 class="box-title">缩略图</h3>
                            <div class="box-tools">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
                                    <i class="fa fa-minus"></i>
                                </button>
                            </div>
                        </div>
                        <div class="box-body">
                            <div>
                                <img
                                        <c:if test="${blog!=null}">
                                             src="${blog.coverImg}"
                                          </c:if>
                                        <c:if test="${blog==null}">
                                        src="${pageContext.request.contextPath}/dist/admin/dist/img/thumbnail/thumbnail.png"
                                        </c:if>
                                        class="img-responsive img-thumbnail" id="selectImg" onclick="openAttach('div')" style="cursor: pointer;">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
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
        //获取blogId
        var blogId = $('#blogId').val();
        //获取分类
        var blogCate=$('input:radio[name="categories"]:checked').val();

        // //获取tag标签集合
        // var tags= $('#tagList').tagEditor('getTags')[0].tags;

        //是否原创
        var isOriginal = $('#postSource option:selected').val();
        //是否允许评论
        var allowComment = $('#allowComment option:selected').val();
        if(blogText == ''){
            layer.msg("文章不能为空",{icon:5,time:700});
            return;
        }
        if(blogTitle == ''){
            layer.msg("标题不能为空",{icon:5,time:700});
            return;
        }
        // if(tags.length==0){
        //     layer.msg("标签不能为空",{icon:5,time:700});
        //     return;
        // }
        if(blogCate == ''){
            layer.msg("分类不能为空",{icon:5,time:700});
            return;
        }
        $.ajax({
            type:'POST',
            url:'${pageContext.request.contextPath}/admin/post/add',
            data: {
                "blogText":blogText,
                "blogInfo":blogInfo,
                "blogTitle":blogTitle,
                "coverImg":coverImg,
                "blogCate":blogCate,
                "blogId":blogId
                // 'tags':tags
            },
            success:function (data) {
                if(data.result==1){
                    layer.msg(data["msg"], {icon:1,time: 700}, function () {
                        window.location="${pageContext.request.contextPath}/admin";
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

            <%--initialTags:['sdasda',--%>
                <%--<c:forEach items="${blog.tags}" var="tag" >--%>
                    <%--<c:if test="${!stat.last}">--%>
                    <%--'${tag.tagName}',--%>
                    <%--</c:if>--%>
                    <%--<c:if test="${stat.last}">--%>
                        <%--'${tag.tagName}'--%>
                    <%--</c:if>--%>
                <%--</c:forEach>--%>
            <%--],--%>
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

    });

</script>
</body>
</html>

