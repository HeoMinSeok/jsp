<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSTL - CATCH</title>
</head>
<body>
    <h2>자바 코드에서의 예외</h2>
    <%
        int num1 = 100;
    %>
    <c:catch var="eMessage">
        <%
            int result = num1 / 0;
        %>
    </c:catch>
    예외 내용 : ${ eMessage }

    <h2>EL에서의 예외</h2>
    <c:set var="num2" value="200" />

    <c:catch var="eMessage">
        ${ "지호" + num2 }
    </c:catch>
    예외 내용 : ${ eMessage }
</body>
</html>
