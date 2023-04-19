package com.lms.librarymanagementsystem.models;

import jakarta.persistence.Column;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

public class Borrow {
    @Id
    @Column(name = "BRID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer brid;

    @Column(name = "USERNAME")
    private String username;

    @Column(name = "ITID")
    private Connector connector;

    @Column(name = "BORROWDATE")
    private String borrowDate;

    @Column(name = "RETURNDATE")
    private String returnDate;

    @Column(name = "STATUS")
    private String status;

    @Column(name = "APPROVED")
    private String approved;

    public Borrow() {
    }

    public Borrow(Integer brid, String username, Connector connector, String borrowDate, String returnDate, String status, String approved) {
        this.brid = brid;
        this.username = username;
        this.connector = connector;
        this.borrowDate = borrowDate;
        this.returnDate = returnDate;
        this.status = status;
        this.approved = approved;
    }

    public Integer getBrid() {
        return this.brid;
    }

    public void setBrid(Integer brid) {
        this.brid = brid;
    }

    public String getUsername() {
        return this.username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Connector getConnector() {
        return this.connector;
    }

    public void setConnector(Connector connector) {
        this.connector = connector;
    }

    public String getBorrowDate() {
        return this.borrowDate;
    }

    public void setBorrowDate(String borrowDate) {
        this.borrowDate = borrowDate;
    }

    public String getReturnDate() {
        return this.returnDate;
    }

    public void setReturnDate(String returnDate) {
        this.returnDate = returnDate;
    }

    public String getStatus() {
        return this.status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getApproved() {
        return this.approved;
    }

    public void setApproved(String approved) {
        this.approved = approved;
    }

    @Override
    public String toString() {
        return "{" +
            " brid='" + getBrid() + "'" +
            ", username='" + getUsername() + "'" +
            ", connector='" + getConnector() + "'" +
            ", borrowDate='" + getBorrowDate() + "'" +
            ", returnDate='" + getReturnDate() + "'" +
            ", status='" + getStatus() + "'" +
            ", approved='" + getApproved() + "'" +
            "}";
    }
}
