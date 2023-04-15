package com.lms.librarymanagementsystem.models;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="message")
public class Message {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MSID")
    private Integer msid;

    @Column(name = "USERNAME", length = 100)
    private String username;

    @Column(name = "CONTENT", columnDefinition = "LONGTEXT")
    private String content;

    @Column(name = "STATUS", length = 100,nullable = true)
    private String status;


    public Message() {
    }

    public Message(Integer msid, String username, String content, String status) {
        this.msid = msid;
        this.username = username;
        this.content = content;
        this.status = status;
    }

    public Integer getMsid() {
        return this.msid;
    }

    public void setMsid(Integer msid) {
        this.msid = msid;
    }

    public String getUsername() {
        return this.username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getContent() {
        return this.content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getStatus() {
        return this.status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "{" +
            " msid='" + getMsid() + "'" +
            ", username='" + getUsername() + "'" +
            ", content='" + getContent() + "'" +
            ", status='" + getStatus() + "'" +
            "}";
    }

}
