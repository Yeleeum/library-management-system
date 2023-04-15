package com.lms.librarymanagementsystem.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.lms.librarymanagementsystem.models.Registration;

public interface RegistrationRepository extends JpaRepository<Registration,Integer>{
    
    @Query(value="SELECT USERNAME FROM REGISTRATION WHERE APPROVED IN ('pending','approved')",nativeQuery = true)
    List<String> getPendingApprovedUsernames();
}
