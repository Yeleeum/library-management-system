package com.lms.librarymanagementsystem.services;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.lms.librarymanagementsystem.FileHandler.FileHandler;
import com.lms.librarymanagementsystem.models.Theses;
import com.lms.librarymanagementsystem.repositories.ThesesRepository;

@Service
public class ThesesServices {
    private ThesesRepository thesesRepository;

    public ThesesServices(ThesesRepository thesesRepository) {
        this.thesesRepository = thesesRepository;
    }

    public Theses insertOneTheses(Theses theses,MultipartFile file){
        String currentDirectory = System.getProperty("user.dir");
        String path= currentDirectory + "\\src\\main\\webapp\\uploads\\thumbnails";
        System.out.println(path);
        FileHandler.saveFile(file, path);
        theses.setThumbnail(file.getOriginalFilename());
        return thesesRepository.save(theses);
    }

    public List<Theses> findBySearch(String searchParam){
        return thesesRepository.findThesesBySearch(searchParam);
    }

    public List<Theses> findBySearchResearcher(String searchParam){
        return thesesRepository.findThesesBySearchResearcher(searchParam);
    }

    public List<Theses> findBySearchCatagory(String searchParam){
        return thesesRepository.findThesesBySearchCatagory(searchParam);
    }

    public Theses findSingleThesesById(String tid){
        return thesesRepository.findSingleThesesById(tid);
    }

    public List<Theses> findBySearchTitle(String searchParam){
        return thesesRepository.findThesesBySearchTitle(searchParam);
    }
}
