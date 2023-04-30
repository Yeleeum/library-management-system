package com.lms.librarymanagementsystem.services;

// import java.io.File;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lms.librarymanagementsystem.Handlers.DateHandler;
import com.lms.librarymanagementsystem.models.Users;
import com.lms.librarymanagementsystem.repositories.UsersRepository;

@Service
@Transactional
public class UsersServices {
    private UsersRepository usersRepository;
    private EmailServices emailServices;

    public UsersServices(UsersRepository usersRepository, EmailServices emailServices) {
        this.usersRepository = usersRepository;
        this.emailServices = emailServices;
    }

    public Users insertOnUser(Users user, String libraryCard) {
        String message = "Dear " + user.getFirstName() + ",\n\n" +
                "On the behalf of our library, we are writing to inform you that your registration request for our library system has been approved. We are pleased to welcome you as a member of our library community.\n\n"
                +
                "With your registration, you will have access to a wealth of resources, including books, journals, magazines, theses, and pdfs also. You will also be able to borrow and renew items, as well as access our online vast repository and search tools.\n\n"
                +
                "As a member of our library system, we ask that you comply with our user policies, which can be found on our website. These policies are in place to ensure a safe and welcoming environment for all users.\n\n"
                +
                "If you have any questions or concerns about our library system, please don't hesitate to contact us. We are always here to help.\n\n"
                +
                "Thank you for choosing to register with us, and we look forward to seeing you soon!\n\n" + "You can now log in to our website and access your profile\n\n" +
                "Sincerely,\n\n" +
                "Library Authorities";

        /* String content = "Dear! " + user.getFirstName()
                + " ,your application has been approved. You can log in to view your profile."; */
        emailServices.sendMail(user.getEmail(), "Approval of Library User Registration", message);

        // emailServices.sendMediaMail(user.getEmail(), "Approval of Application",
        // content, libraryCard);
        return usersRepository.save(user);
    }

    public List<Users> findUserByUsernamePassword(String username, String password) {
        return usersRepository.getUserByUsernamePassword(username, password);
    }

    public Users findUserByUsername(String username) {
        return usersRepository.getUserByUsername(username);
    }

    public String findExpireByUsername(String username) {
        return usersRepository.getExpireByUsername(username);
    }

    public String findMembershipByUsername(String username) {
        return usersRepository.getMembershipByUsername(username);
    }

    public Integer updateMembership() {
        return usersRepository.updateMembership();
    }

    public Integer updateMembershipActive(String username) {
        return usersRepository.updateMembershipActive(usersRepository.getMembershipByUsername(username).equals("active")?DateHandler.addOneYearToDate(usersRepository.getExpireByUsername(username)):DateHandler.addOneYearToDate(DateHandler.getCurrentDate()),username);
    }

    public List<Users> getInactiveUsers(String username) {
        return usersRepository.getInactiveUsers(username);
    }

}
