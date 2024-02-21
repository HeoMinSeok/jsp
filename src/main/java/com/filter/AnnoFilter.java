package com.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;

import java.io.IOException;

@WebFilter(filterName = "AnnoFilter", urlPatterns = "/15/AnnoFilter.jsp")
public class AnnoFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
        System.out.println("BasicFilter -> init() 호출됨") ;
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain filterChain) throws IOException, ServletException {
        String searchField = req.getParameter("searchField");
        String searchWord = req.getParameter("searchWord");
        System.out.println("검색 필드 : " + searchField);
        System.out.println("검색어 : " + searchWord);
        filterChain.doFilter(req, resp);
    }

    @Override
    public void destroy() {
        Filter.super.destroy();
        System.out.println("BasicFilter -> destroy() 호출됨");
    }
}
