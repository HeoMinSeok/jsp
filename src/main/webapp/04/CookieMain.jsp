<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
    쿠키는 웹사이트에 접속했을 때 사용자를 기억하는 수단
    쿠키는 처음 만들어진 시점에서는 서버는 쿠키를 읽을 수 없다

    name : 쿠키 이름
    value : 쿠키 값
    domain : 쿠키를 적용할 도메인
    path : 쿠키를 적용할 경로
    maxAge : 쿠키 유지시간(단위 : 초) 하루 : 86400

    name은 문자열을 입력하는데 , ; space = 포함 x
    path는 특정 경로 입력하면 그 하위 경로도 포함
    age를 설정 안하면 브라우저 종료될 때 쿠키 만료된다.
    getAge age : 설정 안 했을 때 -1 반환
    --%>
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
