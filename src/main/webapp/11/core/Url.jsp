<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSTL - url</title>
</head>
<body>
    <h2>url 태그로 링크 걸기</h2>
    <c:url value="/11/inc/OtherPage.jsp" var="url">
        <c:param name="user_param1" value="금쪽이" />
        <c:param name="user_param2">지호</c:param>
    </c:url>
    <a href="${url }">OtherPage.jsp 바로가기</a>
</body>
</html>
