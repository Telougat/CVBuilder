package com.cvbuilder.servlets;

import com.cvbuilder.Helpers;
import com.cvbuilder.entity.DB;
import com.cvbuilder.entity.Skill;
import com.cvbuilder.entity.User;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "Competences" , urlPatterns = {"/competences"})
public class Competences extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        if (request.getSession().getAttribute("user") != null) {

            String name = request.getParameter("skill");
            String level = request.getParameter("level");
            String description = request.getParameter("description");
            boolean isAnUpdate = !request.getParameter("update").equals("false");

            if (name != null && !name.isEmpty()) {

                User user = (User) request.getSession().getAttribute("user");
                EntityManager entityManager = DB.getEntityManager();
                Skill skill = null;

                if (isAnUpdate) {
                    skill = entityManager.find(Skill.class, Long.parseLong(request.getParameter("update")));
                    if (skill != null) {

                        if (skill.getUser().getId().equals(user.getId())) {
                            if (!skill.getSkill().equals(name))
                                skill.setSkill(name);

                            if (level != null && !level.isEmpty()) {
                                skill.setLevel(Integer.parseInt(level));
                            }

                            if (description != null && !description.isEmpty()) {
                                skill.setDescription(description);
                            }

                            entityManager.getTransaction().begin();
                            try {
                                entityManager.getTransaction().commit();
                                response.setStatus(HttpServletResponse.SC_OK);
                                response.sendRedirect(request.getContextPath() + "/competences");
                            } catch (RuntimeException e) {
                                entityManager.getTransaction().rollback();
                                response.setStatus(HttpServletResponse.SC_NOT_MODIFIED);
                            }
                            entityManager.close();
                        } else {
                            response.setStatus(HttpServletResponse.SC_FORBIDDEN);
                        }

                    } else {
                        response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                    }

                } else {

                    skill = new Skill();
                    skill.setUser(user);
                    skill.setSkill(name);

                    if (level != null && !level.isEmpty())
                        skill.setLevel(Integer.parseInt(level));

                    if (description != null && !description.isEmpty())
                        skill.setDescription(description);

                    entityManager.getTransaction().begin();
                    try {
                        entityManager.persist(skill);
                        entityManager.getTransaction().commit();
                    } catch (RuntimeException e) {
                        entityManager.getTransaction().rollback();
                        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                    }
                    entityManager.close();
                    response.sendRedirect(request.getContextPath() + "/competences");
                }

            } else {
                response.sendRedirect(request.getContextPath() + "/competences");
            }

        } else {
            response.sendRedirect(request.getContextPath() + "/login");
        }
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") != null && request.getParameter("id") != null && !request.getParameter("id").isEmpty()) {
            Long id = Long.parseLong(request.getParameter("id"));
            User user = (User) request.getSession().getAttribute("user");
            EntityManager entityManager = DB.getEntityManager();
            Skill skill = entityManager.find(Skill.class, id);

            if (skill != null) {
                if (skill.getUser().getId().equals(user.getId())) {
                    entityManager.remove(skill);
                    entityManager.getTransaction().begin();
                    try {
                        entityManager.getTransaction().commit();
                        response.setStatus(HttpServletResponse.SC_OK);
                    } catch (RuntimeException e) {
                        entityManager.getTransaction().rollback();
                        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                    }
                } else {
                    response.setStatus(HttpServletResponse.SC_FORBIDDEN);
                }
            } else {
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            }
            entityManager.close();
        } else {
            response.sendRedirect(request.getContextPath() + "/login");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("user") != null) {
            User user = (User) session.getAttribute("user");
            request.setAttribute("skills", user.getSkills());
            this.getServletContext().getRequestDispatcher("/view/competences.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/login");
        }
    }
}

