package com.cvbuilder.servlets;
import com.cloudmersive.client.ConvertDocumentApi;
import com.cloudmersive.client.invoker.ApiClient;
import com.cloudmersive.client.invoker.ApiException;
import com.cloudmersive.client.invoker.Configuration;
import com.cloudmersive.client.invoker.auth.*;

import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

@WebServlet(name = "ConvertToPDF", urlPatterns = {"/convert"})
public class ConvertToPDF extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {

            ApiClient defaultClient = Configuration.getDefaultApiClient();

            // Configure API key authorization: Apikey
            ApiKeyAuth Apikey = (ApiKeyAuth) defaultClient.getAuthentication("Apikey");
            Apikey.setApiKey("b7109031-5328-46a7-aa96-77f9ac2d3186");

            ConvertDocumentApi apiInstance = new ConvertDocumentApi();
            File inputFile = new File("C:\\Users\\Utilisateur\\Documents\\test.html");
            try {
//                Object result = apiInstance.convertDocumentDocxToPdf(inputFile);
                byte[] result = apiInstance.convertDocumentHtmlToPdf(inputFile);
                System.out.println(result);

                OutputStream os = response.getOutputStream();
                response.setContentType("Application/x-pdf");
                response.setHeader("Content-disposition", "filename=\"cvbuilder.pdf\"");
                os.write(result);
            } catch (ApiException e) {
                System.err.println("Exception when calling ConvertDocumentApi#convertDocumentHTMLToPdf");
                e.printStackTrace();
            }
        } catch (Exception e) {
                System.out.println("Error:" + e.toString() + e.getMessage());
            }
        }
    }

