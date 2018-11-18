<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%
	String userid=request.getParameter("userid");
	session.putValue("userid", userid);

	String DateStr = request.getParameter("dob");
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	Date DateOfBirth = new Date(sdf.parse(DateStr).getTime());
	String pwd=request.getParameter("pwd");
	Class.forName("com.mysql.jdbc.Driver").newInstance();

	java.sql.Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/ncp","root","root");
	String selectSQL = "select * from login where userid = ? and dob = ?";
	PreparedStatement stmt=conn.prepareStatement(selectSQL);  
	stmt.setString(1,userid);
	stmt.setDate(2,DateOfBirth);
	ResultSet rs=stmt.executeQuery();
	if(rs.next())
	{
		String seltSQL = "update login set password= ? where userid = ? and dob = ?";
		PreparedStatement st=conn.prepareStatement(seltSQL);  
		st.setString(1,pwd);
		st.setString(2,userid);
		st.setDate(3,DateOfBirth);
		st.executeUpdate();
		out.println("Password changed Please Login Again !!!");
		response.sendRedirect("login.html");
		return;
	}
	else
	{
		out.println("Try Again Userid/db Wrong");
		response.sendRedirect("error_db.html");
		//return;	
	}	
%>
 
</body>
</html>