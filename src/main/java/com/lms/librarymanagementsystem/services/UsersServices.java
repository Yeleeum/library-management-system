package com.lms.librarymanagementsystem.services;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lms.librarymanagementsystem.models.Users;
import com.lms.librarymanagementsystem.repositories.UsersRepository;

@Service
@Transactional
public class UsersServices {
    private UsersRepository usersRepository;

    public UsersServices(UsersRepository usersRepository) {
        this.usersRepository = usersRepository;
    }

    public Users insertOnUser(Users user){
        return usersRepository.save(user);
    }

}
