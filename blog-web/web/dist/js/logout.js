var contextPath = $('#PageContext').val();

function  logout() {
    $.ajax({
        type:'POST',
        url:contextPath+"/user/logout",
        success:function (data) {
            console.info(data);
            if(data.rel==1){
                console.info(data.msg);
                layer.msg(data.msg,{time:700},function () {
                    window.location=contextPath+'/user/toLogin';
                })
            }else {
                layer.msg(data.msg,{time:700},function () {
                })
            }
        }
    })
}


