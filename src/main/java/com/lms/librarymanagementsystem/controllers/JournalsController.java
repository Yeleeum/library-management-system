package com.lms.librarymanagementsystem.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lms.librarymanagementsystem.models.Connector;
import com.lms.librarymanagementsystem.models.Journals;
import com.lms.librarymanagementsystem.services.ConnectorServices;
import com.lms.librarymanagementsystem.services.JournalsServices;

@Controller
@RequestMapping("/journals")
public class JournalsController {
    private JournalsServices JournalsServices;
    private ConnectorServices connectorServices;


    public JournalsController(JournalsServices JournalsServices, ConnectorServices connectorServices) {
        this.JournalsServices = JournalsServices;
        this.connectorServices = connectorServices;
    }

    @GetMapping
    public String getJournalForm(){
        return "journals";
    }

    @PostMapping
    public Journals insertJournal(Journals journal){
        connectorServices.insertOneConnector(new Connector(journal.getItid(),"journal"));
        return JournalsServices.insertOneJournal(journal);
    }
    

}