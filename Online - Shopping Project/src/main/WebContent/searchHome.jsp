<%@page import="java.sql.*"%>
<%@page import="com.demo.packag.ConnectionProvider"%>
<%@ include file="header.jsp"  %>
<%@include file="footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Home <i class="fa fa-institution"></i></div>
<table>
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> Price</th>
            <th scope="col">Add to cart <i class='fas fa-cart-plus'></i></th>
          </tr>
        </thead>
        <tbody>
<%
int z=0;
try{
	String search=request.getParameter("search");
	
	Connection con=ConnectionProvider.getCon();
	Statement stmt=con.createStatement();
	ResultSet res=stmt.executeQuery("select * from product where name like '%"+search+"%' or  category like '%"+search+"%' and active='yes'");
	while(res.next())
	{
		z=1;
%>
          <tr>
         <td><%= res.getString(1) %></td>
		 <td><%= res.getString(2) %></td>
		 <td><%= res.getString(3) %></td>
		 <td><i class ='fa fa-inr'></i><%=res.getString(4) %></td>
		 <td><a href="addToCartAction.jsp?=<%= res.getString(1) %>">Add to cart<i class='fas fa-cart-plus'></i></a></td>
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
  <% if(z==0)
	  {%>
	<h1 style="color:white; text-align: center;">Nothing to show</h1>
	<% } %>
      <br>
      <br>
      <br>
      <div class="footer">
          <p>All right reserved</p>
      </div>

</body>
</html>