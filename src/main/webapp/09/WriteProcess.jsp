<%@ page import="com.model1.board.BoardDTO" %>
<%@ page import="com.model1.board.BoardDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="./IsLoggedIn.jsp"%>
<%
    String title = request.getParameter("title");
    String content = request.getParameter("content");

    BoardDTO dto = new BoardDTO();
    dto.setTitle(title);
    dto.setContent(content);
    dto.setId(session.getAttribute("UserId").toString());

    BoardDAO dao = new BoardDAO();
    int iResult = dao.insertWrite(dto);

    dao.close();

    if(iResult == 1)
        response.sendRedirect("List.jsp");
    else
        JSFunction.alertBack("글쓰기에 실패하였습니다.", out);
%>