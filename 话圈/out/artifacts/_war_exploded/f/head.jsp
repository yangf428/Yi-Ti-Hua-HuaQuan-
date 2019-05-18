<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2018/6/29
  Time: 19:28
  To change this template use File | Settings | File Templates.
--%>
<%@page import="entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!--------------绝对路径--------------->
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!--------------绝对路径-end--------------->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <base href="<%=basePath%>">
    <title>论坛头部</title>
    <meta name="description" content="Free Responsive Html5 Css3 Templates Designed by Kimmy | zerotheme.com">
    <meta name="author" content="sc.chinaz.com">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- CSS================================================== -->
    <link rel="stylesheet" href="../css/head/zerogrid.css">
    <link rel="stylesheet" href="../css/head/style.css">
    <link rel="stylesheet" href="../css/head/css.css">
    <link rel="stylesheet" href="../css/head/responsive.css">

    <link href="../img/head/favicon.ico" mce_href="../img/head/favicon.ico" rel='icon' type='image/x-icon'/>

</head>
<body>

<div class="wrap-body">
    <!----------------------------Header------------------------------------>
    <header>
        <div class="wrap-header zerogrid">
            <div id="logo"><a href="../f/blogList.jsp"><img src="../img/head/logo.png"/></a></div>
            <nav>
                <div class="wrap-nav">
                    <div class="menu">
                        <input type="hidden" value="${empty user}" class="in"/>
                        <ul>
                            <li><a href="../f/blogList.jsp">首页</a></li>
                            <li><a href="../a/topic1.jsp" id="fa">发帖</a></li>
                            <li><a href="../f/blogList.jsp">联系</a></li>

                            <c:if test="${empty user}">
                                <li><a href="../f/blogList.jsp#" class="tc">登录</a></li>
                            </c:if>
                            <c:if test="${!empty user}">
                                <li class="menu1">
                                    <a href="#">${user.getName()}</a>
                                    <ul class="menu2" id="menu2">
                                        <li class="list2"><a href="../a/myCenter.jsp">个人主页</a></li>
                                        <li class="list2"><a href="ExitServlet">退出</a></li>
                                    </ul>
                                </li>
                            </c:if>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
    </header>
    <!----------------------------Header-end------------------------------------>

    <!----------------------- 登录、注册 ------------------------------->
    <jsp:include page="../f/login.jsp"></jsp:include>
    <script type="text/javascript" src="../js/head/judge.js"></script>
    <script type="text/javascript" src="../js/login.js"></script>
    <!----------------------- 登录、注册-end ------------------------------->


</div>
</body>
</html>
