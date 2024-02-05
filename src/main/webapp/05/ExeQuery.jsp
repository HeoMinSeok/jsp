<%@ page import="com.common.JDBCConnect" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>JDBC</title>
</head>
<body>
<h2>회원 추가 테스트(executeUpdate() 사용)</h2>
<%
    JDBCConnect jdbc = new JDBCConnect();

    String sql = "SELECT id,pass,name,regidate FROM scott.member_jsp";
    Statement stmt = jdbc.con.createStatement();

    ResultSet rs = stmt.executeQuery(sql);
    while(rs.next()) {
        String id = rs.getString(1);
        String pw = rs.getString(2);
        String name = rs.getString("name");
        Date regiDate = rs.getDate("regiDate");

        out.println(String.format("%s %s %s %s", id, pw, name, regiDate) + "<br>");
    }

    jdbc.close();
%>
</body>
</html>
