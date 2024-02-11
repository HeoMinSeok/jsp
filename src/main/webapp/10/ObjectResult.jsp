<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>EL - Get object parameters</title>
</head>
<body>
    <h2>Reading objects passed through a scope</h2>

    <ul>
        <li>Person 객체 : 이름 -> ${personObj.name}, 나이 -> ${personObj.age}</li>
        <li>String 객체 : ${requestScope.StringObj}</li>
        <li>Integer 객체 : ${IntegerObj}</li>
    </ul>

    <h2>Reading values passed as parameters</h2>
    <ul>
        <li>${param.firstNum + param.secondNum}</li>
        <li>${param["firstNum"]} + ${param["secondNum"]}</li>
    </ul>
</body>
</html>
