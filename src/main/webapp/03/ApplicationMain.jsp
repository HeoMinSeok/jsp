<%@ page import="java.util.Map" %>
<%@ page import="com.common.Person" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.LinkedHashMap" %><%--
  Created by IntelliJ IDEA.
  User: minzino
  Date: 2/1/24
  Time: 11:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Application 영역</title>
</head>
<body>
    <%--
       웹 애플리케이션 당 하나의 application 객체 생성
       서버를 닫기 전까지 계속 유지 된다.
       클라이언트가 요청하는 모든 페이지가 application 객체를 공유함.
      --%>

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
