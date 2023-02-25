<%@page import="com.demo.packag.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String id=request.getParameter("id");
String email=request.getParameter("email");
String status="Cancel";
try
{
	 Connection con=ConnectionProvider.getCon();
	 Statement stmt=con.createStatement();
	 stmt.executeUpdate("update cart set status='"+status+"' where product_id='"+id+"' and email='"+email+"' and address is not NULL");
	 response.sendRedirect("ordersReceived.jsp?msg=cancel");	
}
catch(Exception e)
{
	System.out.println(e);
	response.sendRedirect("ordersReceived.jsp?msg=wrong");
	
}

%>