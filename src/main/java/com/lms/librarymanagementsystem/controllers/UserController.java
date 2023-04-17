package com.lms.librarymanagementsystem.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lms.librarymanagementsystem.FileHandler.SessionHandler;
import com.lms.librarymanagementsystem.services.UsersServices;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/user")
public class UserController {
    private UsersServices usersServices;

    public UserController(UsersServices usersServices) {
        this.usersServices = usersServices;
    }

    @GetMapping
    public String getProfile(HttpServletRequest req){
        System.out.println(SessionHandler.getUserSession(req));
        System.out.println(SessionHandler.getAccessSession(req));
        return "UserProfile";
    }
}
