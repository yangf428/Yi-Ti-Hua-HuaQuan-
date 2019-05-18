<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2018/6/30
  Time: 19:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>发帖</title>
    <link href="../css/topic.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="../js/jquery-3.2.1.js"></script>
</head>
<body>

<jsp:include page="../f/head.jsp"></jsp:include>

<table border="1" width="47%" height="250" style="border-width: 0px; margin:50px auto;" >
    <tr>
        <td style="border-style: none; border-width: medium">
            <form class="up-contact_form" action="FatieAddServlet" name="contact_form" method="post" enctype="multipart/form-data">
                <ul>
                    <li>
                        <h2>发帖</h2>
                        <span class="up-required_notification">* 表示必填项</span>
                    </li>
                    <li>
                        <label for="titles">标题:</label>
                        <input type="hidden" name="fid" />
                        <input type="text" name="titles" id="titles" placeholder="标题" required />
                    </li>
                    <li>
                        <label for="fcontent">内容:</label>
                        <textarea name="fcontent" cols="40" rows="10" placeholder="${param.fcontent}" id="fcontent" ></textarea>
                    </li>
                    <li>
                        <label>图片:</label>
                        <div id="f_preview">
                            <img style="cursor: pointer;" id="f_imghead" src="${param.str}" onclick="$('#f_previewImg').click();">
                        </div>
                        <input type="file" onchange="f_previewImage(this)"  name="previewImg" required>
                    </li>
                    <li>
                        <button class="up-submit" type="submit">提交</button>
                        <button class="up-submit" type="reset">清空</button>
                    </li>
                </ul>
            </form>
        </td>
    </tr>
</table>

<script src="../js/topic.js"></script>
</body>
</html>
