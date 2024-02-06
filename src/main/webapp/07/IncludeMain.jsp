<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String outerPath1 = "./OuterPage1.jsp";
    String outerPath2 = "./OuterPage2.jsp";

    pageContext.setAttribute("pAttr", "최지호");
    request.setAttribute("rAttr", "조혜령");
%>
<html>
<head>
    <title>지시어와 액션태그 동작 방식 비교</title>
</head>
<body>
    <h2>지시어와 액션태그 동작 방식 비교</h2>
    <%-- 지시어 방식 --%>
    <h3>지시어로 페이지 포함하기</h3>
    <%@ include file="OuterPage1.jsp" %>
    <%--
        <%@include file="<%= outerrPath1 %>>"%>
                    : include 지시어에는 표현식 사용 불가
    --%>
    <p>외부 파일에서 선언한 변수 : <%= newVar1 %></p>

    <h3>액션 태그로 페이지 포함하기</h3>
    <jsp:include page="OuterPage2.jsp"></jsp:include>
    <jsp:include page="<%= outerPath2 %>"></jsp:include>
    <%--
        <p>외부 파일에서 선언한 변수 : <%= newVar2 %></p>
        :외부 파일에서 선언한 변수는 못 가져옴
    --%>


</body>
</html>
