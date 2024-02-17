<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSTL - XML</title>
</head>
<body>
    <c:set var="booklist">
        <c:import url="/11/inc/BookList.xml" charEncoding="UTF-8" />
    </c:set>
    <x:parse xml="${ booklist }" var="bList" />

    <h2>파싱 1</h2>
    제목 : <x:out select="$bList/booklist/book[1]/name" /> <br/>
    저자 : <x:out select="$bList/booklist/book[1]/author" /> <br/>
    가격 : <x:out select="$bList/booklist/book[1]/price" /> <br/>

    <h2>파싱 2</h2>
    <table border="1">
        <tr>
            <th>제목</th>
            <th>저자</th>
            <th>가격</th>
        </tr>
        <x:forEach select="$bList/booklist/book" var="item">
            <tr>
                <td><x:out select="$item/name" /></td>
                <td><x:out select="$item/author" /></td>
                <td>
                    <x:choose>
                        <x:when select="$item/price >= 20000">2만원 이상 <br/></x:when>
                        <x:otherwise>2만원 미만 <br/></x:otherwise>
                    </x:choose>
                </td>
            </tr>
        </x:forEach>
    </table>

    <h2>파싱 3</h2>
    <table border="1">
        <x:forEach select="$bList/booklist/book" var="item">
            <tr>
                <td><x:out select="$item/name" /></td>
                <td><x:out select="$item/author" /></td>
                <td><x:out select="$item/price" /></td>
                <td><x:if select="$item/name = '금쪽이 지호를 고치는 법'">구매함</x:if></td>
            </tr>
        </x:forEach>
    </table>
</body>
</html>
