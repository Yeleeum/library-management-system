package com.lms.librarymanagementsystem.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.lms.librarymanagementsystem.models.Theses;

public interface ThesesRepository extends JpaRepository<Theses,Integer>{
    @Query(value="SELECT * FROM THESES WHERE TITLE LIKE %:PARAM% OR RESEARCHER LIKE %:PARAM% OR GUIDES LIKE %:PARAM% OR DESCRIPTION LIKE %:PARAM% OR CATEGORY LIKE %:PARAM% OR KEYWORDS LIKE %:PARAM% OR PLACE LIKE %:PARAM% OR ABSTRACT LIKE %:PARAM%",nativeQuery = true)
    public List<Theses> findThesesBySearch(@Param("PARAM") String searchParam);

    @Query(value = "SELECT * FROM THESES WHERE RESEARCHER LIKE %:PARAM%",nativeQuery = true)
    public List<Theses> findThesesBySearchResearcher(@Param("PARAM")String searchParam);
}
