<%-- 
    Document   : indexHome
    Created on : 1 May, 2021, 6:34:29 PM
    Author     : AdminpcAdmin admin = new Admin();
--%>
<%@page import="Package.entites.acc_details"%>
<%@page import="java.sql.Statement"%>

<%@page import="Package.helper.ConnectionProvider"%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">

  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.2/css/bootstrap.min.css'>
  <!-- Font Awesome CSS -->
  <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.3.1/css/all.css'>
<style> 
 html{
    font-family: -apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,"Noto Sans",sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol","Noto Color Emoji";
  }
*{
  margin:0px;
  padding: 0px;
  box-sizing: border-box;
} 
body{
background: white;
}

.banner-background{
clip-path: polygon(0 0, 71% 0, 100% 0, 95% 76%, 89% 91%, 69% 95%, 0 98%);


}
.topnav {
  overflow: hidden;
  padding: 18px 5px 10px 10px;
  background: white;
  

}
.topnav .icon {
  display: none;
}
 .topnav a{
  float: right;
  color: white;
  text-align: center;
  padding: 5px 15px;
  font-size: 15px;
  border-radius: 10px;
  margin-left: 15px;
  margin-top: 3px;
  align-items: center;
  background: linear-gradient(70deg, #7D7DF1 3%, #C4357C 60%);
  text-decoration:none;
   font-weight: bolder;

}
.topnav a:hover {
  color: white;
  background: linear-gradient(70deg, #823DC6 3%, #7C0707 60%);
}
 .logo
  {
    margin-left:1px;
  }
.tables {
    margin-top: -50px;
    box-shadow: 2px 2px 12px rgba(0,0,0,0.2),-1px -1px 8px rgba(0,0,0,0.2);
    background: white;
    align-content: center;
    width: 1200px;

    
}
tr{
    transition: all .2s ease-in;
    cursor: pointer;
    text-align:center;
}
th,td{
    text-align:center;
    padding: 12px;
    width:220px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}
thead{
    background: #20476b;
    color: #fff;
}
.pimage{
        margin-left: 125px;
    }
tr:hover{
    background-color: #f5f5f5;
    transform: scale(1.02);
    box-shadow: 2px 2px 12px rgba(0,0,0,0.2),-1px -1px 8px rgba(0,0,0,0.2);
}
.start{
  color: white;
  text-align: center;
  padding: 5px 20px;
  font-size: 20px;
  border-radius: 25px;
  align-items: center;
  text-decoration:none;
  border:none;
  background:#20476b;

}
.start:hover{
  text-decoration:none;
   border:none;
   color: black;
   background: #20476b;
   
}
.but{
    background:#20476b;
  width:100px;
  font-size:15px;
  color:white;
  border-radius:10px;
  height: 30px;
  text-align:center;
  text-decoration:none;
  display: inline-block;
  margin: 1px; /* space between buttons */
  }
  .but:hover{
  background:  #20419b;
  color:white;
}
</style>

</head>
<body>
 <div class="topnav" id="myTopnav">
    <img class="logo" src="images/logo_size(2).jpg"> 
  </div>
    <div class="container-fluid p-0 m-0">
        <div class="jumbotron " style="  background-color: #fff;">

          <div class="container">
            <div class="para "> 
                <table class="tables">
                <thead>
                    <tr> 
                        <th>ACCOUNT NO</th>
                        <th>NAME</th>
                                         
                        <th>ACTION</th>
                    </tr> 
                </thead>
                <tbody>
            <%
            acc_details acc = null;
            
            try {
            
            String query = "select * from accountdetails ";
            
            PreparedStatement ps= (ConnectionProvider.getConnection()).prepareStatement(query);
            
            ResultSet rs = ps.executeQuery();
            acc = new acc_details();
            
            while(rs.next())
            {   %>
                
                <tr>
                   <td>
                    <% int ids = rs.getInt("accountno"); 
                            acc.setAccountno(ids) ;
                    %> 
                        <%= acc.getAccountno()%>
                </td>
                <td>
                    <% String name = rs.getString("name"); 
                            acc.setName(name) ;
                    %> 
                        <%= acc.getName()%>
                </td>
                
                    
                    <td>
                        <a class="but" href='modalView.jsp?d=<%= acc.getName()%>'>View</a>
                  `     <a class="but" href='Transaction.jsp?d=<%= acc.getName()%>'>Transaction</a> 
                    </td>
                </tr>
            <%     
            }

        }
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        }
        %>
        </tbody>
       </table>
    </div>
   </div>
  </div>
 </div>   
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.min.js" integrity="sha384-lpyLfhYuitXl2zRZ5Bn2fqnhNAKOAaM/0Kr9laMspuaMiZfGmfwRNFh8HlMy49eQ" crossorigin="anonymous"></script>

<script src='https://code.jquery.com/jquery-3.3.1.slim.min.js'></script>
<!-- Popper JS -->
<script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js'></script>
<!-- Bootstrap JS -->
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js'></script>
 <script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js" integrity="sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js" integrity="sha384-j0CNLUeiqtyaRmlzUHCPZ+Gy5fQu0dQ6eZ/xAww941Ai1SxSY+0EQqNXNE6DZiVc" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</body>
</html>

