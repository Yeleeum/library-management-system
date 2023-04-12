package com.lms.librarymanagementsystem.controllers;

// import java.util.List;

// import org.apache.catalina.connector.Response;
// import org.springframework.http.HttpStatus;
// import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lms.librarymanagementsystem.models.Books;
import com.lms.librarymanagementsystem.models.Connector;
import com.lms.librarymanagementsystem.services.BooksServices;
import com.lms.librarymanagementsystem.services.ConnectorServices;

@Controller
@RequestMapping("/books")
public class BooksController {
    private BooksServices booksServices;
    private ConnectorServices connectorServices;

    public BooksController(BooksServices booksServices, ConnectorServices connectorServices) {
        this.booksServices = booksServices;
        this.connectorServices = connectorServices;
    }

    @PostMapping
    public Books insertBook(Books book){
        System.out.println(book);
        connectorServices.insertOneConnector(new Connector(book.getItid(),"book"));
        return booksServices.insertOneBook(book);
    }

    @GetMapping
    public String getBookForm(){
        return "books";
    }


    // @GetMapping
    // public ResponseEntity<List<Books>> findAllBooks(){
    //     System.out.println(booksServices.getAllBooks());
    //     return new ResponseEntity<List<Books>>(booksServices.getAllBooks(),HttpStatus.OK);
    // }
}
