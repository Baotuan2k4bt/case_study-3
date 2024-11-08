package com.example.case_webstore.Service;

import com.example.case_webstore.Empty.Category;
import com.example.case_webstore.Empty.Product;
import com.example.case_webstore.Model.ProductModel;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductService {
    private final ProductModel productModel;

    public ProductService() {
        this.productModel = new ProductModel();

    }
    public void showPageProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        // Show list of users
        ResultSet data = productModel.getAllProduct();
        List<Product> products = new ArrayList<>();
        while (data.next()) {
            int id = data.getInt("id");
            String name = data.getString("name");
            String image = data.getString("image");
            String price = data.getString("price");
            Product product = new Product(id, name, image, price);
            products.add(product);  // Add to list of products

            // Add to request attribute for displaying in the view
        }
        request.setAttribute("data", products);
        // Forward to list.jsp
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/home/product/showList.jsp");

        requestDispatcher.forward(request, response);
    }
    public void Seach(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        // Lấy từ khóa tìm kiếm từ request
        String keyword = request.getParameter("keyword");

        // Lấy danh sách sản phẩm dựa trên từ khóa tìm kiếm
        List<Product> products = productModel.searchProducts(keyword);
        System.out.println(products.size());
        // Đặt danh sách sản phẩm vào thuộc tính request
        request.setAttribute("data", products);

        // Forward đến trang showList.jsp
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/home/product/showList.jsp");
        requestDispatcher.forward(request, response);
    }






}
