package com.lms.librarymanagementsystem.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.lms.librarymanagementsystem.models.Borrow;

public interface BorrowRepository extends JpaRepository<Borrow,Integer> {

    @Query(value="SELECT * FROM BORROW WHERE USERNAME=:username AND STATUS='notreturned'",nativeQuery = true)
    List<Borrow> getUnReturned(@Param("username")String username);
    
    @Query(value="SELECT * FROM BORROW WHERE USERNAME=:username AND ITID=:itid AND STATUS='notreturned'",nativeQuery = true)
    List<Borrow> getUnReturnedByItid(@Param("itid")String itid,@Param("username")String username);

    @Query(value="SELECT * FROM BORROW WHERE APPROVED='pending'",nativeQuery = true)
    List<Borrow> getPendingBorrow();

    @Query(value="SELECT * FROM BORROW WHERE USERNAME=:username AND RETURNDATE < CURDATE()",nativeQuery = true)
    List<Borrow> getFinableBorrow(@Param("username")String username);
}
