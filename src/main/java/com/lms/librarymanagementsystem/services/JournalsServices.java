package com.lms.librarymanagementsystem.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.lms.librarymanagementsystem.models.Journals;
import com.lms.librarymanagementsystem.repositories.JournalsRepository;

@Service
public class JournalsServices {
    private JournalsRepository journalsRepository;
    
    public JournalsServices(JournalsRepository journalsRepository) {
        this.journalsRepository = journalsRepository;
    }

    public Journals insertOneJournal(Journals journal){
        return journalsRepository.save(journal);
    }

    public List<Journals> findBySearch(String searchParam){
        return journalsRepository.findJournalBySearch(searchParam);
    }

    public List<Journals> findBySearchEditor(String searchParam){
        return journalsRepository.findJournalBySearchEditor(searchParam);
    }
    public List<Journals> findBySearchPublisher(String searchParam){
        return journalsRepository.findBookBySearchPublisher(searchParam);
    }
}


