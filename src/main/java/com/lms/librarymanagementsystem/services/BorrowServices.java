package com.lms.librarymanagementsystem.services;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lms.librarymanagementsystem.repositories.BorrowRepository;


@Service
@Transactional
public class BorrowServices {
    private BorrowRepository borrowRepository;

    public BorrowServices(BorrowRepository borrowRepository) {
        this.borrowRepository = borrowRepository;
    }
}
