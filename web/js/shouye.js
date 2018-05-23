function getE(id) {
    return document.getElementById(id);
};

$(document).ready(function () {
    $(".move").mouseenter(function () {
        $(".show2").fadeIn(1000);
        $("#up1").show();
        $("#dowm1").hide();
    });
    $("nav").mouseleave(function () {
        $(".show2").fadeOut(1000);
        $("#up1").hide();
        $("#dowm1").show();
    });


   /* $("#qurey").click(function () {
        $.post("/SSM/memberQurey",{},function (data) {
                document.location.href="/SSM/jsp/chaxun.jsp";
        },"json")
    })

    $("#add").click(function () {
        $.post("/SSM/memberAdd",{},function (data) {
            if(data.num==1){
                document.location.href="/SSM/jsp/tianjia.jsp";
            }else {
                if(confirm("您确定要跳转到登录页面吗")){
                    document.location.href="/SSM/jsp/denglu.jsp";
                }
            }
        },"json")
    })*/


});
