package com.lms.librarymanagementsystem.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.lms.librarymanagementsystem.models.Borrow;

public interface BorrowRepository extends JpaRepository<Borrow,Integer> {
    
}
