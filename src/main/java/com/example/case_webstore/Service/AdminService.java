package com.example.case_webstore.Service;

import com.example.case_webstore.Empty.Category;
import com.example.case_webstore.Empty.Product;
import com.example.case_webstore.Model.AdminModel;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AdminService {
    private final AdminModel adminModel;

    public AdminService() {
        this.adminModel = new AdminModel();

    }
    public void showPageList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        // Show list of users
        ResultSet data = adminModel.getAllProduct();
        ResultSet list = adminModel.getAllCategory();
        List<Product> products = new ArrayList<>();
        List<Category> categorys = new ArrayList<>();

        while (data.next()) {
            int id = data.getInt("id");
            String name = data.getString("name");
            String image = data.getString("image");
            String price = data.getString("price");
            Product product = new Product(id, name, image, price);
            products.add(product);
            // Add to request attribute for displaying in the view
        }
        request.setAttribute("data", products);

        while (list.next()) {
            int category_id= list.getInt("category_id");
            String category_name = list.getString("category_name");
            Category category=new Category(category_id,category_name );
            categorys.add(category);

        }
        request.setAttribute("list", categorys);
        // Forward to list.jsp
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/home/admin/list.jsp");

        requestDispatcher.forward(request, response);

    }


    public void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        adminModel.deleteProduct(id);
        response.sendRedirect(request.getContextPath() + "/Admin");
    }

    public void showPageAddProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/home/admin/list.jsp");
        requestDispatcher.forward(request, response);
    }
    public void createProduct(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        // Get user Data from request
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String image = request.getParameter("image");
        String price = request.getParameter("price");
        int categoryId = Integer.parseInt(request.getParameter("category_id"));
        Product product = new Product(id,name,image,price,categoryId);
        // Lưu User vào cơ sở dữ liệu thông qua model
        adminModel.addProduct(product);

        // Redirect to admin page
        response.sendRedirect(request.getContextPath() + "/Admin");
    }

    public void showPageUpdateProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        //get user update from database
        int id = Integer.parseInt(request.getParameter("id"));
        Product productUpdate = this.getProductById(id);
        request.setAttribute("product",productUpdate);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/home/admin/update.jsp");
        requestDispatcher.forward(request, response);
    }

    public Product getProductById(int id) throws SQLException {
        ResultSet resultSet = adminModel.findProductByID(id);
        Product product = null;
        while (resultSet.next()) {
            String name = resultSet.getString("name");
            String image = resultSet.getString("image");
            String price = resultSet.getString("price");
  //          int categoryId = Integer.parseInt(resultSet.getString("category_id"));
            product = new Product(id, name, image, price);
        }
        return product;
    }
    public void updateProduct(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String image = request.getParameter("image");
        String price = request.getParameter("price");
   //  int categoryId = Integer.parseInt(request.getParameter("category_id"));

        Product product = new Product(id,name,image,price);
        // Lưu User vào cơ sở dữ liệu thông qua model
        adminModel.updateProduct(product);
        // Chuyển hướng về trang danh sách người dùng
        response.sendRedirect(request.getContextPath()+"/Admin");
    }
}
