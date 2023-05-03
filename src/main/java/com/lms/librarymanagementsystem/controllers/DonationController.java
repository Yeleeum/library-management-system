package com.lms.librarymanagementsystem.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.lms.librarymanagementsystem.models.BookDonations;
import com.lms.librarymanagementsystem.models.JournalDonations;
import com.lms.librarymanagementsystem.models.MagazineDonations;
import com.lms.librarymanagementsystem.models.ThesesDonations;
import com.lms.librarymanagementsystem.services.BooksDonationServices;
import com.lms.librarymanagementsystem.services.ConnectorServices;
import com.lms.librarymanagementsystem.services.JournalDonationServices;
import com.lms.librarymanagementsystem.services.MagazineDonationServices;
import com.lms.librarymanagementsystem.services.ThesesDonationServices;

import org.springframework.ui.Model;

@Controller
@RequestMapping("/donation")
public class DonationController {
    private BooksDonationServices booksDonationServices;
    private ConnectorServices connectorServices;
    private ThesesDonationServices thesesDonationServices;
    private JournalDonationServices journalDonationServices;
    private MagazineDonationServices magazineDonationServices;

    public DonationController(BooksDonationServices booksDonationServices, ConnectorServices connectorServices,
            ThesesDonationServices thesesDonationServices, JournalDonationServices journalDonationServices, MagazineDonationServices magazineDonationServices) {
        this.booksDonationServices = booksDonationServices;
        this.journalDonationServices = journalDonationServices;
        this.connectorServices = connectorServices;
        this.thesesDonationServices = thesesDonationServices;
        this.magazineDonationServices = magazineDonationServices;
    }

    // book
    @GetMapping("/book")
    public String getBookDonationForm() {
        return "bookDonationForm";
    }

    @PostMapping("/book")
    public String submitBookDonationDetails(BookDonations bookDonations, MultipartFile thumbnailfile, Model model) {
        booksDonationServices.insertOneBookDonations(bookDonations, thumbnailfile);
        String message = "Donation Successfull.";
        model.addAttribute("message", message);
        return "bookDonationForm";
    }

    // theses
    @GetMapping("/theses")
    public String getThesesDonationForm() {
        return "thesesDonationForm";
    }

    @PostMapping("/theses")
    public String submitThesesDonationDetails(ThesesDonations thesesDonations, MultipartFile thumbnailfile,
            Model model) {
        thesesDonationServices.insertOneThesesDonations(thesesDonations, thumbnailfile);
        String message = "Donation Successfull.";
        model.addAttribute("message", message);
        return "thesesDonationForm";
    }

    @GetMapping("/journal")
    public String getJournalDonationForm() {
        return "journalDonationForm";
    }

    @PostMapping("/journal")
    public String submitJournalDonationDetails(JournalDonations journalDonations, MultipartFile thumbnailfile,
            Model model) {
        journalDonationServices.insertOneJournalDonations(journalDonations, thumbnailfile);
        String message = "Donation Successfull.";
        model.addAttribute("message", message);
        return "bookDonationForm";
    }

    @GetMapping("/magazine")
    public String getMagazineDonationForm() {
        return "magazineDonationForm";
    }

    @PostMapping("/magazine")
    public String submitMagazineDonationDetails(MagazineDonations magazineDonations, MultipartFile thumbnailfile, Model model) {
        magazineDonationServices.insertOneJournalDonations(magazineDonations, thumbnailfile);
        String message = "Donation Successfull.";
        model.addAttribute("message", message);
        return "magazineDonationForm";
    }
}