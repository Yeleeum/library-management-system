package com.lms.librarymanagementsystem.controllers;

// import java.util.ArrayList;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
// import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lms.librarymanagementsystem.models.Books;
import com.lms.librarymanagementsystem.models.Journals;
import com.lms.librarymanagementsystem.models.Magazines;
import com.lms.librarymanagementsystem.models.SoftCopy;
import com.lms.librarymanagementsystem.models.Theses;
import com.lms.librarymanagementsystem.services.AlternativeServices;
import com.lms.librarymanagementsystem.services.BooksServices;
import com.lms.librarymanagementsystem.services.ConnectorServices;
import com.lms.librarymanagementsystem.services.JournalsServices;
import com.lms.librarymanagementsystem.services.MagazinesServices;
import com.lms.librarymanagementsystem.services.SoftCopyServices;
import com.lms.librarymanagementsystem.services.ThesesServices;

@Controller
@RequestMapping("/search")
public class SearchController {
    private AlternativeServices alternativeServices;
    private BooksServices booksServices;
    private ConnectorServices connectorServices;
    private JournalsServices journalsServices;
    private MagazinesServices magazinesServices;
    private ThesesServices thesesServices;
    private SoftCopyServices softCopyServices;

    public SearchController(AlternativeServices alternativeServices, BooksServices booksServices, ConnectorServices connectorServices, JournalsServices journalsServices, MagazinesServices magazinesServices, ThesesServices thesesServices,SoftCopyServices softCopyServices) {
        this.alternativeServices = alternativeServices;
        this.booksServices = booksServices;
        this.connectorServices = connectorServices;
        this.journalsServices = journalsServices;
        this.magazinesServices = magazinesServices;
        this.thesesServices = thesesServices;
        this.softCopyServices= softCopyServices;
    }

    @GetMapping
    public String getSearch(){
        return "subSearchComponent";
    }

    @GetMapping("/books")
    public ResponseEntity<List<Books>> searchAllBooks(){
        return new ResponseEntity<List<Books>>(booksServices.getAllBooks(),HttpStatus.OK);
    }

    @GetMapping("/searchitem")
    public String searchItems(String searchParam, Model model){
        List<Journals> journals=journalsServices.findBySearch(searchParam);
        List<Books> books=booksServices.findBySearch(searchParam);
        List<Magazines> magazines=magazinesServices.findBySearch(searchParam);
        List<Theses> theses=thesesServices.findBySearch(searchParam);
        List<SoftCopy> softCopies=softCopyServices.findBySearch(searchParam);
        // List<List> allFound=new ArrayList();
        // allFound.add(books);
        // allFound.add(journals);
        // allFound.add(magazines);
        // allFound.add(theses);
        // allFound.add(softCopies);
        model.addAttribute("books", books);
        model.addAttribute("journals", journals);
        model.addAttribute("magazines", magazines);
        model.addAttribute("theses", theses);
        model.addAttribute("softcopies", softCopies);
        model.addAttribute("searchValue", searchParam);
        // return new ResponseEntity<List>(allFound,HttpStatus.OK);
        return "searchResult";
    }

    @GetMapping("/author")
    public String searchByAuthor(String searchParam,Model model){
        List<Books> books=booksServices.findBySearchAuthor(searchParam);
        model.addAttribute("books", books);
        model.addAttribute("searchValue", searchParam);
        return "searchResult";
    }

    @GetMapping("/researcher")
    public String searchByReasearcher(String searchParam,Model model){
        List<Theses> theses=thesesServices.findBySearchResearcher(searchParam);
        model.addAttribute("theses", theses);
        model.addAttribute("searchValue", searchParam);
        return "searchResult";
    }

    @GetMapping("/editor")
    public String searchByEditor(String searchParam,Model model){
        List<Journals> journals=journalsServices.findBySearchEditor(searchParam);
        model.addAttribute("journals", journals);
        model.addAttribute("searchValue", searchParam);
        return "searchResult";
    }

    @GetMapping("/owner")
    public String searchByOwner(String searchParam,Model model){
        List<SoftCopy> softCopies=softCopyServices.findBySearchOwner(searchParam);
        model.addAttribute("softcopies", softCopies);
        model.addAttribute("searchValue", searchParam);
        return "searchResult";
    }

    @GetMapping("/publisher")
    public String searchByPublisher(String searchParam,Model model){
        List<Journals> journals=journalsServices.findBySearchPublisher(searchParam);
        List<Books> books=booksServices.findBySearchPublisher(searchParam);
        List<Magazines> magazines=magazinesServices.findBySearchPublisher(searchParam);
        List<SoftCopy> softCopies=softCopyServices.findBySearchPublisher(searchParam);
        model.addAttribute("books", books);
        model.addAttribute("journals", journals);
        model.addAttribute("magazines", magazines);
        model.addAttribute("softcopies", softCopies);
        model.addAttribute("searchValue", searchParam);
        return "searchResult";
    }

    @GetMapping("/category")
    public String searchByCatagory(String searchParam, Model model){
        List<Journals> journals=journalsServices.findBySearchCatagory(searchParam);
        List<Books> books=booksServices.findBySearchCatagory(searchParam);
        List<Magazines> magazines=magazinesServices.findBySearchCatagory(searchParam);
        List<Theses> theses=thesesServices.findBySearchCatagory(searchParam);
        List<SoftCopy> softCopies=softCopyServices.findBySearchCatagory(searchParam);
        model.addAttribute("books", books);
        model.addAttribute("journals", journals);
        model.addAttribute("magazines", magazines);
        model.addAttribute("theses", theses);
        model.addAttribute("softcopies", softCopies);
        model.addAttribute("searchValue", searchParam);
        return "searchResult";
    }

    @GetMapping("/category/{category}")
    public String showFromCatagory(@PathVariable("category")String searchParam, Model model){
        List<Journals> journals=journalsServices.findBySearchCatagory(searchParam);
        List<Books> books=booksServices.findBySearchCatagory(searchParam);
        List<Magazines> magazines=magazinesServices.findBySearchCatagory(searchParam);
        List<Theses> theses=thesesServices.findBySearchCatagory(searchParam);
        List<SoftCopy> softCopies=softCopyServices.findBySearchCatagory(searchParam);
        model.addAttribute("books", books);
        model.addAttribute("journals", journals);
        model.addAttribute("magazines", magazines);
        model.addAttribute("theses", theses);
        model.addAttribute("softcopies", softCopies);
        model.addAttribute("searchValue", searchParam);
        return "searchResult";
    }

    @GetMapping("/books/{bookId}")
    public String getSingleBookByBid(@PathVariable("bookId")String bookId,Model model){
        // return new ResponseEntity<Books>(booksServices.findSingleBook(bookId), HttpStatus.OK);\
        Books book = booksServices.findSingleBook(bookId);
        model.addAttribute("book", book);
        return "bookDetails";
    }

    @GetMapping("/journals/{jid}")
    public String getSingleJournalById(@PathVariable("jid")String jid,Model model){
        Journals journal=journalsServices.findSingleJournalById(jid);
        model.addAttribute("journal", journal);
        return "journalDetails";
    }

}
