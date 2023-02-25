<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/signup-style.css">
<title>Signup</title>
</head>
<body>
<div id='container'>
	<div class='signup'>
		<form action="SignupAction.jsp" method="post">
		<input type="text" name="name" placeholder="Enter Name" required>
		<input type="email" name="email" placeholder="Enter Email" required>		
		<input type="number" name="mobileNumber" placeholder="Enter Mobile Number" required>
		<select name="securityQuestion">
		<option value="What is your first Car?">What is your first Car?</option>
		<option value="What is the name of your first pet?">What is the name of your first pet?</option>
		<option value="What elementary school did you attend?">What elementary school did you attend?</option>
		<option value="What is the name of your town where you were born?">What is the name of your town where you were born?</option>
		</select>
		<input type="text" name="answer" placeholder="Enter Answer" required>
		<input type="password" name="password" placeholder="Enter Password" required>
		<input type="submit" value="SignUp">
		</form>
	<h2><a href="Login.jsp">Login</a></h2>
	</div>
	<div class="whysign">
	<%
	String msg=request.getParameter("msg");
	if("valid".equals(msg))
	{%>
		<h1>Successfully Registered !</h1>
	<%} %>
	<%if("invalid".equals(msg))
	{
	%>
	<h1>Something Went Wrong  ! Try Again  !</h1>
	<%} %>
		<h2>Online Shopping</h2>
		<p>The Online Shopping System is the application that allows the users to shop online without going to shops to buy them</p>
		
	</div>
</div>


</body>
</html>