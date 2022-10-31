<%@ page import="java.sql.Connection" %>
<%@ page import="com.blog.helpers.ConnectionProvider" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Home Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/myStyle.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        .banner-background {
            clip-path: polygon(0 0, 100% 0, 100% 100%, 86% 95%, 71% 100%, 57% 96%, 43% 100%, 29% 96%, 15% 100%, 0 96%);
        }
    </style>
</head>
<body>
<%@include file="normal_navbar.jsp" %>
<div class="container-fluid p-0 m-0">
    <div class="jumbotron pb-5 p-4 primary-background text-white banner-background">
        <div class="container">
            <h3 class="display-3">Welcome to GeeksBlog</h3>
            <p>Looking for tech blogs to keep up with the latest technology trends? No worries! Your search ends here!
                Read on…
            </p>
            <p>
                People from different walks of life are intrigued by the way technology is progressing at a profuse
                rate,
                shaping our lives into the digital world!
                With new tech trends being introduced every quarter and information becoming obsolete as technology
                evolves,
                it’s now an obligation to stay relevant and learn about the newest technologies, digital industry,
                social
                media, and the web in general!
            </p>
            <a href="register_page.jsp" class="btn btn-outline-light"><span class="fa fa-user-plus"></span> Start! It's free</a>
            <a href="login_page.jsp" class="btn btn-outline-light"><span class="fa fa-sign-in "></span> Login</a>
        </div>
    </div>
</div>
<br>
<div class="container">
    <div class="row mb-2">
        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Java programming</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the
                        card's content.</p>
                    <a href="#" class="btn primary-background text-white">Read more..</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Python programming</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the
                        card's content.</p>
                    <a href="#" class="btn primary-background text-white">Read more..</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">C programming</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the
                        card's content.</p>
                    <a href="#" class="btn primary-background text-white">Read more..</a>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">C++ programming</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the
                        card's content.</p>
                    <a href="#" class="btn primary-background text-white">Read more..</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Dart programming</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the
                        card's content.</p>
                    <a href="#" class="btn primary-background text-white">Read more..</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Javascript programming</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the
                        card's content.</p>
                    <a href="#" class="btn primary-background text-white">Read more..</a>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/myJs.js" type="text/javascript"></script>
</body>
</html>