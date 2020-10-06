package com.cvbuilder.servlets;

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

@WebServlet(name = "Skill", urlPatterns = {"/skill"})
public class Skill extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") != null) {
            if (request.getParameter("skill") != null) {
                com.cvbuilder.entity.Skill newSkill = new com.cvbuilder.entity.Skill();
                User user = (User) request.getSession().getAttribute("user");

                newSkill.setSkill(request.getParameter("skill"));

                if (request.getParameter("level") != null)
                    newSkill.setLevel(Integer.parseInt(request.getParameter("level")));
                if (request.getParameter("description") != null)
                    newSkill.setDescription(request.getParameter("description"));

                newSkill.setUser(user);

                EntityManager entityManager = DB.getEntityManager();
                entityManager.getTransaction().begin();
                boolean transactionOk = false;
                try {
                    entityManager.persist(newSkill);
                    transactionOk = true;
                } catch (PersistenceException ex) {
                    //Todo: Get Cause (ex: Email in database already exist !)
                    ex.printStackTrace();
                } finally {
                    if (transactionOk) {
                        entityManager.getTransaction().commit();
                        response.sendRedirect(request.getContextPath() + "/skill");
                    } else {
                        entityManager.getTransaction().rollback();
                        //TODO: Send error !
                        response.sendRedirect(request.getContextPath() + "/skill");
                    }
                    entityManager.close();
                }
            } else {
                response.sendRedirect(request.getContextPath() + "/skill");
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/login");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") != null) {
            this.getServletContext().getRequestDispatcher("/view/skill.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/login");
        }
    }
}
