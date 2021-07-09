
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Package.helper.ConnectionProvider"%>
<%@page import="Package.helper.ConnectionProvider"%>
<%@page import="Package.entites.acc_details"%>
<!DOCTYPE html>
<html>
<head>
  <title></title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">

  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.2/css/bootstrap.min.css'>
  <!-- Font Awesome CSS -->
  <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.3.1/css/all.css'>
  <style type="text/css">
    html{
    font-family: -apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,"Noto Sans",sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol","Noto Color Emoji";
  }
  * {
  box-sizing: border-box;
}

.column {
  float: left;
  width: 25%;
  padding: 0 10px;
}
.topnav {
   overflow: hidden;
  padding: 18px 50px 10px 10px;
  background: white;

}
.topnav a:hover {
  color: white;
  background: linear-gradient(70deg, #823DC6 3%, #7C0707 60%);
}
.logo
{
  margin-left:1px;
}
.pimage{
    margin-left: 70px;
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
    <%     
        acc_details  ac;
        String us = request.getParameter("d");
        String query1  = "select * from accountdetails where name = '" +us+ "'";
        PreparedStatement ps1= (ConnectionProvider.getConnection()).prepareStatement(query1);
        ResultSet rs1 = ps1.executeQuery();
        ac = new acc_details();
        while(rs1.next())
        {  
    %>
<form action="TransactionServlet"  method="post" id="tra">
    <div class="row">
        <div class="card" style="width: 25rem; border-radius: 50px; margin-left: 15%; margin-top: -70px; height: 550px;">
            <div class="card-body" style="border-radius: 25px" >
        	<img src="images/user.jpg" class="pimage"  style="width: 200px; height: 200px;">
                    <h1 style="text-align: center; color: black; font-size: 150%;" >SENDER</h1><hr>
                    <div class="form-row">
                        <div class="form-group col-md-12">
                            <label for="">Account Number</label>
                            <% int ids = rs1.getInt("accountno"); 
                                ac.setAccountno(ids) ;
                            %> 
                            <input type="text" class="form-control" style="border-radius: 25px;" value="<%= ac.getAccountno()%>" name="Sacc" readonly="true">
                        </div>
                        <div class="form-group col-md-12">
                            <label for="">Name</label>
                            <% String name = rs1.getString("name"); 
                                ac.setName(name) ;
                            %>         
                            <input type="" class="form-control" style="border-radius: 25px" id="input4" value="<%= ac.getName()%>" name="Sname" readonly="true">
                        </div>
                        <div class="form-group col-md-12">
                            <label for="inputPassword4">Phone</label>
                            <% int phone = rs1.getInt("phone"); 
                                ac.setPhone(phone) ;
                            %> 
                            <input type="text" class="form-control" style="border-radius: 25px;" id="input4" value="<%= ac.getPhone()%>" name="Sphone" readonly="true">
                        </div>
                    </div>
                </div>
            </div>
        <%     
                  }
        %>
   	<div class="column" style="margin-left: 10%">
            <div class="card" style="width: 25rem; margin-top: 3%;border-radius: 50px;margin-left: 15%; margin-top: -80px;height: 568px;">
                <div class="card-body">
                    <img src="images/user.jpg" class="pimage"  style="width: 200px; height: 200px;">
                    <h1 style="text-align: center; color: black;   font-size: 150%;" >RECEVER</h1><hr>
                    <div class="form-row">
                       	<div class="form-group col-md-12">
                            <label for="name">Name</label>
                            <input Required type="text" class="form-control" name="Rname" style="border-radius: 25px;">
                        </div>
                    	<div class="form-group col-md-12">
                            <label for="acnt_no">Account Number</label>
                            <input Required type="text" class="form-control" name="Racc" style="border-radius: 25px;" >
                    	</div>
                        <div class="form-group col-md-12">
                            <label for="acnt_no">Transfer Amount</label>
                            <input Required type="text" class="form-control" name="Samt" style="border-radius: 25px;" >
                            <input type="submit" class="but" value="TRANSFER" name="submit" style="margin-left: -170px; ">
                        </div>
                    </div>
                </div>
            </div>  
        </div> 
    </div>
</form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
       <script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js" integrity="sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js" integrity="sha384-j0CNLUeiqtyaRmlzUHCPZ+Gy5fQu0dQ6eZ/xAww941Ai1SxSY+0EQqNXNE6DZiVc" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script>
    $(document).ready(function() {
            console.log("loaded....")
            
            $('#tra').on('submit',function(event){
                event.preventDefault();
                let form = new FormData(this);
                $.ajax({
                    url: "TransactionServlet",
                    type: 'POST',
                    data: form,  
                    success:function (data ,textStatus , jqXHR){
                         console.log(data)
                         if(data.trim() === 'Error' )
                         {
                            Swal.fire({
                            icon: 'error',
                            title: 'Oops...',
                            text: 'Insufficient balance'
                            
                            });
                             
                         }
                         else if(data.trim() === 'Success1' )
                         {
                             Swal.fire(
                                '',
                                'Transaction Successfull',
                                'success'
                                
                            )
                           
                        }
                        else
                        {
                              
                            Swal.fire({
                            icon: 'error',
                            title: 'Oh..',
                            text:  'Something went wrong!'
                               
                             });
                            
                        }
                            
                    },
                    error:function (jqXHR ,textStatus , errorThrown){
                         console.log(jqXHR)
                         Swal.fire({
                            icon: 'error',
                            title: 'Oops..',
                            text: 'Something went wrong!'
                            })
                            .then((value) => {
                                window.location = "error.jsp"
                            });
                    },
                    processData:false,
                    contentType:false
                });
            });
        });
    
    </script>  

</body>
</html>
