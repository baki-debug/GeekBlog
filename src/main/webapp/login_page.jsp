<%@ page import="com.blog.entities.Message" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login Page</title>
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
<main class="d-flex align-items-center primary-background banner-background" style="height: 70vh">
    <div class="container">
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <div class="card">
                    <div class="card-header primary-background text-white text-center"><span
                            class="fa fa-2x fa-sign-in"></span>
                        <p>Login Here</p></div>
                    <%
                        Message msg= (Message) session.getAttribute("msg");
                        if(msg!=null){
                    %>
                    <div class="alert <%=msg.getCssClass()%>" role="alert">
                        <%= msg.getContent()%>
                    </div>
                    <%
                            session.removeAttribute("msg");
                        }
                    %>
                    <div class="card-body">
                        <form action="LoginServlet" method="post">
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">Email address</label>
                                <input name="email" type="email" required class="form-control" id="exampleInputEmail1"
                                       aria-describedby="emailHelp">
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputPassword1" class="form-label">Password</label>
                                <input name="password" type="password" required class="form-control" id="exampleInputPassword1">
                            </div>
                            <center>
                                <button type="submit" class="btn btn-outline-dark text-white primary-background ">Submit</button>
                            </center>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/myJs.js" type="text/javascript"></script>
</body>
</html>
