package com.lms.librarymanagementsystem.services;

import java.util.List;

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

    public List<String> findPendingApprovedUsernames(){
        return registrationRepository.getPendingApprovedUsernames();
    }

}
