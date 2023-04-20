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

    public List<Borrow> findPending(){
        return borrowRepository.getPending();
    }

    public List<Borrow> findUnReturnedByUsername(String username){
        return borrowRepository.getUnReturnedByUsername(username);
    }

    public List<Borrow> findUnReturnedByItidByUsername(String itid,String username){
        System.out.println(itid);
        return borrowRepository.getUnReturnedByItidByUsername(itid,username);
    }

    public List<Borrow> findPendingBorrow(){
        return borrowRepository.getPendingBorrow();
    }

    public List<Borrow> findFinableBorrowByUsername(String username){
        return borrowRepository.getFinableBorrowByUsername(username);
    }

    public Integer performAction(String action,String username,String itid){
        return borrowRepository.borrowAction(action, username, itid);
    }
}
