package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("*.one")
public class FrontController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uri = req.getRequestURI();
        int lastSlash = uri.lastIndexOf("/");
        String commandStr = uri.substring(lastSlash);

        if(commandStr.equals("/regist.one"))
            registFunc(req);
        else if(commandStr.equals("/login.one"))
            loginFunc(req);
        else if(commandStr.equals("/freeboard.one"))
            freeboardFunc(req);

        req.setAttribute("uri", uri);
        req.setAttribute("commandStr", commandStr);
        req.getRequestDispatcher("/12/FrontController.jsp").forward(req, resp);
    }

    void freeboardFunc(HttpServletRequest req) {
        req.setAttribute("resultValue", "<h2>회원가입</h2>");
    }

    void loginFunc(HttpServletRequest req) {
        req.setAttribute("resultValue", "<h2>로그인</h2>");
    }

    void registFunc(HttpServletRequest req) {
        req.setAttribute("resultValue", "<h2>자유게시판</h2>");
    }
}
