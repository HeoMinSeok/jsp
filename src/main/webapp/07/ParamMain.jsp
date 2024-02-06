<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String pVal = "삼대500";
%>
<html>
<head>
    <title>ActionTag - param</title>
</head>
<body>
    <jsp:useBean id="person" class="com.common.Person" scope="request"/>
    <jsp:setProperty name="person" property="name" value="지호짱짱123"/>
    <jsp:setProperty name="person" property="age" value="24"/>
    <jsp:forward page="ParamForward.jsp?param1=최지호">
        <jsp:param name="param2" value="부산광역시"/>
        <jsp:param name="param3" value="<%=pVal%>"/>
    </jsp:forward>

</body>
</html>
