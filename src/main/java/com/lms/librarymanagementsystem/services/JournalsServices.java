package com.lms.librarymanagementsystem.services;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.lms.librarymanagementsystem.FileHandler.FileHandler;
import com.lms.librarymanagementsystem.models.Journals;
import com.lms.librarymanagementsystem.repositories.JournalsRepository;

@Service
@Transactional
public class JournalsServices {
    private JournalsRepository journalsRepository;

    public JournalsServices(JournalsRepository journalsRepository) {
        this.journalsRepository = journalsRepository;
    }

    public Journals insertOneJournal(Journals journal, MultipartFile file) {
        if (file!=null && !file.isEmpty()) {
            String currentDirectory = System.getProperty("user.dir");
            String path = currentDirectory + "\\src\\main\\webapp\\uploads\\thumbnails";
            FileHandler.saveFile(file, path);
            journal.setThumbnail(file.getOriginalFilename());
        }
        return journalsRepository.save(journal);
    }

    public List<Journals> findBySearch(String searchParam) {
        return journalsRepository.findJournalBySearch(searchParam);
    }

    public List<Journals> findBySearchEditor(String searchParam) {
        return journalsRepository.findJournalBySearchEditor(searchParam);
    }

    public List<Journals> findBySearchPublisher(String searchParam) {
        return journalsRepository.findJournalBySearchPublisher(searchParam);
    }

    public List<Journals> findBySearchCatagory(String searchParam) {
        return journalsRepository.findJournalBySearchCatagory(searchParam);
    }

    public Journals findSingleJournalById(String jid) {
        return journalsRepository.findSingleJournalById(jid);
    }

    public List<Journals> findBySearchTitle(String searchParam) {
        return journalsRepository.findJournalBySearchTitle(searchParam);
    }
}
