package com.cvbuilder.servlets;

import com.cvbuilder.entity.DB;
import com.cvbuilder.entity.Job;
import com.cvbuilder.entity.User;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Template", urlPatterns = {"/templates"})
public class Template extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") != null) {

            String label = request.getParameter("label");
            String code = request.getParameter("code");
            String isPublic = request.getParameter("isPublic");
            String price = request.getParameter("price");
            boolean isAnUpdate = !request.getParameter("update").equals("false");

            if (label != null && !label.isEmpty() && code != null && !code.isEmpty()) {

                User user = (User) request.getSession().getAttribute("user");
                com.cvbuilder.entity.Template template = new com.cvbuilder.entity.Template();
                EntityManager entityManager = DB.getEntityManager();

                if (isAnUpdate) {
                    template = entityManager.find(com.cvbuilder.entity.Template.class, Long.parseLong(request.getParameter("update")));
                    if (template != null) {
                        if (template.getCreator().getId().equals(user.getId())) {

                            if (!label.equals(template.getLabel()))
                                template.setLabel(label);

                            if (!code.equals(template.getCode()))
                                template.setCode(code);

                            if (price != null && !price.isEmpty()) {
                                if (template.getPrice() != Float.parseFloat(price))
                                    template.setPrice(Float.parseFloat(price));
                            }

                            if (isPublic != null && !isPublic.isEmpty()) {
                                if (!template.isPublic())
                                    template.setPublic(true);
                            } else {
                                if (template.isPublic())
                                    template.setPublic(false);
                            }

                            entityManager.getTransaction().begin();
                            try {
                                entityManager.getTransaction().commit();
                                response.setStatus(HttpServletResponse.SC_OK);
                                response.sendRedirect(request.getContextPath() + "/template");
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

                    template.setLabel(label);
                    template.setCode(code);
                    template.setCreator(user);

                    if (price != null && !price.isEmpty())
                        template.setPrice(Float.parseFloat(price));

                    if (isPublic != null && !isPublic.isEmpty())
                        template.setPublic(true);

                    entityManager.getTransaction().begin();
                    try {
                        entityManager.persist(template);
                        entityManager.getTransaction().commit();
                    } catch (RuntimeException e) {
                        entityManager.getTransaction().rollback();
                        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                    }
                    entityManager.close();
                    response.sendRedirect(request.getContextPath() + "/template");
                }

            } else {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            }

        } else {
            response.setStatus(HttpServletResponse.SC_FORBIDDEN);
        }
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") != null && request.getParameter("id") != null && !request.getParameter("id").isEmpty()) {
            String id = request.getParameter("id");
            User user = (User) request.getSession().getAttribute("user");
            EntityManager entityManager = DB.getEntityManager();
            com.cvbuilder.entity.Template template = entityManager.find(com.cvbuilder.entity.Template.class, Long.parseLong(id));

            if (template != null) {
                if (template.getCreator().getId().equals(user.getId())) {
                    entityManager.remove(template);
                    entityManager.getTransaction().begin();
                    try {
                        entityManager.getTransaction().commit();
                        response.setStatus(HttpServletResponse.SC_OK);
                    } catch (RuntimeException e) {
                        entityManager.getTransaction().rollback();
                        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                    }
                    entityManager.close();
                } else {
                    response.setStatus(HttpServletResponse.SC_FORBIDDEN);
                }
            } else {
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            }
        } else {
            response.setStatus(HttpServletResponse.SC_FORBIDDEN);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") != null) {
            User user = (User) request.getSession().getAttribute("user");
            List<com.cvbuilder.entity.Template> templates = user.getTemplates();
            request.setAttribute("templates", templates);
            this.getServletContext().getRequestDispatcher("/view/template.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/login");
        }
    }
}
