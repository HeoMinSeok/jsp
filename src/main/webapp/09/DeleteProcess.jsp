<%@ page import="com.model1.board.BoardDTO" %>
<%@ page import="com.model1.board.BoardDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="./IsLoggedIn.jsp"%>
<%
    String num = request.getParameter("num");
    BoardDTO dto = new BoardDTO();
    BoardDAO dao = new BoardDAO();
    dto = dao.selectView(num);

    String sessionId = session.getAttribute("UserId").toString();

    int delResult = 0;

    if(sessionId.equals(dto.getId())) {
        dto.setNum(num);
        delResult = dao.deletePost(dto);
        dao.close();

        if(delResult == 1)
            JSFunction.alertLocation("삭제되었습니다.", "List.jsp", out);
        else
            JSFunction.alertBack("삭제에 실패했습니다.", out);
    }
    else {
        JSFunction.alertBack("본인만 삭제할 수 있습니다.", out);
        return;
    }
%>
