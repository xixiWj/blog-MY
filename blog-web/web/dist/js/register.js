var path = $('#path').val();
/*
   * 注册表单验证
   */
function  register(){
    $('#register_error').fadeOut();
    //密码位数
    if($('#user_password')<8){
        layer.msg('密码位数不能小于8位',{time: 700,shift: 6})
        return;
    }
    //
    if($('#user_password').val()!=$("#user_password2").val()){
        layer.msg('两次密码输入不一致',{time: 700,shift: 6})
        return;
    }
    // 实用ajax提交表单
    $.post(path+'/user/register', $("#form2").serialize(), function(data) {
        if(data.result==1){
            //注册成功提示信息
            layer.alert(data.msg, {
                icon: 6,
                skin: 'layer-ext-moon'
            },function(){
                window.location = path+"/user/toLogin";
            })
        }else if(data.result==0){
            //编写错误信息
            $('#register_error i').text(data.msg);
            $('#register_error').fadeIn();
        }else {
            layer.alert(data.msg, {
                icon: 0,
                skin: 'layer-ext-moon'
            })
        }
    }, 'json');
}
(function () {

    $('.btn').mouseover(function () {
        $(this).addClass('btn-hover');
    }).mouseout(function () {
        $(this).removeClass('btn-hover');
    });

    /**
     *
     */
    $('#forgetPwdCode').click(function () {
        var ecbtn = $("#forgetPwdCode");
        $.post(path+"/user/forgetPwdCode",
            {
                userEmail:$('[id=user_email]').val()
            },
            function(data){
                if(data.valid==true){
                    test.init(ecbtn)
                }else{
                    layer.msg(data.msg,{"icon":0,time:2000},function () {

                    });
                }
            },
            "json"
        );
    })
    /**
     * 按钮实现读秒
     *
     *
     * 邮箱验证码 采用ajax 请求
     */

    $('#eamilCode').click(function() {
        var ecbtn = $("#eamilCode");
        $.post(path+"/user/emailCode",
            {
                userEmail:$('[id=user_email]').val()
            },
            function(data){
                if(data.valid==true){
                    test.init(ecbtn)
                }else{
                    layer.msg(data.msg,{"icon":0,time:2000},function () {

                    });
                }
            },
            "json"
        );
    });


    /**
     * 发送邮箱验证码读秒函数
     * @type {{node: null, count: number, start: start, init: init}}
     */
    var test = {
        node:null,
        count:60,
        start:function(){
            if(this.count > 0){
                this.node.html(this.count--+"秒后重新获取");
                var _this = this;
                setTimeout(function(){
                    _this.start();
                },1000);
            }else{
                this.node.attr("disabled",false);
                this.node.html( "重新获取");

                //60秒读完，变回开始背景颜色，在这里添加。
                this.count = 60;
            }
        },
        //初始化
        init:function(node){
            this.node = node;
            this.node.attr("disabled",true);
            this.start();
        },
        //恢复
        reset:function (node) {
            this.node = node;
            this.node.attr("active",true);
            this.node.attr("value","获取验证码");
        }
    };


})();