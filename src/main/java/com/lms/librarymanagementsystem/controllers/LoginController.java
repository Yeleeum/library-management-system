package com.lms.librarymanagementsystem.controllers;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lms.librarymanagementsystem.FileHandler.SessionHandler;
import com.lms.librarymanagementsystem.models.Users;
import com.lms.librarymanagementsystem.services.RegistrationServices;
import com.lms.librarymanagementsystem.services.UsersServices;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/login")
public class LoginController {
    private UsersServices usersServices;
    private RegistrationServices registrationServices;

    public LoginController(UsersServices usersServices, RegistrationServices registrationServices) {
        this.usersServices = usersServices;
        this.registrationServices = registrationServices;
    }

    @GetMapping("/users")
    public String getUserLoginForm(){
        return "userLogin";
    }

    @PostMapping("/users")
    public String userLogin(String username,String password,HttpServletRequest req){
        List<Users> users=usersServices.findUserByUsernamePassword(username, password);
        if(!users.isEmpty()){
            SessionHandler.setSession(req, username, "nonadmin");
            return "redirect:/user";
        }
        return "redirect:/login/users";
    }
    
}
