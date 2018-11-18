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
	String userid = (String) session.getAttribute("userid");
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ncp", "root", "root");
		
		String order[] = request.getParameterValues("order");
		String qty[] = request.getParameterValues("qty");


        	String sql = "DELETE FROM cart;";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.executeUpdate();

		if (order != null) 
		{
			for (int i = 0; i < order.length; i++) 
		    {
				String selectSQL = "select * from food where foodname = '"+order[i]+"';";
			  	PreparedStatement stmt = con.prepareStatement(selectSQL);
			  	//stmt.setString(1,order[i]);
			  	ResultSet rs = stmt.executeQuery();
			  	String foodid, foodname, q;
			  	int stock, price, qnt;
			  	q = qty[i];
			  	while (rs.next()) 
			  	{
			  		foodid = rs.getString(1);
	                foodname = rs.getString(2);
	                String s = rs.getString(3);
	                String p = rs.getString(4);
	                qnt = Integer.parseInt(q);
	                stock = Integer.parseInt(s);
	                price = Integer.parseInt(p);
	                if(stock-qnt >= 0)
	       			{
	                	String upSQL = "update food set stock = stock-"+qnt+" where foodid = '"+foodid+"' ;";
	       				PreparedStatement st = con.prepareStatement(upSQL); 
	       				st.executeUpdate();
	       				String inSQL = "insert into ordered values("+foodid+", "+qnt+");";
	       				PreparedStatement stm = con.prepareStatement(inSQL);
	       				stm.executeUpdate(inSQL);
	       				//int i=st.executeUpdate("insert into order values('"+choosesports+"')");
	       		    }
			  	}
		    }
		    response.sendRedirect("sampleCart.jsp");
		}
		
		else 
		{
		  	out.println ("<b>none<b>");
		  	response.sendRedirect("sampleCart.jsp");
		}
	}
	catch(Exception e)
	{
		System.out.println(e);
	}
%>
 
</body>
</html>