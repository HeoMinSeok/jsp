<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>OUTER</title>
</head>
<body>
  <h2>External File 2</h2>
  <%
    String newVar2 = "김해 조혜령";
  %>

  <ul>
    <li>page 영역 속성 : <%=pageContext.getAttribute("pAttr")%> </li>
    <li>request 영역 속성 : <%=request.getAttribute("rAttr")%></li>
  </ul>
</body>
</html>
