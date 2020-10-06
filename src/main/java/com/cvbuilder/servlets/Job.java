package com.cvbuilder.servlets;

import com.cvbuilder.Helpers;
import com.cvbuilder.entity.DB;
import com.cvbuilder.entity.Experience;
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

@WebServlet(name = "Job", urlPatterns = {"/job"})
public class Job extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") != null) {
            if (request.getParameter("job") != null && request.getParameter("company") != null && request.getParameter("city") != null && request.getParameter("start") != null) {

                com.cvbuilder.entity.Job newJob = null;
                User user = (User) request.getSession().getAttribute("user");
                EntityManager entityManager = DB.getEntityManager();

                String job = request.getParameter("job");
                String company = request.getParameter("company");
                String city = request.getParameter("city");
                String start = request.getParameter("start");
                String end = request.getParameter("end");
                String description = request.getParameter("description");

                if (!request.getParameter("update").equals("false")) {
                    newJob = entityManager.find(com.cvbuilder.entity.Job.class, Long.parseLong(request.getParameter("update")));
                    if (newJob != null) {

                        if (!newJob.getJob().equals(job))
                            newJob.setJob(job);

                        if (!newJob.getCompany().equals(company))
                            newJob.setCompany(company);

                        if (!newJob.getCity().equals(city))
                            newJob.setCity(city);

                        if (!newJob.getStart().equals(Helpers.parseDateFromParameter(start)))
                            newJob.setStart(Helpers.parseDateFromParameter(start));

                        if (end != null && !end.isEmpty())
                            newJob.setEnd(Helpers.parseDateFromParameter(end));

                        if (description != null && !description.isEmpty())
                            newJob.setDescription(description);

                        entityManager.getTransaction().begin();
                        try {
                            entityManager.getTransaction().commit();
                            response.sendRedirect(request.getContextPath() + "/job");
                        } catch (RuntimeException e) {
                            entityManager.getTransaction().rollback();
                        }
                        entityManager.close();
                    } else {
                        response.setStatus(HttpServletResponse.SC_FORBIDDEN);
                    }
                } else {
                    newJob = new com.cvbuilder.entity.Job();

                    newJob.setJob(job);
                    newJob.setCompany(company);
                    newJob.setCity(city);
                    newJob.setStart(Helpers.parseDateFromParameter(start));
                    newJob.setUser(user);

                    if (end != null && !end.isEmpty())
                        newJob.setEnd(Helpers.parseDateFromParameter(end));

                    if (description != null && !description.isEmpty())
                        newJob.setDescription(description);

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

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") != null) {
            User user = (User) request.getSession().getAttribute("user");
            Long id = Long.parseLong(request.getParameter("id"));

            EntityManager entityManager = DB.getEntityManager();
            com.cvbuilder.entity.Job job = entityManager.find(com.cvbuilder.entity.Job.class, id);

            if (job != null) {
                if (user.getId().equals(job.getUser().getId())) {
                    entityManager.remove(job);
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
            List<com.cvbuilder.entity.Job> jobs = null;
            jobs = user.getJobs();
            request.setAttribute("jobs", jobs);
            this.getServletContext().getRequestDispatcher("/view/infos_job.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/login");
        }
    }
}
