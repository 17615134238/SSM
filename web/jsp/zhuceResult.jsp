<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
    <title>注册</title>
    <link rel="stylesheet" href="/SSM/css/bootstrap.min.css">
    <link rel="stylesheet" href="/SSM/css/zhuce.css">
</head>
<body>
<div class="box">
    <jsp:include page="header.jsp"></jsp:include>
    <nav>
        <div class="row">
            <div class="col-md-offset-1 col-md-1 col-xs-2">
                <a href="denglu.jsp">登录</a>
            </div>
            <div class="col-md-1 col-xs-2">
                <a href="zhuce.jsp">注册</a>
            </div>
            <div class="col-md-2 col-xs-3 shangjia">
                <a class="move">
                    <img id="dowm1" src="/SSM/image/down.png">
                    <img id="up1" src="/SSM/image/up.png">
                    <span>商家管理</span>
                </a>
            </div>
            <div class="col-md-2 col-md-offset-5 col-xs-offset-2 col-xs-3">
                <c:if test="${userName!=null}">
                    <span>${userName}已登录</span>
                </c:if>
                <c:if test="${userName==null}">
                    <span id="jump">正在注册...</span>
                </c:if>
            </div>
        </div>
        <div class="show2">
            <div class="left">
                <img src="/SSM/image/timg.jpg">
                <a id="qurey" href="/SSM/Qurey">查询</a>
            </div>
            <div class="right">
                <img src="/SSM/image/zj.jpg">
                <a id="add" href="/SSM/Add">添加</a>
            </div>
        </div>
    </nav>
    <div class="md">
        <div class="image">
            <form id="regist" style="color: red;font-size: 20px">注册成功5秒后跳转到登录页面</form>
        </div>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
</div>
<script src="/SSM/js/jquery1.12.4.min.js"></script>
<script src="/SSM/js/bootstrap.min.js"></script>
<script src="/SSM/js/zhuceResult.js"></script>
</body>
</html>