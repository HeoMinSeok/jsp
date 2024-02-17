<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="scopeVar" value="Page value"/>
<c:set var="scopeVar" value="Request value" scope="request"/>
<c:set var="scopeVar" value="Session value" scope="session"/>
<c:set var="scopeVar" value="Application value" scope="application"/>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSTL - REMOVE</title>
</head>
<body>
    <h2>Printing</h2>
    <ul>
        <li>scopeVar : ${ scopeVar }</li>
        <li>requestScopeVar : ${ requestScope.scopeVar }</li>
        <li>sessionScopeVar : ${ sessionScope.scopeVar }</li>
        <li>applicationScopeVar : ${ applicationScope.scopeVar }</li>
    </ul>

    <h2>Deleting from session scope</h2>
    <c:remove var="scopeVar" scope="session"/>
    <ul>
        <li>sessionScope.scopeVar : ${ sessionScope.scopeVar}</li>
    </ul>

    <h2>Deleting without specifying scope</h2>
    <c:remove var="scopeVar"/>
    <ul>
        <li>scopeVar : ${ scopeVar }</li>
        <li>requestScope.scopeVar : ${ requestScope.scopeVar }</li>
        <li>application.scopeVar : ${ applicationScope.scopeVar }</li>
    </ul>
</body>
</html>
