package com.lms.librarymanagementsystem.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.lms.librarymanagementsystem.models.SoftCopy;

public interface SoftCopyRepository extends JpaRepository<SoftCopy,Integer>{
    
}
