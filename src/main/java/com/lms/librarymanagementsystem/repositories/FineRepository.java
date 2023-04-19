package com.lms.librarymanagementsystem.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.lms.librarymanagementsystem.models.Fine;

public interface FineRepository extends JpaRepository<Fine,Integer> {
    
}
