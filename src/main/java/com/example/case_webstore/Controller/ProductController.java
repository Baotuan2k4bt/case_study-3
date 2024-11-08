package com.example.case_webstore.Controller;

import com.example.case_webstore.Service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ProductController",urlPatterns = "/product/*")
public class ProductController extends BaseController {

    private ProductService productService;

    @Override
    public void init() throws ServletException {
        productService = new ProductService();

    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String url = req.getPathInfo();

        if (url == null || url.equals("/")) {
            url = "/";
        }
        try {
            switch (url) {
                case "/":
                    productService.showPageProduct(req, resp);
                    break;
                case"/find":
                    productService.Seach(req, resp);
                    break;
                default:
                    pageNotFound(req, resp);
                    break;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("Database error occurred", e);
        }
    }

}


