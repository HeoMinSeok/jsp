<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ActionTag - forward Sub</title>
</head>
<body>
    <h2>Forward Result</h2>
    <ul>
        <li>page 영역 : <%=pageContext.getAttribute("pAttr")%></li>
        <li>request 영역 : <%=request.getAttribute("rAttr")%></li>
    </ul>
</body>
</html>