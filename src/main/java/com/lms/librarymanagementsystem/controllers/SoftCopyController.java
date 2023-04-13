package com.lms.librarymanagementsystem.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.lms.librarymanagementsystem.FileHandler.FileHandler;
import com.lms.librarymanagementsystem.models.SoftCopy;
import com.lms.librarymanagementsystem.services.SoftCopyServices;

@Controller
@RequestMapping("/softcopy")
public class SoftCopyController {
    private SoftCopyServices softCopyServices;

    public SoftCopyController(SoftCopyServices softCopyServices) {
        this.softCopyServices = softCopyServices;
    }

    @GetMapping
    public String getSoftCopyForm(){
        return "Softcopy";
    }

    @PostMapping
    public SoftCopy insertSoftCopy(SoftCopy softCopy,MultipartFile file){
        // String path="D:\\Java-SpringBoot\\College Project\\librarymanagementsystem\\src\\main\\webapp\\uploads\\SoftCopy";
        String path="D:\\6th sem\\Project\\Library-management-system\\src\\main\\webapp\\uploads\\SoftCopy";
        FileHandler.saveFile(file, path);
        softCopy.setFilename(file.getOriginalFilename());
        return softCopyServices.insertOneSoftCopy(softCopy);
    }
}
