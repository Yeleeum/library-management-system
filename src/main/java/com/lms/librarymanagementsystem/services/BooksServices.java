package com.lms.librarymanagementsystem.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.lms.librarymanagementsystem.models.Books;
import com.lms.librarymanagementsystem.repositories.BooksRepository;

@Service
public class BooksServices {
    private BooksRepository booksRepository;

    public BooksServices(BooksRepository booksRepository) {
        this.booksRepository = booksRepository;
    }

    public Books insertOneBook(Books book){
        return booksRepository.save(book);
    }

    public List<Books> getAllBooks(){
        return booksRepository.findAll();
    }

    public List<Books> findBySearch(String searchParam){
        return booksRepository.findBookBySearch(searchParam);
    }

    public List<Books> findBySearchAuthor(String searchParam){
        return booksRepository.findBookBySearchAuthor(searchParam);
    }
}
