<%@ page contentType="text/html;charset=UTF-8" language="java"
    pageEncoding="UTF-8"
%>
<%!
    String str1 = "JSP";
    String str2 = "안녕하세요";
%>
<html>
<head>
    <title>Hello JSP</title>
</head>
<body>
    <h2>처음 만드는 <%= str1%></h2>
    <p>
        <%
            out.println(str2 + str1 + "입니다. 열심히 공부합시다.");
        %>
    </p>
</body>
</html>
