
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="css/manager.css" rel="stylesheet" type="text/css"/>
    <style>
        img{
            width: 200px;
            height: 120px;
        }
    </style>
<body>
<div class="container">
    <div class="table-wrapper">
        <div class="table-title">
            <div class="row">
                <div class="col-sm-6">
                    <h2>Manage <b>Product</b></h2>
                </div>
                <div class="d-flex justify-content-end mb-3">
                    <a    href="#addEmployeeModal"  href="/Admin/create"  class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Product</span></a>
                </div>
            </div>
        </div>
        <table class="table table-striped table-hover">
            <thead>
            <tr>
                <th>
                                <span class="custom-checkbox">
                                    <input type="checkbox" id="selectAll">
                                    <label for="selectAll"></label>
                                </span>
                </th>
                <th>ID</th>
                <th>Name</th>
                <th>Image</th>
                <th>Price</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${data}" var="product">
                <tr>
                    <td>
                                    <span class="custom-checkbox">
                                        <input type="checkbox" id="checkbox1" name="options[]" value="1">
                                        <label for="checkbox1"></label>
                                    </span>
                    </td>
                    <td><c:out value = "${product.id}"/></td>
                    <td><c:out value = "${product.name}"/></td>
                    <td><img src="<c:out value = "${product.image}"/>"></td>
                    <td><c:out value = "${product.price}"/></td>

                    <td>
                    <td>
                    <a class="btn btn-primary" href="${pageContext.request.contextPath}/Admin/update?id=<c:out value="${product.id}"/> " >Update</a>

                    <a class="btn btn-danger" onclick="return confirm('Are you sure ?')" href="${pageContext.request.contextPath}/Admin/delete?id=<c:out value="${product.id}"/> ">Delete</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div class="clearfix">
            <div class="hint-text">Showing <b>5</b> out of <b>25</b> entries</div>
            <ul class="pagination">
                <li class="page-item disabled"><a href="#">Previous</a></li>
                <li class="page-item"><a href="#" class="page-link">1</a></li>
                <li class="page-item"><a href="#" class="page-link">2</a></li>
                <li class="page-item active"><a href="#" class="page-link">3</a></li>
                <li class="page-item"><a href="#" class="page-link">4</a></li>
                <li class="page-item"><a href="#" class="page-link">5</a></li>
                <li class="page-item"><a href="#" class="page-link">Next</a></li>
            </ul>
        </div>
    </div>
    <a href="/product"><button type="button" class="btn btn-primary">Back to home</button>
    </a>
</div>

<!-- Edit Modal HTML -->
<div id="addEmployeeModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form id="addProductForm" action="/Admin/create" method="post" >
                <div class="modal-header">
                    <h4 class="modal-title">Add Product</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <!-- ID Field -->
                    <%--@declare id="category_id"--%><div class="form-group">
                        <label>ID</label>
                        <input name="id" type="number" class="form-control" required min="1" placeholder="Enter product ID">
                        <span class="error-message" id="idError" style="color: red; display: none;">Please enter a valid ID.</span>
                    </div>

                    <!-- Name Field -->
                    <div class="form-group">
                        <label>Name</label>
                        <input name="name" type="text" class="form-control" required>
                        <span class="error-message" id="nameError" style="color: red; display: none;">Please enter a name.</span>
                    </div>

                    <div class="form-group">
                        <label>Image</label>
                        <input name="image" type="url" class="form-control" required>
                        <span class="error-message" id="imageError" style="color: red; display: none;">Please enter a valid image URL.</span>
                    </div>

                    <!-- Price Field -->
                    <div class="form-group">
                        <label>Price</label>
                        <input name="price" type="text" class="form-control" required>
                        <span class="error-message" id="priceError" style="color: red; display: none;">Please enter a valid price.</span>
                    </div>
                    <label >Category</label>
                    <select name="category_id" class="form-select">
                        <c:forEach items="${list}" var="category">
                            <option value="${category.category_id}"> ${category.category_name}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="modal-footer">
                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                    <input type="submit" class="btn btn-success" value="Add">
                </div>
            </form>
        </div>
    </div>
</div>



<script>
    document.addEventListener('DOMContentLoaded', function () {
        // Validate ID field
        const id = document.querySelector('input[name="id"]');
        id.addEventListener('input', function () {
            const idError = document.getElementById('idError');
            if (!id.value || id.value < 1) {
                idError.style.display = 'block';
            } else {
                idError.style.display = 'none';
            }
        });

        // Validate Name field
        const name = document.querySelector('input[name="name"]');
        const namePattern = /^[a-zA-Z0-9\s\u00C0-\u1EF9\u1F00-\u1FFF]+$/;; // Only allows alphanumeric characters and spaces
        name.addEventListener('input', function () {
            const nameError = document.getElementById('nameError');
            if (!name.value || name.value.length < 3) {
                nameError.textContent = 'Name must be at least 3 characters long.';
                nameError.style.display = 'block';
            } else if (!namePattern.test(name.value)) {
                nameError.textContent = 'Name cannot contain special characters.';
                nameError.style.display = 'block';
            } else {
                nameError.style.display = 'none'; // Hide error if valid
            }
        });

        // Validate Image field
        const image = document.querySelector('input[name="image"]');
        const imageUrlPattern = /^(https?:\/\/)?([a-z0-9-]+\.)+[a-z]{2,6}(\/[^\s]*)?$/i;
        image.addEventListener('input', function () {
            const imageError = document.getElementById('imageError');
            if (!image.value || !imageUrlPattern.test(image.value)) {
                imageError.style.display = 'block';
            } else {
                imageError.style.display = 'none'; // Hide error if valid
            }
        });

        // Validate Price field
        const price = document.querySelector('input[name="price"]');
        const pricePattern = /^\d+(\.\d{1,2})?$/;
        price.addEventListener('input', function () {
            const priceError = document.getElementById('priceError');
            if (!price.value || !pricePattern.test(price.value)) {
                priceError.style.display = 'block';
            } else {
                priceError.style.display = 'none'; // Hide error if valid
            }
        });

        // Validate form fields before submission
        document.getElementById('addProductForm').addEventListener('submit', function (event) {
            event.preventDefault(); // Prevent the form from submitting immediately

            let isValid = true;

            // Validate ID field
            if (!id.value || id.value < 1) {
                document.getElementById('idError').style.display = 'block';
                isValid = false;
            }

            // Validate Name field
            if (!name.value || name.value.length < 3) {
                document.getElementById('nameError').textContent = 'Name must be at least 3 characters long.';
                document.getElementById('nameError').style.display = 'block';
                isValid = false;
            } else if (!namePattern.test(name.value)) {
                document.getElementById('nameError').textContent = 'Name cannot contain special characters.';
                document.getElementById('nameError').style.display = 'block';
                isValid = false;
            }

            // Validate Image field
            if (!image.value || !imageUrlPattern.test(image.value)) {
                document.getElementById('imageError').style.display = 'block';
                isValid = false;
            }

            // Validate Price field
            if (!price.value || !pricePattern.test(price.value)) {
                document.getElementById('priceError').style.display = 'block';
                isValid = false;
            }

            if (isValid) {
                // Submit the form
                this.submit();
            }




        });
    });

</script>

</body>
