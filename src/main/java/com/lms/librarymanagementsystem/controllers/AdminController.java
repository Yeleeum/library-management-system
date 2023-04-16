package com.lms.librarymanagementsystem.controllers;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lms.librarymanagementsystem.models.Message;
import com.lms.librarymanagementsystem.models.Registration;
import com.lms.librarymanagementsystem.models.Users;
import com.lms.librarymanagementsystem.services.EmailServices;
import com.lms.librarymanagementsystem.services.MessageServices;
import com.lms.librarymanagementsystem.services.RegistrationServices;
import com.lms.librarymanagementsystem.services.UsersServices;

@Controller
@RequestMapping("/admin")
public class AdminController {
    private RegistrationServices registrationServices;
    private UsersServices usersServices;
    private EmailServices emailServices;


    public AdminController(RegistrationServices registrationServices, UsersServices usersServices, EmailServices emailServices) {
        this.registrationServices = registrationServices;
        this.usersServices = usersServices;
        this.emailServices = emailServices;
    }

    
    @GetMapping("/viewpending/paid")
    public String viewPaidRegistration(Model model){
        List<Registration> registrations=registrationServices.getPending("paid");
        model.addAttribute("registrations", registrations);
        model.addAttribute("category", "Paid");
        return "registrationRequests";
    }

    @GetMapping("/viewpending/unpaid")
    public String viewUnPaidRegistration(Model model){
        List<Registration> registrations=registrationServices.getPending("unpaid");
        model.addAttribute("registrations", registrations);
        model.addAttribute("category", "Unpaid");
        return "registrationRequests";
    }

    @PostMapping("/approveuser")
    public String approveUser(Integer rsid,String pay){
        registrationServices.updateApproval("approved", rsid);
        Registration registration=registrationServices.getOneRegistration(rsid);
        usersServices.insertOnUser(new Users(registration.getUsername(), registration.getPassword(), registration.getProfilePicture(), registration.getFirstName(), registration.getLastName(), registration.getGender(), registration.getDob(), registration.getPhone(), registration.getEmail(), registration.getCategory(), "active"));
        return "redirect:./viewpending/"+pay.toLowerCase();
    }

    @PostMapping("/rejectuser")
    public String rejectUser(Integer rsid,String message,String pay){
        Registration registration=registrationServices.getOneRegistration(rsid);
        String content="Dear! "+registration.getFirstName()+" ,your application has been rejected due to the reason: "+message+". You can visit the admin for further information.";
        emailServices.sendMail(registration.getEmail(), "Rejection of Application", content);
        registrationServices.updateApproval("rejected", rsid);
        return "redirect:./viewpending/"+pay.toLowerCase();
    }
}
