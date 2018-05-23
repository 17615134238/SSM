<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
    <title>查询</title>
    <link rel="stylesheet" href="/SSM/css/bootstrap.min.css">
    <link rel="stylesheet" href="/SSM/css/chaxun.css">
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
            <div class="container t">
                <form>
                    <div class="row">
                        <div class="col-md-4">
                            <label for="id1">商家ID</label>
                            <input class="clearAll" type="text" id="id1">
                        </div>
                        <div class="col-md-4 ">
                            <label for="name1">商家名</label>
                            <input class="clearAll" type="text" id="name1">
                        </div>
                        <div class="col-md-4">
                            <label for="tele">电话</label>
                            <input class="clearAll" type="text" id="tele">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <label>商家分类</label>
                            <input class="box01 clearAll" type="radio" name="rel" value="中餐">
                            <span>中餐</span>
                            <input class="clearAll" type="radio" name="rel" value="韩餐">
                            <span>韩餐</span>
                            <input class="clearAll" type="radio" name="rel" value="日料">
                            <span>日料</span>
                            <input class="clearAll" type="radio" name="rel" value="" checked>
                            <span>全部</span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <label>商家地址</label>
                            <select id="area">
                                <option value="">全部</option>
                                <option value="甘井子区">甘井子区</option>
                                <option value="中山区">中山区</option>
                                <option value="西岗区">西岗区</option>
                                <option value="高新园区">高新园区</option>
                                <option value="沙河口区">沙河口区</option>
                            </select>
                        </div>
                        <div class="col-md-8">
                            <label>详细地址</label>
                            <input id="addr" class="box02 clearAll" type="text">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <label>人均消费</label>
                            <input id="moneyFrom" class="clearAll" type="text" placeholder="请输入数字">
                        </div>
                        <div class="col-md-4 kk01">
                            <label class="box03">~</label>
                            <input id="moneyTo" class="clearAll kk02" type="text" placeholder="请输入数字">
                        </div>
                        <div class="col-md-3 kk">
                            <span class="yuan">元/人</span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 col-xs-6">
                            <input id="clear" class="but1" type="reset" value="清空">
                        </div>
                        <div class="col-md-6 col-xs-6">
                            <input id="chaxun" class="but2" type="button" value="查询">
                        </div>
                    </div>
                </form>
                <hr>
                <div class="t-top">
                    <input id="clear2" type="button" value="删除所选项">
                    <span class="left">第<span id="nowPage" class="red">1</span>页/共<span id="pages" class="red">1</span>页</span>
                    <span class="right">共查到
                    <c:if test="${business1!=null}">
                       <span class="red" id="information">1</span>
                    </c:if>
                    <c:if test="${business1==null}">
                    <span class="red" id="information">0</span>
                    </c:if>
                        条信息</span>
                </div>
                <div class="t-md table-responsive">
                    <table id="myTable" class="table table-bordered table-condensed table-striped">
                        <thead>
                        <tr class="danger">
                            <th>
                                <input  id="check0" type="checkbox">
                            </th>
                            <th >商家ID</th>
                            <th>商家名</th>
                            <th>电话</th>
                            <th >分类</th>
                            <th >地址</th>
                            <th >详细地址</th>
                            <th >人均</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:if test="${business1!=null}">
                        <tr>
                            <td><input class="check1" type="checkbox" name="chec"></td>
                            <td>${business1.bnsId}</td>
                            <td>${business1.bnsName}</td>
                            <td>${business1.bnsTel}</td>
                            <td>${business1.bnsGroup}</td>
                            <td>${business1.bnsArea}</td>
                            <td>${business1.bnsAddr}</td>
                            <td>${business1.bnsMoney}</td>
                            <td><a href="tianjia.jsp?id=${business1.bnsId}"><input type="button" value="修改"></a></td>
                        </tr>
                        </c:if>
                        <%
                            session.removeAttribute("business1");
                            session.removeAttribute("business");
                        %>
                        </tbody>
                    </table>
                </div>
                <div class="t-bottom">
                    <input id="first" type="button" value="首页">
                    <input id="previous" type="button" value="上一页">
                    <input id="next" type="button" value="下一页" >
                    <input id="end" type="button" value="末页">
                    <input id="jump" type="button" value="跳转到">
                    <input id="num" type="text" onkeyup="value=value.replace(/[^\d]/g,'')">
                    <span>页   显示</span>
                    <select id="rowNum">
                        <option selected>5</option>
                        <option>10</option>
                    </select>
                    <span>行</span>

                    <input type="button" id="out" value="退出登录">
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
</div>
<script src="/SSM/js/jquery1.12.4.min.js"></script>
<script src="/SSM/js/bootstrap.min.js"></script>
<script src="/SSM/js/chaxun.js"></script>
</body>
</html>