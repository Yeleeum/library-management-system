package com.lms.librarymanagementsystem.services;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lms.librarymanagementsystem.models.Users;
import com.lms.librarymanagementsystem.repositories.UsersRepository;

@Service
@Transactional
public class UsersServices {
    private UsersRepository usersRepository;
    private EmailServices emailServices;

    public UsersServices(UsersRepository usersRepository,EmailServices emailServices) {
        this.usersRepository = usersRepository;
        this.emailServices=emailServices;
    }

    public Users insertOnUser(Users user) {
        String content="Dear! "+user.getFirstName()+" ,your application has been approved. You can log in to view your profile.";
        emailServices.sendMail(user.getEmail(), "Approval of Application", content);
        return usersRepository.save(user);
    }

    public List<Users> findUserByUsernamePassword(String username,String password){
        return usersRepository.getUserByUsernamePassword(username, password);
    }

}
