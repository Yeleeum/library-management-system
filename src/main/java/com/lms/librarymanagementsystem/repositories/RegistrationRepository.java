package com.lms.librarymanagementsystem.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.lms.librarymanagementsystem.models.Registration;

public interface RegistrationRepository extends JpaRepository<Registration,Integer>{
    
    @Query(value="SELECT USERNAME FROM REGISTRATION WHERE APPROVED IN ('pending','approved')",nativeQuery = true)
    List<String> getPendingApprovedUsernames();

    @Query(value="SELECT * FROM REGISTRATION WHERE PAID=:PAID AND APPROVED='pending'",nativeQuery = true)
    List<Registration> getPendingRequests(@Param("PAID")String paid);

    @Modifying
    @Query(value="UPDATE REGISTRATION SET APPROVED=:STATUS WHERE RSID=:RSID",nativeQuery = true)
    Integer updateApprovedByRsid(@Param("STATUS")String status,@Param("RSID")Integer rsid);

    @Modifying
    @Query(value="UPDATE REGISTRATION SET REJECTIONMSG=:MSID WHERE RSID=:RSID",nativeQuery = true)
    Integer updateRejectionMessageByRsid(@Param("MSID")Integer msid,@Param("RSID")Integer rsid);
}
