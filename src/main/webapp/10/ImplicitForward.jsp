<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h2>Implicit Forward Main</h2>
    <h3>Read properties stored in each Scope</h3>
    <ul>
        <li style="color: darkorange">페이지 영역 : ${pageScope.scopeValue}</li>
        <li>리퀘스트 영역 : ${requestScope.scopeValue}</li>
        <li>세션 영역 : ${sessionScope.scopeValue}</li>
        <li>애플리케이션 영역 : ${applicationScope.scopeValue}</li>
    </ul>

    <h3>Read properties without specifying scope</h3>
    <ul>
        <li style="color: darkorange">${scopeValue}</li>
    </ul>
</body>
</html>
