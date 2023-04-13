package com.lms.librarymanagementsystem.controllers;

import java.util.List;

// import java.util.List;

// import org.apache.catalina.connector.Response;
// import org.springframework.http.HttpStatus;
// import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

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
    public Books insertBook(Books book,MultipartFile thumbnailfile){
        connectorServices.insertOneConnector(new Connector(book.getItid(),"book"));
        return booksServices.insertOneBook(book,thumbnailfile);
    }

    @GetMapping
    public String getBookForm(){
        return "books";
    }

    @GetMapping("/search")
    public String getBooksBySearch(String searchParam,Model model){
        List<Books> books=booksServices.findBySearch(searchParam);
        model.addAttribute("books", books);
        model.addAttribute("searchValue", searchParam);
        model.addAttribute("type", "books");
        return "searchResult";
    }

    @GetMapping("/author")
    public String getBooksByAuthor(String searchParam,Model model){
        List<Books> books=booksServices.findBySearchAuthor(searchParam);
        model.addAttribute("books", books);
        model.addAttribute("searchValue", searchParam);
        model.addAttribute("type", "books");
        return "searchResult";
    }


    // @GetMapping
    // public ResponseEntity<List<Books>> findAllBooks(){
    //     System.out.println(booksServices.getAllBooks());
    //     return new ResponseEntity<List<Books>>(booksServices.getAllBooks(),HttpStatus.OK);
    // }
}
