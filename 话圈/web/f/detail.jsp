<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2018/6/29
  Time: 19:49
  To change this template use File | Settings | File Templates.
--%>
<%@page import="service.UserDaoTest"%>
<%@page import="service.PinglunDaoTest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>文章内容</title>
    <link href="../img/head/favicon.ico" mce_href="../img/head/favicon.ico" rel='icon' type='image/x-icon'/>

    <!------------------------------------修饰内容的css和分页的js--------------------------------------------->
    <script type="text/javascript" language="javascript">
        window.onload = function() {
            page = new Page(6, 'table1', 'group_one');
        };
    </script>
    <link rel="stylesheet" type="text/css" href="../css/detail.css" />
    <script type="text/javascript" src="../js/content/js.js"></script>
    <!---------------------------------修饰内容的css和分页的js--end------------------------------------------->

    <!----------------------------------------------评论-------------------------------------------------->
    <script type="text/javascript" src="../js/jquery-3.2.1.js"></script>
    <link type="text/css" rel="stylesheet" href="../css/content/pinglun.css" />
    <!--------------------------------------------评论-end------------------------------------------------>

</head>

<body style="background-color:#f3f3f3;">
<jsp:include page="../f/head.jsp"></jsp:include>
<div class="all">
    <div class="content">
        <div class="left">
            <table id="table1" style="width: 100%;">
                <tbody id="group_one">
                <!-- 遍历list -->
                 <c:forEach items="${list}" var="list" begin="0" end="0">
               <%-- <c:forEach items="${list}" var="list">--%>
                    <tr style="height: auto">
                        <td class="left-td-top">


                            <div class="div-title">
                                <a href="javascript:void(0);"><span class="yansebianhuan">${titles}</span></a>
                            </div>


                            <div class="div-name">
                                <a href="../f/others.jsp?uid=${userid_others}">
                                    <span class="yansebianhuan">${username}</span>
                                </a>
                            </div>
                            <div class="div-content-icon">
                               <%-- <a href="#"><img class="img" src="${photo}"
                                                 alt="内容配图" /></a>--%>
                                   <a href="javascript:void(0);">
                                       <img class="img" src="../img/upload_Fatie/${photo}" alt="配图" />
                                   </a>
                            </div>
                            <div class="div-content">
									<span>
                                            ${fcontent}
                                    </span>
                            </div>


                            <c:if test="${!empty user}">
                                <form action="/PinglunAddServlet">
                                    <div class="pinglun">
                                        <div class="input">
                                            <input type="hidden" name="userid" value="${user.userid}">
                                            <input type="hidden" name="byid" value="${list.fid}">
                                            <input type="text" class="input-pinglun" name="pinglun_m" placeholder="写下你的评论..." required>
                                            <c:out value="${user}"/>
                                        </div>
                                        <div class="button">
                                                <a href="../f/blogList.jsp#">
                                            <span>
                                                  <input type="submit" value="评论">
                                            </span>
                                                </a>
                                        </div>
                                    </div>
                                </form>
                            </c:if>

                            <c:set var="byid" scope="session" value="${list[\"fid\"]}"/>
                            <!-- 调用PinglunDaoTest.PinglunQuery(int byid)方法获取到该帖子下的所有的评论，保存到list_p中 -->
                            <c:set var="list_p" scope="session" value="${PinglunDaoTest.PinglunQuery(byid)}"/>

                            <!-- 遍历list_p -->
                                <%-- <c:forEach items="${list_p}" var="list_p" begin="0" end="${fn:length(list)-1}"> --%>
                            <c:forEach items="${list_p}" var="list_p">
                                <c:set var="userid_others" scope="session" value="${list_p[\"userid\"]}" />
                                <!-- 调用UserDaoTest.query(int userid)方法获取每一条评论对应的用户信息，保存到map2中。 -->
                                <c:set var="map2" scope="session" value="${UserDaoTest.query(userid_others)}" />
                                <c:if test="${!empty map2}">

                                    <div class="p-xianshi">
                                        <p class="p1">
                                            <a href="../f/others.jsp?uid=${userid_others}">${map2["name"]}</a>
                                        </p>
                                        <p class="p2">${list_p["pcontent"]}</p>
                                    </div>
                                    <br>
                                </c:if>
                            </c:forEach>
                        </td>
                    </tr>
                    <tr style="height: auto">
                        <td class="left-td-botton"></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <span id="s"></span>
            <br><br>

        </div>
    </div>
</div>

</body>
</html>
