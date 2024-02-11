<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  int num1 = 3;
  pageContext.setAttribute("num2", 4);
  pageContext.setAttribute("num3", "5");
  pageContext.setAttribute("num4", "8");
%>
<html>
<head>
    <title>EL - OPERATOR</title>
</head>
<body>
  <h2>Variable Declaration And assignment</h2>
  Variables declared in scriptlets : ${num1} <br>
  Variables stored in page scope : ${num2} <br>
  Variable assignment and immediate output :${num1 = 7} <br>
  Variable assignment and separate output : ${num2 = 9;''} => ${num2} <br>
  num1 = ${num1}, num2 = ${num2}, num3 = ${num3}, num4 = ${num4} <br>

  <h2>Arithmetic Operator</h2>
  num1 + num2 = ${num1 + num2}<br>
  num1 - num2 = ${num1 - num2}<br>
  num1 * num2 = ${num1 * num2}<br>
  num1 / num2 = ${num1 / num2}<br>

  num3 div num4 = ${num3 div num4} <br>
  num3 %div num4 = ${num3 % num4} <br>
  num3 mod num4 = ${num3 mod num4} <br>

  <h2>+ Operator Can Only Add</h2>
  num1 + "34" : ${num1 + "34"} <br>
<%--  num1 + "이십" : ${num1 + "이십"} <br>--%>
<%--  "삼십 + "사십" : ${"삼십" + "사십"} <br>--%>

  <h2>Comparison Operator</h2>
  num3 > num4 : ${num3 gt num4} <br>
  num1 < num3 : ${num1 lt num3} <br>
  num3 >= num4 : ${num3 ge num4} <br>
  num2 == num4 : ${num2 eq num4} <br>

  <h2>Logical Operator</h2>
  num3 <= num4 %% num3 == num4 : ${num3 le num4 and num3 eq num4} <br>
  num3 >= num4 || num3 != num4 : ${num3 ge num4 or num3 ne num4} <br>

</body>
</html>
