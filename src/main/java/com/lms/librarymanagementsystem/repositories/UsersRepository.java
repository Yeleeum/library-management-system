package com.lms.librarymanagementsystem.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.lms.librarymanagementsystem.models.Users;

public interface UsersRepository extends JpaRepository<Users,String>{
    
}
