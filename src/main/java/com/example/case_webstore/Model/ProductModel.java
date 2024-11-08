package com.example.case_webstore.Model;

import com.example.case_webstore.Empty.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductModel {
    private final Connection connection;

    public ProductModel() {
        List<Product> list = new ArrayList<Product>();
        connection = DataBase.getConnection();

    }
    public ResultSet getAllProduct() throws SQLException {
        // viet cau lenh truy van
        String sql = "SELECT * FROM product";
        //dua cau lenh truy van
        PreparedStatement statement = connection.prepareStatement(sql);
        return statement.executeQuery();

    }
    public List<Product> searchProducts(String keyword) throws SQLException {
        String sql = "SELECT * FROM product WHERE name LIKE ?";
        List<Product> products = new ArrayList<>();

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, "%" + keyword + "%");
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    String name = resultSet.getString("name");
                    Product product = new Product(name);
                    products.add(product);
                }
            }
        }
        return products;
    }




}
