<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
    <title>首页</title>
    <link rel="stylesheet" href="/SSM/css/bootstrap.min.css">
    <link rel="stylesheet" href="/SSM/css/shouye.css">
</head>
<body id="all" onload="riqi()">
<div class="box">
    <jsp:include page="header.jsp"></jsp:include>
    <nav>
       <div class="row">
           <div class="col-md-offset-1 col-md-1 col-xs-2">
               <a href="denglu.jsp" id="login">登录</a>
           </div>
           <div class="col-md-1 col-xs-2">
               <a href="zhuce.jsp" id="regist">注册</a>
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
               <a href="denglu.jsp"><span>请登录</span></a>
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
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                <li data-target="#carousel-example-generic" data-slide-to="3"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <img src="/SSM/image/image_05.png" class="img-responsive" alt="图片未加载">
                </div>
                <div class="item">
                    <img src="/SSM/image/image_11.png" class="img-responsive" alt="图片未加载">
                </div>
                <div class="item">
                    <img src="/SSM/image/image_17.png" class="img-responsive" alt="图片未加载">
                </div>
                <div class="item">
                    <img src="/SSM/image/image_23.jpg" class="img-responsive" alt="图片未加载">
                </div>

            </div>

            <!-- Controls -->
            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">

            </a>
            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">

            </a>
        </div>
    </div>
   <jsp:include page="footer.jsp"></jsp:include>
</div>
<script src="/SSM/js/jquery1.12.4.min.js"></script>
<script src="/SSM/js/bootstrap.min.js"></script>
<script src="/SSM/js/shouye.js"></script>
</body>
</html>