<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    pageContext.setAttribute("scopeValue", "페이지영역");
    request.setAttribute("scopeValue", "리퀘스트영역");
    session.setAttribute("scopeValue", "세션영역");
    application.setAttribute("scopeValue", "애플리케이션영역");
%>
<html>
<head>
    <title>EL - IMPLICIT OBJECT</title>
</head>
<body>
    <h2>Implicit Obj Main</h2>
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

<jsp:forward page="ImplicitForward.jsp"></jsp:forward>
</body>
</html>
