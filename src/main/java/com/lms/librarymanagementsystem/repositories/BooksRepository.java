package com.lms.librarymanagementsystem.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.lms.librarymanagementsystem.models.Books;

public interface BooksRepository extends JpaRepository<Books,Integer>{
    @Query(value="SELECT * FROM BOOKS WHERE TITLE LIKE %:PARAM% OR AUTHOR LIKE %:PARAM% OR PUBLISHER LIKE %:PARAM% OR DESCRIPTION LIKE %:PARAM% OR CATEGORY LIKE %:PARAM% OR KEYWORDS LIKE %:PARAM%",nativeQuery = true)
    List<Books> findBookBySearch(@Param("PARAM")String searchParam);

    @Query(value="SELECT * FROM BOOKS WHERE AUTHOR LIKE %:PARAM%",nativeQuery = true)
    List<Books> findBookBySearchAuthor(@Param("PARAM")String searchParam);
}
