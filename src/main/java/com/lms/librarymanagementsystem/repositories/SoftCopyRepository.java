package com.lms.librarymanagementsystem.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.lms.librarymanagementsystem.models.SoftCopy;

public interface SoftCopyRepository extends JpaRepository<SoftCopy,Integer>{
    @Query(value="SELECT * FROM SOFTCOPY WHERE TITLE LIKE %:PARAM% OR OWNER LIKE %:PARAM% OR PUBLISHER LIKE %:PARAM% OR DESCRIPTION LIKE %:PARAM% OR CATEGORY LIKE %:PARAM% OR KEYWORDS LIKE %:PARAM%",nativeQuery = true)
    public List<SoftCopy> findSoftCopyBySearch(@Param("PARAM")String searchParam);
    
    @Query(value="SELECT * FROM SOFTCOPY WHERE OWNER LIKE %:PARAM%",nativeQuery = true)
    public List<SoftCopy> findSoftCopyBySearchOwner(@Param("PARAM")String searchParam);
}
