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
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDate;
import java.util.Date;

@WebServlet(name = "Informations" , urlPatterns = {"/informations"})
public class Informations extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if (request.getParameter("last_name") != null && request.getParameter("first_name") != null && request.getParameter("email") != null) {

            User user = (User) request.getSession().getAttribute("user");

            EntityManager entityManager = DB.getEntityManager();
            User updateUser = entityManager.find(User.class,user.getId());

            updateUser.setLast_name(request.getParameter("last_name"));
            updateUser.setFirst_name(request.getParameter("first_name"));
            updateUser.setEmail(request.getParameter("email"));

            if(request.getParameter("address") != null)
            {
                if(request.getParameter("address") != user.getAddress())
                {
                    updateUser.setAddress(request.getParameter("address"));
                }
            }
            if(request.getParameter("phone") != null)
            {
                if(request.getParameter("phone") != user.getPhone())
                {
                    updateUser.setPhone(request.getParameter("phone"));
                }
            }
            if(request.getParameter("birth") != null)
            {
                if(Helpers.parseDateFromParameter(request.getParameter("birth")) != user.getBirth())
                {
                    updateUser.setBirth(Helpers.parseDateFromParameter(request.getParameter("birth")));
                }
            }

            entityManager.getTransaction().begin();
            try {
                entityManager.getTransaction().commit();
                request.getSession().setAttribute("user",updateUser);
                response.sendRedirect(request.getContextPath() + "/experience");
            } catch (RuntimeException e) {
                entityManager.getTransaction().rollback();
            }
            entityManager.close();

        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("user") != null) {
            User user = (User) request.getSession().getAttribute("user");
            request.setAttribute("last_name", user.getLast_name());
            request.setAttribute("first_name", user.getFirst_name());
            request.setAttribute("email", user.getEmail());
            request.setAttribute("address", user.getAddress());
            request.setAttribute("phone", user.getPhone());
            request.setAttribute("birth", user.getBirth());

            this.getServletContext().getRequestDispatcher("/view/informations.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/login");
        }
    }
}
