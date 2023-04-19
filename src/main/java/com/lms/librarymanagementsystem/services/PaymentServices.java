package com.lms.librarymanagementsystem.services;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class PaymentServices {
    private PaymentServices paymentServices;

    public PaymentServices(PaymentServices paymentServices) {
        this.paymentServices = paymentServices;
    }
}
