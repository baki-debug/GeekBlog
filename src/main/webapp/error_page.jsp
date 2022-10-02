<%@page isErrorPage="true" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sorry! something went wrong </title>
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
<div class="container text-center">
    <img src="images/error.png" class="img-fluid">
    <h3 class="display-3">Sorry! Something went wrong..</h3>
    <%= exception %>
    <br>
    <a href="index.jsp" class="btn btn-lg primary-background text-white mt-3">Home</a>
</div>
</body>
</html>
