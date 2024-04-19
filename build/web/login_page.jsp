<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.tech.blog.entities.Message" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
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
        <!--navbar-->
        <%@include file="normal_navbar.jsp"%>

        <main class="d-flex align-items-center primary-background banner-background " style="height:80vh">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 offset-md-4">
                        <div class="card">
                            <div class="card-header primary-background text-white text-center">  
                                <span class="fa fa-user-plus fa-2x"></span>
                                <p>login here</p> 
                            </div>
                            <%
                                Message m=(Message)session.getAttribute("msg");
                                if(m!=null){
                            %>
                            <div class="alert <%= m.getCssClass()%> " role="alert" >
                                <%= m.getContent() %>
                            </div>

                            <%
                                session.removeAttribute("msg");
                                }
                            %>
                            <div class="card-body">
                                <form id="login-form" action="LoginServlet" method="post">

                                    <div class="form-group">
                                        <label for="exampleInputEmail1" >Email address</label>
                                        <input type="email" name="email" required class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    </div>


                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input type="password" name="password" required class="form-control" id="exampleInputPassword1" placeholder="Password">
                                    </div>                                  
                                    <div class="container text-center">
                                        <button type="submit" name="submit-btn" class="btn btn-primary btn-sm mt-2">Submit</button>
                                    </div>
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

        

    </body>
</html>
