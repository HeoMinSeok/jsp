<%@ page import="com.el.MyElClass" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="mytag" uri="/WEB-INF/MyTagLib.tld" %>
<%
    MyElClass myClass = new MyElClass();
    pageContext.setAttribute("myClass", myClass);
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Call EL METHOD</title>
</head>
<body>
    <h2>Calling method after saving in area</h2>
    010815-4000000 = > ${ myClass.getGender("010815-4000000") } <br>
    960919-1000000 = > ${ myClass.getGender("960919-1000000") } <br>

    <h2>Calling static methods via class name</h2>
    ${ MyElClass.showGugudan(4) }

    <h2>Calling static methods using TLD files</h2>
    <ul>
        <li>mytag:isNumber("100") => ${mytag:isNumber("100")}</li>
        <li>mytag:isNumber("이백") => ${mytag:isNumber("이백")}</li>
    </ul>

    <h2></h2>
</body>
</html>
