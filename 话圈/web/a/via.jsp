<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2018/6/29
  Time: 20:15
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
    <title>上传头像</title>
    <link type="text/css" rel="stylesheet" href="../css/via.css">
    <script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
    <script src="../js/via.js"></script>
</head>
<body>
<div id="addCommodityIndex">
    <a href="myCenter.jsp#" class="guanbi-i">
        <img class="img" src="../img/myself/popup_guanbi.png">
    </a>
    <div id="preview">
        <a href="../a/myCenter.jsp#">
            <img id="imghead"  src="../img/myself/photo_icon.png" onclick="$('#previewImg').click();">
        </a>
    </div>
    <form action="UserPhoto" name="myform" method="post" enctype="multipart/form-data">
        <input type="file" onchange="previewImage(this)" style="display: none;"
               id="previewImg" name="myfile" required>
        <div class="tijiao">
            <a href="../a/via.jsp#" class="tijiao-a">
                <input type="submit" value="更换头像">
            </a>
        </div>
    </form>
</div>
</body>
</html>