<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile</title>
<link rel="stylesheet" type="text/css" href="pro.css">
</head>
<body background ="image/im2.jpg">
<%

Class.forName("com.mysql.jdbc.Driver").newInstance();
java.sql.Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/ncp","root","root");

String id = (String)session.getAttribute("userid");
String selectSQL = "select * from login where userid = ?";
PreparedStatement stmt=conn.prepareStatement(selectSQL);  
stmt.setString(1,id);
ResultSet rs=stmt.executeQuery();




%>




<div class="container">
<div class="row">
	<h2>WELCOME..!!</h2>	
 		<div class="col-md-7 ">
		<div class="panel">
  			<h2 style="color:#00b1b1;">User Profile</h2></div>
   
				 <div   align="center"> <img alt="User Pic" src="image/user.png" id="profile-image1" class="img-circle"> 
              
         				    <%
							while (rs.next()) {
							%>
							
							
							<h1 style="color:#00b1b1;">UserID :  <%=rs.getString(2)%></h1>
							
							
				              
				 </div>
				
							
							
							<h4 >Username :  <%=rs.getString(1)%></h4>
							<h4 >Contact Number :  <%=rs.getInt(4)%></h4>
							<h4 >Date of birth :  <%=rs.getDate(3)%></h4>
							
							
							<% } %>


       
       
       
              <div class="input-group">
                   <button id="myButton2" type="submit" class="logoutLblPos">Edit</button>   
       </div>
       
       
       
       
         
<script type="text/javascript">
    document.getElementById("myButton2").onclick = function () {
        location.href = "editdetails.jsp";
    };
</script> 
<br>




      <div class="input-group">
                   <button id="myButton" type="submit" class="logoutLblPos">Change Password</button>   
       </div>
       
           
<script type="text/javascript">
    document.getElementById("myButton").onclick = function () {
        location.href = "Password.html";
    };
</script>
		   
		
		 <br>
		 

<form method="post" action="logoutprocess.jsp">
     <div class="input-group">
            <button type="submit"  name="register" class="logoutLblPos">Logout</button>
        </div>


 </form>
		    </div>
		    
		    </div>
</div>  








</body>
</html>




