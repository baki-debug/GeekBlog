<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/myStyle.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        body {
            background-color: #27282C;
        }

        .banner-background {
            clip-path: polygon(0 0, 100% 0, 100% 100%, 86% 95%, 71% 100%, 57% 96%, 43% 100%, 29% 96%, 15% 100%, 0 96%);
        }
    </style>

</head>
<body>
<%@include file="normal_navbar.jsp" %>

<main class="primary-background pb-4">
    <div class="container">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <div class="card">
                    <div class="card-header primary-background text-white text-center"><span
                            class="fa fa-2x fa-user-plus"></span>
                        <p>Register Here</p></div>
                    <div class="card-body">
                        <form id="reg-form" action="RegisterServlet">
                            <div class="mb-3">
                                <label for="user_name" class="form-label">Username</label>
                                <input type="text" name="name" class="form-control" id="user_name"
                                       aria-describedby="emailHelp">
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label">Email address</label>
                                <input type="email" name="email" class="form-control" id="email">
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Gender</label> <br>
                                <input type="radio" name="gender" value="male"> Male
                                <input type="radio" name="gender" value="female"> Female
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">Password</label>
                                <input type="password" name="password" class="form-control" id="password">
                            </div>
                            <div class="form-group">
                                <textarea name="about" class="form-control" id="" rows="4"
                                          placeholder="Enter something about yourself"></textarea>
                            </div>
                            <div class="mb-3 form-check">
                                <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                <label class="form-check-label" for="exampleCheck1">Agree terms and conditions</label>
                            </div>
                            <div class="container text-center" id="loader" style="display: none">
                                <span class="fa fa-refresh fa-spin fa-3x"></span>
                                <h4>Please wait..</h4>
                            </div>
                            <br>
                            <button id="submit_btn" type="submit" class="btn btn-outline-dark primary-background text-white">Submit
                            </button>
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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
    $(document).ready(function () {
        console.log("loaded")
        $('#reg-form').on('submit', function (event) {
            event.preventDefault();
            let form = new FormData(this);
            $("#loader").show()
            $("#submit_btn").hide()
            $.ajax({
                url: "RegisterServlet",
                type: "POST",
                data: form,
                success: function (data, textStatus, jqXHR) {
                    console.log(data)
                    $("#loader").hide()
                    $("#submit_btn").show()
                    if(data.trim()==='DONE') {
                        swal("Registered Successfully.")
                            .then((value) => {
                                window.location = "login_page.jsp"
                            });
                    }
                    else{
                        swal(data)
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    $("#loader").hide()
                    $("#submit_btn").show()
                    swal("Something went wrong. Try again")
                    console.log(errorThrown)
                },
                processData: false,
                contentType: false
            })
        })
    })
</script>
</body>
</html>
