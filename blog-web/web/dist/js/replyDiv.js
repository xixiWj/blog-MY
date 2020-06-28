
class reply extends React.Component {
    constructor(props) {
        super(props);
        this.state = {isToggleOn: true};
// 这边绑定是必要的，这样 `this` 才能在回调函数中使用
        this.handleClick = this.handleClick.bind(this);
    }
    handleClick() {
        this.setState(prevState => ({
            isToggleOn: !prevState.isToggleOn
        }));
    }
    render() {
        return (
            <button onClick={this.handleClick}>
                {this.state.isToggleOn ? 'ON' : 'OFF'}
            </button>
        );
    }
}


ReactDOM.render(
    <div id="respond" className="comment-respond wow" data-wow-delay="0.3s">
    <h3 id="reply-title" className="comment-reply-title" style="font-size: 18px"><i
        className="layui-icon layui-icon-reply-fill"></i>发表评论
        <small><a rel="nofollow" id="cancel-comment-reply-link" href="/3275.html#respond"
                  style="display:none;">取消回复</a></small>
    </h3>
    <form className="layui-form layui-form-pane" action="" id="submitFrom">
        <div className="author_avatar author_avatar_info_img">
            <div className="comments_box_tips">
                <p className="comments_tips">请在下方填写评论信息</p>
            </div>
        </div>
        <div id="comment-author-info">
            <div className="layui-form-item">
                <input type="hidden" name="blogId" value="${article.blog.blogId}"/>
                <label className="layui-form-label">昵称 <span className="required">*</span></label>
                <div className="layui-input-block">
                    <input type="text" name="vName" lay-verify="title" autoComplete="off" placeholder=""
                           className="layui-input"/>
                </div>
            </div>
            <div className="layui-form-item">
                <label className="layui-form-label">邮箱 <span className="required">*</span></label>
                <div className="layui-input-block">
                    <input type="text" name="vEmail" lay-verify="email" placeholder="" autoComplete="off"
                           className="layui-input"/>
                </div>
            </div>
            <div className="layui-form-item">
                <label className="layui-form-label">网址 </label>
                <div className="layui-input-block">
                    <input type="text" name="vWebAddress" placeholder="" autoComplete="off" className="layui-input">
                </div>
            </div>
            <div className="layui-form-item layui-form-text">
                <div className="layui-input-block">
                    <textarea placeholder="世界之大，不发表一下看法？" name="content" className="layui-textarea"></textarea>
                </div>
            </div>
            <!-- 成功 -->
            <div id="success" style="display: none;"><i className="layui-icon layui-icon-ok-circle"
                                                        style="color: #01AAED"></i> 评论成功，刷新页面后查看~
            </div>
            <!-- 提交时 -->
            <div id="loading" style="display: none;"><img
                src="${pageContext.request.contextPath}/dist/img/load/load-avatar.gif"/>正在提交, 请稍候...
            </div>
            <!-- 错误时 -->
            <div id="error" style="display: none;"><i className="glyphicon glyphicon-info-sign"
                                                      style="color: #01AAED"> </i></div>
            <div className="layui-form-item">
                <button id="submit" className="layui-btn layui-btn-primary layui-btn-fluid" lay-submit=""
                        lay-filter="commentFrom">提交评论
                </button>
            </div>
            <div className="layui-form-item">
                <label className="layui-form-label" style="width: 169px;">有回复时邮件通知我</label>
                <div className="layui-input-block">
                    <input type="checkbox" checked="" name="open" lay-skin="switch" lay-filter="switchTest"
                           lay-text="开|关"/>
                    <div className="layui-unselect layui-form-switch layui-form-onswitch" lay-skin="_switch">
                        <em>开</em>
                        <i></i>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>,document.getElementById('root'));