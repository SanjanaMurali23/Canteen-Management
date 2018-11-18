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
String username=request.getParameter("username");


String DateStr = request.getParameter("dob");
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
Date DateOfBirth = new Date(sdf.parse(DateStr).getTime());


int no = Integer.parseInt(request.getParameter("contactno"));


Class.forName("com.mysql.jdbc.Driver");
String id = (String)session.getAttribute("userid");
java.sql.Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/ncp","root","root");
PreparedStatement stmt=conn.prepareStatement("update login set username=?, dob=?, contactnumber=? where userid=?;");
stmt.setString(1,username);

stmt.setDate(2,DateOfBirth);
stmt.setInt(3,no);
stmt.setString(4,id);
stmt.executeUpdate();


%>
 <br>
 <form method="post" action="homepage.html">
 
        

			<script>
			alert("Updated..!!");
			window.location.href = "homepage.html";
			</script>
			
			
   </form>
  

</body>
</html>