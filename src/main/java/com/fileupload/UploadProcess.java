package com.fileupload;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/13/UploadProcess.do")
@MultipartConfig(
        maxFileSize = 1024 * 1024 * 1,
        maxRequestSize = 1024 * 1024 * 10
)
public class UploadProcess extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{
            String saveDirectory = getServletContext().getRealPath("/Uploads");
            String originalFileName = FileUtil.uploadFile(req, saveDirectory);
            String savedFileName = FileUtil.renameFile(saveDirectory, originalFileName);
            insertMyFile(req, originalFileName, savedFileName);
            resp.sendRedirect("FileList.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errMessage", "파일 업로드 오류");
            req.getRequestDispatcher("FileUploadMain.jsp").forward(req, resp);
        }
    }

    private void insertMyFile(HttpServletRequest req, String oFileName, String sFileName) {
        String title = req.getParameter("title");
        String[] cateArr = req.getParameterValues("cate");
        StringBuffer cateBuf = new StringBuffer();
        if (cateArr == null)
            cateBuf.append("선택한 항목 없음");
        else {
            boolean isFirst = true;
            for (String s : cateArr) {
                if (!isFirst)
                    cateBuf.append(", ");
                else
                    isFirst = false;
                cateBuf.append(s);
            }
        }

        MyFileDTO dto = new MyFileDTO();
        dto.setTitle(title);
        dto.setCate(cateBuf.toString());
        dto.setOfile(oFileName);
        dto.setSfile(sFileName);

        MyFileDAO dao = new MyFileDAO();
        dao.insertFile(dto);
        dao.close();
    }
}
