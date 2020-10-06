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

@WebServlet(name = "Informations" , urlPatterns = {"/informations"})
public class Informations extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("last_name") != null && request.getParameter("first_name") != null && request.getParameter("email") != null) {
            User newUser = new User();
            newUser.setLast_name(request.getParameter("last_name"));
            newUser.setFirst_name(request.getParameter("first_name"));
            newUser.setEmail(request.getParameter("email"));
            if(request.getParameter("address") != null)
            {
                newUser.setAddress(request.getParameter("address"));
            }
            if(request.getParameter("phone") != null)
            {
                newUser.setPhone(request.getParameter("phone"));
            }
            if(request.getParameter("birth") != null)
            {
                newUser.setBirth(request.getParameter("birth"));
            }

        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("user") != null) {
            this.getServletContext().getRequestDispatcher("/view/informations.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/login");
        }
    }
}
