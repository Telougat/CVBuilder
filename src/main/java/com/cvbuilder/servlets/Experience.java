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

@WebServlet(name = "Experience", urlPatterns = {"/experience"})
public class Experience extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") != null) {
            if (request.getParameter("experience") != null && request.getParameter("organization") != null && request.getParameter("city") != null && request.getParameter("start") != null) {

                com.cvbuilder.entity.Experience newExperience = new com.cvbuilder.entity.Experience();
                User user = (User) request.getSession().getAttribute("user");


                newExperience.setExperience(request.getParameter("experience"));
                newExperience.setOrganization(request.getParameter("organization"));
                newExperience.setCity(request.getParameter("city"));
                newExperience.setStart(Helpers.parseDateFromParameter(request.getParameter("start")));
                newExperience.setUser(user);

                if (request.getAttribute("end") != null)
                    newExperience.setEnd(Helpers.parseDateFromParameter(request.getParameter("end")));

                if (request.getAttribute("description") != null)
                    newExperience.setDescription(request.getParameter("description"));

                EntityManager entityManager = DB.getEntityManager();
                entityManager.getTransaction().begin();
                boolean transactionOk = false;
                try {
                    entityManager.persist(newExperience);
                    transactionOk = true;
                } catch (PersistenceException ex) {
                    //Todo: Get Cause (ex: Email in database already exist !)
                    ex.printStackTrace();
                } finally {
                    if (transactionOk) {
                        entityManager.getTransaction().commit();
                        response.sendRedirect(request.getContextPath() + "/experience");
                    } else {
                        entityManager.getTransaction().rollback();
                        //TODO: Send error !
                        response.sendRedirect(request.getContextPath() + "/experience");
                    }
                    entityManager.close();
                }
            } else {
                System.out.println("Not all attributes");
                //TODO: Send all attributes is not complete !
                response.sendRedirect(request.getContextPath() + "/experience");
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/login");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") != null) {
            this.getServletContext().getRequestDispatcher("/view/experience.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/login");
        }
    }
}
