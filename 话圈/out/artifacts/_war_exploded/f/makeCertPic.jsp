<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2018/6/29
  Time: 20:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="servlet.MakeCertPicServlet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>验证码</title>
</head>
<body>
<jsp:useBean id="image" scope="page" class="servlet.MakeCertPicServlet"></jsp:useBean>
<%
    String str = image.getCertPic(0,0,response.getOutputStream());
    // 将认证码存入session
    session.setAttribute("certCode", str);

    out.clear();
    out = pageContext.pushBody();
%>
</body>
</html>
