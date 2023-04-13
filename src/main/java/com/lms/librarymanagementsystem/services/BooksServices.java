package com.lms.librarymanagementsystem.services;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.lms.librarymanagementsystem.FileHandler.FileHandler;
import com.lms.librarymanagementsystem.models.Books;
import com.lms.librarymanagementsystem.repositories.BooksRepository;

@Service
public class BooksServices {
    private BooksRepository booksRepository;

    public BooksServices(BooksRepository booksRepository) {
        this.booksRepository = booksRepository;
    }

    public Books insertOneBook(Books book,MultipartFile file){
        String path="D:\\Java-SpringBoot\\College Project\\librarymanagementsystem\\src\\main\\webapp\\uploads\\thumbnails";
        FileHandler.saveFile(file, path);
        book.setThumbnail(file.getOriginalFilename());
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

    public Books findSingleBook(String bookId){
        return booksRepository.getSingleBook(bookId);
    }

    public List<Books> findBySearchPublisher(String searchParam){
        return booksRepository.findBookBySearchPublisher(searchParam);
    }

    public List<Books> findBySearchCatagory(String searchParam){
        return booksRepository.findBookBySearchCatagory(searchParam);
    }
}
