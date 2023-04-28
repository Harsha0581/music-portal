<!DOCTYPE html>
<html lang="en">
<head>
  <title>Admin Login</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
  .body{
background-image:url(musicimages/background_1920x1080.gif);
background-repeat:no-repeat;
background-size:100%;

}
  </style>
</head>
<body class="body">
<%@ include file = "home_menu.jsp" %>
<div class="container" style="background-color:;width:60%">
  
  <form name='f1' method='post' action="admin_login_code.jsp" enctype="" style="color:white">
	
        <div class="row">
			<div class="col-sm-4">
				
			</div>
			<div class="col-sm-4">
				<h3>Admin Login</h3>
				
<div class='row'>
	<div class='col-md-12'><br>
		<label for='username'>User Name</label>
		<input type='text' class='form-control' id='username' placeholder='Enter username' name='username' required >
	</div>
</div><br>
<div class='row'>
	<div class='col-md-12'>
		<label for='password'>Password</label>
		<input type='password' class='form-control' id='password' placeholder='Enter password' name='password' required >
	</div>
</div>
				
				<br>
				<button type="submit" class="btn btn-default btn-success">Login</button>
				<br>
   
					<%
		if(request.getParameter("msg")!=null)
		{
		 out.println("<br><h3>Invalid Username/Password</h3>");
		} 
					
	%>
			</div>
		</div>	
		
  
   </form>


		
		
</body>
</html>
