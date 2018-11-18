
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<html><body background="image/imm1.jpg">

        <%
        	Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ncp", "root", "root");
        	String sql = "DELETE FROM ordered;";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.executeUpdate();
			
            session.invalidate();

        %>

        <h1><font color="Red">You are Sucessfully logged out...</font></h1>

        <a href="login.html">Go-Back To Home Page</a>

    </body>

</html>