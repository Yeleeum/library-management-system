package com.lms.librarymanagementsystem.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Service;

@Configuration
@Service
@EnableAsync
public class EmailServices {
    @Autowired
    private JavaMailSender javaMailSender;

    @Async
    public void sendMail(String to,String subject,String body){
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("libraryauthorities2023@gmail.com");
        message.setTo(to);
        message.setSubject(subject);
        message.setText(body);
        javaMailSender.send(message);
    }
}
