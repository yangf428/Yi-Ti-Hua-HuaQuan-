<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2018/6/29
  Time: 17:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <base href="<%=basePath%>">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link href="../img/head/favicon.ico" mce_href="../img/head/favicon.ico" rel='icon' type='image/x-icon'/>
  <title>首页</title>
</head>
<body>
<jsp:include page="head.jsp"></jsp:include>
<jsp:include page="content.jsp"></jsp:include>

</body>
</html>