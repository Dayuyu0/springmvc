<%@ page language="java" isELIgnored="false" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Login页面</title>
    <STYLE type=text/css>
        BODY {
            TEXT-ALIGN: center;
            PADDING-BOTTOM: 0px;
            BACKGROUND-COLOR: #ddeef2;
            MARGIN: 0px;
            PADDING-LEFT: 0px;
            PADDING-RIGHT: 0px;
            PADDING-TOP: 350px
        }
    </STYLE>
</head>
<body>
<h2>用户登录</h2>
<form method="post"  action="login">
    用户名：<input type="text" name="username"/><br>
    <br>
    &nbsp;&nbsp;&nbsp;&nbsp;密码：<input type="password" name="password"/><br>
    <br>
    <input type="submit" value="登录"/>
</form>
</body>
</html>