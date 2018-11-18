<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>


<html>
<head>
<meta charset="ISO-8859-1">
<title>Change Password</title>
</head>
<body>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>






<% 



String curpwd=request.getParameter("curpwd");
String newpwd=request.getParameter("newpwd");
String repwd=request.getParameter("repwd");

Class.forName("com.mysql.jdbc.Driver").newInstance();

java.sql.Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/ncp","root","root");
String id = (String)session.getAttribute("userid");
String selectSQL = "select * from login where userid = ?";

PreparedStatement stmt=conn.prepareStatement(selectSQL);  

stmt.setString(1,id);

ResultSet rs=stmt.executeQuery();
while(rs.next())
{
	if(rs.getString(5).equals(curpwd))
	{
		if(newpwd.equals(repwd))
			
		{
			
			String seltSQL = "update login set password= ? where userid =?";
			PreparedStatement st=conn.prepareStatement(seltSQL);  
			st.setString(1,newpwd);
			st.setString(2,id);
			st.executeUpdate();
			%>
			<script>
			alert("Password changed.Please login again..!!");
			window.location.href = "login.html";
			</script>
			
			<%
		
		return;
		}
		else
		{
			
			%>
			<script>
			alert("Re-typed password doesn't match with the New password..!!");
			window.location.href = "Password.html";
			</script>
			
			<%
				
		}
	
	}
	
	
	

else
{
	%>
	<script>
	alert("Password Incorrect..!!");
	window.location.href = "Password.html";
	</script>
	
	<%
}
	





}
%>












</body>
</html>