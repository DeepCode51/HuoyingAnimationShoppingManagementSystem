package com.ly.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class MyInterceptor2 implements HandlerInterceptor {
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws ServletException, IOException {
        // 如果是以下页面则放行
        System.out.println("uri: " + request.getRequestURI());
        if (request.getRequestURI().contains("login") || request.getRequestURI().contains("toindex")
            || request.getRequestURI().contains("register")|| request.getRequestURI().contains("Userlogout")
            || request.getRequestURI().contains("torenzhejianjie")|| request.getRequestURI().contains("toOPED")
            || request.getRequestURI().contains("tohyrzResource")|| request.getRequestURI().contains("toFigure")
            || request.getRequestURI().contains("tohyrzIntroduce")|| request.getRequestURI().contains("toxiaozuzhi")
            || request.getRequestURI().contains("tolidaihuoying")|| request.getRequestURI().contains("torendaoqiren")
            || request.getRequestURI().contains("tobamendunjia")|| request.getRequestURI().contains("toOPmusicclassify")
            || request.getRequestURI().contains("toEDmusicclassify")|| request.getRequestURI().contains("toComment")
            || request.getRequestURI().contains("toSalesSortFigure")|| request.getRequestURI().contains("toXuanWoMingRenIntroduce")
            || request.getRequestURI().contains("toZuoZhuIntroduce")

            || request.getRequestURI().contains("Adminlogout")|| request.getRequestURI().contains("toadmin")
            || request.getRequestURI().contains("toAdminIndex")|| request.getRequestURI().contains("adminLogin")
            || request.getRequestURI().contains("toAdminrenzhejianjie")|| request.getRequestURI().contains("toAdminOPED")
            || request.getRequestURI().contains("toAdminHyrzResource")|| request.getRequestURI().contains("toAdminFigure")
            || request.getRequestURI().contains("toAdminHyrzIntroduce")|| request.getRequestURI().contains("toAdminXuanWoMingRenIntroduce")
            || request.getRequestURI().contains("toAdminZuoZhuIntroduce")|| request.getRequestURI().contains("toAdminxiaozuzhi")
            || request.getRequestURI().contains("toAdminlidaihuoying")|| request.getRequestURI().contains("toAdminrendaoqiren")
            || request.getRequestURI().contains("toAdminbamendunjia")|| request.getRequestURI().contains("toAdminOPmusicclassify")
            || request.getRequestURI().contains("toAdminEDmusicclassify")|| request.getRequestURI().contains("toAdminComment")
            || request.getRequestURI().contains("toAdminShowFigureReportForms")|| request.getRequestURI().contains("toAdminxiaozuzhiFigure")
            || request.getRequestURI().contains("toAdminlidaihuoyingFigure")|| request.getRequestURI().contains("toAdminrendaoqirenFigure")
            || request.getRequestURI().contains("toAdminbamendunjiaFigure")|| request.getRequestURI().contains("toAdminSalesSortFigure")
        ) {
            return true;
        }
        HttpSession session = request.getSession();
        // 如果用户已登陆也放行
        if(session.getAttribute("loginSession") != null) {
            return true;
        }
        // 如果管理员已登陆也放行
        if(session.getAttribute("AdminLoginSession") != null) {
            return true;
        }
        // 用户没有登陆跳转到登陆页面
        request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
        return false;
    }

    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
