<%@ page import="com.util.CookieManager" %>
<%@ page import="com.util.JSFunction" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String user_id = request.getParameter("user_id");
    String user_pw = request.getParameter("user_pw");
    String save_check = request.getParameter("save_check");

    if("최지호".equals(user_id) && "1004".equals(user_pw)){
        if(save_check != null && save_check.equals("Y"))
            CookieManager.makeCookie(response, "loginId", user_id, 86400);
        else
            CookieManager.deleteCookie(response, "loginId");
        JSFunction.alertLocation("LOGIN SUCCESS", "IdSaveMain.jsp", out);
    }
    else
        JSFunction.alertBack("LOGIN FAILED", out);
%>