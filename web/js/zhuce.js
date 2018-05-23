function getE(id) {
    return document.getElementById(id);
}

function test1() {
    var name1 =getE("name1");
    if(name1.validity.valueMissing){
        getE("demo1").innerHTML="请输入用户名";
        return;
    }
    else {
        getE("demo1").innerHTML="";
    }
    if(name1.validity.patternMismatch){
        getE("demo1").innerHTML="请按要求输入"
    }
    else {
        getE("demo1").innerHTML="";
    }
}
function test2() {
    var name2 = getE("name2");
    var name3 = getE("name3");
    if(name2.validity.valueMissing){
        getE("demo2").innerHTML="请输入密码";
        return;
    }
    else {
        getE("demo2").innerHTML="";
    }
    if(name2.validity.patternMismatch||name2.value.length>8){
        getE("demo2").innerHTML="请按要求输入"
        return;
    }
    else {
        getE("demo2").innerHTML="";
    }
    if(name2.value!==name3.value){
        getE("demo3").innerHTML="密码要一致"
        return false;
    }
    else {
        getE("demo3").innerHTML="";
        return true;
    }

}
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

    $("#name1").blur(function () {
        var userName = $("#name1").val();
        $.ajax({
            url:"/SSM/user/selectUserByName",
            data:{
                userName:userName
            },
            type:"post",
            dataType:"json",
            timeout:10000,
            success:function (data) {
                var num = data.num;
                if(num>0){
                    $("#demo1").html("用户已存在");
                }
                else {
                    $("#demo1").html("");
                }
            }
        })
    });



    });