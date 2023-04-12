package com.lms.librarymanagementsystem.services;

import org.springframework.stereotype.Service;

import com.lms.librarymanagementsystem.repositories.AlternativeRepository;

@Service
public class AlternativeServices {
    private AlternativeRepository alternativeRepository;

    public AlternativeServices(AlternativeRepository alternativeRepository) {
        this.alternativeRepository = alternativeRepository;
    }
    

}
