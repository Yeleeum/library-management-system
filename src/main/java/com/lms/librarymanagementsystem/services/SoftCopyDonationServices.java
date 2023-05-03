package com.lms.librarymanagementsystem.services;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.lms.librarymanagementsystem.Handlers.FileHandler;
import com.lms.librarymanagementsystem.models.SoftCopyDonations;
import com.lms.librarymanagementsystem.repositories.SoftCopyDonationRepository;

@Service
@Transactional
public class SoftCopyDonationServices {
    private SoftCopyDonationRepository softCopyDonationRepository;

    public SoftCopyDonationServices(SoftCopyDonationRepository softCopyDonationRepository) {
        this.softCopyDonationRepository = softCopyDonationRepository;
    }

    public SoftCopyDonations insertOneSoftCopyDonations(SoftCopyDonations softCopyDonations, MultipartFile file, MultipartFile thumbnail) {
        String currentDirectory = System.getProperty("user.dir");
        String path = currentDirectory + "\\src\\main\\webapp\\uploads\\SoftCopy";
        System.out.println(path);
        if (file!=null && !file.isEmpty()) {
            FileHandler.saveFile(file, path);
            softCopyDonations.setFileName(file.getOriginalFilename());
        }
        if (thumbnail!=null && !thumbnail.isEmpty()) {
            path = currentDirectory + "\\src\\main\\webapp\\uploads\\thumbnails";
            FileHandler.saveFile(thumbnail, path);
            softCopyDonations.setThumbnail(thumbnail.getOriginalFilename());
        }
        softCopyDonations.setApproved("pending");
        return softCopyDonationRepository.save(softCopyDonations);
    }

    public List<SoftCopyDonations> findPendingSoftCopyDonations() {
        return softCopyDonationRepository.getPendingSoftCopyDonations();
    }

    public SoftCopyDonations findSingleJournalDonations(Integer sdnid) {
        return softCopyDonationRepository.getSingleSoftCopyDonation(sdnid);
    }

    public Integer updateDonationToApproved(Integer sdnid) {
        return softCopyDonationRepository.updateDonationApproval(sdnid);
    }
}
