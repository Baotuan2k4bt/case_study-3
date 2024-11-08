<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Minics</title>
  <!-- Bootstrap and Custom CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="css/product.css">
  <link href="https://cdn.jsdelivr.net/npm/remixicon@4.3.0/fonts/remixicon.css" rel="stylesheet"/>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Roboto|Poppins:400,700&display=swap" rel="stylesheet">
  <style>
    /* General Styles */
    body {
      font-family: 'Poppins', sans-serif;
    }
    /* Header Styles */
    .header_top {
      background-color: #007bff; /* Primary color */
      color: white; /* Text color */
    }

    .header_bottom {
      background-color: #eaeef3; /* Dark background for navigation */
      color: white; /* Text color */
    }

    /* Footer Styles */
    .footer_section {
      background-color: #343a40; /* Same as header bottom */
      padding: 30px 0;
      color: #edc574; /* Text color */
      text-align: center; /* Center align footer text */
    }

    /* Button Customization */
    .btn-light {
      background-color: #fff; /* Light background for search button */
      color: #007bff; /* Primary color for text */
    }

    .btn-light:hover {
      background-color: #e2e6ea; /* Slightly darker on hover */
    }

    /* Card Styles */
    .card {

      overflow: hidden; /* Prevent image overflow */
      transition: transform 0.2s; /* Scale effect on hover */
    }

    .card:hover {
      transform: scale(1.05); /* Scale effect */
    }
    /* Adjustments for Product Cards */
    .card {

      transition: transform 0.2s; /* Animation on hover */
    }

    .card-img-top {
      height: 200px; /* Set a fixed height for product images */

    }

    .row {
      margin: 0; /* Reset margin for rows */
    }

    .mb-4 {
      margin-bottom: 1.5rem; /* Space between cards */
    }
    .navbar-toggler {
      display: inline-flex; /* Đảm bảo nút có thể hiển thị */
      align-items: center; /* Căn giữa nội dung bên trong nút */
      background-color: #007bff; /* Màu nền */
      color: white; /* Màu chữ */
      border: none; /* Không viền */
      padding: 10px 15px; /* Khoảng cách cho nút */
      border-radius: 5px; /* Bo góc */
      transition: background-color 0.3s; /* Hiệu ứng chuyển đổi khi hover */
    }
    .rating {
      color: gold; /* Màu vàng cho ngôi sao */
      margin-top: 5px; /* Khoảng cách giữa giá và ngôi sao */
    }

    .rating i {
      margin-right: 3px; /* Khoảng cách giữa các ngôi sao */
    }

  </style>
</head>

<body class="sub_page" >
<!-- Header Section -->
<div class="hero_area">
  <!-- header section strats -->
  <div class="container-fluid bg-light py-2 header_top">
    <div class="container d-flex justify-content-between align-items-center">
      <div class="contact_nav d-flex">
        <a href="">
          <i class="fa fa-phone" aria-hidden="true"></i>
          <span>
                  Call : +01 123455678990
                </span>
        </a>
        <a href="">
          <i class="fa fa-envelope" aria-hidden="true"></i>
          <span>
                  Email : demo@gmail.com
                </span>
        </a>
      </div>
      <form class="search_form form-inline" action="/product/find">
        <label class="mr-2">
          <input type="text" name="keyword" placeholder="Nhập từ khóa tìm kiếm..." class="form-control">
        </label>
        <button class="" type="submit">
          <i class="ri-search-line"></i>
        </button>
      </form>
      <div class="user_option_box d-flex">
        <a href="#" class="account-link"><i class="fa fa-user"></i> My Account</a>
        <a href="#" class="cart-link ml-3"><i class="fa fa-shopping-cart"></i> Cart</a>
      </div>
    </div>
  </div>
