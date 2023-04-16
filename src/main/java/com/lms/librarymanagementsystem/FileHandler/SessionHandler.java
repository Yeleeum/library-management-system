package com.lms.librarymanagementsystem.FileHandler;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public class SessionHandler {
    public boolean checkSession(HttpServletRequest req){
       HttpSession session=req.getSession(false);
       if(session!=null && (String)session.getAttribute("user")!=null){
        return true;
       }
        return false;
    }

    public String getUserSession(HttpServletRequest req){
        if(checkSession(req)){
            return (String)req.getSession(false).getAttribute("user");
        }
        return null;
    }

    public String getAccessSession(HttpServletRequest req){
        if(checkSession(req)){
            return (String)req.getSession(false).getAttribute("access");
        }
        return null;
    }

    public void setSession(HttpServletRequest req,String user,String access){
        HttpSession session=req.getSession();
        session.setAttribute("user", user);
        session.setAttribute("access", access);
    }

    public void deleteSession(HttpServletRequest req){
        HttpSession session=req.getSession(false);
        session.invalidate();
    }
}
