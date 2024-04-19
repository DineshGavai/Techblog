<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>     
        <style>
            img{
                height:20rem;
                padding-top: 4rem;
            }
        </style>
    </head>
    <body>
        <div class="container text-center ">
            <img src="img/browser.png" >
            <h3 class="display-3">Sorry ! Something went wrong...</h3>
            <a href="index.jsp" class="btn primary-background btn-lg text-white  mt-3">Home</a>
        </div>
    </body>
</html>
