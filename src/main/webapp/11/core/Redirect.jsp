<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSTL - REDIRECT</title>
</head>
<body>
    <c:set var="requestVar" value="최지호" scope="request" />
    <c:redirect url="/11/inc/OtherPage.jsp">
        <c:param name="user_param1" value="금쪽이" />
        <c:param name="user_param2" value="잼민이" />
    </c:redirect>
</body>
</html>
