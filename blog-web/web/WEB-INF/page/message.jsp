<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta charset="utf-8" />
    <title></title>
    <!-- 头部导入头部 -->
    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/page/common/cssPart.jsp"/>
</head>
<body>
<input type="hidden" id="path" value="${pageContext.request.contextPath}" />
<div id="page" class="hfeed site">
    <!-- 头部导入头部 -->
    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/page/common/header.jsp"/>
    <div id="content" class="site-content">
        <div class="clear"></div>
        <input type="hidden" id="context" value="${pageContext.request.contextPath}">
        <div id="primary" class="content-area">
            <main id="main" class="site-main" role="main">
                <div class="wow" data-wow-delay="0.3s">
                    <article id="post-3275" class="post-4738 post4 type-post status-publish format-standard hentry category-wordpress tag-wordpress rwz">
                        <header class="entry-header">
                            <h1 class="entry-title">${article.blog.blogTitle}</h1>
                        </header>
                        <!-- .entry-header -->
                        <div class="entry-content">
                            <div class="single-content">
                              ${article.blog.blogText}
                            </div>
                            <div class="clear"></div>
                            <footer class="single-footer">
                                <ul class="single-meta">
                                    <li class="single-date">${article.blog.blogDateTxt}</li>
                                    <li class="comment"><a href="#" rel="external nofollow"><i class="layui-icon layui-icon-reply-fill"></i> ${fn:length(article.comments)}</a></li>
                                    <li class="views"><i class="glyphicon glyphicon-eye-open"></i> ${article.blog.blogVisit}</li>
                                </ul>
                            </footer>
                            <!-- .entry-footer -->
                            <div class="clear"></div>
                        </div>
                        <!-- .entry-content -->
                    </article>
                </div>
                <div class="wow" data-wow-delay="0.3s">
                    <div id="related-img">
                        <c:forEach items="${article.reComActicle}" var="blog" >
                            <div class="r4">
                                <div class="related-site">
                                    <figure class="related-site-img">
                                        <div class="load">
                                            <a href="${pageContext.request.contextPath}/article/articleInfo/${article.blog.blogId}"><img src="${blog.coverImg}" data-original="&amp;w=280&amp;h=210&amp;a=&amp;zc=1" alt="${blog.blogTitle}" style="display: inline;" /></a>
                                        </div>
                                    </figure>
                                    <div class="related-title">
                                        <a href="${pageContext.request.contextPath}/article/articleInfo/${article.blog.blogId}">${blog.blogTitle}</a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <div class="clear"></div>
                    </div>
                </div>
                <div id="single-widget">
                    <div class="wow" data-wow-delay="0.3s"></div>
                    <div class="clear"></div>
                </div>
                <!-- 引用 -->
                <div class="scroll-comments"></div>
                    <div id="respond" class="comment-respond wow" data-wow-delay="0.3s">
                        <h3 id="reply-title" class="comment-reply-title" style="font-size: 16px">
                            <i class="layui-icon layui-icon-reply-fill"></i>发表评论<small>
                            <a rel="nofollow" id="cancel-comment-reply-link" href="javascript:void(0)" style="display:none;">取消回复</a></small>
                        </h3>
                        <form class="layui-form layui-form-pane" action="" id="submitFrom">
                            <div class="author_avatar author_avatar_info_img">
                                <div class="comments_box_tips">
                                    <p class="comments_tips">请在下方填写评论信息</p>
                                </div>
                            </div>
                            <input type="hidden"  name="fatherId" id="commentFatherId"/>
                            <input type="hidden" name="blogId" value="${article.blog.blogId}"/>
                            <c:choose>
                            <c:when test="${user!=null}">
                                <div class="user_avatar">
                                    <img alt="" style=" width: 48px;height: 48px;" src="<c:out value="${sessionScope.user.userInfo.userImage}" default="headerDef.png" />" class="avatar avatar-64 photo" height="64" width="64">
                                    登录者：<a href="${pageContext.request.contextPath}/admin/user/profile">${sessionScope.user.userName}</a>
                                    <br> <a href="javascript:void(0)" onclick="logout()">登出</a>
                                    <input type="hidden" name="role" value="1">
                                    <input type="hidden" name="vName"
                                           value="${sessionScope.user.userName}">
                                    <input type="hidden" name="vEmail"
                                           value="${sessionScope.user.userEmail}">
                                    <input type="hidden" name="vUrl" value="${sessionScope.user.userInfo.userPlace}">
                                </div>
                            </c:when>
                            <c:otherwise>
                                        <div id="comment-author-info">
                                        <div class="layui-form-item">
                                            <label class="layui-form-label">昵称 <span class="required">*</span></label>
                                            <div class="layui-input-block">
                                                <input type="text" name="vName" lay-verify="required" autocomplete="off" placeholder="" class="layui-input" value="${visitor.vName}">
                                            </div>
                                        </div>
                                        <div class="layui-form-item">
                                            <label class="layui-form-label">邮箱 <span class="required">*</span></label>
                                            <div class="layui-input-block">
                                                <input type="text" name="vEmail" lay-verify="email" placeholder="" autocomplete="off" class="layui-input" value="${visitor.vEmail}">
                                            </div>
                                        </div>
                                        <div class="layui-form-item">
                                            <label class="layui-form-label">网址 </label>
                                            <div class="layui-input-block">
                                                <input type="text" name="vWebAddress"  placeholder="" autocomplete="off" class="layui-input" value="${visitor.vWebAddress}">
                                            </div>
                                        </div>
                                         </div>
                            </c:otherwise>
                            </c:choose>
                            <textarea id="commentConent" style="display: none;" lay-verify="article_desc" name="content" placeholder="世界之大，不发表一下看法？" ></textarea>
                            <!-- 成功 -->
                            <div id="success" style="display: none;"><i class="layui-icon layui-icon-ok-circle" style="color: #01AAED"></i> 评论成功，刷新页面后查看~</div>
                            <!-- 提交时 -->
                            <div id="loading" style="display: none;"><img src="${pageContext.request.contextPath}/dist/img/load/load-avatar.gif"/>正在提交, 请稍候...</div>
                            <!-- 错误时 -->
                            <div id="error" style="display: none;"></div>
                            <div class="layui-form-item">
                                <button id="submit"  class="layui-btn layui-btn-primary layui-btn-fluid" lay-submit="" lay-filter="commentFrom">提交评论</button>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label"    style="width: 169px;">有回复时邮件通知我</label>
                                <div class="layui-input-block">
                                    <input type="checkbox" checked="" name="open" lay-skin="switch" lay-filter="switchTest" lay-text="开|关">
                                    <div class="layui-unselect layui-form-switch layui-form-onswitch" lay-skin="_switch">
                                        <em>开</em>
                                        <i></i>
                                    </div>
                                </div>
                            </div>
                        </form>
                     </div>
                    <h2 class="comments-title wow" data-wow-delay="0.3s"> 目前评论：${fn:length(article.comments)} &nbsp;&nbsp;其中：访客&nbsp;&nbsp;${article.blog.blogVisit} &nbsp;&nbsp;博主&nbsp;&nbsp;7 </h2>
                    <h2 class="comments-title wow comment-loading-box" data-wow-delay="0.3s" style="overflow: hidden; display: none;">
                        <center>
                            <div class="loading-comments">
                                <img style="width: 35px;height: 35px;" src="${pageContext.request.contextPath}/dist/img/load/comment_loading.gif" width="auto" height="auto" />
                            </div>
                        </center> </h2>
                    <ol class="comment-list">
                        <c:forEach items="${article.comments}" var="comment" varStatus="status">
                            <c:set var="floor" value="0"></c:set>
                            <c:if test="${empty comment.fatherId}">
                                <c:set var="floor" value="${floor+1}"></c:set>
                                <div id="anchor">
                                    <div id="comment-${comment.id}"></div>
                                </div>
                                <li class="wow" data-wow-delay="0.3s" id="comment-${comment.id}">
                                    <div id="${comment.id}" class="comment-body">
                                        <div class="comment-author vcard">
                                            <c:choose>
                                                <c:when test="${empty comment.userId}">
                                                    <img class="avatar" src="${pageContext.request.contextPath}/dist/img/headPortrait/headerDef.png" alt="avatar" data-original="" style="display: block;" />
                                                    <strong> <a href="${pageContext.request.contextPath}/go/?url=${comment.address}/" rel="external nofollow" target="_blank" class="url">${comment.visitor.vName}</a> </strong>
                                                    <span class="comment_ip_home" >&nbsp;
                                                        <span class="WB-OS">
                                                        <img src="${pageContext.request.contextPath}/dist/img/browseInfo/${comment.browserInfo}.png" title="${comment.browserInfo}" alt="${comment.browserInfo}" />
                                                        <img src="${pageContext.request.contextPath}/dist/img/browseInfo/${comment.systemVersion}.png" title="${comment.systemVersion}" alt="${comment.systemVersion}"/>
                                                        </span>
                                                    </span>
                                                    <span class="comment-meta commentmetadata">
                                                        <a href=""></a><br />
                                                        <span class="comment-aux">
                                                            <span class="reply" >
                                                                <a style="" rel="nofollow" at="${comment.id}" class="comment-reply-link" href="javascript:void(0)"
                                                                   onclick="" aria-label="回复给${comment.visitor.vName}">
                                                                    回复</a>
                                                            </span>
                                                        </span>
                                                            ${comment.dateTxt} <span class="floor"> &nbsp;${floor}楼 </span>
                                                    </span>
                                                </c:when>
                                                <c:otherwise>
                                                    <img class="avatar" src="" alt="avatar" data-original="" style="display: block;" />
                                                    <strong> <a href="${pageContext.request.contextPath}/go/?url=${comment.address}/" rel="external nofollow" target="_blank" class="url">${comment.user.userName}</a> </strong>
                                                    <span class="comment_ip_home" style="display: block;">&nbsp;
                                                        <span class="WB-OS">
                                                        <img src="${pageContext.request.contextPath}/dist/img/browseInfo/${comment.browserInfo}.png" title="${comment.browserInfo}" alt="${comment.browserInfo}" />
                                                        <img src="${pageContext.request.contextPath}/dist/img/browseInfo/${comment.systemVersion}.png" title="${comment.systemVersion}" alt="${comment.systemVersion}"/>
                                                        </span>
                                                    </span>
                                                    <span class="comment-meta commentmetadata">
                                                            <a href=""></a><br />
                                                            <span class="comment-aux">
                                                                <span class="reply">
                                                                    <a rel="nofollow" class="comment-reply-link" href="javascript:void(0)"
                                                                       onclick="reply(this)" aria-label="回复给${comment.user.userName}">
                                                                        回复</a>
                                                                </span>
                                                            </span>
                                                                ${comment.dateTxt} <span class="floor"> &nbsp;${floor}楼 </span>
                                                        </span>
                                                    <%--<a class="vip2" title="评论达人 VIP.2"><i class="fa fa-vimeo-square"></i><span class="lv">2</span></a>--%>
                                                </c:otherwise>
                                            </c:choose>

                                        </div>
                                        <p>${comment.content}</p>
                                   <!-- 待审评论区域 -->
                                    </div>
                                    <ul class="children">
                                        <c:set var="floor2" value="0"/>
                                     <c:forEach items="${article.comments}" var="comment2" varStatus="status">
                                         <c:if test="${comment2.fatherId eq comment.id}">
                                          <c:set var="floor2" value="${floor2+1}"/>
                                             <div id="anchor">
                                                 <div id="comment-${comment2.id}"></div>
                                             </div>
                                             <li class="wow" data-wow-delay="0.3s" id="comment-${comment2.id}">
                                                 <div id="${comment2.id}" class="comment-body">
                                                     <div class="comment-author vcard">
                                                         <c:choose>
                                                             <c:when test="${empty comment2.userId}">
                                                                 <img class="avatar" src="${pageContext.request.contextPath}/dist/img/headPortrait/headerDef.png" alt="avatar" data-original="" style="display: block;" />
                                                                 <strong> <a href="${pageContext.request.contextPath}/go/?url=${comment2.address}/" rel="external nofollow" target="_blank" class="url">${comment2.visitor.vName}</a> </strong>
                                                                 <span class="comment_ip_home">&nbsp;
                                                            <span class="WB-OS">
                                                            <img src="${pageContext.request.contextPath}/dist/img/browseInfo/${comment2.browserInfo}.png" title="${comment2.browserInfo}" alt="${comment2.browserInfo}" />
                                                            <img src="${pageContext.request.contextPath}/dist/img/browseInfo/${comment2.systemVersion}.png" title="${comment2.systemVersion}" alt="${comment2.systemVersion}"/>
                                                            </span>
                                                        </span>
                                                                 <span class="comment-meta commentmetadata">
                                                                <a href=""></a><br />
                                                                <span class="comment-aux">
                                                                    <span class="reply">
                                                                        <a rel="nofollow" at="${comment2.id}" class="comment-reply-link" href="javascript:void(0)"
                                                                           onclick="" aria-label="回复给${comment2.visitor.vName}">
                                                                            回复</a>
                                                                    </span>
                                                                </span>
                                                                    ${comment2.dateTxt} <span class="floor"> &nbsp;${floor2}层 </span>
                                                            </span>
                                                             </c:when>
                                                             <c:otherwise>
                                                                 <img class="avatar" src="" alt="avatar" data-original="" style="display: block;" />
                                                                 <strong> <a href="${pageContext.request.contextPath}/go/?url=${comment2.address}/" rel="external nofollow" target="_blank" class="url">${comment2.user.userName}</a> </strong>
                                                                 <span class="comment_ip_home" style="display: block;">&nbsp;
                                                            <span class="WB-OS">
                                                            <img src="${pageContext.request.contextPath}/dist/img/browseInfo/${comment2.browserInfo}.png" title="${comment2.browserInfo}" alt="${comment2.browserInfo}" />
                                                            <img src="${pageContext.request.contextPath}/dist/img/browseInfo/${comment2.systemVersion}.png" title="${comment2.systemVersion}" alt="${comment2.systemVersion}"/>
                                                            </span>
                                                        </span>
                                                                 <span class="comment-meta commentmetadata">
                                                                <a href=""></a><br />
                                                                <span class="comment-aux">
                                                                    <span class="reply">
                                                                        <a rel="nofollow" class="comment-reply-link" href="javascript:void(0)"
                                                                           onclick="reply(this)" aria-label="回复给${comment2.user.userName}">
                                                                            回复</a>
                                                                    </span>
                                                                </span>
                                                                    ${comment2.dateTxt} <span class="floor"> &nbsp;${floor2}楼 </span>
                                                            </span>
                                                                 <%--<a class="vip2" title="评论达人 VIP.2"><i class="fa fa-vimeo-square"></i><span class="lv">2</span></a>--%>
                                                             </c:otherwise>
                                                         </c:choose>
                                                     </div>
                                                 </div>
                                                 <p><span class="at">@<a href="#comment-${comment.id}"> ${comment.visitor.vName!=null?comment.visitor.vName:comment.user.uName}</a></span>   ${comment2.content}</p>
                                                 <!-- 待审评论区域 -->
                                                     <ul class="children">
                                                         <c:forEach items="${article.comments}" var="comment3" varStatus="status">
                                                         <c:if test="${comment3.fatherId eq comment2.id}">
                                                         <c:set var="floor2" value="${floor2+1}"/>
                                                         <div id="anchor">
                                                             <div id="comment-${comment3.id}"></div>
                                                         </div>
                                                         <li class="wow" data-wow-delay="0.3s" id="comment-${comment3.id}">
                                                             <div id="${comment3.id}" class="comment-body">
                                                                 <div class="comment-author vcard">
                                                                     <c:choose>
                                                                         <c:when test="${empty comment3.userId}">
                                                                             <img class="avatar" src="${pageContext.request.contextPath}/dist/img/headPortrait/headerDef.png" alt="avatar" data-original="" style="display: block;" />
                                                                             <strong> <a href="${pageContext.request.contextPath}/go/?url=${comment3.address}/" rel="external nofollow" target="_blank" class="url">${comment3.visitor.vName}</a> </strong>
                                                                             <span class="comment_ip_home">&nbsp;
                                                            <span class="WB-OS">
                                                            <img src="${pageContext.request.contextPath}/dist/img/browseInfo/${comment3.browserInfo}.png" title="${comment3.browserInfo}" alt="${comment3.browserInfo}" />
                                                            <img src="${pageContext.request.contextPath}/dist/img/browseInfo/${comment3.systemVersion}.png" title="${comment3.systemVersion}" alt="${comment3.systemVersion}"/>
                                                            </span>
                                                        </span>
                                                                             <span class="comment-meta commentmetadata">
                                                                <a href=""></a><br />
                                                                <span class="comment-aux">
                                                                    <span class="reply">
                                                                        <a rel="nofollow" at="${comment3.id}" class="comment-reply-link" href="javascript:void(0)"
                                                                           onclick="" aria-label="回复给${comment3.visitor.vName}">
                                                                            回复</a>
                                                                    </span>
                                                                </span>
                                                                    ${comment3.dateTxt} <span class="floor"> &nbsp;${floor2}层 </span>
                                                            </span>
                                                                         </c:when>
                                                                         <c:otherwise>
                                                                             <img class="avatar" src="" alt="avatar" data-original="" style="display: block;" />
                                                                             <strong> <a href="${pageContext.request.contextPath}/go/?url=${comment3.address}/" rel="external nofollow" target="_blank" class="url">${comment3.user.userName}</a> </strong>
                                                                             <span class="comment_ip_home" style="display: block;">&nbsp;
                                                                             <span class="WB-OS">
                                                                              <img src="${pageContext.request.contextPath}/dist/img/browseInfo/${comment3.browserInfo}.png" title="${comment3.browserInfo}" alt="${comment3.browserInfo}" />
                                                                                <img src="${pageContext.request.contextPath}/dist/img/browseInfo/${comment3.systemVersion}.png" title="${comment3.systemVersion}" alt="${comment3.systemVersion}"/>
                                                                             </span>
                                                                            </span>
                                                                             <span class="comment-meta commentmetadata">
                                                                <a href=""></a><br />
                                                                <span class="comment-aux">
                                                                    <span class="reply">
                                                                        <a rel="nofollow" class="comment-reply-link" href="javascript:void(0)"
                                                                           onclick="reply(this)" aria-label="回复给${comment3.user.userName}">
                                                                            回复</a>
                                                                    </span>
                                                                </span>
                                                                    ${comment3.dateTxt} <span class="floor"> &nbsp;${floor2}楼 </span>
                                                            </span>
                                                                             <%--<a class="vip2" title="评论达人 VIP.2"><i class="fa fa-vimeo-square"></i><span class="lv">2</span></a>--%>
                                                                         </c:otherwise>
                                                                     </c:choose>
                                                                 </div>
                                                                 <p><span class="at">@<a href="#comment-${comment2.id}"> ${comment2.visitor.vName!=null?comment2.visitor.vName:comment2.user.uName}</a></span>   ${comment3.content}</p>
                                                                 <!-- 待审评论区域 -->
                                                             </div>
                                                                 <ul class="children">
                                                                     <c:forEach items="${article.comments}" var="comment4" varStatus="status">
                                                                         <c:if test="${comment4.fatherId eq comment3.id}">
                                                                                     <c:set var="floor2" value="${floor2+1}"/>
                                                                                 <div id="anchor">
                                                                                     <div id="comment-${comment4.id}"></div>
                                                                                 </div>
                                                                                 <li class="wow" data-wow-delay="0.3s" id="comment-${comment4.id}">
                                                                                 <div id="${comment4.id}" class="comment-body">
                                                                                     <div class="comment-author vcard">
                                                                                         <c:choose>
                                                                                             <c:when test="${empty comment4.userId}">
                                                                                                 <img class="avatar" src="${pageContext.request.contextPath}/dist/img/headPortrait/headerDef.png" alt="avatar" data-original="" style="display: block;" />
                                                                                                 <strong> <a href="${pageContext.request.contextPath}/go/?url=${comment4.address}/" rel="external nofollow" target="_blank" class="url">${comment4.visitor.vName}</a> </strong>
                                                                                                 <span class="comment_ip_home">&nbsp;
                                                                                                <span class="WB-OS">
                                                                                                <img src="${pageContext.request.contextPath}/dist/img/browseInfo/${comment4.browserInfo}.png" title="${comment4.browserInfo}" alt="${comment4.browserInfo}" />
                                                                                                <img src="${pageContext.request.contextPath}/dist/img/browseInfo/${comment4.systemVersion}.png" title="${comment4.systemVersion}" alt="${comment4.systemVersion}"/>
                                                                                                </span>
                                                                                             </span>
                                                                                                 <span class="comment-meta commentmetadata"><br />
                                                                                            <span class="comment-aux">
                                                                                            </span>
                                                                                                ${comment4.dateTxt} <span class="floor"> &nbsp;${floor2}层 </span>
                                                                                        </span>
                                                                                             </c:when>
                                                                                             <c:otherwise>
                                                                                                 <img class="avatar" src="" alt="avatar" data-original="" style="display: block;" />
                                                                                                 <strong> <a href="${pageContext.request.contextPath}/go/?url=${comment4.address}/" rel="external nofollow" target="_blank" class="url">${comment4.user.userName}</a> </strong>
                                                                                                 <span class="comment_ip_home" style="display: block;">&nbsp;
                                                                                                <span class="WB-OS">
                                                                                                <img src="${pageContext.request.contextPath}/dist/img/browseInfo/${comment4.browserInfo}.png" title="${comment4.browserInfo}" alt="${comment4.browserInfo}" />
                                                                                                <img src="${pageContext.request.contextPath}/dist/img/browseInfo/${comment4.systemVersion}.png" title="${comment4.systemVersion}" alt="${comment4.systemVersion}"/>
                                                                                                </span>
                                                                                            </span>
                                                                                                 <span class="comment-meta commentmetadata">
                                                                                                   <br />
                                                                                     ${comment4.dateTxt} <span class="floor"> &nbsp;${floor2}楼 </span>
                                                                                  </span>
                                                                                                 <%--<a class="vip2" title="评论达人 VIP.2"><i class="fa fa-vimeo-square"></i><span class="lv">2</span></a>--%>
                                                                                             </c:otherwise>
                                                                                         </c:choose>
                                                                                     </div>
                                                                                     <p><span class="at">@<a href="#comment-${comment3.id}"> ${comment3.visitor.vName!=null?comment3.visitor.vName:comment3.user.uName}</a></span>   ${comment4.content}</p>
                                                                                     <!-- 待审评论区域 -->
                                                                                 </div>
                                                                                 </li>
                                                                         </c:if>
                                                                     </c:forEach>
                                                                 </ul>
                                                                 <!-- .children -->
                                                         </li>

                                                     </c:if>
                                                     </c:forEach>
                                                     </ul>
                                                     <!-- .children -->

                                         </c:if>
                                     </c:forEach>
                                    </ul>
                                    <!-- .children -->
                                </li>
                            </c:if>
                        </c:forEach>
                    </ol>

            </main>
            <!-- .site-main -->
        </div>
        <!-- .右侧内容 -->
        <div id="sidebar" class="widget-area">
            <div class="wow" data-wow-delay="0.5s">
                <aside id="hot_post-4" class="widget widget_hot_post wow" data-wow-delay="0.3s">
                    <h3 class="widget-title"><i class="fa fa-bars"></i>热门文章</h3>
                    <div id="hot_post_widget">
                        <ul>
                            <c:forEach items="${rightInfo.hots}" var="blog" varStatus="status">
                                <li><span class="li-icon li-icon-${status.count}">${status.count} </span><a href="${pageContext.request.contextPath}/article/articleInfo/${blog.blogId}">${blog.blogTitle}</a></li>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="clear"></div>
                </aside>
                <%--<aside id="php_text-7" class="widget widget_php_text wow" data-wow-delay="0.3s">--%>
                <%--<div class="textwidget widget-text">--%>
                <%--<a href="#" title="业务接单" rel="nofollow" target="_blank"><img src="${pageContext.request.contextPath}/dist/img/service/serviceHelp1.jpg" alt="业务接单" title="业务接单" /></a>--%>
                <%--</div>--%>
                <%--<div class="clear"></div>--%>
                <%--</aside>--%>
                <aside id="hot_comment-4" class="widget widget_hot_comment wow" data-wow-delay="0.3s">
                    <h3 class="widget-title"><i class="fa fa-bars"></i>热评文章</h3>
                    <div id="hot_comment_widget">
                        <ul>
                            <c:forEach items="${rightInfo.hotComments}" var="blog" varStatus="status">
                                <li><span class="li-icon li-icon-${status.count}">${status.count}</span>
                                    <a href="${pageContext.request.contextPath}/article/articleInfo/${blog.blogId}" rel="bookmark" title=" (${blog.blogCommentCount}条评论)">
                                            ${blog.blogTitle}</a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="clear"></div>
                </aside>
            </div>
        </div>
        <div class="clear"></div>
        <div class="clear"></div>
    </div>
    <!-- 导入底部 -->
    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/page/common/footer.jsp"/>
