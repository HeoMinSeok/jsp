<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSTL - OUT</title>
</head>
<body>
    <c:set var="iTag">
        i 태그 <i>기울임</i>을 사용해보자. <br/>
        지호는 <i>금쪽이</i>입니다. <br/>
    </c:set>

    <h2>기본 사용</h2>
    <c:out value="${ iTag }" />

    <h2>escapeXml 속성</h2>
    <c:out value="${ iTag }" escapeXml="false" />

    <h2>default 속성</h2>
    <c:out value="${ param.name }" default="지호 없음" />
    <c:out value="" default="빈 문자열은 지호입니다." />
</body>
</html>
