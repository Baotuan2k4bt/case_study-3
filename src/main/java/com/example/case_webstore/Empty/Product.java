package com.example.case_webstore.Empty;

public class Product {
    private int id;
    private String name;
    private String image;
    private String price;
    private String title;
    private String description;
    private int category_id;

    public Product() {
    }

    public Product(int id, String name, String image, String price, String title, String description, int category_id) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.price = price;
        this.title = title;
        this.description = description;
        this.category_id = category_id;
    }

    public Product(int id, String name, String image, String price, int category_id) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.price = price;
        this.category_id = category_id;
    }

    public Product(int id, String name, String image, String price) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.price = price;
    }

    public Product(String name) {
        this.name = name;
    }


    // Getters and Setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }


    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    };

    public int getCategoryId() {
        return category_id;
    };
}

