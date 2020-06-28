(

    function () {

        $(".btn").hover(function () {
            $(this).addClass('btn-hover')
        },function () {
            $(this).removeClass('btn-hover')
        });

        $("#wp-submit").click(

            function () {
                var prevLink = document.referrer;
                $('#wp-submit').button('loading');
                var name = $("#user_login").val();
                var pwd = $("#user_pass").val();
                var encrypt = new JSEncrypt();
                // var key =mydate.getDay()+ mydate.getHours()+ mydate.getMinutes()+mydate.getSeconds()+mydate.getMilliseconds();
                if (name == "" || pwd == "") {
                    layer.msg("必填项不能为空",{time:700});
                    $('#wp-submit').button('reset');
                } else {
                    $.ajax({
                        type: 'POST',
                        url: '/user/getPublicKey',
                        async: false,
                        data: {
                            'userName': name
                        },
                        success:function(data){
                            if(data.rel==1) {
                                var publicKeyJS = data.publicKey;
                                encrypt.setPublicKey(publicKeyJS);
                                pwd = encrypt.encrypt(pwd);
                                var rememberme = $('input[name="rememberme"]:checked').val();
                                    $.ajax({
                                    type: "POST",
                                    url: '/user/loginVer',
                                    async: false,
                                    data: {
                                        'userName':name,
                                        'userPassword':pwd,
                                        'rememberme':rememberme
                                    },success :function(data){
                                         if(data.result==1){
                                             $('#wp-submit').button('reset');
                                             layer.msg('登陆成功',
                                                 {"icon":1,time:2000}
                                                 ,function () {
                                                     window.location.href = '/admin';
                                                 })
                                         }else {
                                             $('#wp-submit').button('reset');
                                             layer.msg(data.msg,
                                                 {"icon":5,time:2000}
                                                 ,function () {
                                                 })
                                         }
                                    }
                                })

                        }
                        }

                    });
                }
         }
        )



        // function (data) {
        //     localStorage.setItem('loginName', $("#login-name").val());
        //     if (data.code == 1) {
        //         $.toast({
        //             text: data.msg,
        //             heading: heading,
        //             icon: 'success',
        //             showHideTransition: 'fade',
        //             allowToastClose: true,
        //             hideAfter: 1000,
        //             stack: 1,
        //             position: 'top-center',
        //             textAlign: 'left',
        //             loader: true,
        //             loaderBg: '#ffffff',
        //             afterHidden: function () {
        //                 if ($.trim(prevLink) == '') {
        //                     window.location.href = '/admin';
        //                 } else {
        //                     window.location.href = prevLink;
        //                 }
        //             }
        //         });
        //     } else {
        //         $('.login-body').addClass('animate shake');
        //         $.toast({
        //             text: data.msg,
        //             heading: heading,
        //             icon: 'error',
        //             showHideTransition: 'fade',
        //             allowToastClose: true,
        //             hideAfter: 2000,
        //             stack: 1,
        //             position: 'top-center',
        //             textAlign: 'left',
        //             loader: true,
        //             loaderBg: '#ffffff',
        //             afterHidden: function () {
        //                 $('.login-body').removeClass('animate shake');
        //             }
        //         });
        //         $('#btn-login').button('reset');
        //     }
        // }
    }
)();