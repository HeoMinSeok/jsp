package com.servlet;

import com.membership.MemberDAO;
import com.membership.MemberDTO;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class MemberAuth extends HttpServlet {
    private static final long serialVersionUID = 1L;
    MemberDAO dao;

    @Override
    public void init() throws ServletException {
        // 애플리케이션 내장 객체
        ServletContext app = this.getServletContext();
        // DAO 생성
        dao = new MemberDAO();
    }

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 서블릿 초기화 매개변수에서 관리자 ID 받기
        String admin_id = this.getInitParameter("admin_id");

        // 인증을 요청한 ID/PW
        String id = req.getParameter("id");
        String pass = req.getParameter("pass");

        MemberDTO dto = dao.getMemberDTO(id, pass);

        String mName = dto.getName();
        if(mName != null)
            req.setAttribute("authMessage", mName + " 하잉 ~ ");
        else {
            if(admin_id.equals(id))
                req.setAttribute("authMessage", admin_id + " 는 대장입니다.");
            else
                req.setAttribute("authMessage", "누구세요 ? ");
        }
        req.getRequestDispatcher("/12/MemberAuth.jsp").forward(req, resp);
    }
    @Override
    public void destroy() {
        dao.close();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
