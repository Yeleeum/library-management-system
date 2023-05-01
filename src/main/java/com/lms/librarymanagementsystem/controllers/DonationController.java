package com.lms.librarymanagementsystem.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.lms.librarymanagementsystem.models.BookDonations;
import com.lms.librarymanagementsystem.services.BooksDonationServices;
import com.lms.librarymanagementsystem.services.ConnectorServices;

import org.springframework.ui.Model;

@Controller
@RequestMapping("/donation")
public class DonationController {
    private BooksDonationServices booksDonationServices;
    private ConnectorServices connectorServices;

    public DonationController(BooksDonationServices booksDonationServices, ConnectorServices connectorServices) {
        this.booksDonationServices = booksDonationServices;
        this.connectorServices = connectorServices;
    }

    @GetMapping("/book")
    public String getBooksBySearch() {
        return "bookDonationForm";
    }

    @PostMapping("/book")
    public String submitBookDonationDetails(BookDonations bookDonations, MultipartFile thumbnailfile,Model model){
        booksDonationServices.insertOneBookDonations(bookDonations, thumbnailfile);
        String message="Donation Successfull.";
        model.addAttribute("message", message);
        return "bookDonationForm";
    }
}