<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/22 0022
  Time: 9:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<input type="button" value="<spring:message code="se"></spring:message>">
<spring:message code="se" var="btnSelect"></spring:message>
<form action="/SSM/testLanguage" method="post">
    <input type="text" name="userName">

    <input type="submit" value="${btnSelect}">
</form>
<a href="/SSM/changeLanguage?locale=zh_CN">中文</a>
<a href="/SSM/changeLanguage?locale=en_US">英文</a>
</body>
</html>
