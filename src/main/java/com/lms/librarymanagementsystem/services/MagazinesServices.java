package com.lms.librarymanagementsystem.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.lms.librarymanagementsystem.models.Magazines;
import com.lms.librarymanagementsystem.repositories.MagazinesRepository;

@Service
public class MagazinesServices {
    private MagazinesRepository magazinesRepository;

    public MagazinesServices(MagazinesRepository magazinesRepository) {
        this.magazinesRepository = magazinesRepository;
    }

    public Magazines insertOneMagazine(Magazines magazine){
        return magazinesRepository.save(magazine);
    }

    public List<Magazines> findBySearch(String searchParam){
        return magazinesRepository.findMagazineBySearch(searchParam);
    }

}
