package com.model2;

import com.fileupload.FileUtil;
import com.util.JSFunction;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class WriteController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/14/Write.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 1. 파일 업로드 처리 - 업로드 디렉토리 물리 경로 확인
        String saveDir = req.getServletContext().getRealPath("/Uploads");

        // -파일 업로드
        String originalFileName = "";
        try {
            originalFileName = FileUtil.uploadFile(req, saveDir);
        } catch (Exception e) {
            // - 파일 업로드 실패
            JSFunction.alertLocation(resp, "파일 업로드 오류입니다.", "../mvcboard/write.do");
            return;
        }

        // 2. 파일 업로드 외 처리 - 폼값 DTO에 저장
        MVCBoardDTO dto = new MVCBoardDTO();
        dto.setName(req.getParameter("name"));
        dto.setTitle(req.getParameter("title"));
        dto.setContent(req.getParameter("content"));
        dto.setPass(req.getParameter("pass"));

        // - 원본 파일명과 저장된 파일 이름 설정
        if (originalFileName != "" && originalFileName != null) {
            // -첨부 파일 있을 경우 파일명 변경
            String savedFileName = FileUtil.renameFile(saveDir, originalFileName);

            dto.setOfile(originalFileName);
            dto.setSfile(savedFileName);
        }
        // - DAO를 통해 DB에 게시 내용 저장
        MVCBoardDAO dao = new MVCBoardDAO();
        int result = dao.insertWrite(dto);
        dao.close();

        if (result == 1)
            resp.sendRedirect("../mvcboard/list.do");
        else
            JSFunction.alertLocation(resp, "글쓰기에 실패했습니다.", "../mvcboard/write.do");
    }
}
