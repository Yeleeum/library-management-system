package com.lms.librarymanagementsystem.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lms.librarymanagementsystem.models.Connector;
import com.lms.librarymanagementsystem.models.Magazines;
import com.lms.librarymanagementsystem.services.ConnectorServices;
import com.lms.librarymanagementsystem.services.MagazinesServices;

@Controller
@RequestMapping("/magazines")
public class MagazinesController {
    private MagazinesServices MagazinesServices;
    private ConnectorServices connectorServices;

    public MagazinesController(MagazinesServices MagazinesServices,ConnectorServices connectorServices) {
        this.MagazinesServices = MagazinesServices;
        this.connectorServices = connectorServices;
    }

    @GetMapping
    public String getMagazineForm(){
        return "magazines";
    }

    @PostMapping
    public Magazines insertMagazine(Magazines magazine){
        connectorServices.insertOneConnector(new Connector(magazine.getItid(),"magazine"));
        return MagazinesServices.insertOneMagazine(magazine);
    }

}