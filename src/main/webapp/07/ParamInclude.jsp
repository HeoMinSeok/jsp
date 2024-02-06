<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <h2>Check parameters on included pages</h2>
    <ul>
        <li><%= request.getParameter("loc1") %></li>
        <li><%= request.getParameter("loc2") %></li>
    </ul>