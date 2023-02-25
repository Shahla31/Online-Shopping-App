<%@page import="java.sql.*"%>
<%@page import="com.demo.packag.ConnectionProvider"%>
<%@include file="footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/bill.css">
<title>Bill</title>
</head>
<body>
<%
String email=session.getAttribute("email").toString();
try
{
	int total=0;
	int sno=0;
	Connection con=ConnectionProvider.getCon();
	Statement stmt=con.createStatement();
	ResultSet res=stmt.executeQuery("select sum(total) from cart where email='"+email+"' and status='bill'");
	while(res.next())
	{
		total=res.getInt(1);
	}
	ResultSet res2=stmt.executeQuery("select * from users inner join cart where cart.email='"+email+"' and cart.status='bill'");
	while(res2.next())
	{
%>
<h3>Online shopping Bill</h3>
<hr>
<div class="left-div"><h3>Name: <%=res2.getString(1) %> </h3></div>
<div class="right-div-right"><h3>Email:  <%out.println(email); %></h3></div>
<div class="right-div"><h3>Mobile Number:  <%=res2.getString(20) %></h3></div>  

<div class="left-div"><h3>Order Date:  <%=res2.getString(21) %></h3></div>
<div class="right-div-right"><h3>Payment Method:  <%=res2.getString(23) %></h3></div>
<div class="right-div"><h3>Expected Delivery:  <%=res2.getString(22) %></h3></div> 

<div class="left-div"><h3>Transaction Id:  <%=res2.getString(24) %></h3></div>
<div class="right-div-right"><h3>City:  <%=res2.getString(17) %></h3></div> 
<div class="right-div"><h3>Address:  <%=res2.getString(16) %></h3></div> 

<div class="left-div"><h3>State:  <%=res2.getString(18) %></h3></div>
<div class="right-div-right"><h3>Country:  <%=res2.getString(19) %></h3></div>  

<hr>
<%break;} %>

	
	<br>
	
<table id="customers">
<h3>Product Details</h3>
  <tr>
    <th>S.No</th>
    <th>Product Name</th>
    <th>category</th>
    <th>Price</th>
    <th>Quantity</th>
     <th>Sub Total</th>
  </tr>
 <%
 ResultSet res1=stmt.executeQuery("select * from cart inner join product where cart.product_id= product.id and cart.email='"+email+"' and cart.status='bill'");
 while(res1.next())
 {
	 sno=sno+1;
%> 
  <tr>
    <td><%out.println(sno); %></td>
    <td><%=res1.getString(17) %></td>
    <td><%=res1.getString(18) %></td>
    <td><%=res1.getString(19) %></td>
    <td><%=res1.getString(3) %></td>
     <td><%=res1.getString(5) %></td>
  </tr>
  <tr>
<%} %>
</table>
<h3>Total: <%out.println(total); %></h3>
<a href="continueShopping.jsp"><button class="button left-button">Continue Shopping</button></a>
<a onclick="window.print();"><button class="button right-button">Print</button></a>
<br><br><br><br>
<%

}
catch(Exception e)
{
	System.out.println(e);
}%>
</body>
</html>