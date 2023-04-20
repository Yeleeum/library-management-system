package com.lms.librarymanagementsystem.controllers;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lms.librarymanagementsystem.FileHandler.SessionHandler;
import com.lms.librarymanagementsystem.models.Borrow;
import com.lms.librarymanagementsystem.services.BorrowServices;
import com.lms.librarymanagementsystem.services.UsersServices;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/user")
public class UserController {
    private UsersServices usersServices;
    private BorrowServices borrowServices;

    public UserController(UsersServices usersServices,BorrowServices borrowServices) {
        this.usersServices = usersServices;
        this.borrowServices=borrowServices;
    }

    @GetMapping
    public String getProfile(HttpServletRequest req){
        System.out.println(SessionHandler.getUserSession(req));
        System.out.println(SessionHandler.getAccessSession(req));
        return "UserProfile";
    }

    @PostMapping("/checkborrow")
    public ResponseEntity<String> checkBorrow(String itid,HttpServletRequest req){
        String username=SessionHandler.getUserSession(req);
        String returnString="false";
        if(borrowServices.findUnReturnedByItidByUsername(itid,username).isEmpty()){
            returnString="true";
         }
        if(borrowServices.findUnReturnedByUsername(username).size()<2){
            returnString="true";
        } 

        return new ResponseEntity<String>(returnString,HttpStatus.OK);
    }

    @PostMapping("/borrow")
    public ResponseEntity<String> borrowItem(Borrow borrow,HttpServletRequest req){
        borrow.setUsername(SessionHandler.getUserSession(req));
        System.out.println(borrow);
        borrowServices.inserOneBorrow(borrow);
        return new ResponseEntity<String>("true",HttpStatus.OK);
    }
}
