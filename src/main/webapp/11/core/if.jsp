<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSTL - if</title>
</head>
<body>
    <c:set var="number" value="100"/>
    <c:set var="string" value="최지호"/>

    <h2>Determining even/odd numbers using JSTL if tag</h2>
    <c:if test="${ number mod 2 eq 0 }" var="result">
        ${ number }는 짝수입니다. <br/>
    </c:if>
    result : ${ result }
    <h2>String comparison and else statement expression</h2>
    <c:if test="${ string eq '한소희' }" var="result2">
        문자열은 한소희입니다. <br/>
    </c:if>
    <c:if test="${ not result2 }">
        한소희가 아닙니다. <br/>
    </c:if>

    <h2>Conditional expression precautions</h2>
    <c:if test="100" var="result3">
        EL이 아닌 정수 지정하면 false
    </c:if>
    result3 : ${ result3 } <br/>
    <c:if test="tRuE" var="result4">
        대소문자 구분 없이 "tRuE"인 경우 true<br/>
    </c:if>
    result4 : ${ result4 }
    <c:if test="${ true }" var="result5">
        EL 양쪽에 빈 공백이 있는 경우 false<br/>
    </c:if>
    result5 : ${ result5 }<br/>
</body>
</html>
