<%@ page language="java" isELIgnored="false" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
       <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
       <title>列表页</title>
       <STYLE type=text/css>
       BODY {
       BACKGROUND-COLOR: #ddeef2;
       }
       </STYLE>
       </head>
       <body>
       <div>
              <a href="/edit">新增</a>
       </div>
       <table width="35%" border="1" align="center">
              <tr>
                     <th>id</th>
                     <th>姓名</th>
                     <th>地址</th>
                     <th>电话</th>
                     <th>操作</th>
              </tr>
              <c:forEach items="${list}" var="e">
                     <tr>
                            <td>${e.id}</td>
                            <td>${e.name}</td>
                            <td>${e.address}</td>
                            <td>${e.phone}</td>
                            <td>
                                   <a href="/deleteOne?id=${e.id}">删除</a>
                                   <a href="/edit?id=${e.id}">编辑</a>
                            </td>
                     </tr>
              </c:forEach>
       </table>
       </body>
       </html>