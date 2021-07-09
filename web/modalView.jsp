<%@page import="Package.entites.acc_details"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Statement"%>
<%@page import="Package.helper.ConnectionProvider"%>
<%@page import="Package.helper.ConnectionProvider"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <title>Register</title>
    <style type="text/css"> 
    .topnav {
    overflow: hidden;
    padding: 1px;
    background: white;
    }
    .logo{
      margin-left:1px;
    }
     .imga{
        border-top-left-radius: 50px;
        border-top-right-radius: 50px;
        border-bottom-left-radius:50px;
        border-bottom-right-radius:50px;
        width: 500px;
        
      }
     .row{
        margin-top: 40px;
        background-color:white;
        align-items: center;
        border-radius: 30px; 
        box-shadow:  10px 10px 10px 10px;
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
  border: none;
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
    <section class="Form" style="margin-top: -60px;">
      <div class="container py-4" >
        <div class="row py-1 pt-1">
          <div class="col-lg-6 image">
            <img src="images/user2.jpg" class="img-fluid imga">
          </div>
            <%  acc_details  ac;
                String us = request.getParameter("d");
                String query1  = "select * from accountdetails where name = '" +us+ "'";
                PreparedStatement ps1= (ConnectionProvider.getConnection()).prepareStatement(query1);
                ResultSet rs1 = ps1.executeQuery();
                ac = new acc_details();
                while(rs1.next())
                {  
                %>

          <div class="col-lg-5 px-1 pt-1 part">
            <form method="post" action="saveques.jsp" >
              <div class="form-row px-1 pt-4">
                <h5>Account No :</h5>
                <div class="col-lg-12"> 
                    <% int ids = rs1.getInt("accountno"); 
                            ac.setAccountno(ids) ;
                    %> 
                  <input type="text" class="form-control" style="border-radius: 25px;" value="<%= ac.getAccountno()%>" readonly="true">
                </div>    
              </div>
              <div class="form-row px-1 pt-4">
                <div class="col-lg-12"> 
                    <% String name = rs1.getString("name"); 
                            ac.setName(name) ;
                    %>             
                   <h5>Name :</h5>
                  <input type="text" class="form-control" style="border-radius: 25px;" value=" <%= ac.getName()%>" readonly="true">                </div>    
              </div>
              <div class="form-row px-1 pt-4">
                <div class="col-lg-12"> 
                    <% int phone = rs1.getInt("phone"); 
                            ac.setPhone(phone) ;
                    %> 
                   <h5>Phone :</h5>
                  <input type="text" class="form-control" style="border-radius: 25px;" value=" <%= ac.getPhone()%>" readonly="true">                </div>    
              </div>
              <div class="form-row px-1 pt-4">
                <div class="col-lg-12"> 
                    <% int balance = rs1.getInt("balance"); 
                            ac.setBalance(balance) ;
                    %> 
                   <h5>Balance :</h5>
                  <input type="text" class="form-control" style="border-radius: 25px;" value=" <%= ac.getBalance()%>Rs" readonly="true">                </div>    
              </div>
              <div class="form-row px-1 pt-4">
                <div class="col-lg-12"> 
                    <a href="viewCustomers.jsp" class="but" style="margin-left: 35%; border-radius: 15px">Back</a>
                </div>
            </form>
          </div>
              <%     
                  }
        %>
        </div>
              
      </div>     
    </section>
  </body>
</html>