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
import java.util.List;

@WebServlet(name = "Experience", urlPatterns = {"/experience"})
public class Experience extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") != null) {
            if (request.getParameter("experience") != null && request.getParameter("organization") != null && request.getParameter("city") != null && request.getParameter("start") != null) {

                com.cvbuilder.entity.Experience newExperience = null;
                User user = (User) request.getSession().getAttribute("user");
                EntityManager entityManager = DB.getEntityManager();

                String experience = request.getParameter("experience");
                String organization = request.getParameter("organization");
                String city = request.getParameter("city");
                String start = request.getParameter("start");
                String end = request.getParameter("end");
                String description = request.getParameter("description");

                if (!request.getParameter("update").equals("false")) {
                    newExperience = entityManager.find(com.cvbuilder.entity.Experience.class, Long.parseLong(request.getParameter("update")));
                    if (newExperience != null) {

                        if (!newExperience.getExperience().equals(experience))
                            newExperience.setExperience(experience);

                        if (!newExperience.getOrganization().equals(organization))
                            newExperience.setOrganization(organization);

                        if (!newExperience.getCity().equals(city))
                            newExperience.setCity(city);

                        if (!newExperience.getStart().equals(Helpers.parseDateFromParameter(start)))
                            newExperience.setStart(Helpers.parseDateFromParameter(start));

                        if (end != null && !end.isEmpty())
                            newExperience.setEnd(Helpers.parseDateFromParameter(end));

                        if (description != null && !description.isEmpty())
                            newExperience.setDescription(description);

                        entityManager.getTransaction().begin();
                        try {
                            entityManager.getTransaction().commit();
                            response.sendRedirect(request.getContextPath() + "/experience");
                        } catch (RuntimeException e) {
                            entityManager.getTransaction().rollback();
                        }
                        entityManager.close();
                    } else {
                        response.setStatus(HttpServletResponse.SC_FORBIDDEN);
                    }
                } else {
                    newExperience = new com.cvbuilder.entity.Experience();

                    newExperience.setExperience(experience);
                    newExperience.setOrganization(organization);
                    newExperience.setCity(city);
                    newExperience.setStart(Helpers.parseDateFromParameter(start));
                    newExperience.setUser(user);

                    if (end != null)
                        newExperience.setEnd(Helpers.parseDateFromParameter(end));

                    if (description != null)
                        newExperience.setDescription(description);

                    entityManager.getTransaction().begin();
                    boolean transactionOk = false;
                    try {
                        entityManager.persist(newExperience);
                        transactionOk = true;
                    } catch (PersistenceException ex) {
                        ex.printStackTrace();
                    } finally {
                        if (transactionOk) {
                            entityManager.getTransaction().commit();
                            response.sendRedirect(request.getContextPath() + "/experience");
                        } else {
                            entityManager.getTransaction().rollback();
                            response.setStatus(HttpServletResponse.SC_SERVICE_UNAVAILABLE);
                        }
                        entityManager.close();
                    }
                }
            } else {
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
