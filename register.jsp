<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Rejsp</title>

<link rel="stylesheet" type="text/css" href="style.css">

</head>
<body background="image/cupcakes.jpg">>
<%@ page import="java.sql.*"%>

<%@ page import="javax.sql.*"%>
<%
String username=request.getParameter("username");
//out.println(username);
String userid=request.getParameter("userid");

session.putValue("userid", userid);
//out.println(userid);
String DateStr = request.getParameter("dob");
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
Date DateOfBirth = new Date(sdf.parse(DateStr).getTime());

//out.println(DateOfBirth);
int no = Integer.parseInt(request.getParameter("contactno"));
String pwd=request.getParameter("pwd");

Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/ncp","root","root");
PreparedStatement stmt=conn.prepareStatement("insert into login  values(?,?,?,?,?);");
stmt.setString(1,username);
stmt.setString(2,userid);
stmt.setDate(3,DateOfBirth);
stmt.setInt(4,no);
stmt.setString(5,pwd);
stmt.executeUpdate();
out.println("Successfully Registered");

%>
 </br>
 <form method="post" action="login.html">
 
        <div class="input-group">
            <button type="submit" name="register" class="btn">Login</button>
        </div>
      
   </form>
  

</body>
</html>