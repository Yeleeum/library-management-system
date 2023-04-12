package com.lms.librarymanagementsystem.services;

import org.springframework.stereotype.Service;

import com.lms.librarymanagementsystem.models.Connector;
import com.lms.librarymanagementsystem.repositories.ConnectorRepository;

@Service
public class ConnectorServices {
    private ConnectorRepository connectorRepository;

    public ConnectorServices(ConnectorRepository connectorRepository) {
        this.connectorRepository = connectorRepository;
    }

    public Connector insertOneConnector(Connector connector){
        return connectorRepository.save(connector);
    }
}
