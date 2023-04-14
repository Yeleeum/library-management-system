package com.lms.librarymanagementsystem.controllers;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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

    @GetMapping
    public String getThesesForm(){
        return "theses";
    }

    @PostMapping
    public Theses insertTheses(Theses theses){
        connectorServices.insertOneConnector(new Connector(theses.getItid(),"theses"));
        return ThesesServices.insertOneTheses(theses);
    }

    @GetMapping("/search")
    public String getThesesBySearch(String searchParam,Model model){
        List<Theses> Theses=ThesesServices.findBySearch(searchParam);
        model.addAttribute("theses", Theses);
        model.addAttribute("searchValue", searchParam);
        model.addAttribute("type", "theses");
        return "searchResult";
    }

    @GetMapping("/title")
    public String getThesesByTitle(String searchParam,Model model){
        List<Theses> theses=ThesesServices.findBySearchTitle(searchParam);
        model.addAttribute("theses", theses);
        model.addAttribute("searchValue", searchParam);
        model.addAttribute("type", "theses");
        return "searchResult";
    }

}
