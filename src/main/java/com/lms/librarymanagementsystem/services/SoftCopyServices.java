package com.lms.librarymanagementsystem.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.lms.librarymanagementsystem.models.SoftCopy;
import com.lms.librarymanagementsystem.repositories.SoftCopyRepository;

@Service
public class SoftCopyServices {
    private SoftCopyRepository softCopyRepository;

    public SoftCopyServices(SoftCopyRepository softCopyRepository) {
        this.softCopyRepository = softCopyRepository;
    }

    public SoftCopy insertOneSoftCopy(SoftCopy softCopy){
        return softCopyRepository.save(softCopy);
    }

    public List<SoftCopy> findBySearch(String searchParam){
        return softCopyRepository.findSoftCopyBySearch(searchParam);
    }

}
