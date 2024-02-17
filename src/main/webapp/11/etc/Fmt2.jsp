<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSTL - FMT 2</title>
</head>
<body>
    <c:set var="today" value="<%= new Date()%>" />

    <h2>날짜 포맷</h2>
    full : <fmt:formatDate value="${ today }" type="date" dateStyle="full" /> <br/>
    short : <fmt:formatDate value="${ today }" type="date" dateStyle="short" /> <br/>
    long : <fmt:formatDate value="${ today }" type="date" dateStyle="long" /> <br/>
    default : <fmt:formatDate value="${ today }" type="date" dateStyle="default" /> <br/>

    <h2>시간 포맷</h2>
    full : <fmt:formatDate value="${ today }" type="time" timeStyle="full" /> <br/>
    short : <fmt:formatDate value="${ today }" type="time" timeStyle="short" /> <br/>
    long : <fmt:formatDate value="${ today }" type="time" timeStyle="long" /> <br/>
    default : <fmt:formatDate value="${ today }" type="time" timeStyle="default" /> <br/>

    <h2>날짜/시간 표시</h2>
    <fmt:formatDate value="${ today }" type="both" dateStyle="full" timeStyle="full" /> <br/>
    <fmt:formatDate value="${ today }" type="both" pattern="yyyy-MM-dd hh:mm:ss" /> <br/>

    <h2>타임존 설정</h2>
    <fmt:timeZone value="GMT">
        <fmt:formatDate value="${ today }" type="both" dateStyle="full" timeStyle="full" /> <br/>
    </fmt:timeZone>
    <fmt:timeZone value="America/Chicago">
        <fmt:formatDate value="${ today }" type="both" dateStyle="full" timeStyle="full" /> <br/>
    </fmt:timeZone>

    <h2>로케일 설정</h2>
    <c:set var="today" value="<%= new Date()%>" />

    한글로 설정 : <fmt:setLocale value="ko_KR"/>
    <fmt:formatNumber value="10000" type="currency" /> / <fmt:formatDate value="${ today }" /> <br/>
    영어로 설정 : <fmt:setLocale value="en_US"/>
    <fmt:formatNumber value="10000" type="currency" /> / <fmt:formatDate value="${ today }" /> <br/>
    일본어로 설정 : <fmt:setLocale value="ja_JP"/>
    <fmt:formatNumber value="10000" type="currency" /> / <fmt:formatDate value="${ today }" /> <br/>
    중국어로 설정 : <fmt:setLocale value="zh_CN"/>
    <fmt:formatNumber value="10000" type="currency" /> / <fmt:formatDate value="${ today }" /> <br/>
</body>
</html>
