package com.cvbuilder.servlets;

import com.cvbuilder.entity.DB;
import com.cvbuilder.entity.Experience;
import com.cvbuilder.entity.Job;
import com.cvbuilder.entity.Skill;
import com.cvbuilder.entity.Template;
import com.cvbuilder.entity.User;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "temp", urlPatterns = {"/templateview"})
public class TemplateView extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") != null) {
            if (request.getParameter("id") != null && ! request.getParameter("id").isEmpty()) {
                Long id = Long.parseLong(request.getParameter("id"));
                EntityManager entityManager1 = DB.getEntityManager();
                User user = entityManager1.find(User.class, Long.parseLong(String.valueOf(1)));
                com.cvbuilder.entity.Template template = null;
                EntityManager entityManager = DB.getEntityManager();

                template = entityManager.find(Template.class, id);

                if (template != null) {
                    if (template.getCreator().getId().equals(user.getId())) {
                        List<Job> jobs = user.getJobs();
                        List<Skill> skills = user.getSkills();
                        List<Experience> experiences = user.getExperiences();
                        request.setAttribute("user", user);
                        request.setAttribute("jobs", jobs);
                        request.setAttribute("skills", skills);
                        request.setAttribute("experiences", experiences);
                        request.setAttribute("code", template.getCode());
                        this.getServletContext().getRequestDispatcher("/view/cv_processor.jsp").forward(request, response);
                    } else {
                        response.setStatus(HttpServletResponse.SC_FORBIDDEN);
                    }
                } else {
                    response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                }
            } else {
                response.sendRedirect(request.getContextPath() + "/template");
            }
        }
        else {
            this.getServletContext().getRequestDispatcher("/view/login.jsp").forward(request, response);
        }
    }
}