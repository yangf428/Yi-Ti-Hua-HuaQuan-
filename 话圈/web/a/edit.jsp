<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2018/6/29
  Time: 20:11
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
    <title>编辑个人信息</title>
    <link rel="stylesheet" rel="stylesheet" href="../css/edit.css" >
    <script type="text/javascript" src="../js/jquery-3.2.1.js"></script>
</head>
<body>
<div class="b-body">
    <div align="center" class="b-center">
        <div class="img">
            <a href="../a/myCenter.jsp" class="p-guanbi">
                <img src="../img/edit/popup_guanbi.png"/>
            </a>
        </div>
        <table border="1" width="47%" height="250" style="border-width: 0px;">
            <tr>
                <td style="border-style: none; border-width: medium">
                    <form class="contact_form" action="UserUpdateServlet" method="post" name="contact_form">
                        <ul>
                            <li>
                                <h2>编辑个人信息</h2>
                                <span class="required_notification">* 表示必填项</span>
                            </li>
                            <li>
                                <label for="name">用户名:</label>
                                <input type="text" name="name" id="name" placeholder="用户名" required />
                            </li>
                            <li>
                                <label for="password">原密码（<span style="color: red;">必须正确哦</span>）:</label>
                                <input type="password" name="password" id="password" placeholder="原密码" required />
                            </li>
                            <li>
                                <label for="q_password">新密码:</label>
                                <input type="password" name="q_password" id="q_password" placeholder="新密码" required />
                            </li>
                            <li>
                                <label for="email">电子邮件:</label>
                                <input type="email" name="email" id="email" placeholder="123456@qq.com" required />
                                <span class="form_hint">正确格式为：123456@qq.com</span>
                            </li>
                            <li>
                                <label for="family">居住地:</label>
                                <input type="text" name="family" id="family" placeholder="居住地" required />
                            </li>
                            <li>
                                <label for="intro">个人简介:</label>
                                <textarea name="intro" cols="40" rows="6" id="intro" placeholder="个人简介" required ></textarea>
                            </li>
                            <li>
                                <button class="submit" type="submit">修改</button>
                                <button class="submit" type="reset">清空</button>
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
