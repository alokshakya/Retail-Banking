<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="connect.ConnectionProvider"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.*"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- link bootstrap css -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- link  bootstrap js -->
<!-- link css -->
<style>
body, html {
  height: 100%;
  margin: 0;
  font: 400 15px/1.8 "Lato", sans-serif;
  color: #777;
}

.bgimg-1, .bgimg-2, .bgimg-3 {
  position: relative;
  opacity: 0.80;
  background-attachment: fixed;
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;

}
.bgimg-1 {
  background-image: url("img/scroll1.jpg");
  min-height: 100%;
}

.bgimg-2 {
  background-image: url("img/scroll2.jpg");
  min-height: 400px;
}


.caption {
  position: absolute;
  left: 0;
  top: 50%;
  width: 100%;
  text-align: center;
  color: #000;
}

.caption span.border {
  background-color: #111;
  color: #fff;
  padding: 18px;
  font-size: 25px;
  letter-spacing: 10px;
}

h3 {
  letter-spacing: 5px;
  text-transform: uppercase;
  font: 20px "Lato", sans-serif;
  color: #111;
}

/* Turn off parallax scrolling for tablets and phones */
@media only screen and (max-device-width: 1024px) {
    .bgimg-1, .bgimg-2, .bgimg-3 {
        background-attachment: scroll;
    }
}
</style>
<script>
  function showexecutive() {
   document.getElementById('executive').style.display = "block";
   document.getElementById('cashier').style.display = "none";

}
function showcashier() {
  document.getElementById('cashier').style.display = "block";
   document.getElementById('executive').style.display = "none";
}
</script>
</head>
<body ng-app="homeApp">

<!-- Start of Navigation Bar-->
    <nav class="navbar navbar-default navbar-fixed-top no-margin" role="navigation">
        <div class="container-fluid">
        <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-knit-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                </button>
      
          <a class="navbar-brand" href="bank_home.jsp">ABC BANK </a>
        </div>
        <div class="collapse navbar-collapse navbar-right" id="bs-knit-navbar-collapse-1">
          <ul class="nav navbar-nav">
            <li><a href="#exlogin" onclick="showexecutive()">Executive Login</a></li>
            <li><a href="#cashlogin" onclick="showcashier()">Cashier Login</a></li>
              </ul>
          </div>

    </nav>
    <!-- End of Navigation Bar -->


<div class="bgimg-1">


<!-- Start of executive login  -->
<a name="exlogin"></a>
<div id="executive" style="padding-top: 100px; display:none;">
<form name="loginForm" method="post" action="c_login">
    <div class="col-md-6 col-md-offset-3">
        <div class="row">
          <div class="col-sm-6 col-sm-offset-3">
              <label >Executive Login</label>  
          </div>

          
        </div>
        <div class="form-group">
            <label for="user_name">User Name</label>
            <input type="text" class="form-control" name="username" placeholder="Enter User Name">
        </div>

        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" class="form-control" name="password" placeholder="Password">
        </div>
                <div class="p" align="center">
        <%if(request.getAttribute("message")!=null)
{
	%>
	<script>
	showexecutive();
	</script>
	<h3 style="color:#FF0000"><%=request.getAttribute("message")%></h3>
	<%}%>
        </div>
        <div class="form-group">
            <div class="row">
              <div class="col-sm-6 col-sm-offset-3">
                  <button  type="submit" class="form-control btn btn-login">Log In
              </div>
            </div>
        </div>          
    </div>
    </form>
</div>
<!-- end of executive login  -->


<!-- Start of cashier login  -->
<a name="cashlogin"></a>
<div id="cashier"  style=" padding-top: 100px; display: none;">
  <div class="col-md-6 col-md-offset-3">
      <div class="row">
          <div class="col-sm-6 col-sm-offset-3">
          <label >Cashier Login</label>  
          </div>
      </div>
      <form name="loginForm" method="post" action="cash_login">
      
      <div class="form-group">
          <label for="user_name">User Name</label>
          <input type="text" class="form-control" name="username" placeholder="Enter User Name">
      </div>
      <div class="form-group">
          <label for="password">Password</label>
          <input type="password" class="form-control" name="password" placeholder="Password">
      </div>
                  <div class="p" align="center">
        <%if(request.getAttribute("message_c")!=null)
{
	%>
	<script>
	showcashier();
	</script>
	<h3 style="color:#FF0000"><%=request.getAttribute("message")%></h3>
	<%}%></div>
      <div class="form-group">
          <div class="row">
              <div class="col-sm-6 col-sm-offset-3">
              
                <button type="submit" class="form-control btn btn-login" value="Log In">Log In
              </div>
          </div>
      </div>  
      </form>
                    
  </div>
</div>
<!-- end  of cashier login  -->
  
</div>

<div style="color: #777;background-color:white;text-align:center;padding:50px 80px;text-align: justify;">
  <h3 style="text-align:center;">ABC BANK</h3>
  <p>ABC Bank is a retail bank which serves individual customers, to manage their savings and current accounts. Key requirements of the system is the ability to create customer, open customer account, update and delete customer, manage cashier transactions such as deposit, withdraw and transfer. Also, to be able to view customer and account information and get account transaction information..</p>
</div>

<div class="bgimg-2">
  <div class="caption">
    <span class="border" style="background-color:transparent;font-size:25px;color: #2f24d3;">Explain Executive working
    <p align="center" style="background-color:transparent;font-size:25px;color: #2f24d3;">
  Executive can Create Customer , Update Customer, Delete Customer, Create Account , Delete Account, View Customer and View Account 
  </p>
    </span>
  </div>
  
</div>

<div style="position:relative;">
  <div style="color:#ddd;background-color:#282E34;text-align:center;padding:50px 80px;text-align: justify;">
    <p>Cashier can Withdraw Amount, Deposit Amount, Transfer Amount, Get Statements by last N transactions
    and by Starting Date and Ending Date and can see details of particular Customer by Customer ID or details of Account By 
    Account ID.
    All This Functionality is working by AJAX calls to java servlet API using Angularjs framework.</p>
  </div>
</div>


<div class="bgimg-1">
  <div class="caption">
    <span class="border">Developers Alok & Abdul!</span>
    
    <p align="center" style="color:#110a09;background-color:#transparent;text-align:center;padding:50px 80px;">Kamla Nehru Institute of Technology, Sultanpur.</p>
  </div>

  </div>
  
</div>

<script type="text/javascript" src="js/angular.min.js"></script>
<script src="js/3.2.1-jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/homeapp.js"></script>
<script type="text/javascript" src="js/controllers/ExecutiveLogin.js"></script>

</body>
</html>