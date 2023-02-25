<%@page import="java.sql.*"%>
<%@page import="com.demo.packag.ConnectionProvider"%>
<%
String email=session.getAttribute("email").toString();
String mobileNumber=request.getParameter("mobileNumber");
String password=request.getParameter("password");

int check=0;
try
{
	Connection con=ConnectionProvider.getCon();
	Statement stmt=con.createStatement();
	ResultSet res=stmt.executeQuery("select * from users where email= '"+email+"' and password= '"+password+"'");
	while(res.next())
	{
		check=1;
		stmt.executeUpdate("update users set mobileNumber= '"+mobileNumber+"' where email= '"+email+"'");
		response.sendRedirect("changeMobileNumber.jsp?msg=done");
	}
	if(check==0)
		response.sendRedirect("changeMobileNumber.jsp?msg=wrong");
}
catch(Exception e)
{
	System.out.println(e);
}
%>