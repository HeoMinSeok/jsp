<%@ page import="java.util.Map" %>
<%@ page import="com.common.Person" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.LinkedHashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Application 영역</title>
</head>
<body>
    <%
        Map<String, Person> maps = new LinkedHashMap<>();
        maps.put("person1", new Person("최지호", 39));
        maps.put("person2", new Person("허민석", 24));
        maps.put("person3", new Person("도수빈", 19));
        maps.put("person4", new Person("조혜령", 49));
        maps.put("person5", new Person("최정환", 12));
        application.setAttribute("maps", maps);
    %>

    <p>application 영역에 속성이 저장되었습니다.</p>

</body>
</html>
