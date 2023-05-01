package com.lms.librarymanagementsystem.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.lms.librarymanagementsystem.models.BookDonations;

public interface BookDonationRepository extends JpaRepository<BookDonations, Integer> {

}
