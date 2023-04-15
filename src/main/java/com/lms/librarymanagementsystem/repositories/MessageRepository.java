package com.lms.librarymanagementsystem.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.lms.librarymanagementsystem.models.Message;

public interface MessageRepository extends JpaRepository<Message,Integer>{
    
}
