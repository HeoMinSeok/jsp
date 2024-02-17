<%@ page import="java.util.Date" %>
<%@ page import="com.common.Person" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>JSTL CORE SET</title>
</head>
<body>
    <c:set var="directVar" value="100"/>
    <c:set var="elVar" value="${ directVar mod 5 }"/>
    <c:set var="expVar" value="<%= new Date() %>"/>
    <c:set var="betweenVar" > 지호 지호 </c:set>

    <h2>Output variables using EL</h2>
    <ul>
        <li>directVar : ${ pageScope.directVar }</li>
        <li>elVar : ${ elVar }</li>
        <li>expVar : ${ expVar }</li>
        <li>betweenVar : ${ betweenVar }</li>
    </ul>

    <h2>Creating JavaBeans 1 - Using constructor</h2>
    <c:set var="personVar1" value='<%= new Person("최지호", 24)%>' scope="request"/>
    <ul>
        <li>이름 : ${ requestScope.personVar1.name }</li>
        <li>나이 : ${ requestScope.personVar1.age }</li>
    </ul>

    <h2>Creating JavaBeans 2 - Using target, property</h2>
    <c:set var="personVar2" value="<%= new Person() %>" scope="request"/>
    <c:set target="${ personVar2 }" property="name" value="죠"/>
    <c:set target="${ personVar2 }" property="age" value="16"/>
    <ul>
        <li>이름 : ${ requestScope.personVar2.name }</li>
        <li>나이 : ${ requestScope.personVar2.age }</li>
    </ul>
</body>
</html>
