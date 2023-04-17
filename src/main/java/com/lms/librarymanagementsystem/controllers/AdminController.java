package com.lms.librarymanagementsystem.controllers;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.lms.librarymanagementsystem.FileHandler.SessionHandler;
import com.lms.librarymanagementsystem.models.Books;
import com.lms.librarymanagementsystem.models.Connector;
import com.lms.librarymanagementsystem.models.Journals;
import com.lms.librarymanagementsystem.models.Magazines;
// import com.lms.librarymanagementsystem.models.Message;
import com.lms.librarymanagementsystem.models.Registration;
import com.lms.librarymanagementsystem.models.SoftCopy;
import com.lms.librarymanagementsystem.models.Theses;
import com.lms.librarymanagementsystem.models.Users;
import com.lms.librarymanagementsystem.services.AdminServices;
import com.lms.librarymanagementsystem.services.AlternativeServices;
import com.lms.librarymanagementsystem.services.BooksServices;
import com.lms.librarymanagementsystem.services.ConnectorServices;
import com.lms.librarymanagementsystem.services.EmailServices;
import com.lms.librarymanagementsystem.services.JournalsServices;
import com.lms.librarymanagementsystem.services.MagazinesServices;
// import com.lms.librarymanagementsystem.services.MessageServices;
import com.lms.librarymanagementsystem.services.RegistrationServices;
import com.lms.librarymanagementsystem.services.SoftCopyServices;
import com.lms.librarymanagementsystem.services.ThesesServices;
import com.lms.librarymanagementsystem.services.UsersServices;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/admin")
public class AdminController {
    private RegistrationServices registrationServices;
    private UsersServices usersServices;
    private EmailServices emailServices;
    private AlternativeServices alternativeServices;
    private BooksServices booksServices;
    private ConnectorServices connectorServices;
    private JournalsServices journalsServices;
    private MagazinesServices magazinesServices;
    private ThesesServices thesesServices;
    private SoftCopyServices softCopyServices;
    private AdminServices adminServices;

    public AdminController(RegistrationServices registrationServices, UsersServices usersServices,
            EmailServices emailServices, AlternativeServices alternativeServices, BooksServices booksServices,
            ConnectorServices connectorServices, JournalsServices journalsServices, MagazinesServices magazinesServices,
            ThesesServices thesesServices, SoftCopyServices softCopyServices, AdminServices adminServices) {
        this.registrationServices = registrationServices;
        this.usersServices = usersServices;
        this.emailServices = emailServices;
        this.alternativeServices = alternativeServices;
        this.booksServices = booksServices;
        this.connectorServices = connectorServices;
        this.journalsServices = journalsServices;
        this.magazinesServices = magazinesServices;
        this.thesesServices = thesesServices;
        this.softCopyServices = softCopyServices;
        this.adminServices = adminServices;
    }

    @GetMapping
    public String getProfile(HttpServletRequest req){
        System.out.println(SessionHandler.getUserSession(req));
        System.out.println(SessionHandler.getAccessSession(req));
        return "adminPanel";
    }

    @GetMapping("/viewpending/paid")
    public String viewPaidRegistration(Model model) {
        List<Registration> registrations = registrationServices.getPending("paid");
        model.addAttribute("registrations", registrations);
        model.addAttribute("category", "Paid");
        return "registrationRequests";
    }

    @GetMapping("/viewpending/unpaid")
    public String viewUnPaidRegistration(Model model) {
        List<Registration> registrations = registrationServices.getPending("unpaid");
        model.addAttribute("registrations", registrations);
        model.addAttribute("category", "Unpaid");
        return "registrationRequests";
    }

    @PostMapping("/approveuser")
    public String approveUser(Integer rsid, String pay) {
        registrationServices.updateApproval("approved", rsid);
        Registration registration = registrationServices.getOneRegistration(rsid);
        usersServices.insertOnUser(new Users(registration.getUsername(), registration.getPassword(),
                registration.getProfilePicture(), registration.getFirstName(), registration.getLastName(),
                registration.getGender(), registration.getDob(), registration.getPhone(), registration.getEmail(),
                registration.getCategory(), "active"));
        return "redirect:./viewpending/" + pay.toLowerCase();
    }

    @PostMapping("/rejectuser")
    public String rejectUser(Integer rsid, String message, String pay) {
        Registration registration = registrationServices.getOneRegistration(rsid);
        String content = "Dear! " + registration.getFirstName()
                + " ,your application has been rejected due to the reason: " + message
                + ". You can visit the admin for further information.";
        emailServices.sendMail(registration.getEmail(), "Rejection of Application", content);
        registrationServices.updateApproval("rejected", rsid);
        return "redirect:./viewpending/" + pay.toLowerCase();
    }

    @GetMapping("/addbook")
    public String getBookForm() {
        return "books";
    }

    @PostMapping("/addbook")
    public Books insertBook(Books book, MultipartFile thumbnailfile) {
        connectorServices.insertOneConnector(new Connector(book.getItid(), "book"));
        return booksServices.insertOneBook(book, thumbnailfile);
    }

    @GetMapping("/addjournal")
    public String getJournalForm() {
        return "journals";
    }

    @PostMapping("/addjournal")
    public Journals insertJournal(Journals journal, MultipartFile thumbnailfile) {
        connectorServices.insertOneConnector(new Connector(journal.getItid(), "journal"));
        return journalsServices.insertOneJournal(journal, thumbnailfile);
    }

    @GetMapping("/addtheses")
    public String getThesesForm() {
        return "theses";
    }

    @PostMapping("/addtheses")
    public Theses insertTheses(Theses theses, MultipartFile thumbnailfile) {
        connectorServices.insertOneConnector(new Connector(theses.getItid(), "theses"));
        return thesesServices.insertOneTheses(theses, thumbnailfile);
    }

    @GetMapping("/addmagazine")
    public String getMagazineForm() {
        return "magazines";
    }

    @PostMapping("/addmagazine")
    public Magazines insertMagazine(Magazines magazine, MultipartFile thumbnailfile) {
        connectorServices.insertOneConnector(new Connector(magazine.getItid(), "magazine"));
        return magazinesServices.insertOneMagazine(magazine, thumbnailfile);
    }

    @GetMapping("/addsoftcopy")
    public String getSoftCopyForm() {
        return "Softcopy";
    }

    @PostMapping("/addsoftcopy")
    public SoftCopy insertSoftCopy(SoftCopy softCopy, MultipartFile file, MultipartFile thumbnailfile) {
        return softCopyServices.insertOneSoftCopy(softCopy, file, thumbnailfile);
    }
    // @PostMapping("/addalternative")
}
