package com.cvbuilder.entity;

import javax.persistence.*;
import java.util.Date;

@Entity
public class Experience {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Basic
    @Column(columnDefinition = "TEXT", nullable = false)
    private String experience;

    @Basic
    @Column(columnDefinition = "TEXT", nullable = false)
    private String organization;

    @Basic
    @Column(columnDefinition = "TEXT", nullable = false)
    private String city;

    @Temporal(TemporalType.DATE)
    @Column(nullable = false)
    private Date start;

    @Temporal(TemporalType.DATE)
    private Date end;

    @Basic
    @Column(columnDefinition = "TEXT")
    private String description;

    @ManyToOne(optional = false)
    private User user;

    public Long getId() {
        return id;
    }

    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience;
    }

    public String getOrganization() {
        return organization;
    }

    public void setOrganization(String organization) {
        this.organization = organization;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public Date getStart() {
        return start;
    }

    public void setStart(Date start) {
        this.start = start;
    }

    public Date getEnd() {
        return end;
    }

    public void setEnd(Date end) {
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
