package com.cvbuilder.servlets;

import com.cvbuilder.Helpers;
import com.cvbuilder.entity.DB;
import com.cvbuilder.entity.User;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "Register", urlPatterns = {"/register"})
public class Register extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("last_name") != null && request.getParameter("first_name") != null && request.getParameter("email") != null && request.getParameter("password") != null) {
            User newUser = new User();
            newUser.setLast_name(request.getParameter("last_name"));
            newUser.setFirst_name(request.getParameter("first_name"));
            newUser.setEmail(request.getParameter("email"));
            newUser.setPassword(Helpers.hashPassword(request.getParameter("password")));

            EntityManager entityManager = DB.getEntityManager();
            entityManager.getTransaction().begin();
            boolean transactionOk = false;
            try {
                entityManager.persist(newUser);
                transactionOk = true;
            } catch (PersistenceException ex) {
                //Todo: Get Cause (ex: Email in database already exist !)
                ex.printStackTrace();
            } finally {
                if (transactionOk) {
                    entityManager.getTransaction().commit();
                    response.sendRedirect(request.getContextPath() + "/login");
                } else {
                    entityManager.getTransaction().rollback();
                    response.sendRedirect(request.getContextPath() + "/register");
                }
                entityManager.close();
            }
        } else {
            System.out.println("Not all attributes");
            response.sendRedirect(request.getContextPath() + "/register");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.getServletContext().getRequestDispatcher("/view/register.jsp").forward(request, response);
    }
}
