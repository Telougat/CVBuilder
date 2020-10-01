package com.cvbuilder;

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

@WebServlet(name = "Index", urlPatterns = {"/index"})
public class Index extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("OKLM");

        EntityManagerFactory emf = Persistence.createEntityManagerFactory("default");
        EntityManager entityManager = emf.createEntityManager();

        User user = new User();
        user.setNom("LAGOUTTE");
        user.setPrenom("Lorenzo");

        entityManager.getTransaction().begin();
        boolean transactionOk = false;
        try {
            entityManager.persist(user);
            transactionOk = true;
        } finally {
            if (transactionOk) {
                entityManager.getTransaction().commit();
            } else {
                entityManager.getTransaction().rollback();
            }
            entityManager.close();
        }



        this.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
    }
}