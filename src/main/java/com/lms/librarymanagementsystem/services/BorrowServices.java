package com.lms.librarymanagementsystem.services;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lms.librarymanagementsystem.models.Borrow;
import com.lms.librarymanagementsystem.repositories.BorrowRepository;


@Service
@Transactional
public class BorrowServices {
    private BorrowRepository borrowRepository;

    public BorrowServices(BorrowRepository borrowRepository) {
        this.borrowRepository = borrowRepository;
    }

    public Borrow inserOneBorrow(Borrow borrow){
        return borrowRepository.save(borrow);
    }

    public List<Borrow> findUnReturned(String username){
        return borrowRepository.getUnReturned(username);
    }

    public List<Borrow> findUnReturnedByItid(String itid,String username){
        System.out.println(itid);
        return borrowRepository.getUnReturnedByItid(itid,username);
    }

    public List<Borrow> findPendingBorrow(){
        return borrowRepository.getPendingBorrow();
    }

    public List<Borrow> findFinableBorrow(String username){
        return borrowRepository.getFinableBorrow(username);
    }
}
