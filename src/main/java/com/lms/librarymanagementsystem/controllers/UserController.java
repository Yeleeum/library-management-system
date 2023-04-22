package com.lms.librarymanagementsystem.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.lms.librarymanagementsystem.Handlers.SessionHandler;
import com.lms.librarymanagementsystem.models.Borrow;
import com.lms.librarymanagementsystem.models.Fine;
import com.lms.librarymanagementsystem.models.Users;
import com.lms.librarymanagementsystem.services.BorrowServices;
import com.lms.librarymanagementsystem.services.FineServices;
import com.lms.librarymanagementsystem.services.UsersServices;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/user")
public class UserController {
    private UsersServices usersServices;
    private BorrowServices borrowServices;
    private FineServices fineServices;

    public UserController(UsersServices usersServices,BorrowServices borrowServices,FineServices fineServices) {
        this.usersServices = usersServices;
        this.borrowServices=borrowServices;
        this.fineServices=fineServices;
    }

    @GetMapping
    public String getProfile(HttpServletRequest req,Model model){
        System.out.println(SessionHandler.getUserSession(req));
        System.out.println(SessionHandler.getAccessSession(req));
        Users user=usersServices.findUserByUsername(SessionHandler.getUserSession(req));
        List<Fine> fines=fineServices.findUnpaidFineByUsername(SessionHandler.getUserSession(req));
        Integer totalFine=0;
        for(Fine fine:fines){
            totalFine+=fine.getAmount();
        }
        model.addAttribute("user", user);
        model.addAttribute("fine", totalFine);
        return "userPanel";
    }

    @PostMapping("/checkborrow")
    public ResponseEntity<String> checkBorrow(String itid,HttpServletRequest req){
        String username=SessionHandler.getUserSession(req);
        Map<String, String> keyValue = new HashMap<>();
        keyValue.put("status", "true");
        keyValue.put("message", "Can borrow");
        // String returnString="true";
        if(!borrowServices.findUnReturnedByItidByUsername(itid,username).isEmpty()){
            keyValue.put("status", "false");
            keyValue.put("message", "You have already Borrowed this item.");
        }else if(borrowServices.findUnReturnedByUsername(username).size()==2){
            keyValue.put("status", "false");
            keyValue.put("message", "You have already Borrowed Two Items.");
        }else if(!fineServices.findUnpaidFineByUsername(username).isEmpty()){
            keyValue.put("status", "false");
            keyValue.put("message", "You have a fine.");
        }else if(!usersServices.getInactiveUsers(username).isEmpty()){
            keyValue.put("status", "false");
            keyValue.put("message", "The membership has expired");
        }
        ObjectMapper objectMapper = new ObjectMapper();
        String json="";
        try {
            json = objectMapper.writeValueAsString(keyValue);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return new ResponseEntity<String>(json,HttpStatus.OK);
    }

    @PostMapping("/borrow")
    public ResponseEntity<String> borrowItem(Borrow borrow,HttpServletRequest req){
        borrow.setUsername(SessionHandler.getUserSession(req));
        System.out.println(borrow);
        borrowServices.inserOneBorrow(borrow);
        return new ResponseEntity<String>("true",HttpStatus.OK);
    }
}
