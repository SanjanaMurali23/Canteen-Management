<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Dashboard</title>
		<!--<link rel="stylesheet" type="text/css" href="style2.css">-->
		<style>
			table,td,th,tr
			{
				border: 3px solid black;
			}
			table
			{
				border-collapse:collapse;
				width: 75%;
			}
			th,td
			{
				height: 50px;
				text-align: left;
				padding: 15px;
				border-bottom: 1px solid #ddd;
			}
			th
			{
				background-color: #fcbcb5/*#4CAF50*/;
				color: white;
			}
		</style>
	</head>
	<body background="image/cart.jpg">
		<%@ page import="java.sql.*"%>
		<%@ page import="javax.sql.*"%>
	<%
		int value = 0, values = 0;
		String userid=(String)session.getAttribute("userid");
		Class.forName("com.mysql.jdbc.Driver");
		java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost/ncp","root","root");
		PreparedStatement stmt=con.prepareStatement("SELECT ordered.foodid,food.foodname,ordered.quantity,food.price FROM ordered INNER JOIN food WHERE food.foodid=ordered.foodid;");
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
				values += value;
		%>
			<tr>
				<td><%= id %></td>
				<td><%= rset.getString("foodname") %></td>
				<td><%= rset.getInt("quantity") %></td>
				<td><%= value %></td>
			<tr>
		<%
				
			}
		%>
		</table>
		<br>
		<br>
		<h2> Total value is <%= values %> </h2>
	<%	String inSQL = "insert into cart values(?, ?);";
		PreparedStatement st = con.prepareStatement(inSQL); 
		st.setString(1,userid);
		st.setInt(2,values);
	    st.executeUpdate(); %>
		<a href="homepage.html"><h3> BACK </h3></a>
		<form method="post" action="updateCart.jsp">
			 <div class="input-group">
            <button type="submit" name="pay" class="btn">Make Payment!</button>
        	</div>
		</form>
	<%
		rset.close();
		stmt.close();
		con.close();
	%>
</body>
</html>