<%@ page import="com.common.Person" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>EL - Transfer object parameters</title>
</head>
<body>
    <%
        request.setAttribute("personObj", new Person("최지호", 24));
        request.setAttribute("StringObj", "나는 최지호 ><");
        request.setAttribute("IntegerObj", new Integer(10));
    %>

<jsp:forward page="ObjectResult.jsp">
    <jsp:param name="firstNum" value="10"/>
    <jsp:param name="secondNum" value="20"/>
</jsp:forward>
</body>
</html>
