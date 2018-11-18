<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>loginjsp</title>
</head>
<body>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%
String userid=request.getParameter("userid");
session.putValue("userid", userid);
String password=request.getParameter("password");
Class.forName("com.mysql.jdbc.Driver").newInstance();
java.sql.Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/ncp","root","root");
String selectSQL = "select * from login where userid = ?";
PreparedStatement stmt=conn.prepareStatement(selectSQL);  
stmt.setString(1,userid);
ResultSet rs=stmt.executeQuery();
if(rs.next())
{
	if(rs.getString(5).equals(password))
	{
		response.sendRedirect("homepage.html");
		return;
		//out.println("welcome "+userid);
	}
	else
	{
		response.sendRedirect("error.html");
		return;		 
	}
}
else
{
	out.println("Not existing Userid ");
	response.sendRedirect("error_us.html");
	//return;	
}
	
%>
 
</body>
</html>