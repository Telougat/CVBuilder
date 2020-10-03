package com.cvbuilder.entity;

import javax.persistence.*;
import java.util.List;

@Entity
public class Skill {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Basic
    @Column(columnDefinition = "TEXT", nullable = false)
    private String skill;

    @Basic
    @Column
    private int level;

    @Basic
    @Column(columnDefinition = "TEXT")
    private String description;

    @ManyToOne(optional = false)
    private User user;

    public Long getId() {
        return id;
    }

    public String getSkill() {
        return skill;
    }

    public void setSkill(String skill) {
        this.skill = skill;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
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
