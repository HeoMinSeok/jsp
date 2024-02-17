<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSTL - IMPORT</title>
</head>
<body>
    <c:set var="requestVar" value="최지호" scope="request"/>
    <c:import url="/11/inc/OtherPage.jsp" var="contents">
        <c:param name="user_param1" value="금쪽이" />
        <c:param name="user_param2" value="잼민이" />
    </c:import>

    <h2>다른 문서 삽입하기</h2>
    ${ contents }

    <h2>외부 페이지 삽입하기</h2>
    <iframe src="../inc/WebPage.jsp" style="width: 100%;height: 100%;"></iframe>
</body>
</html>
