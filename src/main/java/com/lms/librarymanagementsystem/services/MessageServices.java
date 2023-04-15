package com.lms.librarymanagementsystem.services;

import org.springframework.stereotype.Service;

import com.lms.librarymanagementsystem.repositories.MessageRepository;

import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class MessageServices {
    private MessageRepository messageRepository;

    public MessageServices(MessageRepository messageRepository) {
        this.messageRepository = messageRepository;
    }

}