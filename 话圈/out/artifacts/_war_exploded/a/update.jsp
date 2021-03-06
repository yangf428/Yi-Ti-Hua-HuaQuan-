<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2018/6/29
  Time: 20:08
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
    <title>修改</title>
    <link rel="stylesheet" rel="stylesheet" href="../css/update.css" >
    <script type="text/javascript" src="../js/jquery-3.2.1.js"></script>

    <script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
    <script src="../js/update.js"></script>

</head>
<body>

<div class="up-body">
    <div align="center" class="up-center">
        <div class="img">
            <a href="../a/myCenter.jsp" class="up-guanbi">
                <img src="../img/update/popup_guanbi.png"/>
            </a>
        </div>
        <table border="1" width="47%" height="250" style="border-width: 0px;">
            <tr>
                <td style="border-style: none; border-width: medium">
                    <form class="up-contact_form" action="FatieUpdateServlet" name="contact_form" method="post" enctype="multipart/form-data">
                        <ul>
                            <li>
                                <h2>修改你的帖子</h2>
                                <span class="up-required_notification">* 表示必填项</span>
                            </li>
                            <li>
                                <label for="titles">标题:</label>
                                <input type="hidden" name="fid" value="${param.fid}"/>
                                <input type="text" name="titles" value="${param.titles}" id="titles" placeholder="标题" required />
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
                                <input type="file" onchange="f_previewImage(this)" style="display: none;" id="f_previewImg" name="previewImg" required>
                            </li>
                            <li>
                                <button class="up-submit" type="submit">修改</button>
                                <button class="up-submit" type="reset">清空</button>
                            </li>
                        </ul>
                    </form>
                </td>
            </tr>
        </table>
    </div>
</div>
</body>
</html>