package com.cvbuilder.entity;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Entity
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Basic
    @Column(length = 80, nullable = false)
    private String last_name;

    @Basic
    @Column(length = 80, nullable = false)
    private String first_name;

    @Basic
    @Column(length = 200, nullable = false, unique = true)
    private String email;

    @Basic
    @Column(columnDefinition = "TEXT", nullable = false)
    private String password;

    @Temporal(TemporalType.DATE)
    @Column(nullable = true)
    private Date birth;

    @Basic
    @Column(nullable = false)
    private int privileges = 2;

    @Basic
    @Column(columnDefinition = "TEXT", nullable = true)
    private String address;

    @Basic
    @Column(length = 12, nullable = true, unique = true)
    private String phone;

    public Long getId() {
        return id;
    }

    public String getLast_name() {
        return last_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public String getFirst_name() {
        return first_name;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getBirth() {
        return birth;
    }

    public void setBirth(Date birth) {
        this.birth = birth;
    }

    public int getPrivileges() {
        return privileges;
    }

    public void setPrivileges(int privileges) {
        this.privileges = privileges;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public static User getUserByMail(String email) {
        EntityManager entityManager = DB.getEntityManager();
        User user = entityManager
                .createQuery("select u from User u where email = :email", User.class)
                .setParameter("email", email)
                .getSingleResult();
        entityManager.close();
        return user;
    }

    public List<Template> getTemplates() {
        EntityManager entityManager = DB.getEntityManager();
        List<Template> templates = entityManager
                .createQuery("select t from Template t where creator = :user", Template.class)
                .setParameter("user", this)
                .getResultList();
        entityManager.close();
        return templates;
    }

    public List<Job> getJobs() {
        EntityManager entityManager = DB.getEntityManager();
        List<Job> jobs = entityManager
                .createQuery("select j from Job j where user = :user", Job.class)
                .setParameter("user", this)
                .getResultList();
        entityManager.close();
        return jobs;
    }

    public List<Experience> getExperiences() {
        EntityManager entityManager = DB.getEntityManager();
        List<Experience> experiences = entityManager
                .createQuery("select e from Experience e where user = :user", Experience.class)
                .setParameter("user", this)
                .getResultList();
        entityManager.close();
        return experiences;
    }

    public List<Skill> getSkills() {
        EntityManager entityManager = DB.getEntityManager();
        List<Skill> skills = entityManager
                .createQuery("select s from Skill s where user = :user", Skill.class)
                .setParameter("user", this)
                .getResultList();
        entityManager.close();
        return skills;
    }
}
