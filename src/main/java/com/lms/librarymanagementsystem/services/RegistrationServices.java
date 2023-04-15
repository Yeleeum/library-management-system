package com.lms.librarymanagementsystem.services;

import org.springframework.stereotype.Service;

import com.lms.librarymanagementsystem.repositories.RegistrationRepository;

import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class RegistrationServices {
    private RegistrationRepository registrationRepository;

    public RegistrationServices(RegistrationRepository registrationRepository) {
        this.registrationRepository = registrationRepository;
    }

}
