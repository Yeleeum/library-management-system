package com.lms.librarymanagementsystem.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.lms.librarymanagementsystem.models.Magazines;

public interface MagazinesRepository extends JpaRepository<Magazines,Integer>{
    @Query(value="SELECT * FROM MAGAZINES WHERE TITLE LIKE %:PARAM% OR PUBLISHER LIKE %:PARAM% OR DESCRIPTION LIKE %:PARAM% OR CATEGORY LIKE %:PARAM% OR KEYWORDS LIKE %:PARAM%",nativeQuery = true)
    List<Magazines> findMagazineBySearch(@Param("PARAM") String searchParam);

    @Query(value="SELECT * FROM MAGAZINES WHERE PUBLISHER LIKE %:PARAM%",nativeQuery = true)
    List<Magazines> findMagazineBySearchPublisher(@Param("PARAM")String searchParam);

    @Query(value="SELECT * FROM MAGAZINES WHERE CATEGORY LIKE %:PARAM%",nativeQuery = true)
    List<Magazines> findMagazineBySearchCatagory(@Param("PARAM")String searchParam);

    @Query(value="SELECT * FROM MAGAZINES WHERE TITLE LIKE %:PARAM%",nativeQuery = true)
    List<Magazines> findMagazineBySearchTitle(@Param("PARAM")String searchParam);
}
