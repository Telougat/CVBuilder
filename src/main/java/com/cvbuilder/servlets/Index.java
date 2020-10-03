package com.cvbuilder.servlets;

import com.cvbuilder.entity.DB;
import com.cvbuilder.entity.Template;
import com.cvbuilder.entity.User;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Index", urlPatterns = {"/index"})
public class Index extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager entityManager = DB.getEntityManager();

        User user = new User();
        user.setFirst_name("Lorenzo");
        user.setLast_name("LAGOUTTE");
        user.setPrivileges(0);
        user.setEmail("thelorenzo533@gmail.com");
        user.setPassword("secret");

        Template template = new Template();
        template.setLabel("Test");
        template.setCode("CODE####");
        template.setCreator(user);

        Template template1 = new Template();
        template1.setLabel("SecondTest");
        template1.setCode("CODE###");
        template1.setCreator(user);
        template1.setPublic(true);

        Template template2 = new Template();
        template2.setLabel("ThirdTemplate");
        template2.setCode("Code###");
        template2.setCreator(user);
        template2.setPublic(true);

        Template template4 = new Template();
        template4.setLabel("FourTemplate");
        template4.setCode("CODE###");
        template4.setCreator(user);

        entityManager.getTransaction().begin();
        boolean transactionOk = false;
        try {
            entityManager.persist(user);
            entityManager.persist(template);
            entityManager.persist(template1);
            entityManager.persist(template2);
            entityManager.persist(template4);

            transactionOk = true;
        } finally {
            if (transactionOk) {
                entityManager.getTransaction().commit();
            } else {
                entityManager.getTransaction().rollback();
            }
            entityManager.close();
        }

        List<Template> publicTemplates = Template.getPublicTemplates();
        for (Template temp : publicTemplates) {
            System.out.println(temp.getId());
            System.out.println(temp.getCreator().getFirst_name());
            System.out.println(temp.getCreator().getLast_name());
        }

        this.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
    }
}