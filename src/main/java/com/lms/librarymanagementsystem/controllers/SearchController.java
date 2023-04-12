package com.lms.librarymanagementsystem.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lms.librarymanagementsystem.models.Books;
import com.lms.librarymanagementsystem.models.Journals;
import com.lms.librarymanagementsystem.models.Magazines;
import com.lms.librarymanagementsystem.models.Theses;
import com.lms.librarymanagementsystem.services.AlternativeServices;
import com.lms.librarymanagementsystem.services.BooksServices;
import com.lms.librarymanagementsystem.services.ConnectorServices;
import com.lms.librarymanagementsystem.services.JournalsServices;
import com.lms.librarymanagementsystem.services.MagazinesServices;
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

    public SearchController(AlternativeServices alternativeServices, BooksServices booksServices, ConnectorServices connectorServices, JournalsServices journalsServices, MagazinesServices magazinesServices, ThesesServices thesesServices) {
        this.alternativeServices = alternativeServices;
        this.booksServices = booksServices;
        this.connectorServices = connectorServices;
        this.journalsServices = journalsServices;
        this.magazinesServices = magazinesServices;
        this.thesesServices = thesesServices;
    }

    @GetMapping
    public String getSearch(){
        return "searchComponent";
    }

    @GetMapping("/books")
    public ResponseEntity<List<Books>> searchAllBooks(){
        return new ResponseEntity<List<Books>>(booksServices.getAllBooks(),HttpStatus.OK);
    }

    @GetMapping("/searchitem")
    public ResponseEntity<List> searchItems(String searchParam){
        List<Journals> journals=journalsServices.findBySearch(searchParam);
        List<Books> books=booksServices.findBySearch(searchParam);
        List<Magazines> magazines=magazinesServices.findBySearch(searchParam);
        List<Theses> theses=thesesServices.findBySearch(searchParam);
        List<List> allFound=new ArrayList();
        allFound.add(books);
        allFound.add(journals);
        allFound.add(magazines);
        allFound.add(theses);
        // System.out.println(books);
        return new ResponseEntity<List>(allFound,HttpStatus.OK);
    }

    @GetMapping("/author")
    public ResponseEntity<List<Books>> searchByAuthor(String searchParam){
        return new ResponseEntity<List<Books>>(booksServices.findBySearchAuthor(searchParam),HttpStatus.OK);
    }
}
