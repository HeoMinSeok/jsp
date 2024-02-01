<%@ page import="com.common.Person" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h2>forward로 전될된 페이지</h2>
    <h4>RequestMain 파일의 Request 영역 속성 읽기</h4>

    <%
        Person pPerson = (Person) request.getAttribute("reqPerson");
    %>

    <ul>
        <li> <%=request.getAttribute("reqStr")%></li>
        <li> <%=pPerson.getName()%></li>
    </ul>

    <h4>매개변수로 전달된 값 출력하기</h4>

    <%
        out.println(request.getParameter("paramHan"));
        out.println(request.getParameter("paramEng"));
    %>

</body>
</html>
