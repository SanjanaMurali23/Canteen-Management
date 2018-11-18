<%-- 
    Document   : wallet
    Created on : 5 Nov, 2018, 3:23:10 PM
    Author     : malavika
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Wallet</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="mainpage.css" >
<style>
.bgimg{
  /* The image used */
  background-image: url("image/flavours.jpg");
  
  /* Add the blur effect */
  filter: blur(8px);
  -webkit-filter: blur(8px);
  
  /* Full height */
  height: 100%; 
  
  /* Center and scale the image nicely */
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
}
</style>
</head>
<body>
<div class="bgimg"></div>
<div class="bg-text">
<h1><b>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%
	//String userid = (String) session.getAttribute("userid");
        String userid="123";
	try
	{
                Class.forName("com.mysql.jdbc.Driver");
                java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ncp","root","root");
		       // String amount  = request.getParameter("amt");

               // System.out.println(amount);
               // int a = Integer.parseInt(amount);
               int amount= Integer.parseInt(request.getParameter("amt"));
                String selectSQL = "select * from wallet where userid='ssss'";
                PreparedStatement stmt=con.prepareStatement(selectSQL); 
               // stmt.setString(1,userid);
                ResultSet rs=stmt.executeQuery();
                rs.next();
                int bal= rs.getInt(2) + amount;
	        String upSQL = "update wallet set balance = ? where wallet.userid ='ssss'";
	        PreparedStatement st = con.prepareStatement(upSQL); 
            st.setInt(1,bal);
	       	st.executeUpdate();
            out.println("Balance :   Rs. "+bal);
	       	
	}
	catch(Exception e)
	{
		System.out.println(e);
	}
%>
<br><br>
<form action="homepage.html" method="POST">
<center><button class="btn btn-orange" >Back</button></center>
</form>
</b></h1>
</div> 
</body>
</html>
