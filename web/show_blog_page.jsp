<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.tech.blog.entities.User" %>
<%@ page import="com.tech.blog.dao.PostDao" %>
<%@ page import="com.tech.blog.dao.UserDao" %>
<%@ page import="com.tech.blog.entities.Post" %>
<%@ page import="com.tech.blog.helper.ConnectionProvider" %>
<%@ page import="com.tech.blog.entities.Message" %>
<%@ page import="com.tech.blog.entities.Category" %>
<%--<%@ page errorPage="error_page.jsp" %>--%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.time.LocalDateTime" %>



<%
User user=(User)session.getAttribute("currentUser");
if(user==null){
    response.sendRedirect("login_page.jsp");
}
int postid=Integer.parseInt(request.getParameter("post_id"));
PostDao d = new PostDao(ConnectionProvider.getConnection());
Post p=d.getPostByPostId(postid);
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= p.getpTitle()%></title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <style>
            .post-content{

                font-size: 30px !important;
            }
        </style>
    </head>
    <body>

        <!--navbar-->

        <nav class="navbar navbar-expand-lg navbar-dark  bg-dark primary-background">
            <div class="container-fluid">
                <a class="navbar-brand" href="#"><span class="fa fa-asterisk"> </span> Techblog</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#"><span class="fa fa-home"> </span> Home</a>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link active dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <span class="fa fa-check-square-o"></span> Categories
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">Programming Language</a></li>
                                <li><a class="dropdown-item" href="#">Project Implementation</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="#">Data Structure</a></li>
                            </ul>
                        </li>


                        <li class="nav-item">
                            <a class="nav-link active" href="#"><span class="fa fa-user-circle-o"></span> Contact</a>
                        </li>
                        <li class="nav-item ">
                            <a  class="nav-link active" href="#"data-bs-toggle="modal" data-bs-target="#add-post-modal"><span class="fa fa-plus"></span> Do Post</a>
                        </li>

                    </ul>
                    <ul class="navbar-nav mr-right">
                        <li class="nav-item">
                            <a class="nav-link active" href="#" data-bs-toggle="modal" data-bs-target="#profile-modal"><span class="fa fa-user-circle"></span> <%= user.getName()%></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="LogoutServlet"><span class="fa fa-user-plus"></span> Logout</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>


        <!--navbar end-->


        <!--main body-->

        <div class="container">
            <div class="row my-4">
                <div class="col-md-6 offset-md-3 ">
                    <div class="card">
                        <div class="card-header bg-primary text-white">
                            <h4 class="post-title" ><%= p.getpTitle()%></h4>

                        </div>
                        <div class="card-body">
                            <img id="posts" src="blog_pics/<%= p.getpPic()%>"  class="card-img-top" alt="...">
                            <div class="row my-3">
                                <div class="col-md-8">
                                    <%
                                    UserDao u=new UserDao(ConnectionProvider.getConnection());
                                    User user1=u.getUserbyUserId(p.getUserId());
                                    %>

                                    <p><%=user1.getName() %> posted:</p>
                                </div>
                                <div class="col-md-4">
                                    <p><%= p.getpDate().toLocalDateTime() %></p>

                                </div>
                            </div>

                            <p class="post-content" ><%= p.getpContent()%></p>
                            <br>
                            <div class="post-code">
                                <pre><%= p.getpCode()%></pre>
                            </div>
                        </div>
                        <div class="class-footer bg-primary p-2">
                            <a href="#" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"><span>10</span></i></a>
                            <a href="#" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"><span>20</span></i></a>
                        </div>
                    </div>


                </div>
            </div>
        </div>



        <!--end of main body-->



        <!--profile modal-->


        <!-- Modal -->
        <div class="modal fade" id="profile-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header primary-background text-white">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Techblog</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">

                            <img style="height:8rem;border-radius:50%;" src="pics/<%= user.getProfile()%>">

                            <h1 class="modal-title fs-5" id="exampleModalLabel"><%= user.getName()%></h1>
                            <!--details-->

                            <div id="profile-details">
                                <table class="table">

                                    <tbody>
                                        <tr>
                                            <th scope="row">ID:</th>
                                            <td><%= user.getId()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Email: </th>
                                            <td><%= user.getEmail()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Gender: </th>
                                            <td ><%= user.getGender()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Registered on: </th>
                                            <td ><%= user.getDateTime().toString()%></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!--profile edit-->
                            <div id="profile-edit" style="display:none;">
                                <h4>Please edit carefully...</h4>
                                <form action="EditServlet" method="post" enctype="multipart/form-data">
                                    <table class="table">
                                        <tr>
                                            <td>ID :</td>
                                            <td><%= user.getId()%></td>
                                        </tr>
                                        <tr>
                                            <td>Name :</td>
                                            <td> <input type="text"  class="form-control" name="user_name" value="<%=user.getName()%>"</td>
                                        </tr>
                                        <tr>
                                            <td>Email :</td>
                                            <td> <input type="email" class="form-control" name="user_email" value="<%=user.getEmail()%>"</td>
                                        </tr>
                                        <tr>
                                            <td>Password :</td>
                                            <td> <input type="password" class="form-control" name="user_password" value="<%=user.getPassword()%>"</td>
                                        </tr>
                                        <tr>
                                            <td>Gender :</td>
                                            <td><%= user.getGender().toUpperCase()%></td>
                                        </tr>
                                        <tr>
                                            <td> New Profile :</td>
                                            <td><input type="file"  value="default.png" name="image" class="form-control"></td>
                                        </tr>
                                    </table>
                                    <div class="container">
                                        <button type="submit" class="btn btn-outline-primary">Save</button>

                                    </div>

                                </form>
                            </div>

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" id="edit-profile-button" class="btn btn-primary">Edit</button>
                    </div>
                </div>
            </div>
        </div>


        <!--end of profile modal-->


        <!--add post modal-->




        <!-- Modal -->
        <div class="modal fade" id="add-post-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Provide the post details...</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="add-post-form" action="AddPostServlet" enctype="multipart/form-data" method="post">

                            <div class="form-group pb-2">
                                <select class="form-control" name="cid">
                                    <option selected disabled>---Select Category--- </option>

                                    <%
                                    PostDao postd=new PostDao(ConnectionProvider.getConnection());
                                    ArrayList<Category>list=postd.getAllCategories();
                                    for(Category c:list){
                                    %>

                                    <option value="<%= c.getCid() %>"><%= c.getName()%> </option>

                                    <%
                                        }
                                    %>
                                </select>
                            </div>

                            <div class="form-group pb-2">
                                <input type="text" name="pTitle" placeholder="Enter Post Title" class="form-control">
                            </div>

                            <div class="form-group pb-2">
                                <textarea class="form-control" name="pContent" style="height:150px" placeholder="Enter Your Content"></textarea>
                            </div>


                            <div class="form-group">
                                <textarea class="form-control" name="pCode" style="height:100px" placeholder="Enter Your Program(if any)"></textarea>
                            </div>

                            <div class="form-group">
                                <lable>Select your pic</lable><br>
                                <input name="pPic" type="file" >
                            </div>

                            <div class="container text-center pt-2">
                                <button type="submit" class="btn btn-outline-primary">Post</button>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
        <!--end of add post modal-->


        <!--script-->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

        <script>
            $(document).ready(function () {
                let editStatus = false

                $("#edit-profile-button").click(function () {
                    if (editStatus == false) {
                        $("#profile-details").hide();
                        $("#profile-edit").show();
                        editStatus = true;
                        $(this).text("Back");
                    } else {
                        $("#profile-details").show();
                        $("#profile-edit").hide();
                        editStatus = false;
                    }
                })

            })

        </script>
        <!--add post js-->
        <script>
            $(document).ready(function (e) {
                $("#add-post-form").on("submit", function (event) {
//                    this code run when form submitted
                    event.preventDefault();
                    console.log("form submitted");
                    let form = new FormData(this);
//                    now requesting to server
                    $.ajax({
                        url: "AddPostServlet",
                        type: "POST",
                        data: form,
                        processData: false,
                        contentType: false,
                        success: function (data, textStatus, jqXHR) {
//                            console.log(data);
                            if (data.trim() == 'done') {
                                swal("Good job!", "Saved successfully ", "success");
                            } else {
                                swal("Error!", "Something went wrong try again...", "error");
                            }

                        },
                        error: function (jqXHR, textStatus, errorThrown) {
//                            console.log(errorThrown);
                            swal("Error!", "Something went wrong try again later", "error");


                        }
                    })
                })

            })


        </script>



    </body>
</html>
