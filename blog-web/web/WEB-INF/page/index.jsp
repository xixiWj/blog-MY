<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta charset="utf-8" />
		<title>一只西瓜</title>
	<!-- 头部导入头部 -->
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/page/common/cssPart.jsp"/>
	</head>
	<style type="text/css">
	*{
		margin: 0;
		padding: 0;
		box-sizing: border-box;
	}
	#header{
		height: 480px;
		margin: 0 auto;
	}
	#header .carousel-inner .item img{
		margin: 0 auto;
		width: 100%;
	}
	::-webkit-scrollbar {
		width: 6px;
		height: 6px;
		background-color: #eee;
	}

	::-webkit-scrollbar-thumb {
		background-color: #3798e8;
	}

	::-webkit-scrollbar-track {
		background-color: #eee;
	}



	</style>
	<body>
			<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
	  		<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
				<li data-target="#carousel-example-generic" data-slide-to="1"></li>
				<li data-target="#carousel-example-generic" data-slide-to="2"></li>
				<li data-target="#carousel-example-generic" data-slide-to="3"></li>
				<li data-target="#carousel-example-generic" data-slide-to="4"></li>
				<li data-target="#carousel-example-generic" data-slide-to="5"></li>
			</ol>
			<!-- Wrapper for slides -->
	  		<div class="carousel-inner" role="listbox">
	  			<div class="item active">
	  				<img src="${pageContext.request.contextPath}/dist/img/hd_7.jpg" data-src="${pageContext.request.contextPath}/dist/holder.js/900x400?theme=industrial">
	  				<p class="carousel-caption">
	  					自由
	  				</p>
	  			</div>
	  			<div class="item">
	  				<img src="${pageContext.request.contextPath}/dist/img/hd_6.jpg" data-src="${pageContext.request.contextPath}/dist/holder.js/900x400?theme=industrial">
	  				<p class="carousel-caption">
	  					和平
	  				</p>
	  			</div>
	  			<div class="item">
	  				<img src="${pageContext.request.contextPath}/dist/img/hd_5.jpg" data-src="${pageContext.request.contextPath}/dist/holder.js/900x400?theme=industrial">
	  				<p class="carousel-caption">
	  					爱心
	  				</p>
	  			</div>
	  			<div class="item">
	  				<img src="${pageContext.request.contextPath}/dist/img/hd_4.jpg">
	  				<p class="carousel-caption">
	  					帮助
	  				</p>
	  			</div>
	  			<div class="item">
	  				<img src="${pageContext.request.contextPath}/dist/img/hd_3.jpg">
	  				<p class="carousel-caption">
	  					热情
	  				</p>
	  			</div>
	  			<div class="item">
	  				<img src="${pageContext.request.contextPath}/dist/img/hd_2.jpg">
	  				<p class="carousel-caption">
	  					骑马
	  				</p>
	  			</div>
	  		</div>
	</div>
	  		<!-- Controls -->
			<a class="left carousel-control" style="height: 45%;" href="#carousel-example-generic" role="button" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"  aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a>
			<a class="right carousel-control" style="height: 45%;" href="#carousel-example-generic" role="button" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
			<!-- 功能模块 -->
		<div class="row div_function">
			<c:forEach items="${webInfo.indexLinks}" var="link">
				<a href="${pageContext.request.contextPath}/go/?url=${link.linkUrl}" target="_blank">
					<div class="col-xs-4">
						<div class="panel panel-default" id="pFunc1">
							<div class="panel-body">
								<strong>${link.linkName}</strong>
								<img class="iv_function" src="${pageContext.request.contextPath}/dist/img/${link.linkImage}">
							</div>
						</div>
					</div>
				</a>
			</c:forEach>
			<%--<a href="#">--%>
			<%--<div class="col-xs-4">--%>
				<%--<div class="panel panel-default"  id="pFunc2">--%>
					<%--<div class="panel-body">--%>
						<%--<strong>纪念馆</strong>--%>
						<%--<img class="iv_function" src="${pageContext.request.contextPath}/dist/img/ic_remeber.svg">--%>
					<%--</div>--%>
				<%--</div>--%>
			<%--</div>--%>
			<%--</a>--%>
			<%--<a href="${pageContext.request.contextPath}/go/?url=${}">--%>
			<%--<div class="col-xs-4">--%>
				<%--<div class="panel panel-default"  id="pFunc3">--%>
					<%--<div class="panel-body">--%>
						<%--<strong>私人角落</strong>--%>
						<%--<img class="iv_function" src="${pageContext.request.contextPath}/dist/img/ic_personal.svg">--%>
					<%--</div>--%>
				<%--</div>--%>
			<%--</div>--%>
			<%--</a>--%>
		</div>
			<div class="clear"></div>
		<!-- 技术日记 -->
	<div id="page" class="hfeed site">
			<!-- 分割线 -->
			<%--<hr class="hr_1">igname Technology World !<hr class="hr_2">--%>
		<!-- 头部导入头部 -->
		<jsp:include page="${pageContext.request.contextPath}/WEB-INF/page/common/header.jsp"/>
		<div id="content" class="site-content" style="transform: none;">
			<div class="row">
				<!-- 文章列表 -->
				<!-- 分类文章 -->
				<section id="primary" class="content-area">
					<main id="main" class="site-main" role="main">
						<c:forEach items="${pageBlogs.listBean}" var="blog">
							<div class="wow" data-wow-delay="0.3s">
								<article id="post-3298" class="post-3298  bulletin type-post status-publish format-standard hentry category-java category-444 tag-java tag-406 tag-452 zqu">
									<figure class="thumbnail">
										<div class="load">
											<a href="${pageContext.request.contextPath}/article/articleInfo/${blog.blogId}"><img src="${blog.coverImg}" data-original="" alt="${blog.blogTitle}" style="display: block;" /></a>
										</div>
										<span class="cat"><a href="${pageContext.request.contextPath}/category/${blog.category.categoryId}">Java</a></span>
									</figure>
									<header class="entry-header">
										<h2 class="entry-title"><a href="${pageContext.request.contextPath}/article/articleInfo/${blog.blogId}" rel="bookmark">${blog.blogTitle}</a></h2>
									</header>
									<!-- .entry-header -->
									<div class="entry-content">
										<div class="archive-content">
												${blog.blogInfo}
										</div>
										<span class="title-l"></span>
										<span class="entry-meta" style="bottom: 14px;">
                                        <span class="date">${blog.blogDateTxt}&nbsp;&nbsp;</span>
                                        <span class="views">阅读 ${blog.blogVisit}</span>
                                        <span class="comment">&nbsp;&nbsp;
                                            <a href="${pageContext.request.contextPath}/article/articleInfo/${blog.blogId}" rel="external nofollow"><i class="fa fa-comment-o"></i> ${blog.blogCommentCount}</a></span> </span>
										<div class="clear"></div>
									</div>
									<!-- .entry-content -->
									<span class="entry-more"><a href="${pageContext.request.contextPath}/article/articleInfo/${blog.blogId}" rel="bookmark">阅读全文</a></span>
								</article>
								<!-- #post -->
							</div>
						</c:forEach>
					</main>
					<!-- .site-main -->
					<nav class="navigation pagination" role="navigation">
						<h2 class="screen-reader-text">文章导航</h2>
						<div class="nav-links">
							<c:if test="${pageBlogs.pc!=1}">
								<a class="prev page-numbers" href="${pageContext.request.contextPath}/page/${pageBlogs.tp-1}">
									<i class="fa fa-angle-left"></i>
								</a>
							</c:if>
							<c:set var="begin" value="${pageBlogs.pc-2}"></c:set>
							<c:set var="end" value="${pageBlogs.pc+2}"></c:set>
							<c:if test="${end >= (pageBlogs.tp-3)}">
								<c:set var="end" value="${pageBlogs.tp}"></c:set>
								<c:set var="begin" value="${pageBlogs.tp-7}"></c:set>
							</c:if>
							<c:if test="${pageBlogs.tp < 8}">
								<c:set var="begin" value="1"></c:set>
								<c:set var="end" value="${pageBlogs.tp}"></c:set>
							</c:if>
							<c:if test="${begin < 1}">
								<c:set var="begin" value="1"></c:set>
								<c:set var="end" value="5"></c:set>
							</c:if>
							<c:forEach begin="${begin}" end="${end}" var="i" varStatus="status">
								<c:choose>
									<c:when test="${pageBlogs.pc==i}">
										<span aria-current="page" class="page-numbers current"><span class="screen-reader-text">第 </span>${i}<span class="screen-reader-text"> 页</span></span>
									</c:when>
									<c:otherwise>
										<a class="page-numbers" href="${pageContext.request.contextPath}/page/${i}"><span class="screen-reader-text">第 </span>${i}<span class="screen-reader-text"> 页</span></a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${end<(pageBlogs.tp-3)&&begin>=1}">
								<span class="page-numbers dots">…</span>
								<a class="page-numbers" href="${pageContext.request.contextPath}/page/${pageBlogs.tp-1}"><span class="screen-reader-text">第 </span>${pageBlogs.tp-1}<span class="screen-reader-text"> 页</span></a>
								<a class="page-numbers" href="${pageContext.request.contextPath}/page/${pageBlogs.tp}"><span class="screen-reader-text">第 </span>${pageBlogs.tp}<span class="screen-reader-text"> 页</span></a>
							</c:if>
							<c:if test="${pageBlogs.pc!=pageBlogs.tp}">
								<a class="next page-numbers" href="${pageContext.request.contextPath}/page/${pageBlogs.pc+1}"><i class="fa fa-angle-right"></i></a>
							</c:if>
						</div>
					</nav>
				</section>
				
				<!-- 右侧 -->
				<div class="col-xs-3 div_record">
					<!-- 用户信息 -->
					<div class="jumbotron div_userinfo">
						<%--<h3 class="widget-title">--%>
							<%--<i class="fa fa-bars"></i>关于本站--%>
						<%--</h3>--%>
						<img class="iv_user_head img-circle" src="${pageContext.request.contextPath}/dist/img/c_2.jpg">
						<%--<c:choose>--%>
							<%--<c:when test="${empty  user}">--%>
						<div  class="about-name" style="">不忘初心</div>
						<div class="about-the">人生并不像火车要通过每个站似的经过每一个生活阶段。人生总是直向前行走，从不留下什么。</div>
								<ul>
									<li class="weixin">
										<a id="weixin_info" title="微信" href="${pageContext.request.contextPath}/dist/img/info/weixin.png"><i class="layui-icon  layui-icon-login-wechat"></i></a>
										<span class="weixin-code"><img class="weixin-img" src="${pageContext.request.contextPath}/dist/img/info/weixin.png" ></span>
									</li>
									<li class="tqq"><a target="blank" rel="external nofollow" href="http://wpa.qq.com/msgrd?V=3&amp;uin=936933494&amp;Site=QQ&amp;Menu=yes" title="QQ在线"><i class="layui-icon  layui-icon-login-qq"></i></a></li>
									<li class="tsina"><a title="微博" href="http://weibo.com/13628108265/profile?rightmod=1&amp;wvr=6&amp;mod=personinfo&amp;is_all=1" target="_blank" rel="external nofollow"><i class="layui-icon  layui-icon-login-weibo"></i></a></li>
									<li class="feed"><a title="github主页" href="https://github.com/xixiWj" target="_blank" rel="external nofollow"><i class="iconfont" style="font-size: 33px;" >&#xe885;</i>

									</a></li>
								</ul>
						<%--</c:when>--%>
							<%--<c:otherwise>--%>
								<%--<div style="display: inline-block; margin-left: 12px;font-size: 18px;"><c:out value='${user.userName }'></c:out></div>--%>
							<%--</c:otherwise>--%>
						<%--</c:choose>--%>


					</div>
					<!-- 网站信息 -->
					<aside class="widget wow fadeInUp" data-wow-delay="0.3s">
						<h3 class="widget-title">
							<i class="layui-icon layui-icon-list"></i>网站概况
						</h3>
						<div class="widget-text">
							<ul class="site-profile">
								<li><i class="layui-icon layui-icon-file"></i>
									文章总数：${webInfo.blogTotal} 篇
								</li>
								<li><i class="layui-icon layui-icon-dialogue"></i>
									留言数量：${webInfo.leaveMessageTotal} 条
								</li>
								<li><i class="layui-icon layui-icon-template"></i>
									分类数量：${webInfo.categoryTotal} 个
								</li>
								<%--<li><i class="layui-icon layui-icon-note"></i> 标签总数：${webInfo.noteTotal} 个--%>
								</li>
								<li><i class="layui-icon layui-icon-link"></i> 链接数量：${webInfo.linkTotal}
									个
								</li>
								<li><i class="layui-icon layui-icon-engine"></i> 运行时间：<span id="blogStart">${webInfo.serverRunTime}</span> 天</li>
								<li><i class="glyphicon glyphicon-eye-open"></i>
									浏览总量：${webInfo.browseTotal} 次
								</li>
								<li><i class="layui-icon layui-icon-edit"></i> 最后更新：
									<span style="color:#2F889A">${webInfo.lastUpdateTimeText}</span>
								</li>
								<span style="color:red;">
                    加油！不要因为走的太远，而忘了当初为什么出发。
                </span>
							</ul>

						</div>
						<div class="clear"></div>
					</aside>

					<!-- 热门文章 -->
					<aside id="hot_post-4" class="widget widget_hot_post wow" data-wow-delay="0.3s">
						<h3 class="widget-title"><i class="fa fa-bars"></i>热门文章</h3>
						<div id="hot_post_widget">
							<ul>
								<c:forEach items="${webInfo.hotBlogs}" var="blog" varStatus="status">
									<li>
										<span class="li-icon li-icon-${status.count}">${status.count}</span>
										<a href="${pageContext.request.contextPath}/article/articleInfo/${blog.blogId}"
										   rel="bookmark" title=" (${blog.blogCommentCount}条评论)">
												${blog.blogTitle}</a>
									</li>
								</c:forEach>
							</ul>
						</div>
						<div class="clear"></div>
					</aside>
					<!--近期评论-->
					<aside id="recent_comments-2" class="widget widget_recent_comments wow" data-wow-delay="0.3s">
						<h3 class="widget-title"><i class="fa fa-bars"></i>近期评论</h3>
						<div id="message" class="message-widget">
							<ul>
								<c:forEach items="${webInfo.newComments}" var="comment" varStatus="status">
								<li>
									<a href="${pageContext.request.contextPath}/article/articleInfo/${comment.blogId}" title="" rel="external nofollow">
									<%--<img src="${pageContext.request.contextPath}/article/comment" class="avatar avatar-128" height="128" width="128" />--%>
									<span class="comment_author">
										<strong>${comment.visitor.vName}</strong>
									</span>
									：${comment.content}
								</a>
								</li>
								</c:forEach>
							</ul>
						</div>
						<div class="clear"></div>
					</aside>
					<%--<!-- 随手记录 -->--%>
					<%--<div style="display: flex;">--%>
						<%--<div style="flex: 1"><hr></div>--%>
						<%--<div style="text-align: center;line-height: 48px;color: #34374C">记录美好的心情</div>--%>
						<%--<div style="flex: 1"><hr></div>--%>
					<%--</div>--%>
					<%--<input type="text" class="form-control" placeholder="标题:美好的一天...">--%>
					<%--<br>--%>
					<%--<textarea class="form-control" rows="3" name=textarea placeholder="内容:今天捡到一分钱！！！^_^"></textarea>--%>
					<%--<br>--%>
					<%--<div class="div_save">--%>
						<%--<button type="button" class="btn btn-primary btn_save_record"><i class="layui-icon layui-icon-releasesav"></i>save</button>--%>
					<%--</div>--%>
					<%--<hr>--%>
					<%--<!-- 小功能列表 -->--%>
					<%--<div class="row div_little_func">--%>
					<%--<c:choose>--%>
						<%--<c:when test="${empty  user}">--%>
							<%--<div class="col-xs-4">--%>
								<%--<button class="btn btn-default btn-cricle btn_login" data-toggle="modal" data-target="#loginModal">登</button>--%>
							<%--</div>--%>
							<%--<div class="col-xs-4">--%>
								<%--<button class="btn btn-default btn-cricle btn_write" data-toggle="modal" data-target="#RegisterModal">注</button>--%>
							<%--</div>--%>
						<%--</c:when>--%>
						<%--<c:otherwise>--%>
							<%--<div class="col-xs-4">--%>
								<%--<button class="btn btn-default btn-cricle btn_login">我</button>--%>
							<%--</div>--%>
							<%--<div class="col-xs-4">--%>
								<%--<a href="${pageContext.request.contextPath}/edit.jsp"><button class="btn btn-default btn-cricle btn_write">写</button></a>--%>
							<%--</div>--%>
						<%--</c:otherwise>--%>
					<%--</c:choose>	--%>
						<%--<div class="col-xs-4">--%>
							<%--<button class="btn btn-default btn-cricle btn_stay">留</button>--%>
						<%--</div>--%>
						<%----%>
					<%--</div>--%>
				</div>

				</div>		

		</div>
			<!-- 登录模态框 -->
			<div class="modal fade bs-example-modal-sm" style="margin-top: 20%;" id="loginModal"  data-backdrop="false"  tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
				<div class="modal-dialog modal-sm" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
							<div class="modal-title" id="myModalLabel" style="text-align: center;">登录</div>
						</div>
						<div class="modal-body">
							<form class="form-horizontal" id="form1" method="post" action="<c:url value='/user/login'/>" style="padding: 12px;" >
								<input type="hidden" id="path" value="${pageContext.request.contextPath}">
								<div class="form-group">
									<input type="text" class="form-control" id="user_name1" name="userName" placeholder="账户名">
								</div>
								<div class="form-group">			
									<input type="password" class="form-control" id="user_password1" name="userPassword" placeholder="密码">
								</div>
							</form>
						</div>
						<div class="modal-footer" style="text-align: center;">
							<button type="button" id="loginBtn" class="btn btn-primary" style="width: 100%">登录</button>
							<br />
							<button type="button" class="btn btn-primary " data-toggle="modal" data-target="#RegisterModal"
								style="width: 100%; margin-top: 2px;">注册</button>
						</div>
						
					</div>
				</div>
			</div>
			<!-- 注册模态框 -->
			<div class="modal bs-example-modal-sm" style="margin-top: 15%" id="RegisterModal"  data-backdrop="false" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
  			<div class="modal-dialog modal-sm" role="document">
  				<div class="modal-content">
  					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
  						<div class="modal-title" id="myModalLabe2" style="text-align: center;">注册</div>
  					</div>
  					<div class="modal-body">
  						<form class="form-horizontal" id="form2" style="padding: 12px;" action="<c:url value='/user/register' />" method="post">
  							<input type="hidden" name="method" value="register" />
  							
  							<div class="form-group">
  								<input type="text" class="form-control" id="user_email" name="userEmail"  placeholder="邮箱">
  								 <!--<span class="glyphicon glyphicon-envelope form-control-feedback"></span>-->
  								<font color="red" id="msg_email"></font>
  							</div>
  							<div class="form-group">
  								<input type="text" class="form-control" id="user_name" name="userName" placeholder="用户名">
  								<!--<span class="glyphicon glyphicon-user form-control-feedback"></span>-->
  							</div>
  							<div class="form-group">			
  								<input type="password" class="form-control" id="user_password"  name="userPassword" placeholder="密码">
  								<!--<span class="glyphicon glyphicon-lock form-control-feedback"></span>-->
  							</div>
  							<div class="form-group">			
  								<input type="password" class="form-control" id="user_password2" name="userPassword2" placeholder="确认密码">
  								<!--<span class="glyphicon glyphicon-log-in form-control-feedback"></span>-->
  							</div>
  							<div class="form-group">
  								<input type="text" class="form-control" id="user_code" name="verifyCode" placeholder="邮箱验证码">
  								<button  type="button" id="eamilCode"  class="btn btn-primary" style="width: 100%; margin-top: 5px;">获取邮箱验证码</button>		
  							</div>
  							<div class="form-group" style="text-align: center;">
  								<button type="submit" class="btn btn-primary" id="submitButton" 
  								style="width: 100%; margin-top: 2px;">注册</button> 
  							</div>
  						</form>
  						
  					</div>

  				</div>
  			</div>
  		</div>
	 </div>
			<!-- 导入底部 -->
			<jsp:include page="${pageContext.request.contextPath}/WEB-INF/page/common/footer.jsp"/>
	<!-- 头部导入头部 -->
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/page/common/jsPart.jsp"/>
	<script type="text/javascript">

	</script>
	</body>
</html>