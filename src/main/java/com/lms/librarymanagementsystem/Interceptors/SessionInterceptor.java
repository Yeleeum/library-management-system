package com.lms.librarymanagementsystem.Interceptors;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.lms.librarymanagementsystem.FileHandler.SessionHandler;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Component
public class SessionInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler) throws Exception {
        if(SessionHandler.checkSession(req)){
            return true;
        }
        res.sendRedirect("/login");
        return false;
    }
}
