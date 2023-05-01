package com.lms.librarymanagementsystem.services;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.lms.librarymanagementsystem.Handlers.FileHandler;
import com.lms.librarymanagementsystem.models.BookDonations;
import com.lms.librarymanagementsystem.repositories.BookDonationRepository;

@Service
@Transactional
public class BooksDonationServices {
    private BookDonationRepository bookDonationRepository;

    public BooksDonationServices(BookDonationRepository bookDonationRepository) {
        this.bookDonationRepository = bookDonationRepository;
    }

    public BookDonations insertOneBookDonations(BookDonations bookDonations, MultipartFile file) {
        String currentDirectory = System.getProperty("user.dir");
        String path = currentDirectory + "\\src\\main\\webapp\\uploads\\thumbnails";
        if (file != null && !file.isEmpty()) {
            FileHandler.saveFile(file, path);
            bookDonations.setThumbnail(file.getOriginalFilename());
        }
        bookDonations.setApproved("pending");
        return bookDonationRepository.save(bookDonations);
    }
}