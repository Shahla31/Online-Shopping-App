<%@page import="java.sql.*"%>
<%@page import="com.demo.packag.ConnectionProvider"%>
<%@include file="footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/addressPaymentForOrder-style.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Home</title>
<script>
if(window.history.forward(1) !=null)
	window.history.forward(1);</script>
</head>
<body>
<br>
<table>
<thead>
<%
String email=session.getAttribute("email").toString();
int total=0;
int sno=0;
try
{
	 Connection con=ConnectionProvider.getCon();
	 Statement stmt=con.createStatement();
	 ResultSet res1=stmt.executeQuery("select sum(total) from cart where email='"+email+"' and address is NULL");
	 while(res1.next())
	 {
		 total=res1.getInt(1);
	 }
%>
          <tr>
          <th scope="col"><a href="myCart.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></th>
            <th scope="col" style="background-color: #5fd43c;">Total: <i class="fa fa-inr"></i><%out.println(total); %> </th>
          </tr>
        </thead>
        <thead>
          <tr>
          <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Sub Total</th>
          </tr>
        </thead>
        <tbody>
       	<%
      	ResultSet res=stmt.executeQuery("select * from product inner join cart on product.id=cart.product_id and cart.email='"+email+"' and cart.address is NULL");
      	while(res.next())
      	{
      	%>      
          <tr>
          <% sno=sno+1; %>
           <td><% out.println(sno); %></td>
            <td><%=res.getString(2) %></td>
            <td><%=res.getString(3) %></td>
            <td><i class="fa fa-inr"></i><%=res.getString(4) %> </td>
            <td><%=res.getString(8) %> </td>
            <td><i class="fa fa-inr"></i><%=res.getString(10) %> </td>
            </tr>
         <%
         }
      	ResultSet res2=stmt.executeQuery("select *from users where email='"+email+"' ");
      	while(res2.next())
      	{
      	%>
        </tbody>
      </table>
      
<hr style="width: 100%">
<form action="addressPaymentForOrderAction.jsp" method="post">
 <div class="left-div">
 <h3>Enter Address</h3>
<input class="input-style" type="text" name="address" value="<%=res2.getString(7)%>" placeholder="Enter Address" required>
 </div>

<div class="right-div">
<h3>Enter city</h3>
<input class="input-style" type="text" name="city" value="<%=res2.getString(8)%>" placeholder="Enter City" required>
</div> 

<div class="left-div">
<h3>Enter State</h3>
<input class="input-style" type="text" name="state" value="<%=res2.getString(9)%>" placeholder="Enter State" required>
</div>

<div class="right-div">
<h3>Enter country</h3>
<input class="input-style" type="text" name="country" value="<%=res2.getString(10)%>" placeholder="Enter Country" required>
</div>
<h3 style="color: #f79844">*If there is no address then you did not set your address!</h3>
<h3 style="color: #f79844">*This address will also be updated to your profile</h3>
<hr style="width: 100%">
<div class="left-div">
<h3>Select the method of Payment</h3>
 <select class="input-style" name="paymentMethod">
 <option value="Cash on delivery (COD)">Cash on delivery (COD)</option>
 <option value="Online Payment">Online Payment</option>
 </select>
</div>

<div class="right-div">
<h3>Pay online on this OSPJSP@benefitpay.com</h3>
<input class="input-style" type="text" name="transactionId" placeholder="Enter Transaction ID">
<h3 style="color: #f79844">*If you select online Payment then enter you transaction ID here otherwise leave this blank</h3>
</div>
<hr style="width: 100%">

<div class="left-div">
<h3>Mobile Number</h3>
<input class="input-style" type="text" name="mobileNumber" value="<%=res2.getString(3)%>" placeholder="Enter Mobile Number" required>
<h3 style="color: #f79844">*This mobile number will also be updated to your profile</h3>
</div>
<div class="right-div">
<h3 style="color: #f79844">*If you enter wrong transaction ID then your order will be cancelled!</h3>
<button class="button" type="submit">Proceed to Generate Bill & Save <i class='far fa-arrow-alt-circle-right'></i></button>
<h3 style="color: #f79844">*Fill form correctly</h3>
</div>
</form>
<%
		}
}
catch(Exception e)
{
	System.out.println(e);
}
%>
      <br>
      <br>
      <br>

</body>
</html>