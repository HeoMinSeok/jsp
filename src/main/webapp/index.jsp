<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<style>
    body {
        text-align: center;
        font-size: 8em;
    }
</style>
<head>
    <meta charset="UTF-8">
    <title>JSP - Project</title>
    <%!
        String str1 = "하입보이요";
        String str2 = "뉴진스";
    %>
</head>
<body>
    <h2>하잉 ~</h2>
    <p>
        <%
            out.println(str2 + " " + str1);
        %>
    </p>
</body>
</html>