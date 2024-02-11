<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.common.Person" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>EL - COLLECTION</title>
</head>
<body>
    <h2>LIST COLLECTION</h2>
    <%
        List<Object> aList = new ArrayList<>();
        aList.add("에스파");
        aList.add(new Person("카리나", 25));
        pageContext.setAttribute("SmEnt", aList);
    %>
    <ul>
        <li>0번째 요소 : ${ SmEnt[0] }</li>
        <li>1번째 요소 : ${ SmEnt[1].name }, ${ SmEnt[1].age }</li>
        <li>2번째 요소 : ${ SmEnt[2] }</li>
    </ul>

    <h2>MAP COLLECTION</h2>
    <%
        Map<String, String> map = new HashMap<String, String>();
        map.put("한글", "최지호");
        map.put("Eng", "Jiho");
        pageContext.setAttribute("GeumJJok", map);
    %>
    <ul>
        <li>영문 KEY : ${ GeumJJok["Eng"] }, ${ GeumJJok['Eng'] }, ${ GeumJJok.Eng }</li>
        <li>한글 KEY : ${ GeumJJok["한글"] }, ${ GeumJJok['한글'] }, \${ GeumJJok.한글 }</li>
    </ul>
</body>
</html>
