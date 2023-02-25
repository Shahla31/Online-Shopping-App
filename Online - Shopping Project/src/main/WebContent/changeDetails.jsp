<%@page import="java.sql.*"%>
<%@page import="com.demo.packag.ConnectionProvider"%>
<%@ include file="changeDetailsHeader.jsp"  %>
<%@include file="footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<title>Change Details</title>
<style>
hr
{width:70%;}</style>
</head>
<body>
<%
try
{
	Connection con=ConnectionProvider.getCon();
	Statement stmt=con.createStatement();
	ResultSet res=stmt.executeQuery("select * from users where email= '"+email+"'");
	while(res.next())
	{

%>
<h3>Name: <%=res.getString(1) %></h3>
<hr>
 <h3>Email: <%=res.getString(2) %></h3>
 <hr>
 <h3>Mobile Number: <%=res.getString(3) %></h3>
 <hr>
<h3>Security Question: <%=res.getString(4) %></h3>
<hr>
      <br>
      <br>
      <br>
<%
	}
}
catch(Exception e)
{
	System.out.println(e);
}
%>
</body>
</html>