package com.example.case_webstore.Controller;

import com.example.case_webstore.Service.AdminService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "AdminController",urlPatterns = {"/Admin/*"})
public class AdminController extends BaseController {
    private AdminService adminService;

    @Override
    public void init() throws ServletException {
        adminService = new AdminService();
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String url = req.getPathInfo();
        if (url == null) {
            url = "/";
        }
        System.out.println(url);
        try {
            switch (url) {
                case "/":
                    adminService.showPageList(req, resp);

                    break;

                case "/create":
                    adminService.showPageAddProduct(req, resp);
                    break;
                case "/update":
                  adminService.showPageUpdateProduct(req, resp);
                    break;
                case"/delete":
                    adminService.deleteProduct(req, resp);
                    break;
                default:
                    pageNotFound(req, resp);
                    break;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException(e);
        }
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Handle POST requests here
        req.setCharacterEncoding("UTF-8");
        String url = req.getPathInfo();
        if ((url == null)) {
            url = "/";
        }
        try {
            switch (url){
                case "/create":
                    adminService.createProduct(req, resp);
                    break;
                case "/update":
                    adminService.updateProduct(req, resp);
                    break;
                default:
                    pageNotFound(req, resp);
                    break;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException(e);
        }
    }
}

