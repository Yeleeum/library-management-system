package com.lms.librarymanagementsystem.services;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lms.librarymanagementsystem.repositories.FineRepository;

@Service
@Transactional
public class FineServices {
    private FineRepository fineRepository;

    public FineServices(FineRepository fineRepository) {
        this.fineRepository = fineRepository;
    }
}
