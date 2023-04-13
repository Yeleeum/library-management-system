package com.lms.librarymanagementsystem.services;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.lms.librarymanagementsystem.FileHandler.FileHandler;
import com.lms.librarymanagementsystem.models.SoftCopy;
import com.lms.librarymanagementsystem.repositories.SoftCopyRepository;

@Service
public class SoftCopyServices {
    private SoftCopyRepository softCopyRepository;

    public SoftCopyServices(SoftCopyRepository softCopyRepository) {
        this.softCopyRepository = softCopyRepository;
    }

    public SoftCopy insertOneSoftCopy(SoftCopy softCopy,MultipartFile file){
        String path="D:\\Java-SpringBoot\\College Project\\librarymanagementsystem\\src\\main\\webapp\\uploads\\SoftCopy";
        FileHandler.saveFile(file, path);
        softCopy.setFilename(file.getOriginalFilename());
        return softCopyRepository.save(softCopy);
    }

    public List<SoftCopy> findBySearch(String searchParam){
        return softCopyRepository.findSoftCopyBySearch(searchParam);
    }

    public List<SoftCopy> findBySearchOwner(String searchParam){
        return softCopyRepository.findSoftCopyBySearchOwner(searchParam);
    }

    public List<SoftCopy> findBySearchPublisher(String searchParam){
        return softCopyRepository.findSoftCopyBySearchPublisher(searchParam);
    }

    public List<SoftCopy> findBySearchCatagory(String searchParam){
        return softCopyRepository.findSoftCopyBySearchCatagory(searchParam);
    }

}
