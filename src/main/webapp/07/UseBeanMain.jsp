<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ActionTag - UseBean</title>
    <%--
        자바빈즈 규약
        - 기본 패키지 이외의 패키지에 속해있어야한다.
        - 멤버 변수는 private 선언
        - 기본 생성자 필요
        - 게터/세터 메소드가 있어야한다.
        -게터/세터 메소드는 public으로 선언
    --%>
</head>
<body>
    <h2>ActionTag - UseBean</h2>
    <h3>Create JavaBeans</h3>
    <jsp:useBean id="person" class="com.common.Person" scope="request"/>
    <%--
        useBean 내부 동작
        Person person = (Person)request.getAttribute("person");
        if(person == null) {
            person = new Person();
            request.setAttribute("person");
        }
    --%>
    <h2>Setting value JavaBeans for setProperty</h2>
    <jsp:setProperty name="person" property="name" value="최지호"></jsp:setProperty>
    <jsp:setProperty name="person" property="age" value="34"></jsp:setProperty>

    <h2>Setting value JavaBeans for getProperty</h2>
    <ul>
        <li>이름 : <jsp:getProperty name="person" property="name"/></li>
        <li>나이 : <jsp:getProperty name="person" property="age"/></li>
    </ul>
</body>
</html>
