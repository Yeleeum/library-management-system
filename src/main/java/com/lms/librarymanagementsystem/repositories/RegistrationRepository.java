package com.lms.librarymanagementsystem.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.lms.librarymanagementsystem.models.Registration;

public interface RegistrationRepository extends JpaRepository<Registration,Integer>{
    
}
