package com.model2;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@WebServlet("/mvcboard/view.do")
public class ViewController extends HttpServlet {
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        MVCBoardDAO dao = new MVCBoardDAO();
        String idx = req.getParameter("idx");
        dao.updateVisitCount(idx);
        MVCBoardDTO dto = dao.selectView(idx);
        dao.close();

        dto.setContent(dto.getContent().replaceAll("\n", "<br/>"));

        String ext = null, fileName = dto.getSfile();
        if(fileName!=null)
            ext = fileName.substring(fileName.lastIndexOf(".")+1);
        String[] mimeStr = {"png", "jpg", "gif"};
        List<String> mimeList = Arrays.asList(mimeStr);
        boolean isImage = false;
        if(mimeList.contains(ext)){

            isImage = true;
        }
        req.setAttribute("dto", dto);
        req.setAttribute("isImage", isImage);
        req.getRequestDispatcher("/14/View.jsp").forward(req, resp);
    }
}