</div>

<!-- 头部导入头部 -->
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/page/common/jsPart.jsp"/>
<script>
    var commentURL = contextPath+"/article/comment";
    var layedit;
    var form;
    layui.use(['form', 'layedit', 'laydate'], function(){
        var layer = layui.layer
            ,laydate = layui.laydate;
        layedit = layui.layedit;
        form = layui.form;
            var index =layedit.build('commentConent', {
            tool: ['link' //超链接
                ,'unlink' //清除链接
                ,'face' //表情
                ,'image']});


        form.on('submit(commentFrom)', function(data){
            $("#loading").hide();
            $("#success").hide();
            $("#error").hide();
            $("#error").val("");
            //等待提交
            $("#loading").slideDown();
            //提交按钮变灰
            $("#submit").attr('disabled', true).fadeTo('slow', 0.5);
            //url
            var url = $(this).attr("action");
            //表单提交
            $.post(commentURL,data.field,
                function (data) {
                    if(data.status==1){
                        $("#loading").hide();
                        //评论成功
                        $("#success").slideDown();
                        setTimeout(function () {
                            $("submit").attr('disabled', false).fadeTo('slow', 1);
                            window.location.reload();
                        }, 3000);
                    }else {
                        $("#loading").hide();
                        $("#error").html('<i class="glyphicon glyphicon-info-sign" style="color: #01AAED"> </i>'+data.msg).slideDown();
                        setTimeout(function() {
                            $("#submit").attr('disabled', false).fadeTo('slow', 1);
                            $('#error').slideUp();
                        }, 3000);
                    }
                });
            return false;
        });



        //日期
        laydate.render({
            elem: '#date'
        });
        laydate.render({
            elem: '#date1'
        });


        //自定义验证规则
        form.verify({
            pass: [
                /^[\S]{6,12}$/
                ,'密码必须6到12位，且不能出现空格'
            ],
            article_desc:function(value){
                layedit.sync(index);
            }
        });

        //监听指定开关
        form.on('switch(switchTest)', function(data){
            if(this.checked){
                layer.tips('有回复时将收到邮箱提醒~', data.othis);
            }else {
                layer.tips('不会收到邮箱提醒~', data.othis);
            }
        });

        //监听提交


        // //表单初始赋值
        // form.val('example', {
        //     "username": "贤心" // "name": "value"
        //     ,"password": "123456"
        //     ,"interest": 1
        //     ,"like[write]": true //复选框选中状态
        //     ,"close": true //开关状态
        //     ,"sex": "女"
        //     ,"desc": "我爱 layui"
        // })


    });
    /* 点击回复 回复框出现 */
    function  replyDiv(reply) {
        $("#respond").hide();
        $("#cancel-comment-reply-link").show();
        var commentId = reply.attr("id");
        $("#commentFatherId").val(commentId);
        reply.after($("#respond").show());
        var index1 =layedit.build('commentConent', {
            tool: ['link' //超链接
                ,'unlink' //清除链接
                ,'face' //表情
                ,'image']});
        form.verify({
            article_desc:function(value){
                layedit.sync(index1);
            }
        });
    }


</script>
</body>
</html>
