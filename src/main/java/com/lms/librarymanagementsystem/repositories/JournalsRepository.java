package com.lms.librarymanagementsystem.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.lms.librarymanagementsystem.models.Journals;

public interface JournalsRepository extends JpaRepository<Journals,Integer> {
    @Query(value="SELECT * FROM JOURNALS WHERE TITLE LIKE %:PARAM% OR EDITOR LIKE %:PARAM% OR PUBLISHER LIKE %:PARAM% OR DESCRIPTION LIKE %:PARAM% OR CATEGORY LIKE %:PARAM% OR KEYWORDS LIKE %:PARAM%",nativeQuery = true)
    List<Journals> findJournalBySearch(@Param("PARAM")String searchParam);

    @Query(value="SELECT * FROM JOURNALS WHERE EDITOR LIKE %:PARAM%",nativeQuery = true)
    List<Journals> findJournalBySearchEditor(@Param("PARAM")String searchParam);
}
