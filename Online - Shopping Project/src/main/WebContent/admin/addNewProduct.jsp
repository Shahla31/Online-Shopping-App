<%@page import="com.demo.packag.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title>Add New Product</title>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("done".equals(msg))
{%>
<h3 class="alert">Product Added Successfully!</h3>
<%}%>
<%
if("wrong".equals(msg))
{%>
<h3 class="alert">Something Went Wrong!</h3>
<%}%>
<%
	int id=1;
	try
	{
	Connection con=ConnectionProvider.getCon();
	Statement stmt=con.createStatement();
	ResultSet res=stmt.executeQuery("select max(id) from product");
	while(res.next())
	{
		id=res.getInt(1);
		id=id+1;
		
	}
	
}
catch(Exception e)
{
	System.out.print(e);
}
%>
<h3 style="color: yellow;">Product ID: <%out.println(id); %></h3>
<form action="addNewProductAction.jsp" method="post">
<input type="hidden" name="id" value="<% out.println(id); %>">
<div class="left-div">
 <h3>Enter Name</h3>
 <input class="input-style" type="text" name="name" placeholder="Enter Product Name" required="required">
 <br>
</div>

<div class="right-div">
 <h3>Enter Category</h3>
 <input class="input-style" type="text" name="category" placeholder="Enter Category" required="required">
 <br>
</div>

<div class="left-div">
 <h3>Enter Price</h3>
 <input class="input-style" type="number" name="price" placeholder="Enter Price" required="required">
 <br>
</div>

<div class="right-div">
 <h3>Active</h3>
 <select class="input-style" name="active" >
 <option value="yes">yes</option>
 <option value="no">no</option>
 </select>
 <br>
</div>
<button class="button">Save</button>
</form>
<br><br><br>
</body>
</html>