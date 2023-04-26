package com.lms.librarymanagementsystem.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.lms.librarymanagementsystem.models.Connector;

public interface ConnectorRepository extends JpaRepository<Connector,String>{
    @Query(value="SELECT TYPE FROM CONNECTOR WHERE ITID=:ITID",nativeQuery = true)
    String getType(@Param("ITID")String ITID);

    @Query(value="SELECT * FROM CONNECTOR WHERE ITID=:ITID",nativeQuery = true)
    Connector getConnectorByItid(@Param("ITID")String ITID);
}
