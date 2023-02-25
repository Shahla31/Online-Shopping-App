<%@page import="java.sql.*"%>
<%@page import="com.demo.packag.ConnectionProvider"%>
<%
String email=session.getAttribute("email").toString();
String product_id=request.getParameter("id");
int quantity=1;
int product_price=0;
int product_total=0;
int cart_total=0;

	int z=0;
	try
	{
		Connection con=ConnectionProvider.getCon();
		Statement stmt=con.createStatement();
		ResultSet res=stmt.executeQuery("select * from product where id='"+product_id+"'");
		while(res.next())
		{
			product_price=res.getInt(4);
			product_total=product_price;
		}
		ResultSet res1=stmt.executeQuery("select * from cart where product_id='"+product_id+"' and email='"+email+"' and address is NULL");
		while(res1.next())
		{
			cart_total=res1.getInt(5);
			cart_total=cart_total+product_total;
			quantity=res1.getInt(3);
			quantity=quantity+1;
			z=1;
		}
		if(z==1)
		{
			stmt.executeUpdate("update cart set total='"+cart_total+"',quantity='"+quantity+"' where product_id="+product_id+" and email='"+email+"' and address is NULL");
			response.sendRedirect("home.jsp?msg=exist");
		}
		if(z==0) 
		{
			PreparedStatement ps=con.prepareStatement("insert into cart(email,product_id,quantity,price,total) value (?,?,?,?,?)");
			ps.setString(1, email);
			ps.setString(2, product_id);
			ps.setInt(3, quantity);
			ps.setInt(4, product_price);
			ps.setInt(5, product_total);
			ps.executeUpdate();
			response.sendRedirect("home.jsp?msg=added");
			}
	}
	catch(Exception e)
	{
	System.out.println(e);
	response.sendRedirect("home.jsp?msg=invalid");
	}
%>