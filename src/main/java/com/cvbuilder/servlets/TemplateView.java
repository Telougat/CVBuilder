package com.cvbuilder.servlets;

import com.cvbuilder.entity.DB;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "template", urlPatterns = {"/template"})
public class TemplateView extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

            System.out.println("OK");
            com.cvbuilder.entity.Template template = null;
            EntityManager entityManager = DB.getEntityManager();
            template = entityManager.find(com.cvbuilder.entity.Template.class, Long.parseLong(request.getParameter("id")));
            request.setAttribute("template", template);
            this.getServletContext().getRequestDispatcher("/view/template.jsp").forward(request, response);
        }
    }