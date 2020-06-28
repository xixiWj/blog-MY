/**
 * 右侧信息栏 出现
 */
/*导航*/
function infoIn(){
    var banOffTop=$(".sidebar-roll").offset().top;//获取到距离顶部的垂直距离
    var scTop=0;//初始化垂直滚动的距离
    var height =$(".sidebar-roll").height();
    $(document).scroll(function(){
        scTop=$(this).scrollTop();//获取到滚动条拉动的距离
        //console.log(scTop);查看滚动时，垂直方向上，滚动条滚动的距离
        if(scTop>=(banOffTop+height)){
            //核心部分：当滚动条拉动的距离大于等于导航栏距离顶部的距离时，添加指定的样式
            if(!$(".sidebar-roll").hasClass("follow")){
                $(".sidebar-roll").fadeOut();
                $(".sidebar-roll").addClass("follow");
                $(".sidebar-roll").fadeIn();
            }
        }else {
            $(".sidebar-roll").removeClass("follow");
        }

    })
}



(
    function (){
        infoIn();
    })();