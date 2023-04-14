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

    public SoftCopy insertOneSoftCopy(SoftCopy softCopy,MultipartFile file,MultipartFile thumbnail){
        // String path="D:\\Java-SpringBoot\\College Project\\librarymanagementsystem\\src\\main\\webapp\\uploads\\SoftCopy";
        String currentDirectory = System.getProperty("user.dir");
        String path= currentDirectory + "\\src\\main\\webapp\\uploads\\SoftCopy";
        System.out.println(path);
        FileHandler.saveFile(file, path);
        softCopy.setFilename(file.getOriginalFilename());
        path= currentDirectory + "\\src\\main\\webapp\\uploads\\thumbnails";
        FileHandler.saveFile(thumbnail, path);
        softCopy.setThumbnail(thumbnail.getOriginalFilename());
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

    public List<SoftCopy> findBySearchTitle(String searchParam){
        return softCopyRepository.findSoftCopyBySearchTitle(searchParam);
    }

    public SoftCopy findSingleSoftCopyById(String sid){
        return softCopyRepository.findSingleSoftCopyById(sid);
    }
}
