<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    pageContext.setAttribute("num1", 9);
    pageContext.setAttribute("num2", "10");

    pageContext.setAttribute("nullStr", null);
    pageContext.setAttribute("emptyStr", "");
    pageContext.setAttribute("lengthZero", new Integer[0]);
    pageContext.setAttribute("sizeZero", new ArrayList<Object>());
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>EL - OPERATOR</title>
</head>
<body>
    <h2>empty Operator</h2>
    empty nullStr : ${ empty nullStr } <br>
    empty emptyStr : ${ empty emptyStr } <br>
    empty lengthZero : ${ empty lengthZero } <br>
    empty sizeZero : ${ empty sizeZero } <br>

    <h2>Ternary Operator</h2>
    num1 gt num2 ? "True": "False" => ${num1 gt num2 ? "num1 is large": "num2 is large"} <br>

    <h2>null Operator</h2>
    null + 10 : ${ null + 10 } <br>
    nullStr + 10 : ${ nullStr + 10 } <br>
    param.noVar : ${ param.noVar > 10 } <br>

</body>
</html>
