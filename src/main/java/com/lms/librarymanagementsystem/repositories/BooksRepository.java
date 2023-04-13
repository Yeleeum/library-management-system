package com.lms.librarymanagementsystem.repositories;

import java.util.List;

import org.hibernate.mapping.Value;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.lms.librarymanagementsystem.models.Books;

public interface BooksRepository extends JpaRepository<Books,Integer>{
    @Query(value="SELECT * FROM BOOKS WHERE TITLE LIKE %:PARAM% OR AUTHOR LIKE %:PARAM% OR PUBLISHER LIKE %:PARAM% OR DESCRIPTION LIKE %:PARAM% OR CATEGORY LIKE %:PARAM% OR KEYWORDS LIKE %:PARAM%",nativeQuery = true)
    List<Books> findBookBySearch(@Param("PARAM")String searchParam);

    @Query(value="SELECT B.* FROM BOOKS B,CONNECTOR C WHERE B.ITID=C.ITID AND B.AUTHOR LIKE %:PARAM%",nativeQuery = true)
    List<Books> findBookBySearchAuthor(@Param("PARAM")String searchParam);

    @Query(value="SELECT * from Books where BID=:PARAM", nativeQuery = true)
    Books getSingleBook(@Param("PARAM")String bookId);

    @Query(value="SELECT * FROM BOOKS WHERE PUBLISHER LIKE %:PARAM%",nativeQuery = true)
    List<Books> findBookBySearchPublisher(@Param("PARAM")String searchParam);
}
