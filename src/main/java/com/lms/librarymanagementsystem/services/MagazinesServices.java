package com.lms.librarymanagementsystem.services;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.lms.librarymanagementsystem.FileHandler.FileHandler;
import com.lms.librarymanagementsystem.models.*;
import com.lms.librarymanagementsystem.repositories.MagazinesRepository;

@Service
@Transactional
public class MagazinesServices {
    private MagazinesRepository magazinesRepository;

    public MagazinesServices(MagazinesRepository magazinesRepository) {
        this.magazinesRepository = magazinesRepository;
    }

    public Magazines insertOneMagazine(Magazines magazine,MultipartFile file){
        String currentDirectory = System.getProperty("user.dir");
        String path= currentDirectory + "\\src\\main\\webapp\\uploads\\thumbnails";
        FileHandler.saveFile(file, path);
        magazine.setThumbnail(file.getOriginalFilename());
        return magazinesRepository.save(magazine);
    }

    public List<Magazines> findBySearch(String searchParam){
        return magazinesRepository.findMagazineBySearch(searchParam);
    }

    public List<Magazines> findBySearchPublisher(String searchParam){
        return magazinesRepository.findMagazineBySearchPublisher(searchParam);
    }

    public List<Magazines> findBySearchCatagory(String searchParam){
        return magazinesRepository.findMagazineBySearchCatagory(searchParam);
    }

    public Magazines findSingleMagazineById(String mid){
        return magazinesRepository.findSingleMagazineById(mid);
    }

    public List<Magazines> findBySearchTitle(String searchParam){
        return magazinesRepository.findMagazineBySearchTitle(searchParam);
    }

}
