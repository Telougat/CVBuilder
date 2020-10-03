package com.cvbuilder.entity;

import javax.persistence.*;
import java.util.List;

@Entity
public class Template {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Basic
    @Column(length = 150, nullable = false)
    private String label;

    @Basic
    @Column(columnDefinition = "LONGTEXT", nullable = false)
    private String code;

    @Basic
    @Column
    private boolean isPublic = false;

    @ManyToOne(optional = false)
    private User creator;

    public Long getId() {
        return id;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public boolean isPublic() {
        return isPublic;
    }

    public void setPublic(boolean aPublic) {
        isPublic = aPublic;
    }

    public User getCreator() {
        return creator;
    }

    public void setCreator(User creator) {
        this.creator = creator;
    }

    public static List<Template> getPublicTemplates() {
        EntityManager entityManager = DB.getEntityManager();
        List<Template> templates = entityManager
                .createQuery("select t from Template t where t.isPublic = true", Template.class)
                .getResultList();
        entityManager.close();
        return templates;
    }
}
