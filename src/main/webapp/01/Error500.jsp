<%--
  Created by IntelliJ IDEA.
  User: minzino
  Date: 1/30/24
  Time: 2:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        int Age = Integer.parseInt(request.getParameter("age")) + 10;
        out.println("10년 후 당신의 나이는" + Age + "입니다.");
    %>
</body>
</html>
