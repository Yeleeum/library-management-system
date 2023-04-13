package com.lms.librarymanagementsystem.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
        return "mainSearchComponent";
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
    public ResponseEntity<List<Theses>> searchByReasearcher(String searchParam){
        return new ResponseEntity<List<Theses>>(thesesServices.findBySearchResearcher(searchParam),HttpStatus.OK);
    }

    @GetMapping("/editor")
    public ResponseEntity<List<Journals>> searchByEditor(String searchParam){
        return new ResponseEntity<List<Journals>>(journalsServices.findBySearchEditor(searchParam),HttpStatus.OK);
    }

    @GetMapping("/owner")
    public ResponseEntity<List<SoftCopy>> searchByOwner(String searchParam){
        return new ResponseEntity<List<SoftCopy>>(softCopyServices.findBySearchOwner(searchParam),HttpStatus.OK);
    }
}
