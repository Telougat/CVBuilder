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

@WebServlet(name = "Job", urlPatterns = {"/job"})
public class Job extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") != null) {
            if (request.getParameter("job") != null && request.getParameter("company") != null && request.getParameter("city") != null && request.getParameter("start") != null) {

                com.cvbuilder.entity.Job newJob = new com.cvbuilder.entity.Job();
                User user = (User) request.getSession().getAttribute("user");


                newJob.setJob(request.getParameter("job"));
                newJob.setCompany(request.getParameter("company"));
                newJob.setCity(request.getParameter("city"));
                newJob.setStart(Helpers.parseDateFromParameter(request.getParameter("start")));
                newJob.setUser(user);

                if (request.getAttribute("end") != null)
                    newJob.setEnd(Helpers.parseDateFromParameter(request.getParameter("end")));

                if (request.getAttribute("description") != null)
                    newJob.setDescription(request.getParameter("description"));

                EntityManager entityManager = DB.getEntityManager();
                entityManager.getTransaction().begin();
                boolean transactionOk = false;
                try {
                    entityManager.persist(newJob);
                    transactionOk = true;
                } catch (PersistenceException ex) {
                    //Todo: Get Cause (ex: Email in database already exist !)
                    ex.printStackTrace();
                } finally {
                    if (transactionOk) {
                        entityManager.getTransaction().commit();
                        response.sendRedirect(request.getContextPath() + "/job");
                    } else {
                        entityManager.getTransaction().rollback();
                        //TODO: Send error !
                        response.sendRedirect(request.getContextPath() + "/job");
                    }
                    entityManager.close();
                }
            } else {
                System.out.println("Not all attributes");
                //TODO: Send all attributes is not complete !
                response.sendRedirect(request.getContextPath() + "/job");
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/login");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") != null) {
            this.getServletContext().getRequestDispatcher("/view/job.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/login");
        }
    }
}
