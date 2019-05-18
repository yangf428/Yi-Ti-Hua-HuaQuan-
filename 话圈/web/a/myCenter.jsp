<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2018/6/29
  Time: 19:40
  To change this template use File | Settings | File Templates.
--%>
<%@page import="service.PinglunDaoTest"%>
<%@page import="service.FatieDaoTest"%>
<%@page import="service.UserDaoTest"%>
<%@page import="service.ViaDaoTest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>个人主页</title>
    <link href="../img/head/favicon.ico" mce_href="../img/head/favicon.ico" rel='icon' type='image/x-icon'/>
    <link type="text/css" rel="stylesheet" href="../css/myself.css">
</head>
<body>
<div class="u-main">
    <jsp:include page="../f/head.jsp"></jsp:include>
    <div class="u-top">
        <div class="u-img">

        </div>
        <div class="u-myself">
            <div class="left">
                <div class="img">
                    <div>
                        <!-- 判断用户是否登录 -->
                        <c:if test="${empty user}">
                            <a href="../a/myCenter.jsp#" class="tou-xiang"><img src="../img/myself/touxiang.jpeg"/></a>
                        </c:if>
                        <c:if test="${!empty user}">
                            <!-- 调用ViaDaoTest.query(int userid)方法获取到该登录用户的头像信息，保存到map中。查询头像信息 -->
                            <c:set var="map" scope="session" value="${ViaDaoTest.query(user.getUserid())}"/>
                            <c:set var="str" scope="session" value="upload/${map[\"photo\"]}"/>
                            <c:if test="${str==\"upload/\"}">
                                <a href="../a/myCenter.jsp#" class="tou-xiang"><img src="../img/myself/touxiang.jpeg"/></a>
                            </c:if>
                            <c:if test="${str!=\"upload/\"}">
                                <a href="../a/myCenter.jsp#" class="tou-xiang"><img src="../img/myself/touxiang.jpeg"/></a>
                            </c:if>
                        </c:if>
                    </div>
                </div>
            </div>

            <c:if test="${!empty user}">
                <!-- 调用UserDaoTest.query(int userid)方法获取到登录用户的个人信息，保存到map中。查询用户信息 -->
                <c:set var="map" scope="session" value="${UserDaoTest.query(user.getUserid())}"/>
                <div class="right">
                    <div class="zuo">
                        <div>
                            <p class="p1">
                                <span class="span-1">${user.getName()}</span>
                                <span class="span-1-1">克己复礼</span>
                            </p>
                            <p class="p2">
                                <span class="span-2">居住地</span>
                                <span class="span-2-2">${map["family"]}</span>
                            </p>
                            <p class="p3">
                                <span class="span-3">个人简介</span>
                                <span class="span">${map["intro"]}</span>
                            </p>
                            <p class="p4">
                                <span class="span-4">电子邮件</span>
                                <span class="span">${map["email"]}</span>
                            </p>
                            <p class="p5">
                                <span class="span-5">出生年月</span>
                                <span class="span">${map["time"]}</span>
                            </p>
                        </div>
                    </div>
                    <div class="you">
                        <div>
                            <a href="../a/myCenter.jsp#" class="p-tc">编辑个人资料</a>
                        </div>
                    </div>
                </div>
            </c:if>
        </div>

        <div class="u-botton">
            <div class="u-tiezi">
                <a href="../a/topic1.jsp">
                    <div>
                        <span>发帖</span>
                    </div>
                </a>
            </div>

            <c:if test="${!empty user}">
                <!-- 调用FatieDaoTest.QueryId(userid)方法获取到该登录用户发过的所有的帖子，保存到lis中。查询该用户发帖信息 -->
                <c:set var="list" scope="session" value="${FatieDaoTest.QueryId(user.getUserid())}"/>
                <!-- 遍历list -->
                <%-- <c:forEach items="${list}" var="list" begin="0" end="${fn:length(list)}"> --%>
                <c:forEach items="${list}" var="list">
                    <!-- 获取list中的属性 -->
                    <c:set var="str" scope="session" value="upload_Fatie/${list[\"photo\"]}"/>
                    <c:set var="fid" scope="session" value="${list[\"fid\"]}"/>
                    <c:set var="titles" scope="session" value="${list[\"titles\"]}"/>
                    <c:set var="time" scope="session" value="${list[\"time\"]}"/>
                    <c:set var="fcontent" scope="session" value="${list[\"fcontent\"]}"/>

                    <div class="u-suibi">
                        <div class="zhong">
                        <div class="shang-1">
                            <span class="span-1">${titles}</span>
                        </div>
                        <div class="shang-2">
                            <span class="span-2">${time}</span>
                        </div>

                            <span>${fcontent}</span>
                        </div>

                        <div class="xia">
                            <form action="../a/update.jsp">
                                <input type="hidden" name="fid" value="${fid}">
                                <input type="hidden" name="titles" value="${titles}">
                                <input type="hidden" name="fcontent" value="${fcontent}">
                                <input type="hidden" name="str" value="${str}">
                                <input type="submit" class="xiugai" value="修改">
                            </form>
                            <form action="FatieDeleteServlet">
                                <input type="hidden" name="fid" value="${fid}">
                                <input type="submit" class="shanchu" onclick="return p_del();" value="删除">
                            </form>
                        </div>
                    </div>
                    <!-- 获取到对应帖子的id -->
                    <c:set var="byid" scope="session" value="${list[\"fid\"]}"/>
                    <!-- 调用PinglunDaoTest.PinglunQuery(int byid)方法获取到该帖子下的所有的评论，保存到list_p中 -->
                    <c:set var="list_p" scope="session" value="${PinglunDaoTest.PinglunQuery(byid)}"/>
                    <!-- 遍历list_p -->
                    <c:forEach items="${list_p}" var="list_p">
                        <c:set var="userid" scope="session" value="${list_p[\"userid\"]}"/>
                        <!-- 调用UserDaoTest.query(int userid)方法获取到每一个评论对应的用户信息，保存到map2中 -->
                        <c:set var="map2" scope="session" value="${UserDaoTest.query(userid)}"/>
                        <c:if test="${!empty map2}">
                            <!-- 获取map2中的（用户）属性 -->
                            <c:set var="userid_others" scope="session" value="${map2[\"userid\"]}"/>
                            <c:set var="name" scope="session" value="${map2[\"name\"]}"/>
                            <!-- 获取list_p中的（评论）属性 -->
                            <c:set var="pcontent" scope="session" value="${list_p[\"pcontent\"]}"/>
                            <c:set var="pid" scope="session" value="${list_p[\"pid\"]}"/>

                            <div class="pinglun">
                            <div class="myself-p">
                                <p class="name">
                                    <a href="../f/others.jsp?uid=${userid_others}">${name}</a>
                                </p>
                                <p class="pcontent">${pcontent}</p>
                            </div>
                            <div class="p-shanchu">
                                <form action="/PinglunDeleteServlet">
                                    <input type="hidden" name="pid" value="${pid}">
                                    <input type="submit" class="p-shanchu" onclick="return p_del();" value="删除">
                                </form>
                            </div>
                            </div>
                        </c:if>
                    </c:forEach>

                </c:forEach>
            </c:if>
            <br>
        </div>
    </div>
</div>
<!--------------------- 删除确认 --------------------->
<script type="text/javascript" src="../js/delete.js"></script>
<!--------------------- 删除确认-end --------------------->

<!--------------------- 编辑个人信息 --------------------->
<jsp:include page="../a/edit.jsp"></jsp:include>
<script type="text/javascript" src="../js/myselfShow.js"></script>
<!--------------------- 编辑个人信息-end --------------------->

<!--------------------- 发帖 --------------------->
<%--<!--------------------- weditor --------------------->
<jsp:include page="../a/topic1.jsp"></jsp:include>--%>
<%--
<jsp:include page="../a/topic1.jsp"></jsp:include>
<script type="text/javascript" src="../js/myselfShow.js"></script>
--%>
<!--------------------- 发帖-end --------------------->

<!--------------------- 上传头像-end --------------------->
<jsp:include page="../a/via.jsp"></jsp:include>
<script type="text/javascript" src="../js/viashow.js"></script>
<!--------------------- 上传头像-end --------------------->

</body>
</html>
