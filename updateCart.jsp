<title>Subtract from Wallet</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="mainpage.css" >
<style>
.bgtext {
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0, 0.4); /* Black w/opacity/see-through */
  color: black;
  font-weight: bold;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  z-index: 2;
  width: 80%;
  padding: 20px;
  text-align: center;
}
</style>
</head>
<body>
<div class="bg-image"></div>
<div class="bgtext"><br><br><br><h1>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%
	//String userid = (String) session.getAttribute("userid");
        String userid="ssss";
	try
	{
                Class.forName("com.mysql.jdbc.Driver");
                java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ncp","root","root");
                String selectSQL = "select totalamount from cart where cart.userid='ssss'";
                PreparedStatement stmt=con.prepareStatement(selectSQL); 
                ResultSet rs=stmt.executeQuery();
				rs.next();
                int sum= rs.getInt(1);
				String selectSQ = "select balance from wallet where wallet.userid='ssss'";
                PreparedStatement st=con.prepareStatement(selectSQ); 
                rs=st.executeQuery();
				rs.next();
                int bal= rs.getInt(1)-sum;
	        	if(bal>=0){
	        		String upSQL = "update wallet set balance ="+bal+" where wallet.userid ='ssss'";
	        		PreparedStatement stt = con.prepareStatement(upSQL); 
	       			stt.executeUpdate();
	       			out.println("Payment Done");
	       		}
	       		else{
	       			out.println("Insufficient Funds");
	       		}
	       	
	}
	catch(Exception e)
	{
		System.out.println(e);
	}
%>
</h1>
<br>
<form action="homepage.html" method="POST">
<center><button class="btn btn-orange" >Back</button></center>
</form>
<br><br><br>
</div> 
</body>
</html>
