<%@ page import="com.blog.entities.User" %>
<%@ page import="com.blog.dao.PostDao" %>
<%@ page import="com.blog.helpers.ConnectionProvider" %>
<%@ page import="com.blog.entities.Post" %>
<%@ page import="com.blog.entities.Message" %>
<%@ page import="com.blog.entities.Category" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.blog.dao.UserDao" %>
<%@ page import="java.text.DateFormat" %>
<%@page errorPage="error_page.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null)
        response.sendRedirect("login_page.jsp");
%>
<% int pid = Integer.parseInt(request.getParameter("postId"));
    PostDao d = new PostDao(ConnectionProvider.getConnection());
    Post p = d.getPostsById(pid);
%>
<html>
<head>
    <title><%=p.getPtitle()%>
    </title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/myStyle.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        .banner-background {
            clip-path: polygon(0 0, 100% 0, 100% 100%, 86% 95%, 71% 100%, 57% 96%, 43% 100%, 29% 96%, 15% 100%, 0 96%);
        }

        .post-title {
            font-weight: 100;
            font-size: 40px;
        }

        .post-content {
            font-weight: 100;
            font-size: 25px;
        }

        .post-userInfo {
            font-size: 20px;
        }

        .post-date {
            font-style: italic;
            font-weight: bold;
        }

        .row-user {
            border: 1px solid #e2e2e2;
            padding-top: 15px;
        }

        body {
            background-size: cover;
            background: url(images/bg.jpg) fixed;
        }
    </style>
</head>
<body>
<%--navbar--%>
<nav class="navbar navbar-expand-lg navbar-dark primary-background">
    <div class="container-fluid">
        <a class="navbar-brand" href="#"><span class="fa fa-pencil"></span> TechBlog</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="profile.jsp">Learning Wisely</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                       aria-expanded="false">
                        Categories
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Action</a></li>
                        <li><a class="dropdown-item" href="#">Another action</a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Contact</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#postmodal"> <span
                            class="fa fa-plus-circle"></span> New post</a>
                </li>

            </ul>
            <ul class="navbar-nav mr-right ">
                <li class="nav-item">
                    <a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#Profile-Modal"><span
                            class="fa fa-user-circle"></span> <%=user.getName()%>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="LogoutServlet"><span class="fa fa-sign-out"></span> Logout</a>
                </li>
            </ul>


        </div>
    </div>
</nav>
<%--navbar ends--%>

<%--main content--%>
<div class="container">
    <div class="row my-4">
        <div class="col-md-8  offset-md-2">
            <div class="card">
                <div class="card-header">
                    <h3 class="post-title"><%=p.getPtitle()%>
                    </h3>
                </div>
                <div class="card-body ">
                    <img class="card-img-top my-3" src="blog_images/<%=p.getPpic()%>" alt="Card image cap">
                    <div class="row my-2 row-user">
                        <div class="col-md-8">
                            <% UserDao dao = new UserDao(ConnectionProvider.getConnection());
                                User u = dao.getUserById(p.getUserId());%>
                            <p class="post-userInfo">Posted by: <a href="#!" style="text-decoration: none;"><%=u.getName()%></a></p>
                        </div>
                        <div class="col-md-4">
                            <p class="post-date"><%=DateFormat.getDateTimeInstance().format(p.getPdate())%>
                            </p>
                        </div>
                    </div>
                    <p class="post-content"><%=p.getPcontent()%>
                    </p>
                    <br>
                    <br>
                </div>
                <div class="card-footer">
                    <a href="#" class="btn btn-outline-dark btn-sm"><i class="fa fa-thumbs-o-up"></i><span> 10</span>
                    </a>
                    <a href="#" class="btn btn-outline-dark btn-sm"><i class="fa fa-commenting-o"></i><span> 5</span>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<%--main content ends--%>


<%--add post modal--%>
<div class="modal fade" id="postmodal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">New post</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="add-post-form" action="AddPostServlet" method="post">
                    <div class="form-group">
                        <select class="form-control" name="cid">
                            <option selected disabled>---Select category---</option>
                            <% PostDao postDao = new PostDao(ConnectionProvider.getConnection()); %>
                            <% ArrayList<Category> list = postDao.getAllCategories();
                                for (Category c : list) {
                            %>
                            <option value="<%=c.getCid()%>"><%= c.getName() %>
                            </option>
                            <%
                                }
                            %>
                        </select>
                    </div>
                    <div class="form-group mt-2">
                        <input name="pTitle" type="text" placeholder="Enter post title" class="form-control">
                    </div>
                    <div class="form-group mt-2">
                        <textarea name="pContent" style="height: 180px" placeholder="Enter post content"
                                  class="form-control"></textarea>
                    </div>
                    <div class="form-group mt-2">
                        <label>Select file (optional)</label>
                        <br>
                        <input type="file" name="pFile">
                    </div>
                    <div class="container text-center mt-3">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-outline-dark primary-background text-white">Post
                        </button>
                    </div>

                </form>
            </div>

        </div>
    </div>
