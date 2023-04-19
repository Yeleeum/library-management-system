package com.lms.librarymanagementsystem.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.lms.librarymanagementsystem.models.Payment;

public interface PaymentRepository extends JpaRepository<Payment,Integer> {
    
}
