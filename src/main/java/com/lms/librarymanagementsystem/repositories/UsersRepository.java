package com.lms.librarymanagementsystem.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.lms.librarymanagementsystem.models.Users;

public interface UsersRepository extends JpaRepository<Users,String>{

    @Query(value="SELECT * FROM USERS WHERE USERNAME=:USERNAME AND PASSWORD=:PASSWORD", nativeQuery=true)
    public List<Users> getUserByUsernamePassword(@Param("USERNAME")String username,@Param("PASSWORD")String password);

    @Query(value="SELECT * FROM USERS WHERE USERNAME=:USERNAME", nativeQuery=true)
    public Users getUserByUsername(@Param("USERNAME")String username);
    
}
