package com.lms.librarymanagementsystem.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.lms.librarymanagementsystem.models.Connector;

public interface ConnectorRepository extends JpaRepository<Connector,String>{
    
}
