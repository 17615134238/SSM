<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
    <title>添加</title>
    <link rel="stylesheet" href="/SSM/css/bootstrap.min.css">
    <link rel="stylesheet" href="/SSM/css/tianjia.css">
</head>

<body onload="riqi()">
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
        <div class="image">
            <c:if test="${param.id!=null}">
            <form class="container t">
                <div class="row">
                    <div class="col-md-6 left">
                        <label>商家ID</label>
                        <input type="text" id="bnsId" value="${param.id}" disabled="true"></input>
                        </c:if>
                        <c:if test="${param.id==null}">
                        <form class="container t" action="/SSM/InsertBns" method="post">
                            <div class="row">
                                <div class="col-md-6 left">
                                    <label>商家ID</label>
                                    <span id="businessId">id系统自动生成</span>
                                    </c:if>
                                </div>
                                <div class="col-md-6">
                                    <label for="name1">商家名</label>
                                    <input class="clearAll" type="text" name="bnsName" id="name1" required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 left">
                                    <label for="tele">电话</label>
                                    <input class="clearAll" type="text" name="bnsTel" id="tele" required>
                                </div>
                                <div class="col-md-6">
                                    <label>商家分类</label>
                                    <input id="clear1" class="box01" type="radio" name="bnsGroup" value="中餐" checked>
                                    <span>中餐</span>
                                    <input class="clearAll" type="radio" name="bnsGroup" value="韩餐">
                                    <span>韩餐</span>
                                    <input class="clearAll" type="radio" name="bnsGroup" value="日料">
                                    <span>日料</span>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 left">
                                    <label>商家地址</label>
                                    <input class="clearAll" typt="text" list="lis" name="bnsArea" required>
                                    <datalist id="lis">
                                        <option value="甘井子区">甘井子区</option>
                                        <option value="中山区">中山区</option>
                                        <option value="西岗区">西岗区</option>
                                        <option value="高新园区">高新园区</option>
                                        <option value="沙河口区">沙河口区</option>
                                    </datalist>
                                </div>
                                <div class="col-md-6">
                                    <label>详细地址</label>
                                    <input class="box02 clearAll" name="bnsAddr" type="text" required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 left">
                                    <label>人均消费</label>
                                    <input id="money" class="clearAll" name="bnsMoney" type="text" placeholder="请输入数字"
                                           required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 col-xs-6">
                                    <input id="clear" class="but1" type="reset" value="清空">
                                </div>
                                <div class="col-md-6 col-xs-6">
                                    <c:if test="${param.id!=null}">
                                        <input id="update" class="but2" type="button" value="保存">
                                    </c:if>
                                    <c:if test="${param.id==null}">
                                        <input class="but2" type="submit" value="添加">
                                    </c:if>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <jsp:include page="footer.jsp"></jsp:include>
        </div>
        <script src="/SSM/js/jquery1.12.4.min.js"></script>
        <script src="/SSM/js/bootstrap.min.js"></script>
        <script src="/SSM/js/tianjia.js"></script>
    </div>
</body>
</html>