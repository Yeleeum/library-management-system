package com.lms.librarymanagementsystem.services;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class FineServices {
    private FineServices fineServices;

    public FineServices(FineServices fineServices) {
        this.fineServices = fineServices;
    }
}
