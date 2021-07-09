<%-- 
    Document   : errorPage
    Created on : 1 May, 2021, 3:39:12 PM
    Author     : Adminpc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Soory! Something went wrong</title>
    </head>
    <body>
        <div class="container text-center" >
            <img src="images/error.png" class="display-3 img-fluid mt-3" >
            <h3 class="display-3">Soory! Something went wrong........</h2>
            <%=exception%>   
            <a href="index.html" class= "btn btn-primary btn-lg mt-3"> Home </a>
            
        </div>
    </body>
</html>
