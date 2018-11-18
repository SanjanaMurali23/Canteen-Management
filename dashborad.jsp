<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Dashboard</title>
		<link rel="stylesheet" type="text/css" href="style.css">
	</head>
	<body background="bg5.jpg">
		<%@ page import="java.sql.*"%>
		<%@ page import="javax.sql.*"%>
	<%
		int value = 0;
		String userid=(String)session.getAttribute("userid");
		Class.forName("com.mysql.jdbc.Driver");
		java.sql.Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/ncp","root","root");
		PreparedStatement stmt=conn.prepareStatement("SELECT ordered.foodid,food.foodname,ordered.quantity,food.price FROM ordered INNER JOIN food WHERE food.foodid=ordered.foodid;");
		ResultSet rset=stmt.executeQuery(); %>
		<br><br><br>
		<h2>Orders History</h2><br>
		<table>
			<tr>
				<th>Food id</th>
				<th>Name</th>
				<th>quantity</th>
				<th>price</th>
		<%
			while (rset.next()) {
				int id = rset.getInt("foodid");
				int price=rset.getInt("price");
				int quant=rset.getInt("quantity");
				value = price*quant;
		%>
			<tr>
				<td><%= id %></td>
				<td><%= rset.getString("foodname") %></td>
				<td><%= rset.getInt("quantity") %></td>
				<td><%= value %></td>
			<tr>
		<%
				value+=value;
			}
		%>
		</table>
		<h> Total value is <%= value %> 
	<%	String inSQL = "insert into cart values("+userid+", "+value+");";
	    stmt.executeUpdate(inSQL); %>
		<a href="menu.jsp"><h3> BACK </h3></a>
	<%
		rset.close();
		stmt.close();
		conn.close();
	%>
</body>
</html>