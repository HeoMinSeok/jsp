<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h2>Check Cookie</h2>
    <%
        Cookie[] cookies = request.getCookies();
        if(cookies != null) {
            for(Cookie c : cookies) {
                String cName = c.getName();
                String cValue = c.getValue();

                out.print(String.format("%s : %s <br>", cName, cValue));
            }
        }
    %>

</body>
</html>