</div>
    </div>
    <div class="header_bottom">
      <div class="container-fluid">
        <nav class="navbar navbar-expand-lg custom_nav-container ">
          <a class="navbar-brand" href="index.html">
              <span>
                wellcome to Bảo Tuấn !!
              </span>
          </a>
          <button class="navbar-toggler" type="button" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <i class="ri-search-line"></i> Tìm kiếm
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto">
              <li class="nav-item">
                <a class="nav-link" href="index.html">Home <span class="sr-only">(current)</span></a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="about.html">About</a>
              </li>
              <li class="nav-item active">
                <a class="nav-link" href="/Admin">Products</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="why.html">Why Us</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="testimonial.html">Testimonial</a>
              </li>
            </ul>
          </div>
        </nav>
      </div>
    </div>
</section>
</header>
</div>
<!-- Product Section -->
<section class="product_section layout_padding">
  <div class="container">
    <div class="heading_container heading_center">
      <h2>Our Products</h2>
    </div>
    <div class="col-sm-13">
      <div class="row">
        <c:forEach items="${data}" var="product">
          <div class="col-12 col-md-6 col-lg-4 d-flex align-items-stretch mb-4">
            <div class="card w-100">
              <img src="<c:out value='${product.image}'/>" alt="Product Image" class="card-img-top">
              <div class="card-body d-flex flex-column">
                <h4 class="card-title show_txt"><a href="#" title="View Product">${product.name}</a></h4>
                <div class="mt-auto row">
                  <div class="col">
                    <p class="btn btn-danger btn-block">${product.price}</p>
                  </div>
                  <div class="col">
                    <a href="#" class="btn btn-success btn-block">Add to cart</a>
                  </div>
                  <div class="rating">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </c:forEach>
      </div>
    </div>
    </div>

  </div>
    <div class="btn_box text-center">
      <a href="#" class="view_more-link btn btn-secondary">View More</a>
    </div>
</section>

<!-- About Section -->
<section class="about_section">
  <div class="container">
    <div class="row">
      <div class="col-md-6">

      </div>
    </div>
  </div>
  <section class="info_section ">
    <div class="container">
      <div class="row">
        <div class="col-md-3">
          <div class="info_contact">
            <h5>
              <a href="" class="navbar-brand">
                <span>
                  Minics
                </span>
              </a>
            </h5>
            <p>
              <i class="fa fa-map-marker" aria-hidden="true"></i>
              Address
            </p>
            <p>
              <i class="fa fa-phone" aria-hidden="true"></i>
              +01 1234567890
            </p>
            <p>
              <i class="fa fa-envelope" aria-hidden="true"></i>
              demo@gmail.com
            </p>
          </div>
        </div>
        <div class="col-md-3">
          <div class="info_info">
            <h5>
              Information
            </h5>
            <p>
              Eligendi sunt, provident, debitis nemo, facilis cupiditate velit libero dolorum aperiam enim nulla iste maxime corrupti ad illo libero minus.
            </p>
          </div>
        </div>
        <div class="col-md-3">
          <div class="info_links">
            <h5>
              Useful Link
            </h5>
            <ul>
              <li>
                <a href="index.html">
                  Home
                </a>
              </li>
              <li>
                <a href="about.html">
                  About
                </a>
              </li>
              <li>
                <a href="../product.html">
                  Products
                </a>
              </li>
              <li>
                <a href="why.html">
                  Why Us
                </a>
              </li>
              <li>
                <a href="testimonial.html">
                  Testimonial
                </a>
              </li>
            </ul>
          </div>
        </div>
        <div class="col-md-3">
          <div class="info_form ">
            <h5>
              Newsletter
            </h5>
            <form action="">
              <input type="email" placeholder="Enter your email">
              <button>
                Subscribe
              </button>
            </form>
            <div class="social_box">
              <a href="">
                <i class="fa fa-facebook" aria-hidden="true"></i>
              </a>
              <a href="">
                <i class="fa fa-twitter" aria-hidden="true"></i>
              </a>
              <a href="">
                <i class="fa fa-instagram" aria-hidden="true"></i>
              </a>
              <a href="">
                <i class="fa fa-youtube" aria-hidden="true"></i>
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

</section>
<footer class="footer_section">
  <div class="container">
    <p>&copy; <span id="displayYear"></span> All Rights Reserved By Minics</p>
  </div>
</footer>
<!-- Scripts -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="../js/bootstrap.js"></script>
<!-- custom js -->
<script src="../js/custom.js"></script>


</body>
</html>
