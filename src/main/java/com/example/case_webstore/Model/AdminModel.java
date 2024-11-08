package com.example.case_webstore.Model;

import com.example.case_webstore.Empty.Product;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminModel {
    private final Connection connection;

    public AdminModel() {
        connection = DataBase.getConnection();

    }

    public ResultSet getAllProduct() throws SQLException {
        //  viet cau lenh truy van
        String sql = "SELECT * FROM product";
        //dua cau lenh truy van
        PreparedStatement statement = connection.prepareStatement(sql);
        ResultSet resultSet = statement.executeQuery();
        return resultSet;


    }
    public ResultSet getAllCategory() throws SQLException {
        String sql = "SELECT * FROM category";
        PreparedStatement statement = connection.prepareStatement(sql);
        ResultSet resultSet = statement.executeQuery();
        return resultSet;
    }

    public void deleteProduct(int id) throws SQLException {
        String sql = "DELETE FROM product WHERE id = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        //thay thế câu lệnh
        statement.setInt(1,id);
        statement.execute();
    }
    public void addProduct(Product products) throws SQLException {
        String sql = "INSERT INTO product (id,name,image, price,category_id) VALUES (?,?,?,?,?)";
        PreparedStatement statement = connection.prepareStatement(sql);
        //thay thế câu lệnh
        statement.setInt(1, products.getId());
        statement.setString(2, products.getName());
        statement.setString(3, products.getImage());
        statement.setBigDecimal(4, new BigDecimal(products.getPrice()));
        statement.setInt(5, products.getCategoryId());
        statement.execute();
    }
    public ResultSet findProductByID(int id) throws SQLException {
        String sql = "SELECT * FROM product WHERE id = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        // Thay thế tham số dấu ? trong câu truy vấn bằng giá trị id
        statement.setInt(1, id);

        // Thực thi truy vấn và trả về kết quả
        ResultSet resultSet = statement.executeQuery();
        return resultSet;
    }

    public void updateProduct(Product product) throws SQLException {
        String sql = "UPDATE product SET name=?, image=?, price=? WHERE id=?";
        PreparedStatement statement = connection.prepareStatement(sql);
        //thay thế câu lệnh
        statement.setInt(4, product.getId());
        statement.setString(1, product.getName());
        statement.setString(2, product.getImage());
        statement.setString(3, product.getPrice());

        //thực thi câu lệnh
        statement.execute();
    }

}