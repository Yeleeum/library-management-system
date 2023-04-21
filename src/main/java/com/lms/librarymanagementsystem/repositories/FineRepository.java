package com.lms.librarymanagementsystem.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.lms.librarymanagementsystem.models.Fine;

public interface FineRepository extends JpaRepository<Fine,Integer> {
    @Query(value="SELECT * FROM FINE WHERE USERNAME=:USERNAME AND PAID='FALSE'",nativeQuery = true)
    List<Fine> getUnpaidFineByUsername(@Param("USERNAME")String username);
}
