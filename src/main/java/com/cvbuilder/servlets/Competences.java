package com.cvbuilder.servlets;

import com.cvbuilder.Helpers;
import com.cvbuilder.entity.User;

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
        if (request.getSession().getAttribute("user") != null) {

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

