<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    public int add(int num1, int num2) {
        return num1 + num2;
    }
%>
<html>
<head>
    <title>Script 요소</title>
</head>
<body>
    <%-- 스크립틀릿 --%>
    <%
//        public int add(int num1, int num2) {
//        return num1 + num2;
//        }    메소드 선언 불가 !
        int result = add(1,2);
    %>

    <%-- 표현식 --%>
    덧셈결과 : <%= result%> <br/>
    덧셈결과 : <%= add(10, 20)%> <br/>



</body>
</html>
