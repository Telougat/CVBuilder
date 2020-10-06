package com.cvbuilder.servlets;

import com.cvbuilder.Helpers;
import com.cvbuilder.entity.DB;
import com.cvbuilder.entity.Template;
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

@WebServlet(name = "Market", urlPatterns = {"/marketplace"})
public class Marketplace extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String search = request.getParameter("search");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Template> templates = Template.getPublicTemplates();
        request.setAttribute("templates", templates);
        this.getServletContext().getRequestDispatcher("/view/marketplace.jsp").forward(request, response);
    }
}