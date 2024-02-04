<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cookie</title>
</head>
<body>
    <h2>1. Cookie Setting</h2>
    <%
        Cookie cookie = new Cookie("myCookie", "뉴진스");
        cookie.setPath(request.getContextPath()); // 최상위 경로 설정
        cookie.setMaxAge(3600); // 1hour
        response.addCookie(cookie); // add to response header
    %>

    <h2>2. Check cookies immediately after setting </h2>
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

    <h2>3. Read cookie value after moving page </h2>
    <a href="CookieResult.jsp">
        Check cookie value on the next page
    </a>
</body>
</html>
