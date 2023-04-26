package com.lms.librarymanagementsystem.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.lms.librarymanagementsystem.models.Payment;

public interface PaymentRepository extends JpaRepository<Payment,Integer> {

    @Modifying
    @Query(value="UPDATE PAYMENT SET APPROVED=:action WHERE PID=:pid",nativeQuery = true)
    Integer updatePaymentByPid(@Param("pid")String pid,@Param("action")String action);
    
}
