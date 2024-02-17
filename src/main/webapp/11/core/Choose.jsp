<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSTL - choose/when/otherwise</title>
</head>
<body>
    <c:set var="number" value="100"/>

    <h2>Judging odd or even with the choose tag</h2>
    <c:choose>
        <c:when test="${ number mod 2 eq 0 }">
            ${ number }는 짝수입니다.
        </c:when>
        <c:otherwise>
            ${ number }는 홀수입니다.
        </c:otherwise>
    </c:choose>

    <h2>지호의 국영수 학점 구하기</h2>
    <form>
        KOR : <input type="text" name="kor"/><br/>
        ENG : <input type="text" name="eng"/><br/>
        MATH : <input type="text" name="math"/><br/>
        <input type="submit" value="지호의 학점은 ?">
    </form>

    <c:if test="${ not (empty param.kor or empty param.eng or empty param.math)}">
        <c:set var="avg" value="${ (param.kor + param.eng + param.math) / 3 }"/>
        평균 점수 ${ avg }으로

        <c:choose>
            <c:when test="${ avg ge 90}">A 학점</c:when>
            <c:when test="${ avg ge 80}">B 학점</c:when>
            <c:when test="${ avg ge 70}">C 학점</c:when>
            <c:when test="${ avg ge 60}">D 학점</c:when>
            <c:otherwise>F 학점</c:otherwise>
        </c:choose>
        입니다.
    </c:if>
</body>
</html>
