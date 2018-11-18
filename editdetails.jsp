<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit</title>

<link rel="stylesheet" type="text/css" href="try.css">

</head>
<body background="image/mint.jpg">
<%@ page import="java.sql.*"%>

<%@ page import="javax.sql.*"%>
<%

Class.forName("com.mysql.jdbc.Driver").newInstance();
java.sql.Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/ncp","root","root");

String id = (String)session.getAttribute("userid");
String selectSQL = "select * from login where userid = ?";
PreparedStatement stmt=conn.prepareStatement(selectSQL);  
stmt.setString(1,id);
ResultSet rs=stmt.executeQuery();

rs.next();
String uname=rs.getString(1);
int cn=rs.getInt(4);
Date dt=rs.getDate(3);




%>



<div class="header">
  	<h2>Update</h2>
  </div>
	
    
    <form method="post" action="edits.jsp">
        <div class="input-group">
           <label>Username : </label>
           <input type="text" name="username"   value=<%= uname%>                                                      >
        </div>
        
         <div class="input-group">
           <label>Date Of Birth : </label>
           <input type="date" name="dob"    value=<%= dt%>     >
        </div>
        
         <div class="input-group">
           <label>Contact Number : </label>
           <input type="number" name="contactno" value=<%= cn%>>
        </div>
        
       

       
       <div class="input-group">
                   <button id="myButton2" type="submit" name="register" class="btn">Update</button>   
       </div>
<script type="text/javascript">
    document.getElementById("myButton2").onclick = function () {
        location.href = "edits.jsp";
    };
</script>



 </form>














</body>
</html>