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
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.List;

@WebServlet(name = "Experience", urlPatterns = {"/experience"})
public class Experience extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") != null) {
            if (request.getParameter("experience") != null && request.getParameter("organization") != null && request.getParameter("city") != null && request.getParameter("start") != null) {

                com.cvbuilder.entity.Experience newExperience = new com.cvbuilder.entity.Experience();
                User user = (User) request.getSession().getAttribute("user");
                EntityManager entityManager = DB.getEntityManager();

                System.out.println(request.getParameter("update"));

                if (!request.getParameter("update").equals("true")) {

                }

                newExperience.setExperience(request.getParameter("experience"));
                newExperience.setOrganization(request.getParameter("organization"));
                newExperience.setCity(request.getParameter("city"));
                newExperience.setStart(Helpers.parseDateFromParameter(request.getParameter("start")));
                newExperience.setUser(user);

                System.out.println(request.getParameter("end"));

                if (request.getParameter("end") != null)
                    newExperience.setEnd(Helpers.parseDateFromParameter(request.getParameter("end")));

                if (request.getParameter("description") != null)
                    newExperience.setDescription(request.getParameter("description"));

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


    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") != null) {
            User user = (User) request.getSession().getAttribute("user");
            Long id = Long.parseLong(request.getParameter("id"));

            EntityManager entityManager = DB.getEntityManager();
            com.cvbuilder.entity.Experience exp = entityManager.find(com.cvbuilder.entity.Experience.class, id);

            if (exp != null) {
                if (user.getId().equals(exp.getUser().getId())) {
                    entityManager.remove(exp);
                    entityManager.getTransaction().begin();
                    try {
                        entityManager.getTransaction().commit();
                        response.setStatus(HttpServletResponse.SC_OK);
                    } catch (RuntimeException e) {
                        entityManager.getTransaction().rollback();
                        response.setStatus(HttpServletResponse.SC_NOT_MODIFIED);
                    }
                    entityManager.close();
                }
                else {
                    response.setStatus(HttpServletResponse.SC_FORBIDDEN);
                }
            } else {
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/login");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") != null) {
            User user = (User) request.getSession().getAttribute("user");
            List<com.cvbuilder.entity.Experience> experiences = null;
            experiences = user.getExperiences();
            request.setAttribute("experiences", experiences);
            this.getServletContext().getRequestDispatcher("/view/infos_experience.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/login");
        }
    }
}
