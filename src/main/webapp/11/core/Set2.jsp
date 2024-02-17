<%@ page import="java.util.ArrayList" %>
<%@ page import="com.common.Person" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSTL - SET 2</title>
</head>
<body>
  <h2>List Collection</h2>
  <%
    ArrayList<Person> pList = new ArrayList<Person>();
    pList.add(new Person("최지호", 24));
    pList.add(new Person("한소희", 31));
  %>
  <c:set var="personList" value="<%= pList %>" scope="request"/>
  <ul>
    <li>이름 : ${ requestScope.personList[0].name }</li>
    <li>나이 : ${ requestScope.personList[0].age }</li>
    <li>이름 : ${ requestScope.personList[1].name }</li>
    <li>나이 : ${ requestScope.personList[1].age }</li>
  </ul>

  <h2>Map Collection</h2>
  <%
    Map<String, Person> pMap = new HashMap<String, Person>();
    pMap.put("personArgs1", new Person("최죠", 24));
    pMap.put("personArgs2", new Person("카리나", 25));
  %>
  <c:set var="personMap" value="<%= pMap %>" scope="request"/>
  <ul>
    <li>이름 : ${ requestScope.personMap.personArgs1.name }</li>
    <li>나이 : ${ requestScope.personMap.personArgs1.age }</li>
    <li>이름 : ${ requestScope.personMap.personArgs2.name }</li>
    <li>나이 : ${ requestScope.personMap.personArgs2.age }</li>
  </ul>
</body>
</html>
