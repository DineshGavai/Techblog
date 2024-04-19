<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(50% 0%, 100% 0, 100% 100%, 66% 93%, 30% 100%, 0 94%, 0 0);
            }
        </style> 
    </head>
    <body>
        <%@include file="normal_navbar.jsp"%>

        <main class="primary-background pb-5 banner-background">
            <div class="container">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-header primary-background text-white text-center">
                            <span class="fa fa-3x fa-user-circle "></span>
                            <br>
                            Register here
                        </div>
                        <div class="card-body">
                            <form id="reg-form" action="RegisterServlet" method="post">

                                <div class="form-group">
                                    <label for="user_name">User Name</label>
                                    <input type="text"  name="user_name" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter Name">
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email"  name="user_email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input type="password"  name="user_password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>

                                <div class="form-group">
                                    <label for="gender">Select Gender</label>
                                    <br>
                                    <input type="radio"   name="gender" value="Male" >Male  
                                    <input type="radio"  name="gender" value="Female">Female
                                </div>

                                <div class="form-check">
                                    <input type="checkbox"  name="check" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">agree terms and conditions</label>
                                </div>
                                <div id="loader" class="container text-center" style="display:none;">
                                    <span class="fa fa-refresh fa-spin" ></span>
                                    <h5>Please wait...</h5>
                                </div>
                                <button type="submit" id="submit-btn" class="btn btn-primary btn-sm mt-2">Submit</button>
                            </form>
                        </div>

                    </div>
                </div>
            </div>

        </main>


        <!--script-->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script>
            $(document).ready(function () {
                console.log("loaded...");

                $('#reg-form').on('submit', function (event) {
                    event.preventDefault();

                    let form = new FormData(this);

                    $('#submit-btn').hide();
                    $('#loader').show();
                    // send to register servlet
                    $.ajax({
                        url: "RegisterServlet",
                        type: 'POST',
                        data: form, // pass FormData object directly
                        processData: false, // set processData to false
                        contentType: false, // set contentType to false
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            $('#submit-btn').show();
                            $('#loader').hide();
                            
                            if(data.trim()==='Data inserted')
                            {                            
                            swal("Registered successfully.Redirecting to the login page..")
                                    .then((value) => {
                                        window.location = "login_page.jsp"
                                    });
                                }else{
                                    swal(data);
                                }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            $('#submit-btn').show();
                            $('#loader').hide();
                            swal("Something went wrong . Try again");

                        }
                    });
                });
            });

        </script>

    </body>
</html>
