<%@ page import="com.util.CookieManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    CookieManager.makeCookie(response, "ELCookie", "Jiho", 10);
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>EL - OTHER IMPLICIT OBJECT</title>
</head>
<body>
    <h2>Read Cookie Value</h2>
    <li>EL Cookie Value : ${cookie.ELCookie.value}</li>

    <h2>Read HTTP Header Value</h2>
    <ul>
        <li>host : ${header.host}</li>
        <li>user-agent : ${header['user-agent']}</li>
        <li>cookie : ${header.cookie}</li>
    </ul>

    <h2>web.xml parameters</h2>
    <li>OracleDriver : ${initParam.OracleDriver}</li>
    <li>INIT_PARAM : ${initParam.INIT_PARAM}</li>

    <h2>Context Root Path</h2>
    <li>${pageContext.request.contextPath}</li>
</body>
</html>
