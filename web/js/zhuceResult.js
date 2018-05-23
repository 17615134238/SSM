
    setTimeout("document.location.href='denglu.jsp'",5000);
    var n = 4;
    setInterval(function () {
        $("#regist").text("注册成功" + n-- + "秒后跳转到登录页面");
    }, 1000);
