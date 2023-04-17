package com.lms.librarymanagementsystem.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.lms.librarymanagementsystem.models.Admin;
import com.lms.librarymanagementsystem.repositories.AdminRepository;

@Service
public class AdminServices {
    private AdminRepository adminRepository;

    public AdminServices(AdminRepository adminRepository) {
        this.adminRepository = adminRepository;
    }

    public List<Admin> findUserByUsernamePassword(String username,String password){
        return adminRepository.getUserByUsernamePassword(username, password);
    }
}
