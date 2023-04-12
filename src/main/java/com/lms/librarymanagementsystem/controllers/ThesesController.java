package com.lms.librarymanagementsystem.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lms.librarymanagementsystem.models.Connector;
import com.lms.librarymanagementsystem.models.Theses;
import com.lms.librarymanagementsystem.services.ConnectorServices;
import com.lms.librarymanagementsystem.services.ThesesServices;

@Controller
@RequestMapping("/theses")
public class ThesesController {
    private ThesesServices ThesesServices;
    private ConnectorServices connectorServices;

    public ThesesController(ThesesServices ThesesServices, ConnectorServices connectorServices) {
        this.ThesesServices = ThesesServices;
        this.connectorServices = connectorServices;
    }

    @PostMapping
    public Theses insertTheses(Theses theses){
        connectorServices.insertOneConnector(new Connector(theses.getItid(),"theses"));
        return ThesesServices.insertOneTheses(theses);
    }

}
