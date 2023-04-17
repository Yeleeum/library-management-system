package com.lms.librarymanagementsystem.controllers;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lms.librarymanagementsystem.FileHandler.SessionHandler;
import com.lms.librarymanagementsystem.models.Registration;
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

    @GetMapping
    public String getLoginForm(){
        return "login";
    }

    @PostMapping("/users")
    public ResponseEntity<String> userLogin(String username,String password,HttpServletRequest req){
        List<Users> users=usersServices.findUserByUsernamePassword(username, password);
        if(!users.isEmpty()){
            SessionHandler.setSession(req, username, "nonadmin");
            return new ResponseEntity<String>("logged", HttpStatus.OK);
        }
        List<Registration> registrationspending=registrationServices.findUserByUsernamePasswordPending(username, password);
        if(!registrationspending.isEmpty()){
            return new ResponseEntity<String>("pending", HttpStatus.OK);
        }
        List<Registration> registrationsrejected=registrationServices.findUserByUsernamePasswordRejected(username, password);
        if(!registrationsrejected.isEmpty()){
            return new ResponseEntity<String>("rejected", HttpStatus.OK);
        }
        return new ResponseEntity<String>("not found", HttpStatus.NOT_FOUND);
    }
    
}
