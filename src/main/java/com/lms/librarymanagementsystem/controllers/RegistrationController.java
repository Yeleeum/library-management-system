package com.lms.librarymanagementsystem.controllers;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
// import org.springframework.web.bind.annotation.RequestAttribute;
// import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.lms.librarymanagementsystem.models.Registration;
import com.lms.librarymanagementsystem.services.MessageServices;
import com.lms.librarymanagementsystem.services.RegistrationServices;


@Controller
@RequestMapping("/registration")
public class RegistrationController {
    private RegistrationServices registrationServices;
    private MessageServices messageServices;

    public RegistrationController(RegistrationServices registrationServices, MessageServices messageServices) {
        this.registrationServices = registrationServices;
        this.messageServices = messageServices;
    }

    @GetMapping
    public String getRegistrationForm(){
        return "personalDetailsForm";
    }

    @PostMapping("/checkusername")
    public ResponseEntity<String> checkUsername(String username){
        List<String> usernames=registrationServices.findPendingApprovedUsernames();
        String response="true";
        for(String user:usernames){
            System.out.println(user+" "+username);
            if(user.equals(username)){
                System.out.println(user);
                response="false";
                break;
            }
        }
        return new ResponseEntity<String>(response,HttpStatus.OK);
    }

    @PostMapping("/submitregister")
    public String submitPersonalDetails(Registration registration,MultipartFile profilepicturefile){
        System.out.println(registration);
        return "submitted";
    }

}
