<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ActionTag - param forward</title>
</head>
<body>
    <jsp:useBean id="person" class="com.common.Person" scope="request"/>
    <h2>Check parameters on forwarded page</h2>
    <ul>
        <li><jsp:getProperty name="person" property="name"/></li>
        <li>나이 : <jsp:getProperty name="person" property="age"/></li>
        <li>본명 : <%= request.getParameter("param1") %></li>
        <li>출생 : <%= request.getParameter("param2") %></li>
        <li>특징 : <%= request.getParameter("param3") %></li>
    </ul>
    <jsp:include page="ParamInclude.jsp">
        <jsp:param name="loc1" value="부산 부전동"/>
        <jsp:param name="loc2" value="최지호 광장"/>
    </jsp:include>
</body>
</html>
