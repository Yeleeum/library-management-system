package com.lms.librarymanagementsystem.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.lms.librarymanagementsystem.models.Theses;
import com.lms.librarymanagementsystem.repositories.ThesesRepository;

@Service
public class ThesesServices {
    private ThesesRepository thesesRepository;

    public ThesesServices(ThesesRepository thesesRepository) {
        this.thesesRepository = thesesRepository;
    }

    public Theses insertOneTheses(Theses theses){
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

    public List<Theses> findBySearchTitle(String searchParam){
        return thesesRepository.findThesesBySearchTitle(searchParam);
    }
}
