<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSTL - FOREACH 1</title>
</head>
<body>
    <h2>일반 for문 형태의 forEach 태그</h2>
    <c:forEach begin="1" end="3" step="1" var="i">
        <p>지호는 ${ i }살입니다</p>
    </c:forEach>

    <h2>varStatus 속성 살펴보기</h2>
    <table border="1">
        <c:forEach begin="3" end="5" var="i" varStatus="loop">
            <tr>
                <td>count : ${ loop.count }</td>
                <td>index : ${ loop.index }</td>
                <td>current : ${ loop.current }</td>
                <td>first : ${ loop.first }</td>
                <td>last : ${ loop.last }</td>
            </tr>
        </c:forEach>
    </table>

    <h2>1에서 100까지 정수 중 홀수의 합</h2>
    <c:forEach begin="1" end="100" var="j">
        <c:if test="${ j mod 2 ne 0}">
            <c:set var="sum" value="${ sum + j}" />
        </c:if>
    </c:forEach>
    1 ~ 100 사이의 정수 중 홀수의 합은 ? ${ sum }
</body>
</html>
