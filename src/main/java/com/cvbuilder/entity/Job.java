package com.cvbuilder.entity;

import javax.persistence.*;
import java.util.Calendar;

@Entity
public class Job {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Basic
    @Column(columnDefinition = "TEXT", nullable = false)
    private String job;

    @Basic
    @Column(columnDefinition = "TEXT", nullable = false)
    private String company;

    @Basic
    @Column(columnDefinition = "TEXT", nullable = false)
    private String city;

    @Temporal(TemporalType.DATE)
    @Column(nullable = false)
    private Calendar start;

    @Temporal(TemporalType.DATE)
    private Calendar end;

    @Basic
    @Column(columnDefinition = "TEXT")
    private String description;

    @ManyToOne(optional = false)
    private User user;

    public Long getId() {
        return id;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public Calendar getStart() {
        return start;
    }

    public void setStart(Calendar start) {
        this.start = start;
    }

    public Calendar getEnd() {
        return end;
    }

    public void setEnd(Calendar end) {
        this.end = end;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}