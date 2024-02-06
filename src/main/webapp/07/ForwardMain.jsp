<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    pageContext.setAttribute("pAttr", "한소희");
    request.setAttribute("rAttr", "카리나");
%>
<html>
<head>
    <title>ActionTag - forward</title>
</head>
<body>
    <h2>액션태그를 활용한 포워딩</h2>
    <jsp:forward page="ForwardSub.jsp"></jsp:forward>
</body>
</html>
