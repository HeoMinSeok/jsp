<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.util.CookieManager" %>
<%----%>
<%
    String loginId = CookieManager.readCookie(request, "loginId");

    String cookieCheck="";
    if(!loginId.equals("")) {
        cookieCheck = "checked";
    }
%>
<html>
<head>
    <title>Save ID</title>
</head>
<body>
    <h2>Login Page</h2>
    <form action="IdSaveProcess.jsp" method="post">
        아이디 : <input type="text" name="user_id" value="<%= loginId %>">
                 <input type="checkbox" name="save_check" value="Y" <%= cookieCheck %>>
                아이디 저장하기
        <br>
        패스워드 : <input type="password" name="user_pw">
        <br>
        <input type="submit" value="로그인하기">
    </form>
</body>
</html>
