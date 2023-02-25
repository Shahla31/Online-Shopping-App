<%@page import="com.demo.packag.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Messages Received <i class='fas fa-comment-alt'></i></div>
<table>
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Email</th>
            <th scope="col">Subject</th>
            <th scope="col">Body</th>
          </tr>
        </thead>
        <tbody>
<%
try
{
	Connection con=ConnectionProvider.getCon();
	Statement stmt=con.createStatement();
	ResultSet res=stmt.executeQuery("select * from message");
	while(res.next())
	{
%>       
          <tr>
            <td><%=res.getString(1) %></td>
            <td><%=res.getString(2) %></td>
            <td><%=res.getString(3) %></td>
            <td><%=res.getString(4) %></td>
          </tr>
    <%
	}
}
catch(Exception e)
{
	System.out.println(e);
}
    %>     
        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>