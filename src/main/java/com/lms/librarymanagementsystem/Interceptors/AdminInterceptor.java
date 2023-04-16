package com.lms.librarymanagementsystem.Interceptors;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.lms.librarymanagementsystem.FileHandler.SessionHandler;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Component
public class AdminInterceptor implements HandlerInterceptor {
    public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler) throws Exception {
        if(!SessionHandler.checkSession(req) ){
            return true;
        }
        res.sendRedirect("/user");
        return false;
    }
}
