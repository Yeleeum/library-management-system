package com.lms.librarymanagementsystem.controllers;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.lms.librarymanagementsystem.Handlers.SessionHandler;
import com.lms.librarymanagementsystem.models.Books;
import com.lms.librarymanagementsystem.models.Borrow;
import com.lms.librarymanagementsystem.models.Connector;
import com.lms.librarymanagementsystem.models.Journals;
import com.lms.librarymanagementsystem.models.Magazines;
import com.lms.librarymanagementsystem.models.Registration;
import com.lms.librarymanagementsystem.models.SoftCopy;
import com.lms.librarymanagementsystem.models.Theses;
import com.lms.librarymanagementsystem.models.Users;
import com.lms.librarymanagementsystem.services.AdminServices;
import com.lms.librarymanagementsystem.services.AlternativeServices;
import com.lms.librarymanagementsystem.services.BooksServices;
import com.lms.librarymanagementsystem.services.BorrowServices;
import com.lms.librarymanagementsystem.services.ConnectorServices;
import com.lms.librarymanagementsystem.services.EmailServices;
import com.lms.librarymanagementsystem.services.JournalsServices;
import com.lms.librarymanagementsystem.services.MagazinesServices;
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
    private BorrowServices borrowServices;

    public AdminController(RegistrationServices registrationServices, UsersServices usersServices,
            EmailServices emailServices, AlternativeServices alternativeServices, BooksServices booksServices,
            ConnectorServices connectorServices, JournalsServices journalsServices, MagazinesServices magazinesServices,
            ThesesServices thesesServices, SoftCopyServices softCopyServices, AdminServices adminServices,
            BorrowServices borrowServices) {
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
        this.borrowServices = borrowServices;
    }

    @GetMapping
    public String getProfile(HttpServletRequest req, Model model) {
        // System.out.println(SessionHandler.getUserSession(req));
        // System.out.println(SessionHandler.getAccessSession(req));
        List<Registration> top5Registrations = registrationServices.findTopPendings();
        List<Registration> registrations = registrationServices.findAllPending();
        List<Borrow> borrows = borrowServices.findPendingBorrows();
        model.addAttribute("registrations", top5Registrations);
        model.addAttribute("noOfRegistrations", registrations.size());
        model.addAttribute("borrows", borrows);
        model.addAttribute("noOfPendingBorrow", borrows.size());
        System.out.println(top5Registrations);
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
    public String approveUser(Integer rsid, String pay, String membershipexpire, String libraryCard) {
        registrationServices.updateApproval("approved", rsid);
        Registration registration = registrationServices.getOneRegistration(rsid);
        usersServices.insertOnUser(new Users(registration.getUsername(), registration.getPassword(),
                registration.getProfilePicture(), registration.getFirstName(), registration.getLastName(),
                registration.getGender(), registration.getDob(), registration.getPhone(), registration.getEmail(),
                registration.getCategory(), "active", membershipexpire), libraryCard);
        return "redirect:./viewpending/" + pay.toLowerCase();
    }

    @PostMapping("/rejectuser")
    public String rejectUser(Integer rsid, String message, String pay) {
        Registration registration = registrationServices.getOneRegistration(rsid);
        String content = "Dear " + registration.getFirstName() + ",\n\n" +
                "On the behalf of our library, we are writing to inform you that your registration request for our library system has been rejected. We regret to inform you that we are unable to approve your registration at this time.\n\n"
                +
                "We apologize for any inconvenience this may have caused, and we would like to explain the reasons for our decision. " + message + "\n\n"
                +
                "If you have any questions or concerns regarding our decision, please don't hesitate to contact us. We are always here to help.\n\n"
                +
                "Thank you for your interest in our library system, and we wish you all the best in your future endeavors.\n\n"
                +
                "Sincerely,\n\n" +
                "Library Authorities";

        /* String content = "Dear! " + registration.getFirstName()
                + " ,your application has been rejected due to the reason: " + message
                + ". You can visit the admin for further information."; */
        emailServices.sendMail(registration.getEmail(), "Rejection of Library User Registration", content);
        registrationServices.updateApproval("rejected", rsid);
        return "redirect:./viewpending/" + pay.toLowerCase();
    }

    @GetMapping("/addbook")
    public String getBookForm(Model model) {
        model.addAttribute("activity", "add");
        return "books";
    }

    @PostMapping("/addbook")
    public String insertBook(Books book, MultipartFile thumbnailfile) {
        connectorServices.insertOneConnector(new Connector(book.getItid(), "book"));
        Books bookInserted = booksServices.insertOneBook(book, thumbnailfile);
        return "redirect:/search/books/" + bookInserted.getBid();
    }

    @GetMapping("/addjournal")
    public String getJournalForm(Model model) {
        model.addAttribute("activity", "add");
        return "journals";
    }

    @PostMapping("/addjournal")
    public String insertJournal(Journals journal, MultipartFile thumbnailfile) {
        connectorServices.insertOneConnector(new Connector(journal.getItid(), "journal"));
        Journals journalInserted = journalsServices.insertOneJournal(journal, thumbnailfile);
        return "redirect:/search/journals/" + journalInserted.getJid();
    }

    @GetMapping("/addtheses")
    public String getThesesForm(Model model) {
        model.addAttribute("activity", "add");
        return "theses";
    }

    @PostMapping("/addtheses")
    public String insertTheses(Theses theses, MultipartFile thumbnailfile) {
        connectorServices.insertOneConnector(new Connector(theses.getItid(), "theses"));
        Theses thesesInserted = thesesServices.insertOneTheses(theses, thumbnailfile);
        return "redirect:/search/theses/" + thesesInserted.getTid();

    }

    @GetMapping("/addmagazine")
    public String getMagazineForm(Model model) {
        model.addAttribute("activity", "add");
        return "magazines";
    }

    @PostMapping("/addmagazine")
    public String insertMagazine(Magazines magazine, MultipartFile thumbnailfile) {
        connectorServices.insertOneConnector(new Connector(magazine.getItid(), "magazine"));
        Magazines magazineInserted = magazinesServices.insertOneMagazine(magazine, thumbnailfile);
        return "redirect:/search/magazines/" + magazineInserted.getMid();

    }

    @GetMapping("/addsoftcopy")
    public String getSoftCopyForm(Model model) {
        model.addAttribute("activity", "add");
        return "Softcopy";
    }

    @PostMapping("/addsoftcopy")
    public String insertSoftCopy(SoftCopy softCopy, MultipartFile file, MultipartFile thumbnailfile) {
        SoftCopy softcopyInserted = softCopyServices.insertOneSoftCopy(softCopy, file, thumbnailfile);
        return "redirect:/search/softcopy/" + softcopyInserted.getSid();

    }

    // Edit Routes

    @GetMapping("/edit/softcopy/{sid}")
    public String editSoftCopy(@PathVariable String sid, Model model) {
        SoftCopy softcopy = softCopyServices.findSingleSoftCopyById(sid);
        model.addAttribute("softcopy", softcopy);
        model.addAttribute("activity", "edit");
        System.out.println(softcopy);
        return "Softcopy";
    }

    @PostMapping("/edit/softcopy")
    public String editSoftCopySave(SoftCopy softCopy, MultipartFile file, MultipartFile thumbnailfile) {
        softCopyServices.insertOneSoftCopy(softCopy, file, thumbnailfile);
        return "redirect:/search/softcopy/" + softCopy.getSid();
    }

    @GetMapping("/edit/books/{bid}")
    public String editBooksCopy(@PathVariable String bid, Model model) {
        Books book = booksServices.findSingleBook(bid);
        model.addAttribute("book", book);
        model.addAttribute("activity", "edit");
        return "books";
    }

    @PostMapping("/edit/books")
    public String editBooksCopySave(Books books, MultipartFile thumbnailfile) {
        booksServices.insertOneBook(books, thumbnailfile);
        return "redirect:/search/books/" + books.getBid();
    }

    @GetMapping("/edit/journals/{jid}")
    public String editJournalsCopy(@PathVariable String jid, Model model) {
        Journals journals = journalsServices.findSingleJournalById(jid);
        model.addAttribute("journal", journals);
        model.addAttribute("activity", "edit");
        return "journals";
    }

    @PostMapping("/edit/journals")
    public String editJournalsCopySave(Journals journals, MultipartFile thumbnailfile) {
        journalsServices.insertOneJournal(journals, thumbnailfile);
        return "redirect:/search/journals/" + journals.getJid();
    }

    @GetMapping("/edit/theses/{tid}")
    public String editThesesCopy(@PathVariable String tid, Model model) {
        Theses theses = thesesServices.findSingleThesesById(tid);
        model.addAttribute("theses", theses);
        model.addAttribute("activity", "edit");
        return "theses";
    }

    @PostMapping("/edit/theses")
    public String editThesesCopySave(Theses theses, MultipartFile thumbnailfile) {
        thesesServices.insertOneTheses(theses, thumbnailfile);
        return "redirect:/search/theses/" + theses.getTid();
    }

    @GetMapping("/edit/magazines/{mid}")
    public String editMagazinesCopy(@PathVariable String mid, Model model) {
        Magazines magazines = magazinesServices.findSingleMagazineById(mid);
        model.addAttribute("magazine", magazines);
        model.addAttribute("activity", "edit");
        return "magazines";
    }

    @PostMapping("/edit/magazines")
    public String editMagazinesCopySave(Magazines magazines, MultipartFile thumbnailfile) {
        magazinesServices.insertOneMagazine(magazines, thumbnailfile);
        return "redirect:/search/magazines/" + magazines.getMid();
    }

    @GetMapping("/pendingborrow")
    public String getPendingBorrowTable(Model model) {
        List<Borrow> borrows = borrowServices.findPendingBorrows();
        model.addAttribute("borrows", borrows);
        return "pendingBorrows";
    }

    @GetMapping("/pendingreturn")
    public String getPendingReturnTable(Model model) {
        List<Borrow> returns = borrowServices.findPendingReturns();
        model.addAttribute("returns", returns);
        return "pendingReturns";
    }

    @PostMapping("/borrowaction")
    public ResponseEntity<String> performBorrowAction(String action, String itid, String username) {
        borrowServices.performAction(action, username, itid);
        return new ResponseEntity<String>("true", HttpStatus.OK);
    }

    @PostMapping("/returnaction")
    public ResponseEntity<String> performReturn(String action, String itid, String username) {
        borrowServices.performReturnAction(action.equals("rejected") ? "return " + action : "returned", username, itid);
        String type = connectorServices.getType(itid);
        if (type.equals("book")) {
            booksServices.increaseStock(itid);
        } else if (type.equals("journal")) {
            journalsServices.increaseStock(itid);
        } else if (type.equals("magazine")) {
            magazinesServices.increaseStock(itid);
        } else {
            thesesServices.increaseStock(itid);
        }
        return new ResponseEntity<String>("true", HttpStatus.OK);
    }

}
