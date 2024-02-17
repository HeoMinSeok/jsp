<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>JIHO</title>
</head>
<body>
    <h2>MVC 패턴으로 회원 인증하기</h2>
    <p>
        <strong>${ authMessage }</strong> <br/>
        <a href="./MemberAuth.mvc?id=jiho&pass=1004">회원인증(관리자)</a>
        &nbsp;&nbsp;
        <a href="./MemberAuth.mvc?id=hsh&pass=1004">회원인증(회원)</a>
        &nbsp;&nbsp;
        <a href="./MemberAuth.mvc?id=karina&pass=1234">회원인증(비회원)</a>
    </p>
</body>
</html>
