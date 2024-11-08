<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
 <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">

    <title>Edit Product</title>

    <!-- Custom CSS -->
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fc;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 50px auto;
            background-color: white;
            padding: 20px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        h3 {
            text-align: center;
            font-size: 24px;
            color: #333;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-label {
            font-size: 16px;
            font-weight: bold;
            color: #333;
            display: block;
            margin-bottom: 8px;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .form-control:focus {
            outline: none;
            border-color: #007bff;
        }

        .form-footer {
            text-align: center;
            margin-top: 20px;
        }

        .btn {
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            border: none;
            border-radius: 5px;
        }

        .btn-primary {
            background-color: #007bff;
            color: white;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .btn-secondary {
            background-color: #ccc;
            color: #333;
        }

        .btn-secondary:hover {
            background-color: #999;
        }

        .btn:focus {
            outline: none;
        }
    </style>
</head>

<body>

<div class="container">
    <h3>Edit Product</h3>
    <form action="/Admin/update?id=<c:out value="${product.id}"/>" method="POST">
        <!-- Name Field -->
        <div class="form-group">
            <label for="name" class="form-label">Product Name</label>
            <input name="name" id="name" type="text" class="form-control" value="<c:out value="${product.name}"/>" required>
        </div>

        <!-- Image URL Field -->
        <div class="form-group">
            <label for="image" class="form-label">Product Image URL</label>
            <input name="image" id="image" type="url" class="form-control" value="<c:out value="${product.image}"/>" required>
        </div>

        <!-- Price Field -->
        <div class="form-group">
            <label for="price" class="form-label">Product Price ($)</label>
            <input name="price" id="price" type="number" step="0.01" class="form-control" value="<c:out value="${product.price}"/>" required>
        </div>

        <!-- Submit Button -->
        <div class="form-footer">
            <button type="submit" class="btn btn-primary">Save Changes</button>
            <a href="/Admin" class="btn btn-secondary">Cancel</a>
        </div>
    </form>
</div>

</body>

</html>
