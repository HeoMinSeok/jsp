<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSTL - FORTOKENS</title>
</head>
<body>
    <%
        String rgba = "Red, Green, Blue, Black";
    %>
    <h2>JSTL의 forTokens 태그 사용</h2>
    <c:forTokens items="<%= rgba %>" delims="," var="color">
        <span style="color: ${ color };">${ color }</span> <br/>
    </c:forTokens>
</body>
</html>
