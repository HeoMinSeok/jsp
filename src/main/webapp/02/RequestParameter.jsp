<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>내장객체 - request</title>
</head>
<body>
    <%
        request.setCharacterEncoding("UTF-8");
        String id = request.getParameter("id");
        String gender = request.getParameter("gender");
        String[] favor = request.getParameterValues("favor");
        String favorStr = "";
        if(favor != null) {
            for(String k : favor) {
                favorStr += k + " ";
            }
        }
        String intro = request.getParameter("intro").replace("\r\n", "<br>");
    %>

    <ul>
        <li>아이디 : <%=id%></li>
        <li>성별 : <%=gender%></li>
        <li>관심사 : <%=favorStr%></li>
        <li>자기소개 : <%=intro%></li>
    </ul>
</body>
</html>