</div>
<%--add post modal ends--%>


<%
    Message msg = (Message) session.getAttribute("msg");
    if (msg != null) {
%>
<div class="alert <%=msg.getCssClass()%>" role="alert">
    <%= msg.getContent()%>
</div>
<%
        session.removeAttribute("msg");
    }
%>

<%--profile modal --%>
<div class="modal fade" id="Profile-Modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header primary-background text-white ">
                <h5 class="modal-title" id="exampleModalLabel">Techblog</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="container text-center">
                    <img src="profile_pics/<%=user.getProfile()%>" class="img-fluid"
                         style="border-radius: 50%; max-width: 120px">
                    <br>
                    <h5 class="modal-title mt-3"><%=user.getName()%>
                    </h5>
                    <%--detail table--%>
                    <div id="profile_details">
                        <table class="table">
                            <tbody>
                            <tr>
                                <td>Id :</td>
                                <td><%=user.getId()%>
                                </td>
                            </tr>
                            <tr>
                                <td>Email :</td>
                                <td><%=user.getEmail()%>
                                </td>
                            </tr>
                            <tr>
                                <td>Gender :</td>
                                <td><%=user.getGender()%>
                                </td>
                            </tr>
                            <tr>
                                <td>About :</td>
                                <td><%=user.getAbout()%>
                                </td>
                            </tr>
                            <tr>
                                <td>Registered on :</td>
                                <td><%=user.getDateTime().toString()%>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <%--detail table ends--%>

                    <%--edit details--%>
                    <div id="profile_edit" style="display: none;">
                        <h2 class="mt-2">Edit details</h2>
                        <form action="EditServlet" method="post" enctype="multipart/form-data">
                            <table class="table">
                                <tr>
                                    <td>Id :</td>
                                    <td><%=user.getId()%>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Email :</td>
                                    <td><input name="user_email" type="email" class="form-control"
                                               value="<%= user.getEmail() %>">
                                    </td>
                                </tr>
                                <tr>
                                    <td>Name :</td>
                                    <td><input name="user_name" type="text" class="form-control"
                                               value="<%= user.getName() %>">
                                    </td>
                                </tr>
                                <tr>
                                    <td>Password :</td>
                                    <td><input name="user_password" type="password" class="form-control"
                                               value="<%= user.getPassword() %>">
                                    </td>
                                </tr>
                                <tr>
                                    <td>Gender :</td>
                                    <td><%= user.getGender().toUpperCase() %>
                                    </td>
                                </tr>
                                <tr>
                                    <td>About :</td>
                                    <td><textarea name="user_about" class="form-control"
                                                  rows="3"><%=user.getAbout()%></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Edit Profile :</td>
                                    <td><input name="user_profile" type="file" class="form-control">
                                    </td>
                                </tr>
                            </table>
                            <div class="container">
                                <button type="submit" class="btn btn-outline-dark ">Save</button>
                            </div>
                        </form>
                    </div>

                    <%-- edit details ends--%>

                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" id="edit_details_button"
                        class="btn btn-outline-dark primary-background text-white">Edit
                </button>
            </div>
        </div>
    </div>
</div>
<%--profile modal ends--%>


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/myJs.js" type="text/javascript"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<%-- edit detail js--%>
<script>
    $(document).ready(function () {
        let editStatus = false
        $("#edit_details_button").click(function () {
            if (!editStatus) {
                $("#profile_details").hide()
                $("#profile_edit").show()
                $(this).text("Back")
                editStatus = true
            } else {
                $("#profile_details").show()
                $("#profile_edit").hide()
                $(this).text("Edit")
                editStatus = false
            }
        })
    })
</script>
<%-- edit detail js ends--%>

<%--add post js--%>
<script>
    $(document).ready(function () {
        $("#add-post-form").on("submit", function (event) {
            //called when form is submitted
            event.preventDefault();
            let form = new FormData(this);

            //now requesting to server
            $.ajax({
                url: "AddPostServlet",
                type: "POST",
                data: form,
                success: function (data, textStatus, jqXHR) {
                    if (data.trim() == 'done') {
                        swal("Success", "Post saved successfully!", "success");
                    } else
                        swal("Error", "Something went wrong!", "error");
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    swal("Error", "Something went wrong!", "error");
                },
                processData: false,
                contentType: false
            })

        })
    })
</script>
<%-- add post js ends--%>

</body>
</html>
